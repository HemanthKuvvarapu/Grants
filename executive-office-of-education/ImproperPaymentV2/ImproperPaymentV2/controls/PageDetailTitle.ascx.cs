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

public partial class controls_PageDetailTitle : System.Web.UI.UserControl
{

    public string eID;
    public string recID;
    public string recType;
    public string serviceDate;
    public DataSet dsChildInfo0;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (recID != null)
        {
            txtID.Text = eID;
            txtCounty.Text = dsChildInfo0.Tables[0].Rows[0]["County"].ToString();
            txtReviewDate.Text = AppData.FormatDateStr(dsChildInfo0.Tables[0].Rows[0]["ReviewDate"].ToString()) == "01/01/1900" ? "Review Not Yet Completed" :  AppData.FormatDateStr(dsChildInfo0.Tables[0].Rows[0]["ReviewDate"].ToString());
            if (txtReviewDate.Text == "")
                txtReviewDate.Text = "N/A";
            txtServiceDate.Text = AppData.FormatMonthYearStr(dsChildInfo0.Tables[0].Rows[0]["ServiceDate"].ToString());
        }
    }

    public void SetPageTitle(String title)
    {
        txtPageTitle.Text = title;
    }
}
