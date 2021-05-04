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

public partial class controls_ChildDetail1 : System.Web.UI.UserControl
{
    public string recID;
    public string recType;
    public string serviceDate;
    public string funding;
    public string placement = "0";

    protected void Page_Load(object sender, EventArgs e)
    {
        String sError = "";

        if (recID != null)
        {
            /*begin - load the child info*/
            DataSet dsChildInfo = CChild.LoadSelectedChildInfo(recID, Convert.ToInt16(recType), serviceDate, Session["SessionID"].ToString(), "0");

            txtChildName.Text = dsChildInfo.Tables[0].Rows[0]["FirstName"].ToString() + " " + dsChildInfo.Tables[0].Rows[0]["LastName"].ToString();
            txtChildDOB.Text = AppData.FormatDateStr(dsChildInfo.Tables[0].Rows[0]["DOB"].ToString());
            txtChildSSN.Text = dsChildInfo.Tables[0].Rows[0]["SSN"].ToString();
            txtVendorName.Text = dsChildInfo.Tables[0].Rows[0]["VendorName"].ToString();
            txtServiceDate.Text = AppData.FormatDateStr(dsChildInfo.Tables[0].Rows[0]["ServiceDate"].ToString());
            //txtFunding.Text = dsChildInfo.Tables[0].Rows[0]["Funding"].ToString();
            txtFunding.Text = funding;
            txtPlacement.Text = (placement == "0") ? "INITIAL ASSESSMENT" : "REASSESSMENT";
            /*end - load the child info*/
        }
    }
}
