using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class CoverPage : System.Web.UI.Page
{
    DAL dal = new DAL();
    DataSet ds;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["GrantApplicantId"] == null) Response.Redirect("SessionTimeout.aspx");

        Master.PartTitle = AppInfo.DisplayPart11Title;

        lblInstruction.Text = dal.GetPartInstruction(AppInfo.FundCode, AppInfo.FiscalYear, "11");

        if (!IsPostBack)
        {
            BindData();
        }
    }

    private void BindData()
    {
        ds = dal.GetCoverPageData(Session["GrantApplicantId"].ToString());

        if (ds.Tables[0].Rows.Count > 0)
        {
            DataRow dr = ds.Tables[0].Rows[0];

            lblApplicantName.Text = dr["Lead Agency Name"].ToString();

            lblAgencyAddress.Text = dr["Address"].ToString();
            lblCityZip.Text = dr["CityTown"].ToString() + ", MA " + dr["ZipCode"].ToString();

            txtContactName.Text = dr["GrantContactName"].ToString();
            txtEmailAddress.Text = (string.IsNullOrEmpty(dr["GrantContactEmail"].ToString()) || dr["GrantContactEmail"].ToString().ToUpper() == "NULL") ? "" : dr["GrantContactEmail"].ToString();
            txtPhone.Text = dr["GrantContactPhone"].ToString();
            txtTaxId.Text = dr["TaxId"].ToString();
        }
    }

    private void Save()
    {
        dal.SaveAgencySuperContactInfo(Convert.ToInt32(Session["GrantApplicantId"].ToString()), txtContactName.Text, txtEmailAddress.Text, txtPhone.Text, txtTaxId.Text);
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            Save();

            Response.Redirect("CheckList.aspx");
        }
    }

    protected void btnSavePrint_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            Save();

            Response.Redirect("Print.aspx?type=CoverSheet");
        }
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("CheckList.aspx");
    }
}
