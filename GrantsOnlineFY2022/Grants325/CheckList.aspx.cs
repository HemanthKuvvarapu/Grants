using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;


public partial class CheckList : System.Web.UI.Page
{
    DAL dal = new DAL();
    DataSet ds;
    Amendment amend = new Amendment();


    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["GrantApplicantId"] == null) Response.Redirect("SessionTimeout.aspx");

        Master.PartTitle = "Steps to Complete the Online Application";
   
        if (!Page.IsPostBack)
        {

            if (Session["GrantApplicantId"] != null)
            {
                BindData();
            }
            else
            {
                Response.Redirect("Default.aspx");
            }
        }

        DisplayAmendmentSection();
        DisplayFinancialReport();
    }

    private void DisplayFinancialReport()
    {
        if (AppInfo.FinancialReport)
        {
            tblFinancialReport.Visible = true;
        }
        else
        {
            tblFinancialReport.Visible = false;
        }
    }

    private void DisplayAmendmentSection()
    {
        if (AppInfo.Amendment1 || AppInfo.Amendment2 || AppInfo.Amendment3)
        {
            amendmentHeader.Visible = true;
            amendmentSection.Visible = true;

            btnSelectCommuntiesServedPart2.Enabled = false;
            btnSelectLanguagesServedPart3.Enabled = false;
            btnSelectLeadAgencyBudgetPart4.Enabled = false;
            btnSelectSubcontractorPart5.Enabled = false;
            btnSelectBudgetSummaryPart6a.Enabled = false;
            btnSelectBudgetSummaryPart6b.Enabled = false;
            btnSelectBudgetSummaryPart6c.Enabled = false;
            btnSelectNarrativeQuestionsPart7.Enabled = false;
            btnSelectProjectedDeliverablePart8.Enabled = false;
            btnSelectRequiredGrantFormsPart9.Enabled = false;
            btnSelectChecklistPart10.Enabled = false;
            btnSelectCoverPagePart11.Enabled = false;

            btnSubmit.Enabled = false;
        }
        else
        {
            btnSelectCommuntiesServedPart2.Enabled = false;
            btnSelectNarrativeQuestionsPart7.Enabled = false;
            btnSelectProjectedDeliverablePart8.Enabled = false;
            amendmentHeader.Visible = false;
            amendmentSection.Visible = false;
        }

        if (AppInfo.Amendment1)
        {
            tblAmendment1.Visible = true;
        }


        if (AppInfo.Amendment2)
        {
            tblAmendment2.Visible = true;
        }


        if (AppInfo.Amendment3)
        {
            tblAmendment3.Visible = true;
        }

#region AmendmentCheck
        //Code below works well, but does not allow going back to fix an amendment after submitted if not approved by EEC
        //DataSet dsAmend = amend.GetLatestBudgetNarrativeAmendment(Convert.ToInt32(Session["GrantApplicantId"]));

        //if (dsAmend.Tables[0].Rows.Count > 0)
        //{
        //    DataRow drAmend = dsAmend.Tables[0].Rows[0];

        //    if (AppInfo.Amendment2)
        //    {
        //        tblAmendment2.Visible = true;
        //        //add check for Amendment 1
        //        if (drAmend["LatestVersion"].ToString() == "1" || drAmend["LatestVersion"].ToString() == "2")
        //        {
        //            btnAmendmentHome2.Enabled = true;
        //            btnAmendmentHome1.Enabled = false;
        //        }
        //        else
        //        {
        //            btnAmendmentHome2.Enabled = false;
        //        }
        //    }
        //    if (AppInfo.Amendment3)
        //    {
        //        tblAmendment2.Visible = true;
        //        tblAmendment3.Visible = true;
        //        //add check for Amendmment 2
        //        if (drAmend["LatestVersion"].ToString() == "2" || drAmend["LatestVersion"].ToString() == "3")
        //        {
        //            btnAmendmentHome3.Enabled = true;
        //            btnAmendmentHome2.Enabled = false;
        //            btnAmendmentHome1.Enabled = false;
        //        }
        //        else
        //        {
        //            btnAmendmentHome3.Enabled = false;
        //        }
        //    }
        //}
    }
#endregion

    /// <summary>
    /// check to see what sections have been completed/visited and change the select button and the Completed Image accordingly.
    /// Also show the Print All button and any other at the bottom based on the completion of the sections.
    /// </summary>
    private void BindData()
    {

        int errorCount;
        int warningCount;
        bool isNoRecord;

        bool enableSubmit = true;

        #region Update status

        if (AppInfo.DisplayPart1)
        {
            if (isValidContactInformation(out errorCount, out isNoRecord))
            {
                if (!isNoRecord)
                {
                    imgPart1.ImageUrl = "~/Images/Completed.jpg";
                }
                else
                {
                    if (enableSubmit)
                    {
                        enableSubmit = false;
                    }
                }
            }
            else
            {
                if (enableSubmit)
                {
                    enableSubmit = false;
                }
            }
        }

        if (AppInfo.DisplayPart2)
        {
            if (isValidGrantProposal(out errorCount, out isNoRecord))
            {
                if (!isNoRecord)
                {
                    imgPart2.ImageUrl = "~/Images/Completed.jpg";
                }
                else
                {
                    if (enableSubmit)
                    {
                        enableSubmit = false;
                    }
                }
            }
            else
            {
                if (enableSubmit)
                {
                    enableSubmit = false;
                }
            }
        }
        else
        {
            imgPart2.Visible = false;
        }

        if (AppInfo.DisplayPart3)
        {
            if (isValidLanguages(out errorCount, out isNoRecord))
            {
                if (!isNoRecord)
                {
                    imgPart3.ImageUrl = "~/Images/Completed.jpg";
                }
                else
                {
                    if (enableSubmit)
                    {
                        enableSubmit = false;
                    }
                }
            }
            else
            {
                if (enableSubmit)
                {
                    enableSubmit = false;
                }
            }
        }

        if (AppInfo.DisplayPart4)
        {
            if (isValidLeadAgencyBudget(out errorCount, out warningCount, out isNoRecord))
            {
                if (!isNoRecord)
                {
                    imgPart4.ImageUrl = "~/Images/Completed.jpg";
                }
                else
                {
                    if (enableSubmit)
                    {
                        enableSubmit = false;
                    }
                }

                lblErrorPart4.Visible = false;
            }
            else
            {
                lblErrorPart4.Visible = true;
                lblErrorPart4.Text = "(" + errorCount.ToString() + " error(s) found)";

                if (enableSubmit)
                {
                    enableSubmit = false;
                }
            }

            if (warningCount > 0)
            {
                lblWarningPart4.Visible = true;
                lblWarningPart4.Text = "(" + warningCount.ToString() + " warning(s) found)";
            }
            else
            {
                lblWarningPart4.Visible = false;
            }
        }
        //end - part 4 validation

        //begin - part 5 validation
        if (AppInfo.DisplayPart5)
        {
            if (isValidSubcontractorBudget(out errorCount, out warningCount, out isNoRecord))
            {
                imgPart5.ImageUrl = "~/Images/Completed.jpg";
                lblErrorPart5.Visible = false;
            }
            else
            {
                lblErrorPart5.Visible = true;
                lblErrorPart5.Text = "(" + errorCount.ToString() + " error(s) found)";

                if (enableSubmit)
                {
                    enableSubmit = false;
                }
            }

            if (warningCount > 0)
            {
                lblWarningPart5.Visible = true;
                lblWarningPart5.Text = "(" + warningCount.ToString() + " warning(s) found)";
            }
            else
            {
                lblWarningPart5.Visible = false;
            }
        }
        //end - part 5 validation

        //begin - part 6a validation
        if (AppInfo.DisplayPart6a)
        {
            if (isValidBudgetSummary(out errorCount, out isNoRecord))
            {
                if (!isNoRecord)
                {
                    imgPart6a.ImageUrl = "~/Images/Completed.jpg";
                    lblErrorPart6a.Visible = false;
                }
                else
                {
                    if (enableSubmit)
                    {
                        enableSubmit = false;
                    }
                }
            }
            else
            {
                lblErrorPart6a.Visible = true;
                lblErrorPart6a.Text = "(" + errorCount.ToString() + " error(s) found)";

                if (enableSubmit)
                {
                    enableSubmit = false;
                }
            }
        }
        //end - part 6a validation

        //begin - part 6b validation
        if (AppInfo.DisplayPart6b)
        {
            if (isValidBudgetSummary(out errorCount, out isNoRecord))
            {
                if (!isNoRecord)
                {
                    imgPart6b.ImageUrl = "~/Images/Completed.jpg";
                    lblErrorPart6b.Visible = false;
                }
                else
                {
                    if (enableSubmit)
                    {
                        enableSubmit = false;
                    }
                }
            }
            else
            {
                lblErrorPart6b.Visible = true;
                lblErrorPart6b.Text = "(" + errorCount.ToString() + " error(s) found)";

                if (enableSubmit)
                {
                    enableSubmit = false;
                }
            }
        }
        else
        {
            Section6b_1.Visible = false;
            Section6b_2.Visible = false;
        }
        //end - part 6b validation

        //begin - part 6c validation
        if (AppInfo.DisplayPart6c)
        {
            if (isValidBudgetSummary(out errorCount, out isNoRecord))
            {
                if (!isNoRecord)
                {
                    imgPart6c.ImageUrl = "~/Images/Completed.jpg";
                    lblErrorPart6c.Visible = false;
                }
                else
                {
                    if (enableSubmit)
                    {
                        enableSubmit = false;
                    }
                }
            }
            else
            {
                lblErrorPart6c.Visible = true;
                lblErrorPart6c.Text = "(" + errorCount.ToString() + " error(s) found)";

                if (enableSubmit)
                {
                    enableSubmit = false;
                }
            }
        }
        else
        {
            Section6c_1.Visible = false;
            Section6c_2.Visible = false;
        }
        //end - part 6c validation

        //begin - part 7 validation
        if (AppInfo.DisplayPart7)
        {
            if (isValidNarrativeQuestions(out errorCount, out isNoRecord))
            {
                if (!isNoRecord)
                {
                    imgPart7.ImageUrl = "~/Images/Completed.jpg";
                }
                else
                {
                    if (enableSubmit)
                    {
                        enableSubmit = false;
                    }
                }

                lblErrorPart7.Visible = false;
            }
            else
            {
                lblErrorPart7.Visible = true;
                lblErrorPart7.Text = "(" + errorCount.ToString() + " error(s) found)";

                if (enableSubmit)
                {
                    enableSubmit = false;
                }
            }
        }
        else
        {
            imgPart7.Visible = false;
            //btnSelectNarrativeQuestionsPart7.Visible = false;
        }
        //end - part 7 validation

        //begin - part 8 validation
        if (AppInfo.DisplayPart8)
        {
            if (isValidProjectedDeliverablesQuestions(out errorCount, out isNoRecord))
            {
                if (!isNoRecord)
                {
                    imgPart8.ImageUrl = "~/Images/Completed.jpg";
                }
                else
                {
                    if (enableSubmit)
                    {
                        enableSubmit = false;
                    }
                }

                lblErrorPart8.Visible = false;
            }
            else
            {
                lblErrorPart8.Visible = true;
                lblErrorPart8.Text = "(" + errorCount.ToString() + " error(s) found)";

                if (enableSubmit)
                {
                    enableSubmit = false;
                }
            }
        }
        else
        {
            imgPart8.Visible = false;
        }
        //end - part 8 validation

        if (AppInfo.DisplayPart9)
        {
            if (isValidRequiredForms(out errorCount, out isNoRecord))
            {
                if (!isNoRecord && errorCount == 0)
                {
                    imgPart9.ImageUrl = "~/Images/Completed.jpg";
                }
                else
                {
                    if (enableSubmit)
                    {
                        enableSubmit = false;
                    }
                }

                lblErrorPart9.Visible = false;
            }
            else
            {
                lblErrorPart9.Visible = true;
                lblErrorPart9.Text = "(" + errorCount.ToString() + " error(s) found)";

                if (enableSubmit)
                {
                    enableSubmit = false;
                }
            }
        }

        if (AppInfo.DisplayPart10)
        {
            if (isValidPDFCheckList(out errorCount, out isNoRecord))
            {
                if (!isNoRecord)
                {
                    imgPart10.ImageUrl = "~/Images/Completed.jpg";
                }
                else
                {
                    if (enableSubmit)
                    {
                        enableSubmit = false;
                    }
                }
            }
            else
            {
                if (enableSubmit)
                {
                    enableSubmit = false;
                }
            }
        }

        if (AppInfo.DisplayPart11)
        {
            if (isValidCover(out errorCount, out isNoRecord))
            {
                imgPart11.ImageUrl = "~/Images/Completed.jpg";
            }
            else
            {
                if (enableSubmit)
                {
                    enableSubmit = false;
                }
            }
        }

        btnSubmit.Enabled = enableSubmit;

        if (!string.IsNullOrEmpty(dal.GetLatestSubmissionDate(Convert.ToInt32(Session["GrantApplicantId"].ToString()))))
        {
            btnPrint.Enabled = true;
        }
        else
        {
            btnPrint.Enabled = false;
        }

        #endregion
    }

    protected void btnSelectContactInfoPart1_Click(object sender, EventArgs e)
    {
        NextPage("part1");
    }
    protected void btnSelectCommuntiesServedPart2_Click(object sender, EventArgs e)
    {

        NextPage("part2");
    }
    protected void btnSelectLanguagesServedPart3_Click(object sender, EventArgs e)
    {
        NextPage("part3");
    }
    protected void btnSelectLeadAgencyBudgetPart4_Click(object sender, EventArgs e)
    {
        NextPage("part4");
    }
    protected void btnSelectSubcontractorPart5_Click(object sender, EventArgs e)
    {
        NextPage("part5");
    }
    protected void btnSelectBudgetSummaryPart6a_Click(object sender, EventArgs e)
    {
        NextPage("part6a");
    }
    protected void btnSelectBudgetSummaryPart6b_Click(object sender, EventArgs e)
    {
        NextPage("part6b");
    }
    protected void btnSelectBudgetSummaryPart6c_Click(object sender, EventArgs e)
    {
        NextPage("part6c");
    }
    protected void btnSelectNarrativeQuestionsPart7_Click(object sender, EventArgs e)
    {
        NextPage("part7");
    }
    protected void btnSelectProjectedDeliverablePart8_Click(object sender, EventArgs e)
    {
        NextPage("part8");
    }

    protected void btnSelectRequiredGrantFormsPart9_Click(object sender, EventArgs e)
    {
        NextPage("part9");
    }

    protected void btnSelectChecklistPart10_Click(object sender, EventArgs e)
    {
        NextPage("part10");
    }

    protected void btnSelectCoverPagePart11_Click(object sender, EventArgs e)
    {
        NextPage("part11");
    }

    private void NextPage(string part)
    {
        string redirectURL = "";

        switch (part.ToLower())
        {
            case "part1":
                redirectURL = "ApplicantInfo.aspx";
                break;

            case "part2":
                redirectURL = "CommunitiesServed.aspx";
                break;

            case "part3":
                redirectURL = "Languages.aspx";
                break;

            case "part4":
                redirectURL = "BudgetNarrative.aspx";
                break;

            case "part5":
                redirectURL = "BudgetNarrativeSubcontractorHome.aspx";
                break;

            case "part6a":
                redirectURL = "BudgetNarrativeSummary.aspx";
                break;
            case "part6b":
                redirectURL = "BudgetNarrativeSummaryProjected1Year.aspx";
                break;
            case "part6c":
                redirectURL = "BudgetNarrativeSummaryProjected2Year.aspx";
                break;
            case "part7":
                redirectURL = "NarrativeQuestions.aspx";
                break;

            case "part8":
                redirectURL = "ProjectedDeliverables.aspx";
                break;

            case "part9":
                redirectURL = "RequiredGrantForms.aspx";
                break;

            case "part10":
                redirectURL = "PDFCheckList.aspx";
                break;

            case "part11":
                redirectURL = "CoverPage.aspx";
                break;

            default:
                redirectURL = "CheckList.aspx";
                break;
        }

        Response.Redirect(redirectURL);
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        //if (rbtnMiscDocs.Items.FindByValue("1").Selected)
        //{
        //save misc docs value.
        try
        {
            dal.SaveMiscDocsPrinted(Convert.ToInt32(Session["GrantApplicantId"]), 1);
        }
        catch { }

        Response.Redirect("SI_Complete.aspx");
        //}
        //else
        //{
        //    lblMessage.Visible = true;
        //}
    }
    protected void btnPrint_Click(object sender, EventArgs e)
    {
        Response.Redirect("Print.aspx?type=package");
    }

    protected void btnSelectPDFCheckList_Click(object sender, EventArgs e)
    {
        Response.Redirect("PDFCheckList.aspx");
    }

    protected void btnCoverPage_Click(object sender, EventArgs e)
    {
        Response.Redirect("CoverPage.aspx");
    }

    protected void btnGrantDeliverables_Click(object sender, EventArgs e)
    {
        Response.Redirect("GrantDeliverables.aspx");
    }

    private bool isValidPDFCheckList(out int errorCount, out bool isNoRecord)
    {
        errorCount = 0;

        DAL dal = new DAL();

        DataSet ds = dal.GetPDFCheckList(Convert.ToInt32(Session["GrantApplicantId"].ToString()));

        if (ds.Tables[0].Rows.Count > 0)
        {
            isNoRecord = false;
        }
        else
        {
            isNoRecord = true;
        }

        return !isNoRecord;
    }

    private bool isValidCover(out int errorCount, out bool isNoRecord)
    {
        errorCount = 0;
        isNoRecord = true;

        DAL dal = new DAL();

        DataSet ds = dal.GetCoverPageData(Session["GrantApplicantId"].ToString());

        if (ds.Tables[0].Rows.Count > 0)
        {
            if (string.IsNullOrEmpty(ds.Tables[0].Rows[0]["GrantContactEmail"].ToString()) || 
                string.IsNullOrEmpty(ds.Tables[0].Rows[0]["GrantContactPhone"].ToString()) ||
                string.IsNullOrEmpty(ds.Tables[0].Rows[0]["TaxId"].ToString()))
            {
                errorCount = 1;
                isNoRecord = false;
            }
        }
        else
        {
            isNoRecord = true;
        }

        return (errorCount == 0);
    }

    private bool isValidLanguages(out int errorCount, out bool isNoRecord)
    {
        errorCount = 0;

        DAL dal = new DAL();

        DataSet ds = dal.GetGrantLanguage(Convert.ToInt32(Session["GrantApplicantId"]));

        if (ds.Tables[0].Rows.Count > 0)
        {
            isNoRecord = false;
        }
        else
        {
            isNoRecord = true;
        }

        return !isNoRecord;
    }

    private bool isValidGrantProposal(out int errorCount, out bool isNoRecord)
    {
        errorCount = 0;
        isNoRecord = true;

        DAL dal = new DAL();
        bool hasSelectedTown = false;

        DataSet ds = dal.GetAllCommunitiesServed(Convert.ToInt32(Session["GrantApplicantId"]), AppInfo.FiscalYear);

        if (ds.Tables[1].Rows.Count > 0)
        {
            for (int i = 0; i < ds.Tables[1].Rows.Count; i++)
            {
                if (!string.IsNullOrEmpty(ds.Tables[1].Rows[i]["isSelected"].ToString()))
                {
                    hasSelectedTown = true;
                    break;
                }
            }

            if (hasSelectedTown)
            {
                isNoRecord = false;
            }
        }

        return !isNoRecord;
    }

    private bool isValidContactInformation(out int errorCount, out bool isNoRecord)
    {
        errorCount = 0;

        DAL dal = new DAL();

        DataSet ds = dal.GetGrantContacts(Convert.ToInt32(Session["GrantApplicantId"]));

        if (ds.Tables[0].Rows.Count > 0)
        {
            isNoRecord = false;
        }
        else
        {
            isNoRecord = true;
        }

        return !isNoRecord;
    }

    private bool isValidBudgetSummary(out int errorCount, out bool isNoRecord)
    {
        errorCount = 0;
        isNoRecord = false;
        float amount;

        DAL dal = new DAL();

        DataSet ds = dal.GetBudgetSummary(Int32.Parse(Session["GrantApplicantId"].ToString()));
        DataSet dsSumm = dal.GetBudgetAmountTotal(Convert.ToInt32(Session["GrantApplicantId"].ToString()));
        if (ds.Tables[0].Rows.Count > 0)
        {
            if (!GlobalFunc.isValidBudgetUpToEligibilityAmount(Int32.Parse(Single.Parse(ds.Tables[0].Rows[0]["EligibilityAmount"].ToString()).ToString()), dsSumm))
            {
                errorCount++;
            }

            if (!GlobalFunc.isValidBudgetSummaryEECAdminLimit(ds, Int32.Parse(Single.Parse(Session["Eligibility Amount"].ToString()).ToString()), out amount))
            {
                errorCount++;
            }
        }
        else
        {
            isNoRecord = true;
        }

        return errorCount == 0;
    }

    private bool isValidRequiredForms(out int errorCount, out bool isNoRecord)
    {
        DAL dal = new DAL();

        errorCount = 0;
        isNoRecord = false;

        DataSet ds = dal.GetGrantPartStatus(Int32.Parse(Session["GrantApplicantId"].ToString()), "9");

        if (ds.Tables[0].Rows.Count > 0)
        {
            errorCount = Int32.Parse(ds.Tables[0].Rows[0]["ErrorCount"].ToString());
        }
        else
        {
            isNoRecord = true;
        }

        return (errorCount == 0);
    }

    private bool isValidNarrativeQuestions(out int errorCount, out bool isNoRecord)
    {
        DAL dal = new DAL();

        errorCount = 0;
        isNoRecord = false;

        DataSet ds = dal.GetNarrativeData(Int32.Parse(Session["GrantApplicantId"].ToString()));

        if (ds.Tables[0].Rows.Count > 0)
        {
            DataSet ds2 = dal.GetGrantPartStatus(Int32.Parse(Session["GrantApplicantId"].ToString()), "7");

            if (ds2.Tables[0].Rows.Count > 0)
            {
                errorCount = Int32.Parse(ds2.Tables[0].Rows[0]["ErrorCount"].ToString());
            }
        }
        else
        {
            isNoRecord = true;
        }

        return (errorCount == 0);
    }

    private bool isValidProjectedDeliverablesQuestions(out int errorCount, out bool isNoRecord)
    {
        DAL dal = new DAL();

        errorCount = 0;
        isNoRecord = false;
        DataSet ds = dal.GetProjectedDeliverables(Int32.Parse(Session["GrantApplicantId"].ToString()));

        if (ds.Tables[0].Rows.Count > 0)
        {
            errorCount = Int32.Parse(ds.Tables[0].Rows[0]["ErrorCount"].ToString());
        }
        else
        {
            isNoRecord = true;
        }
        return (errorCount == 0);
    }

    private bool isValidLeadAgencyBudget(out int errorCount, out int warningCount, out bool isNoRecord)
    {
        DAL dal = new DAL();

        errorCount = 0;
        warningCount = 0;
        isNoRecord = false;

        DataSet ds = dal.GetBudgetNarrativeData(Int32.Parse(Session["GrantApplicantId"].ToString()), 1);

        if (ds.Tables[0].Rows.Count > 0)
        {
            errorCount = Int32.Parse(ds.Tables[0].Rows[0]["ErrorCount"].ToString());
            warningCount = Int32.Parse(ds.Tables[0].Rows[0]["WarningCount"].ToString());
        }
        else
        {
            isNoRecord = true;
        }

        return (errorCount == 0);
    }

    private bool isValidSubcontractorBudget(out int errorCount, out int warningCount, out bool isNoRecord)
    {
        DAL dal = new DAL();

        errorCount = 0;
        warningCount = 0;
        isNoRecord = false;

        DataSet ds = dal.GetHSSubContractorsInfo(Int32.Parse(Session["GrantApplicantId"].ToString()), 0);

        if (ds.Tables[0].Rows.Count > 0)
        {
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                errorCount = errorCount + Int32.Parse(ds.Tables[0].Rows[i]["ErrorCount"].ToString());
                warningCount = warningCount + Int32.Parse(ds.Tables[0].Rows[i]["WarningCount"].ToString());
            }
        }
        else
        {
            isNoRecord = true;
        }

        return (errorCount == 0);
    }

    protected void btnAmendmentHome1_Click(object sender, EventArgs e)
    {
        //Add check if submitted already
        string confirmMsg = "";

        DataSet dsAmend = amend.GetLatestBudgetNarrativeAmendment(Convert.ToInt32(Session["GrantApplicantId"]));

        if (dsAmend.Tables[0].Rows.Count > 0)
        {
            DataRow drAmend = dsAmend.Tables[0].Rows[0];

            if (drAmend["SubmittedAmendment1"].ToString() == "1" && drAmend["SubmitDateAmendment1"].ToString() != "")
            { 
                confirmMsg = "You have already submitted Amendment #1 on " + drAmend["SubmitDateAmendment1"].ToString() + ".  Are you sure you want to edit Amendment #1?";

                Response.Write("<script language=javascript>");
                Response.Write("if(confirm('" + confirmMsg +"')){window.location.href='AmendmentHome.aspx?ver=1'}");
                Response.Write("</script>");
            }
            else
            {
                Response.Redirect("AmendmentHome.aspx?ver=1");
            }
        }
        else
        {
            Response.Redirect("AmendmentHome.aspx?ver=1");
        }
    }

    protected void btnAmendmentHome2_Click(object sender, EventArgs e)
    {
        //add check if submitted already
        string confirmMsg = "";
        DataSet dsAmend = amend.GetLatestBudgetNarrativeAmendment(Convert.ToInt32(Session["GrantApplicantId"]));

        if (dsAmend.Tables[0].Rows.Count > 0)
        {
            DataRow drAmend = dsAmend.Tables[0].Rows[0];

            if (drAmend["SubmittedAmendment2"].ToString() == "1" && drAmend["SubmitDateAmendment2"].ToString() != "")
            {
                confirmMsg = "You have already submitted Amendment #2 on " + drAmend["SubmitDateAmendment2"].ToString() + ".  Are you sure you want to edit Amendment #2?";

                Response.Write("<script language=javascript>");
                Response.Write("if(confirm('" + confirmMsg + "')){window.location.href='AmendmentHome.aspx?ver=2'}");
                Response.Write("</script>");

            }
            else if (drAmend["SubmittedAmendment1"].ToString() == "0" || drAmend["SubmitDateAmendment1"].ToString() == "")
            {
                confirmMsg = "You have not yet submitted Amendment #1. Do you want to edit Amendment #1?";

                Response.Write("<script language=javascript>");
                Response.Write("if(confirm('" + confirmMsg + "')){window.location.href='AmendmentHome.aspx?ver=1'}");
                Response.Write("</script>");

            }
            else
            {
                Response.Redirect("AmendmentHome.aspx?ver=2");
            }
        }
        else
        {
            //return;
            Response.Redirect("AmendmentHome.aspx?ver=1");
        }

    }

    protected void btnFinancialReport_Click(object sender, EventArgs e)
    {
  
        Response.Redirect("FinancialReportBudgetNarrative.aspx");
    }

    protected void btnAmendmentHome3_Click(object sender, EventArgs e)
    {
        //add check if submitted already
        string confirmMsg = "";

        DataSet dsAmend = amend.GetLatestBudgetNarrativeAmendment(Convert.ToInt32(Session["GrantApplicantId"]));

        if (dsAmend.Tables[0].Rows.Count > 0)
        {
            DataRow drAmend = dsAmend.Tables[0].Rows[0];

            if (drAmend["SubmittedAmendment3"].ToString() == "1" && drAmend["SubmitDateAmendment3"].ToString() != "")
            {
                confirmMsg = "You have already submitted Amendment #3 on " + drAmend["SubmitDateAmendment3"].ToString() + ".  Are you sure you want to edit Amendment #3?";

                Response.Write("<script language=javascript>");
                Response.Write("if(confirm('" + confirmMsg + "')){window.location.href='AmendmentHome.aspx?ver=3'}");
                Response.Write("</script>");

            }
            else if (drAmend["SubmittedAmendment1"].ToString() == "0" || drAmend["SubmitDateAmendment1"].ToString() == "")
            {
                confirmMsg = "You have not yet submitted Amendment #1. Do you want to edit Amendment #1?";

                Response.Write("<script language=javascript>");
                Response.Write("if(confirm('" + confirmMsg + "')){window.location.href='AmendmentHome.aspx?ver=1'}");
                Response.Write("</script>");
            
            }
            else if (drAmend["SubmittedAmendment2"].ToString() == "0" || drAmend["SubmitDateAmendment2"].ToString() == "")
            { 
                confirmMsg = "You have not yet submitted Amendment #2.  Do you want to edit Amendment #2?";

                Response.Write("<script language=javascript>");
                Response.Write("if(confirm('" + confirmMsg + "')){window.location.href='AmendmentHome.aspx?ver=2'}");
                Response.Write("</script>");

            }
            else
            {
                Response.Redirect("AmendmentHome.aspx?ver=3");
            }
        
        }
        else
        {
            //return;
            Response.Redirect("AmendmentHome.aspx?ver=1");
        }
    }

}

