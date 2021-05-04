// This is a working re-write of the CSession class that doesn't reference the EC_Session VB DLL.
// The problem is we can't use it until we remove all the classic ASP pages, or reference this .NET 
// assembly from ASP.
// Author: Jon Hunt
// Date: 03/19/2010

using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Xml;

/// <summary>
/// Class that manages the ASP session state for eCCIMS
/// Updated to remove references to VB DLL - JH 03/19/2010
/// </summary>
public class CSession
{
    #region Members

    private bool loadSuccess = false;
    private string sessionID = string.Empty;
    private DateTime createdDate;
    private DateTime? updatedDate;
    private DateTime expirationDate;
    private DateTime? deletedDate;
    private string sessionXMLData;
    private Dictionary<string, string> sessionData = new Dictionary<string, string>();

    #endregion Members

    #region Properties

    public bool LoadSuccess
    {
        get
        {
            return this.loadSuccess;
        }
    }

    public string SessionID
    {
        get
        {
            return this.sessionID;
        }
    }

    public DateTime CreatedDate
    {
        get
        {
            return this.createdDate;
        }
    }

    public DateTime? UpdatedDate
    {
        get
        {
            return this.updatedDate;
        }
    }

    public DateTime ExpirationDate
    {
        get
        {
            return this.expirationDate;
        }
    }

    public DateTime? DeletedDate
    {
        get
        {
            return this.deletedDate;
        }
    }

    public string SessionXMLData
    {
        get
        {
            return this.sessionXMLData;
        }
    }

    public Object this[object oKey]
    {
        get
        {
            string key = oKey.ToString();
            if (this.sessionData.ContainsKey(key))
            {
                return this.sessionData[key];
            }
            else
            {
                return string.Empty;
            }
        }
        set
        {
            string key = oKey.ToString();
            if (this.sessionData.ContainsKey(key))
            {
                this.sessionData[key] = value.ToString();
            }
            else
            {
                this.sessionData.Add(key, value.ToString());
            }

            // Save changes to the session record
            object sError = "";
            SaveSession(ref sError);
        }
    }

    #endregion Properties

    #region Methods

    public CSession(ref string sError, string sSessionID)
    {
        try
        {
            // Create a new session
            this.loadSuccess = false;

            if (string.IsNullOrEmpty(sSessionID))
            {
                this.sessionID = CreateNewSession();
            }
            else
            {
                this.sessionID = sSessionID;
            }


            // Load the session from the database
            LoadSession(this.sessionID.Replace("%2D", "-"));
            this.loadSuccess = true;
        }
        catch (Exception ex)
        {
            sError = String.Format("Cannot load session - {0}", ex.Message);
            this.loadSuccess = false;
        }
    }

    public string CreateNewSession()
    {
        int error;
        SqlParameter errorParam = new SqlParameter("@int_Error", SqlDbType.Int);
        errorParam.Direction = ParameterDirection.Output;

        string sGUID;
        SqlParameter guidParam = new SqlParameter("@GUID", SqlDbType.VarChar, 38);
        guidParam.Direction = ParameterDirection.Output;

        SQLHelper.ExecuteStoredProc("sp_CreateNewSession",
            new SqlParameter("@strXML_SESSION_DATA", GetXMLSessionData()),
            guidParam,
            errorParam);

        // Parse errors
        error = (int)errorParam.Value;
        if (error != 0)
        {
            throw new ApplicationException(String.Format("Could not create new session (error={0})", error));
        }

        // Query new GUID created from the stored procedure
        sGUID = guidParam.Value.ToString();
        this.sessionID = sGUID;
        return this.sessionID;
    }

    private void LoadSession(string sessionID)
    {
        int error;
        SqlParameter errorParam = new SqlParameter("@int_Error", SqlDbType.Int);
        errorParam.Direction = ParameterDirection.Output;

        DataSet dsSession = SQLHelper.ExecuteStoredProc("sp_LoadSession",
            new SqlParameter("@vc_session_GUID", sessionID),
            errorParam);

        error = (int)errorParam.Value;

        // Load session information
        if (dsSession.Tables.Count > 0
            && dsSession.Tables[0].Rows.Count > 0)
        {
            DataRow drSession = dsSession.Tables[0].Rows[0];

            this.sessionID = this.sessionID.Replace("%2D", "-");
            this.createdDate = (DateTime)drSession["dt_Created"];
            this.updatedDate = drSession.IsNull("dt_Updated") ? null : (DateTime?)drSession["dt_Updated"];
            this.expirationDate = (DateTime)drSession["dt_expired"];
            this.deletedDate = drSession.IsNull("dt_Deleted") ? null : (DateTime?)drSession["dt_Deleted"];
            this.sessionXMLData = drSession["xml_session_data"].ToString();

            // Parse XML session data
            sessionData.Clear();

            XmlDocument doc = new XmlDocument();
            doc.LoadXml(this.sessionXMLData);
            foreach (XmlNode node in doc.SelectSingleNode("//SESSION_DATA").ChildNodes)
            {
                sessionData.Add(node.Name, node.InnerText);
            }
        }
    }

    private string GetXMLSessionData()
    {
        XmlDocument doc = new XmlDocument();
        XmlElement elem = doc.CreateElement("SESSION_DATA");
        XmlNode rootNode = doc.AppendChild(elem);
        foreach (string key in this.sessionData.Keys)
        {
            XmlElement childNode = doc.CreateElement(key);
            childNode.InnerText = this.sessionData[key];
            rootNode.AppendChild(childNode);
        }

        return doc.InnerXml;
    }

    public bool IsSessionExpired()
    {
        if (DateTime.Now.CompareTo(this.expirationDate) > 0)
        {
            return true;
        }
        else
        {
            return false;
        }
    }

    public bool SaveSession(ref Object sError)
    {
        sError = "";

        int error;
        SqlParameter errorParam = new SqlParameter("@int_Error", SqlDbType.Int);
        errorParam.Direction = ParameterDirection.Output;

        try
        {
            string xmlSessionData = GetXMLSessionData();

            SQLHelper.ExecuteStoredProc("sp_SaveSession",
                new SqlParameter("@vc_Session_GUID", this.sessionID),
                new SqlParameter("@vc_XML_Session_Data", xmlSessionData),
                errorParam);

            error = (int)errorParam.Value;
            if (error != 0)
            {
                sError = error;
                return false;
            }

            return true;
        }
        catch (Exception ex)
        {
            sError = ex.Message;
            return false;
        }
    }

    public bool Terminate(string sessionID)
    {
        if (!string.IsNullOrEmpty(sessionID))
        {
            LoadSession(sessionID);
        }

        int error;
        SqlParameter errorParam = new SqlParameter("@int_Error", SqlDbType.Int);
        errorParam.Direction = ParameterDirection.Output;

        try
        {
            SQLHelper.ExecuteStoredProc("sp_TerminateSession",
                new SqlParameter("@vc_Session_GUID", sessionID),
                errorParam);

            error = (int)errorParam.Value;

            if (error != 0)
            {
                return false;
            }

            return true;
        }
        catch (Exception)
        {
            return false;
        }
    }

    #endregion Methods
}
