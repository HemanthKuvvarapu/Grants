using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Security;
using System.Data;
using System.Web.UI.WebControls;
using System.Data.SqlTypes;

//namespace ImproperPaymentV2.App_Code
//{
    public class IPBasePage :  System.Web.UI.Page
    {
        protected CUser CurrentUser;

        public IPBasePage()
        {
            //
            // TODO: Add constructor logic here
            //
        }

        protected Status PageInitialize()
        {
            if (Session.IsNewSession)
            {
                return Status.FAIL;
            }
            else
            {

                SSI.Security ssi = new SSI.Security();
                CurrentUser = (CUser)Session["UserInfo"];

                if (CurrentUser == null)
                {
                    return Status.FAIL;
                }
                else if (!ssi.IsValidSession(CurrentUser.SSISessionID))
                {
                    return Status.FAIL;
                }
                else
                {
                    //Comment out next line to debug
                    //ssi.UpdateSessionHistory(CurrentUser.SSISessionID, SSI.EECApp.ImproperPayment, "");

                    //if (!CurrentUser.AgreeTermOfUse)
                    //{
                    //    Response.Redirect("UserAgreement.aspx");
                    //}
                    Session["CurrentMenuFocus"] = "MenuItem1";

                    return Status.SUCCESS;
                }
            }
        }

        protected void RedirectDefaultPage()
        {
            Response.Redirect(AppData.GetValue("PAGE_DEFAULT"));    //Goes to Single Sign-in login page
        }


        protected string DecryptDES(string stringToDecrypt)
        {
            return CGlobal.DecryptDES(stringToDecrypt, "#12B@@k$");
        }

        protected string EncryptDES(string stringToEncrypt)
        {
            return CGlobal.EncryptDES(stringToEncrypt, "#12B@@k$");
        }


        protected void TerminateSession()
        {
            sSessionID = "";
            RedirectDefaultPage();
            
    }


        private String sSessionID
        {
            get
            {
                HttpCookie SessionKeyCookie = Request.Cookies["SESSION_ID"];
                if (SessionKeyCookie != null)
                {
                    return SessionKeyCookie.Value.Replace("-", "%2D");
                }
                else
                {
                    return "";
                }
            }
            set
            {
                HttpCookie SessionKeyCookie = Request.Cookies["SESSION_ID"];
                if (SessionKeyCookie != null)
                {
                    SessionKeyCookie.Value = value;
                }
            }


        }

        public abstract class BaseEntity
        {
            public abstract int RetrieveById(int Id);
            public abstract int SaveNew();
            public abstract int Update();
            public abstract int Delete();
            public abstract bool Validate(List<CustomValidator> list);
            public abstract DataSet Search(params Object[] parameterValues);

            public int UserId { get; set; }
            public SqlDateTime CreateDate { get; set; }
            public int CreateByUserId { get; set; }
            public string CreateByUserName { get; set; }
            public SqlDateTime ModifyDate { get; set; }
            public int ModifyByUserId { get; set; }
            public string ModifyByUserName { get; set; }
            public string LastErrorMessage { get; set; }

            public BaseEntity()
            {
                // TODO: Complete member initialization
            }
        }

    }


//}