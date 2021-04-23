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

public partial class CPPIHome : System.Web.UI.Page
{
    DAL dal = new DAL();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["GrantApplicantId"] == null) Response.Redirect("~/SessionTimeout.aspx");

        Session["CPPIHome"] = 1;

        if (AppInfo.Amendment1)
        {
            lnkDistrictInformation.Enabled = false;
            lnkDistrictInformation.Enabled = false;
            lnkGrantOnlineLink.Enabled = true;
        }
        else
        {
            lnkDistrictInformation.NavigateUrl = "CPPIDistrictInformation.aspx";
            lnkProgramInformation.NavigateUrl = "CPPIProgramInformation.aspx";

            //lnkGrantOnlineLink.NavigateUrl = "/../CheckList.aspx";

            DataSet ds = dal.GetCPPIPartStatus(Convert.ToInt32(Session["GrantApplicantId"].ToString()));

            bool isSurveyPart1Completed = false;
            bool isSurveyPart2Completed = false;

            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                DataRow row = ds.Tables[0].Rows[i];

                if (row["Part"].ToString() == "2" && row["Status"].ToString() == "1")
                {
                    isSurveyPart1Completed = true;
                }
                if (row["Part"].ToString() == "3" && row["Status"].ToString() == "1")
                {
                    isSurveyPart2Completed = true;
                }
            }

            if (isSurveyPart1Completed || isSurveyPart2Completed)
            {
                lnkGrantOnlineLink.Enabled = true;
            }
            else
            {
                lnkGrantOnlineLink.Enabled = false;
            }
        }

        lnkGrantOnlineLink.Enabled = true;
    }
    protected void lnkGrantOnlineLink_Click(object sender, EventArgs e)
    {
        //DataSet ds = dal.GetGrantApplicant(Convert.ToInt32(Session["GrantApplicantId"]), AppInfo.FundCode);

        //if (ds.Tables[0].Rows.Count > 0)
        //{
        //    Session["Program Name"] = ds.Tables[0].Rows[0]["ProgramName"].ToString();
        //    Session["Eligibility Amount"] = Decimal.Parse(ds.Tables[0].Rows[0]["EligibilityAmount"].ToString()).ToString("N2");
        //}

        Response.Redirect("~/CheckList.aspx");
    }
}
