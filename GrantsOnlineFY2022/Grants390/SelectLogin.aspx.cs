using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data;
using System.Configuration;

public partial class SelectLogin : System.Web.UI.Page
{
    DAL dal = new DAL();
    DataSet ds;

    protected void Page_Load(object sender, EventArgs e)
    {
        Session.RemoveAll();

        if (!IsPostBack)
        {
            BindLeadAgency();
            PageLoadView();
        }
    }

    private void PageLoadView()
    {
        divCreatePassword.Visible = false;
        divConfirmPassword.Visible = false;

        divHSLEA.Visible = true;

        //default controls
        SetFocus(ddlHSLEA);
        Form.DefaultButton = btnHSLEASelected.UniqueID;

    }
    private void BindLeadAgency()
    {
        ddlHSLEA.DataSource = dal.GetLeadAgencyName(AppInfo.FundCode, AppInfo.FiscalYear);

        ddlHSLEA.DataTextField = "AgencyName";
        ddlHSLEA.DataValueField = "GrantApplicantId";
        ddlHSLEA.DataBind();

        ddlHSLEA.Items.Insert(0, new ListItem("--Select One--", "-1"));
    }

    protected void btnHSLEASelected_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            if (dal.UserIsRegistered(Convert.ToInt32(ddlHSLEA.SelectedValue)))
            {
                ShowConfirmationWindow();
            }
            else
            {
                ShowNewRegistrationWindow();
            }
        }
    }

    private void ShowNewRegistrationWindow()
    {
        divCreatePassword.Visible = true;
        divConfirmPassword.Visible = false;

        btnHSLEASelected.Enabled = false;
        ddlHSLEA.Enabled = false;


        this.SetFocus(txtPassword1);
        this.Form.DefaultButton = btnSavePassword.UniqueID;
    }

    private void ShowConfirmationWindow()
    {
        divCreatePassword.Visible = false;
        divConfirmPassword.Visible = true;

        btnHSLEASelected.Enabled = false;
        ddlHSLEA.Enabled = false;

        this.SetFocus(txtConfirmPassword);
        this.Form.DefaultButton = btnConfirmPwd.UniqueID;
    }

    private void ShowDistrictInforWindow()
    {
        divCreatePassword.Visible = false;
        divConfirmPassword.Visible = false;

        btnHSLEASelected.Enabled = false;
        ddlHSLEA.Enabled = false;

    }

    protected void btnSavePassword_Click(object sender, EventArgs e)
    {
        if (txtPassword1.Text != txtPassword2.Text)
        {
            lblCreatePwdMsg.Text = "The passwords do not match!";
            lblCreatePwdMsg.Visible = true;
            lblCreatePwdMsg.Font.Bold = true;
            lblCreatePwdMsg.ForeColor = System.Drawing.Color.DarkRed;

            this.SetFocus(txtPassword1);
            this.Form.DefaultButton = btnSavePassword.UniqueID;

            return;
        }

        int GrantApplicantId = dal.SavePassword(Convert.ToInt32(ddlHSLEA.SelectedValue),
                                                AppInfo.FundCode,
                                                AppInfo.FiscalYear,
                                                txtPassword1.Text);

        //successfully 
        if (GrantApplicantId > 0)
        {
            loadAgencyInfo();
            ShowDistrictInforWindow();
            NextPage();
        }
        else
        {
            lblCreatePwdMsg.Text = "Unable to save the password!";
            lblCreatePwdMsg.Visible = true;
            lblCreatePwdMsg.Font.Bold = true;
            lblCreatePwdMsg.ForeColor = System.Drawing.Color.DarkRed;

            this.SetFocus(txtPassword1);
            this.Form.DefaultButton = btnSavePassword.UniqueID;
        }
    }

    private void loadAgencyInfo()
    {
        Session["GrantApplicantId"] = ddlHSLEA.SelectedValue;

        DataSet ds = dal.GetGrantApplicant(Convert.ToInt32(Session["GrantApplicantId"]), AppInfo.FundCode);

        if (ds.Tables[0].Rows.Count > 0)
        {
            Session["Lead Agency Name"] = ds.Tables[0].Rows[0]["AgencyName"].ToString();
            Session["Eligibility Amount"] = Decimal.Parse(ds.Tables[0].Rows[0]["EligibilityAmount"].ToString()).ToString("N2");

            /*this is only for 391*/
            if (AppInfo.FundCode == 391)
            {
                ds = dal.GetOrgId(Convert.ToInt32(Session["GrantApplicantId"]));
                Session["OrgId"] = ds.Tables[0].Rows[0]["OrgId"].ToString();

                ds = dal.GetDocId(Convert.ToInt32(Session["GrantApplicantId"]));
                Session["DocId"] = ds.Tables[0].Rows[0]["DocId"].ToString();
            }

            /*this is only for 511 UPK */
            if (AppInfo.FundCode == 511)
            {
                Session["Program Name"] = ds.Tables[0].Rows[0]["ProgramName"].ToString();

                ds = dal.GetUPKAgencyInfo(Convert.ToInt32(Session["GrantApplicantId"]));
                Session["ProgramTypeId"] = ds.Tables[0].Rows[0]["ProgramTypeId"].ToString();
            }
        }
    }

    protected void btnConfirmPwd_Click(object sender, EventArgs e)
    {
        int GrantsUserId = dal.ConfirmPassword(Convert.ToInt32(ddlHSLEA.SelectedValue), txtConfirmPassword.Text);

        if (GrantsUserId > 0)
        {
            loadAgencyInfo();
            ShowDistrictInforWindow();
            NextPage();
        }
        else
        {
            lblConfirmPwdMsg.Text = "Unable to verify the password!";
            lblConfirmPwdMsg.Visible = true;
            lblConfirmPwdMsg.Font.Bold = true;
            lblConfirmPwdMsg.ForeColor = System.Drawing.Color.DarkRed;

            this.SetFocus(txtConfirmPassword);
            this.Form.DefaultButton = btnConfirmPwd.UniqueID;
        }
    }

    private void NextPage()
    {
        if (Request.QueryString["ReturnUrl"] != null)
        {
            FormsAuthentication.SetAuthCookie(Session["hsCode"].ToString(), false);
            FormsAuthentication.RedirectFromLoginPage(Session["hsCode"].ToString(), false);
        }
        else
        {
            if (AppInfo.FundCode == 390 && (AppInfo.FiscalYear == 2018 || AppInfo.FiscalYear == 2019 || AppInfo.FiscalYear == 2020 || AppInfo.FiscalYear == 2021 || AppInfo.FiscalYear == 2022))
            {
                Response.Redirect("HeadStart/HeadStartHome.aspx");
            }
            else if (AppInfo.FundCode == 511)
            {
                Response.Redirect("UPK/UPKHome.aspx");
            }
            else
            {
                Response.Redirect("Checklist.aspx");
            }
            
        }
    }
    protected void btnCancelCreatePwd_Click(object sender, EventArgs e)
    {
        btnHSLEASelected.Enabled = true;
        ddlHSLEA.Enabled = true;

        divCreatePassword.Visible = false;
        divConfirmPassword.Visible = false;

    }

    //private void GetID(int grantApplicantId)
    //{

    //    string GrantApplicantId = "";


    //    ds = dal.GetGrantApplicant(grantApplicantId);

    //    if (ds.Tables[0].Rows.Count > 0)
    //    {
    //        DataRow dr = ds.Tables[0].Rows[0];
    //        GrantApplicantId = dr["GrantApplicantId"].ToString();

    //        Session["GrantApplicantId"] = GrantApplicantId;
    //    }
    //}
}