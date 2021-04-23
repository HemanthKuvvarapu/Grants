using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ForgotPassword : System.Web.UI.Page
{
    DAL dal = new DAL();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            this.SetFocus(txtAgencyName);

            this.Form.DefaultButton = btnResetPassword.UniqueID;
        }

    }
    protected void btnResetPassword_Click(object sender, EventArgs e)
    {
        try
        {
              int GrantApplicantId = dal.GetUserNamePwd(txtAgencyName.Text.Trim(), txtUsername.Text.Trim(), Convert.ToInt32(Session["GrantTypeId"]));

                if (GrantApplicantId > 0)
                {
                    Session["GrantApplicantId"] = GrantApplicantId;
                    lblMessage.Text = "Your password has been reset.";
                    lblMessage.ForeColor = System.Drawing.Color.Green;
                    btnContinue.Visible = true;
                    btnResetPassword.Enabled = false;
                }
                else
                {
                    lblMessage.Text = "Unable to reset your password. Please make sure that you enter the information correct.";
                }
            }
        
        catch (Exception ex)
        {
            lblMessage.Text = ex.Message;
        }
    }

    ////private bool IsValidData()
    ////{
    ////    bool validData = true;
    ////    string errMsg = "Please correct the following:<br>";

    ////    if (txtAgencyName.Text.Trim() == ""  || txtUsername.Text.Trim() == "")
    ////    {
    ////        validData = false;
    ////        errMsg += "&nbsp;&nbsp;&nbsp;-&nbsp;Please complete the required fields marked with *.<br>";
    ////    }

    //    //if (txtUsername.Text.Trim() == "")
    //    //{
    //    //    validData = false;
    //    //    errMsg += "&nbsp;&nbsp;&nbsp;-&nbsp;Please enter a Username.<br>";
    //    //}
    //    //if (txtregcode.Text.Trim() == "")
    //    //{
    //    //    validData = false;
    //    //    errMsg += "&nbsp;&nbsp;&nbsp;-&nbsp;Please enter Password.<br>";
    //    //}

    //    ////if (txtPassword.Text != txtPasswordConfirm.Text)
    //    ////{
    //    ////    validData = false;
    //    ////    errMsg += "&nbsp;&nbsp;&nbsp;-&nbsp;Passwords do not match.<br>";
    //    ////}

    //    if (validData)
    //        lblMessage.Text = "";
    //    else
    //        lblMessage.Text = errMsg;

    //    return validData;

    //}
    protected void btnContinue_Click(object sender, EventArgs e)
    {
        Response.Redirect("LoginHeadStart.aspx");
    }
}
