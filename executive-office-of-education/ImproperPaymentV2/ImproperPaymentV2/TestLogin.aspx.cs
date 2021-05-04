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
using System.Text;
using System.Security.Cryptography;
using System.IO;

public partial class TestLogin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Session["IPReviewStartDate"] = System.Configuration.ConfigurationManager.AppSettings.Get("IPReviewStartDate");
            Session["IPReviewEndDate"] = System.Configuration.ConfigurationManager.AppSettings.Get("IPReviewEndDate");   
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        String sUsername = txtUsername.Text;

        SSI.Security ssi = new SSI.Security();

        String sSessionID = ssi.StartNewSession(sUsername, "#12B@@k$");

        sSessionID = EncryptDES(sSessionID, "#12B@@k$");
        Session["DevLogin"] = "true";

        Response.Redirect("PostLogin.aspx?sessionid=" + sSessionID);
    }

    public static string EncryptDES(string stringToEncrypt, string sEncryptionKey)
    {

        byte[] key = { };
        byte[] IV = { 10, 20, 30, 40, 50, 60, 70, 80 };
        byte[] inputByteArray; //Convert.ToByte(stringToEncrypt.Length)

        try
        {

            key = Encoding.UTF8.GetBytes(sEncryptionKey.Substring(0, 8));
            DESCryptoServiceProvider des = new DESCryptoServiceProvider();
            inputByteArray = Encoding.UTF8.GetBytes(stringToEncrypt);
            MemoryStream ms = new MemoryStream();
            CryptoStream cs = new CryptoStream(ms, des.CreateEncryptor(key, IV), CryptoStreamMode.Write);
            cs.Write(inputByteArray, 0, inputByteArray.Length);
            cs.FlushFinalBlock();

            return Convert.ToBase64String(ms.ToArray());
        }
        catch (System.Exception ex)
        {
            throw ex;
        }
    }
}
