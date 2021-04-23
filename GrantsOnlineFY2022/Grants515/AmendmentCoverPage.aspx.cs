using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class AmendmentCoverPage : System.Web.UI.Page
{
    DAL dal = new DAL();
    Amendment amend = new Amendment();
    DataSet ds;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["GrantApplicantId"] == null) Response.Redirect("SessionTimeout.aspx");

        if (!IsPostBack)
        {
            string amendmentVersion = Request.QueryString["ver"].ToString();

            ViewState["AmendmentVersion"] = amendmentVersion;
            Session["AmendmentVersion"] = amendmentVersion;

            BindData();
        }

        Master.PartTitle = "BUDGET AMENDMENT #" + ViewState["AmendmentVersion"].ToString() + " COVER PAGE";
    }

    private void BindData()
    {
        ds = dal.GetCoverPageData(Session["GrantApplicantId"].ToString());

        if (ds.Tables[0].Rows.Count > 0)
        {
            DataRow dr = ds.Tables[0].Rows[0];

            lblApplicantName.Text = dr["Lead Agency Name"].ToString();
            //lblOrganizationCode.Text = dr["OrganizationCode"].ToString();

            lblAgencyAddress.Text = dr["Address"].ToString();
            lblCityZip.Text = dr["CityTown"].ToString() + ", MA " + dr["ZipCode"].ToString();

            ds = amend.GetCoverPageAmendmentData(Session["GrantApplicantId"].ToString(), ViewState["AmendmentVersion"].ToString());

            if (ds.Tables[0].Rows.Count > 0)
            {
                dr = ds.Tables[0].Rows[0];

                txtContactName.Text = dr["ContactNameAmendment"].ToString();
                txtEmailAddress.Text = (string.IsNullOrEmpty(dr["ContactEmailAmendment"].ToString()) || dr["ContactEmailAmendment"].ToString().ToUpper() == "NULL") ? "" : dr["ContactEmailAmendment"].ToString();
                txtPhone.Text = dr["ContactPhoneAmendment"].ToString();
                txtTitle.Text = dr["ContactTitleAmendment"].ToString();
            }
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            amend.SaveAgencySuperContactAmendmentInfo(Convert.ToInt32(Session["GrantApplicantId"].ToString()), txtContactName.Text, txtEmailAddress.Text, txtPhone.Text, txtTitle.Text, ViewState["AmendmentVersion"].ToString());

            Response.Redirect("AmendmentHome.aspx?ver=" + ViewState["AmendmentVersion"].ToString());
        }
    }

    protected void btnSavePrint_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            amend.SaveAgencySuperContactAmendmentInfo(Convert.ToInt32(Session["GrantApplicantId"].ToString()), txtContactName.Text, txtEmailAddress.Text, txtPhone.Text, txtTitle.Text, ViewState["AmendmentVersion"].ToString());

            Response.Redirect("Print.aspx?type=AmendmentCoverSheet");
        }
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("AmendmentHome.aspx?ver=" + ViewState["AmendmentVersion"].ToString());
    }
}
