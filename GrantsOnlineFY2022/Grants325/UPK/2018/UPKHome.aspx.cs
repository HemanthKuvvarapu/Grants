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

public partial class UPK_2018_UPKHome : System.Web.UI.Page
{
    DAL dal = new DAL();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["GrantApplicantId"] == null) Response.Redirect("~/SessionTimeout.aspx");

        if (AppInfo.Amendment1)
        {
            lnkUPKProgramInformation.Enabled = false;
            lnkGrantOnlineLink.Enabled = true;
            lnkQuestion.Enabled = false;
        }
        else
        {
            lnkQuestion.Enabled = true;
            lnkQuestion.NavigateUrl = "UPKQuestionnaire.aspx";

            DataSet ds = dal.GetUPKQuestionnaire(Convert.ToInt32(Session["GrantApplicantId"].ToString()));

            bool isUPKValid = true;

            if (ds.Tables[0].Rows.Count == 0)
            {
                lnkUPKProgramInformation.Enabled = false;
                lnkGrantOnlineLink.Enabled = false;

                isUPKValid = false;
            }
            else if (ds.Tables[0].Rows.Count > 0 && ds.Tables[0].Rows[0]["IsValid"].ToString() == "1")
            {
                lnkUPKProgramInformation.NavigateUrl = "UPKProgramInformation.aspx";
                lnkGrantOnlineLink.Enabled = true;
            }
            else
            {
                lnkUPKProgramInformation.NavigateUrl = "UPKNotAvailable.aspx";
                lnkGrantOnlineLink.Enabled = false;

                isUPKValid = false;
            }

            if (isUPKValid)
            {
                ds = dal.GetUPKPartStatus(Convert.ToInt32(Session["GrantApplicantId"].ToString()));

                bool isQuestionnaireCompleted = false;
                bool isSurveyPart1Completed = false;
                //bool isSurveyPart2Completed = false;
                //bool isSurveyPart3Completed = false;

                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    DataRow row = ds.Tables[0].Rows[i];

                    if (row["Part"].ToString() == "1" && row["Status"].ToString() == "1")
                    {
                        isQuestionnaireCompleted = true;
                    }
                    else if (row["Part"].ToString() == "2" && row["Status"].ToString() == "1")
                    {
                        isSurveyPart1Completed = true;
                    }
                    //else if (row["Part"].ToString() == "3" && row["Status"].ToString() == "1")
                    //{
                    //    isSurveyPart2Completed = true;
                    //}
                    //else if (row["Part"].ToString() == "4" && row["Status"].ToString() == "1")
                    //{
                    //    isSurveyPart3Completed = true;
                    //}
                }

                if (!isQuestionnaireCompleted)
                {
                    lnkUPKProgramInformation.NavigateUrl = "UPKSurveyNotAvailable.aspx";
                    //lnkUPKEnrollment.NavigateUrl = "UPKSurveyNotAvailable.aspx";
                    //lnkUPKClass.NavigateUrl = "UPKSurveyNotAvailable.aspx";
                    lnkGrantOnlineLink.Enabled = false;
                }
                else if (!isSurveyPart1Completed)
                {
                    //lnkGrantOnlineLink.NavigateUrl = "UPKGrantNotAvailable.aspx";
                    lnkGrantOnlineLink.Enabled = false;
                }
                else
                {
                    lnkGrantOnlineLink.Enabled = true;
                }
            }
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
