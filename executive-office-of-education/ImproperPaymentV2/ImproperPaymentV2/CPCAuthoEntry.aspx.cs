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

public partial class CPCAuthoEntry : IMBasePage
{
    private string recID;
    private string recType;
    private string serviceDate;
    private string funding;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            RecID = GetParameter("id");
            RecType = GetParameter("type");
            ServiceDate = GetParameter("date");
            Funding = GetParameter("fund");

            ControlsInitialize();
        }
    }

    private void ControlsInitialize()
    {
        Master.ShowFooter = false;
        //Master.ShowPageTitle = false;
        //Master.ShowNavMenu = false;
        Master.PageTitle = "CPC Authorization Infomation";
        //Master.NavMenuItem = "MenuItem2";   //current focus tab
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        string sError = "";
        double parentFeeTotalAmount = Convert.ToDouble(txtParentFee.Text) * Convert.ToDouble(txtAuthoDays.Text);
        double totalAmount = (Convert.ToDouble(txtAuthoDays.Text) * Convert.ToDouble(txtProviderRate.Text)) + Convert.ToDouble(txtTransAmount.Text) - parentFeeTotalAmount;

        CChild.SetCPCAuthoInfo(ref sError, RecID, txtProviderRate.Text, txtAuthoDays.Text, txtFeeLevel.Text,
                               txtFamilyIncome.Text, txtFamilySize.Text, 
                               txtParentFee.Text, 
                               txtTransAmount.Text,
                               totalAmount.ToString(), 
                               cboAuthoType.SelectedValue);

        if (string.IsNullOrEmpty(sError))
        {
            Response.Redirect("ElementForms.aspx?id=" + RecID + "&date=" + ServiceDate + "&type=" + RecType + "&fund=" + Funding);
        }
    }

    private string RecID
    {
        get
        {
            return ViewState["recID"].ToString();
        }
        set
        {
            ViewState["recID"] = value;
        }
    }

    private string RecType
    {
        get
        {
            return ViewState["recType"].ToString();
        }
        set
        {
            ViewState["recType"] = value;
        }
    }

    private string ServiceDate
    {
        get
        {
            return ViewState["serviceDate"].ToString();
        }
        set
        {
            ViewState["serviceDate"] = value;
        }
    }

    private string Funding
    {
        get
        {
            return ViewState["funding"].ToString();
        }
        set
        {
            ViewState["funding"] = value;
        }
    }
}
