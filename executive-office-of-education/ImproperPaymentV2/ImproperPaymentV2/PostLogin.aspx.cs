using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class PostLogin : IPBasePage
{
    //private object UserMsg;

    // IPBasePage must have 'Build Action' = Content not Compile
    // Also must class PostLogin must be in CodeBehind, not CodeFile in PostLogin.aspx 

    //protected CUser CurrentUser;

    protected void Page_Load(object sender, EventArgs e)
    {
        String sSID = "";
        String sSSIUserID = "";
        String sFirstName = "";
        String sLastName = "";
        String sUserName = "";
        String sApp = "";
        string sError = "";


        sSID = Request.QueryString["sessionid"].ToString();

        if (Request.QueryString["app"] != null)
        {
            sApp = Request.QueryString["app"].ToString();
        }

        sSID = DecryptDES(sSID.Replace(" ", "+"));

        SSI.Security ssi = new SSI.Security();

        if (Session["DevLogin"] == null) //this is the prod environment, meaning the sSID is the temp token.
        {
            //get the permanent Session Id. What is passed in the URL is a temp token.
            sSID = ssi.GetSessionId(sSID);
        }
        //DataSet dsSSIAppInfo = ssi.GetUserAppsInfo(sSID);

        Session["SessionID"] = sSID;
        //Response.Write ("SessionID = " + sSID);
        //Response.End();

        DataSet dsSSIUserInfo = ssi.GetUserProfile(sSID);

        if (dsSSIUserInfo.Tables[0].Rows.Count > 0)
        {
            sSSIUserID = dsSSIUserInfo.Tables[0].Rows[0]["UserID"].ToString();
            sUserName = dsSSIUserInfo.Tables[0].Rows[0]["Username"].ToString();
            sFirstName = dsSSIUserInfo.Tables[0].Rows[0]["Firstname"].ToString();
            sLastName = dsSSIUserInfo.Tables[0].Rows[0]["Lastname"].ToString();
            Session["UserID"] = dsSSIUserInfo.Tables[0].Rows[0]["UserID"].ToString();
            Session["UserName"] = sUserName;
            Session["CurrentMenuFocus"] = "";

            DataSet dsUser = CUser.LoadAllUsersInfo(ref sError, sUserName);
            
            //if (!CGlobal.IsEmptyString(sSSIUserID))
            if (dsUser.Tables[0].Rows.Count > 0)
            {
                //User is authenticated via SSI
                if (dsUser.Tables[0].Rows[0]["IsReadOnly"].ToString() == "1") 
                {
                    Session["IsReadOnly"] = "1";
                    Session["HideNames"] = "1";
                    Session["IsAdminUser"] = "0";
                    
                    Response.Redirect("selectChild.aspx?hn=1");
                }
                else
                {
                    Session["IsReadOnly"] = "0";
                    Session["HideNames"] = "0";                   
                    Session["IsAdminUser"] = dsUser.Tables[0].Rows[0]["IsAdmin"].ToString();

                    Response.Redirect("selectChild.aspx?hn=0");
                }
            }
            else
            {
                //throw exception
                UserMsg.Text = "Invalid IP User";
                UserMsg.Visible = true;
                return;
                //UserMsg.Text = "SSI Session ID is Empty.";
                //UserMsg.Visible = true;
                //return;
            }
        }
    }
}