using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Login : System.Web.UI.Page
{
    DAL dal = new DAL();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            this.SetFocus(txtUsername);
            this.Form.DefaultButton = btnConfirmPwd.UniqueID;
        }
    }
    protected void btnConfirmPwd_Click(object sender, EventArgs e)
    {
        int GrantApplicantId = dal.ConfirmUsernamePassword(txtUsername.Text, txtPassword.Text, AppInfo.FundCode, AppInfo.FiscalYear);
        
        if (GrantApplicantId > 0)
        {
            Session["GrantApplicantId"] = GrantApplicantId;

            loadAgencyInfo();

            if (AppInfo.FundCode == 511)
            {
                Response.Redirect("UPK/" + AppInfo.FiscalYear.ToString() + "/UPKHome.aspx");
            }
            else if (AppInfo.FundCode == 391)
            {
                Response.Redirect("Preschool/" + AppInfo.FiscalYear.ToString() + "/PreschoolHome.aspx");
            }
            else if (AppInfo.FundCode == 390)
            {
                Response.Redirect("HeadStart/" + AppInfo.FiscalYear.ToString() + "/HeadStartHome.aspx");
            }
            if (AppInfo.FundCode == 515)
            {
                Response.Redirect("CPPI/" + AppInfo.FiscalYear.ToString() + "/CPPIHome.aspx");
            }
            else
            {
                //Response.Redirect("Checklist.aspx");
                Response.Redirect("/CPPIHome.aspx");
            }
        }
        else
        {
            lblConfirmPwdMsg.Text = "The Username/Password entered do not match our records. Please make sure that the CAPS lock is Off.";
            lblConfirmPwdMsg.Visible = true;
            lblConfirmPwdMsg.Font.Bold = true;
            lblConfirmPwdMsg.ForeColor = System.Drawing.Color.DarkRed;

            this.SetFocus(txtUsername);
            this.Form.DefaultButton = btnConfirmPwd.UniqueID;
        }
    }

    private void loadAgencyInfo()
    {
        DataSet ds = dal.GetGrantApplicant(Convert.ToInt32(Session["GrantApplicantId"]), AppInfo.FundCode);

        if (ds.Tables[0].Rows.Count > 0)
        {
            Session["Lead Agency Name"] = ds.Tables[0].Rows[0]["AgencyName"].ToString();
            Session["Eligibility Amount"] = Decimal.Parse(ds.Tables[0].Rows[0]["EligibilityAmount"].ToString()).ToString("N2");

            /*this is only for 511 UPK */
            if (AppInfo.FundCode == 511)
            {
                Session["Program Name"] = ds.Tables[0].Rows[0]["ProgramName"].ToString();

                //ds = dal.GetUPKAgencyInfo(Convert.ToInt32(Session["GrantApplicantId"]));
                Session["ProgramTypeId"] = ds.Tables[0].Rows[0]["ProgramTypeId"].ToString();

                float eligAmount = dal.UpdateUPKEligAmountNew(Convert.ToInt32(Session["GrantApplicantId"].ToString()));

                Session["Eligibility Amount"] = eligAmount.ToString("N2");
            }
        }
    }

    protected void btnRegister_Click(object sender, EventArgs e)
    {
        Response.Redirect("Register.aspx");
    }
}
