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

public partial class Preschool_2018_PreschoolHome : System.Web.UI.Page
{
    DAL dal = new DAL();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["GrantApplicantId"] == null) Response.Redirect("../../SessionTimeout.aspx");

        //lnkPreschoolQuestionnaire.NavigateUrl = "PreschoolQuestionnaire.aspx";
        lnkPreschoolProgramInformation.NavigateUrl = "PreschoolProgramInformation.aspx";
        //lnkPreschoolEnrollment.NavigateUrl = "PreschoolEnrollment.aspx";
        //lnkPreschoolClass.NavigateUrl = "PreschoolClass.aspx";
        //lnkGrantOnlineLink.NavigateUrl = "../CheckList.aspx";

        //DataSet ds = dal.GetPreschoolQuestionnaire(Convert.ToInt32(Session["GrantApplicantId"].ToString()), AppInfo.FiscalYear);

        bool isPreschoolValid = true;

        //if (ds.Tables[0].Rows.Count == 0)
        //{
        //    lnkPreschoolProgramInformation.Enabled = false;
        //    lnkGrantOnlineLink.Enabled = false;

        //    isPreschoolValid = false;
        //}
        //else if (ds.Tables[0].Rows.Count > 0 && ds.Tables[0].Rows[0]["IsValid"].ToString() == "1")
        
        if (isPreschoolValid)
        {
            lnkPreschoolProgramInformation.NavigateUrl = "PreschoolProgramInformation.aspx";
            lnkGrantOnlineLink.Enabled = true;
        }
        else
        {
            lnkPreschoolProgramInformation.NavigateUrl = "PreschoolNotAvailable.aspx";
            lnkPreschoolProgramInformation.Enabled = false;
            lnkGrantOnlineLink.Enabled = false;

            isPreschoolValid = false;
        }

        if (isPreschoolValid)
        {
            ////////ds = dal.GetPreschoolPartStatus(Convert.ToInt32(Session["GrantApplicantId"].ToString()));

            ////////bool isQuestionnaireCompleted = false;
            ////////bool isSurveyPart1Completed = false;
            //bool isSurveyPart2Completed = false;
            //bool isSurveyPart3Completed = false;

            ////////for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            ////////{
            ////////    DataRow row = ds.Tables[0].Rows[i];

            ////////    if (row["Part"].ToString() == "1" && row["Status"].ToString() == "1")
            ////////    {
            ////////        isQuestionnaireCompleted = true;
            ////////    }
            ////////    else if (row["Part"].ToString() == "2" && row["Status"].ToString() == "1")
            ////////    {
            ////////        isSurveyPart1Completed = true;
            ////////    }
            ////////    //else if (row["Part"].ToString() == "3" && row["Status"].ToString() == "1")
            ////////    //{
            ////////    //    isSurveyPart2Completed = true;
            ////////    //}
            ////////    //else if (row["Part"].ToString() == "4" && row["Status"].ToString() == "1")
            ////////    //{
            ////////    //    isSurveyPart3Completed = true;
            ////////    //}
            ////////}

            ////////if (!isQuestionnaireCompleted)
            ////////{
            ////////    lnkPreschoolProgramInformation.NavigateUrl = "PreschoolSurveyNotAvailable.aspx";
            ////////    //lnkPreschoolEnrollment.NavigateUrl = "PreschoolSurveyNotAvailable.aspx";
            ////////    //lnkPreschoolClass.NavigateUrl = "PreschoolSurveyNotAvailable.aspx";
            ////////    lnkGrantOnlineLink.Enabled = false;
            ////////}
            //////////else if (!isSurveyPart1Completed)
            //////////{
            //////////    //lnkGrantOnlineLink.NavigateUrl = "PreschoolGrantNotAvailable.aspx";
            //////////    lnkGrantOnlineLink.Enabled = false;
            //////////}
            ////////else
            ////////{
            ////////    lnkGrantOnlineLink.Enabled = true;
            ////////}

            lnkGrantOnlineLink.Enabled = true;
        }
    }
    protected void lnkGrantOnlineLink_Click(object sender, EventArgs e)
    {
        DataSet ds = dal.GetGrantApplicant(Convert.ToInt32(Session["GrantApplicantId"]), AppInfo.FundCode);

        if (ds.Tables[0].Rows.Count > 0)
        {
            Session["Program Name"] = ds.Tables[0].Rows[0]["ProgramName"].ToString();
            Session["Eligibility Amount"] = Decimal.Parse(ds.Tables[0].Rows[0]["EligibilityAmount"].ToString()).ToString("N2");
        }

        Response.Redirect("~/CheckList.aspx");
    }
}
