using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;


public partial class DataEntryForm : IMBasePage
{
    private string recID;
    private string completed;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            recID = GetParameter("recid");
            completed = GetParameter("completed");

            ControlsInitialize();

            if (completed != "1")
                LoadFormData();
        }
    }

    private void ControlsInitialize()
    {
        Master.ShowFooter = false;
        //Master.ShowPageTitle = false;
        //Master.ShowNavMenu = false;
        Master.PageTitle = "Data Entry Form";
        //Master.NavMenuItem = "MenuItem2";   //current focus tab
    }

    private void LoadFormData()
    {
        string sError = "";

        DataSet ds = CForms.GetDataEntryFormData(ref sError, recID);

        txtDataEntryChildID.Text = ds.Tables[0].Rows[0]["ChildID"].ToString();
        txtDataEntryMonth.Text = AppData.FormatDateStr(ds.Tables[0].Rows[0]["SampleMonth"].ToString());
        txtDataEntryCounty.Text = ds.Tables[0].Rows[0]["County"].ToString();
        txtDataEntryErrorNum.Text = ds.Tables[0].Rows[0]["ErrorNum"].ToString();
        //txtDataEntryImproperPayment.Text = "$" + ((ds.Tables[0].Rows[0]["ImproperPayment"].ToString() == "") ? "0.00" : ds.Tables[0].Rows[0]["ImproperPayment"].ToString());
        //txtDataEntryImproperPaymentType.Text = ds.Tables[0].Rows[0]["ImproperPaymentType"].ToString();
        txtDataEntryMissingDoc.Text = ds.Tables[0].Rows[0]["MissingDoc"].ToString();
        txtDataEntryTotalPaid.Text = "$" + ((ds.Tables[0].Rows[0]["TotalPaid"].ToString() == "") ? "0.00" : ds.Tables[0].Rows[0]["TotalPaid"].ToString());
        txtDataEntryState.Text = "MA";
        txtDataEntryReviewDate.Text = AppData.FormatDateStr(ds.Tables[0].Rows[0]["ReviewDate"].ToString());
        txtDataEntryReviewerName.Text = ds.Tables[0].Rows[0]["ReviewerName"].ToString();
    }
}
