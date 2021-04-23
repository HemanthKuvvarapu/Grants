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

public partial class HeadStart_HSPrintOut : System.Web.UI.Page
{
    HSDAL dal = new HSDAL();
    DataSet ds;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {

            if (Session["Lead Agency Name"] != null)
            {
                //HSAgenName1.Text = Session["Lead Agency Name"].ToString();


            }
            else
                Response.Redirect("~/Default.aspx");
        }

    }

    protected void btnBackprevious1_Click(object sender, EventArgs e)
    {
        Response.Redirect("HSSurveyHome.aspx");
    }
    protected void btnContinue_Click(object sender, EventArgs e)
    {
        Response.Redirect("HeadStartThankYou.aspx");
    }
    /// <summary>
    /// This functions connects to the report server and gets the report in a pdf format
    /// </summary>

    
    protected void HSCenterBaseSurveybtn_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("hsprintoutpg.aspx?type=HSSurveyCenterBasedList");
    }

    protected void HSFCCSurveyBtn_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("hsprintoutpg.aspx?type=HSSurveyFCCList");
    }

    protected void HSHomeBasedSurveybtn_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("hsprintoutpg.aspx?type=HSSurveyHomeBasedList");

    }

    protected void HSLocallyDesignedbtn_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("hsprintoutpg.aspx?type=part5");

    }

}
