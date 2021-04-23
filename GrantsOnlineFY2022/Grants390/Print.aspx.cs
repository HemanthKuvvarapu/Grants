﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Print : System.Web.UI.Page
{
    DAL dal = new DAL();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["GrantApplicantId"] == null)
        {
            if (Request.QueryString["GrantApplicantId"] == null)
                Response.Redirect("default.aspx?logout=true");
        }

        if (!IsPostBack)
        {
            string connStr = dal.GetConnStringForLicensing();

            byte[] result = null;
            string eD = "";
            int requestID = 0;

            int GrantApplicantId;

            if (Session["GrantApplicantId"] != null)
                GrantApplicantId = Convert.ToInt32(Session["GrantApplicantId"]);
            else
                GrantApplicantId = Convert.ToInt32(Request.QueryString["GrantApplicantId"]);

            string type = Request.QueryString["type"] != null ? Request.QueryString["type"].ToString() : "";

            SSRSAgent2008.SSRSAgent c = new SSRSAgent2008.SSRSAgent();
            string ssrsFolder = System.Configuration.ConfigurationManager.AppSettings.Get("SSRSFolder");
            string fileName = "GrantApplicant_";

            switch(type)
            {
                case "a": //print all proposals.
                    
                    if (AppInfo.FundCode == 390)
                    {
                        fileName = fileName + "AllProposals.pdf";
                        requestID = c.AddRequest(connStr, ssrsFolder + "AllProposalsHeadStart", GrantApplicantId.ToString(), "GrantApplicantId", 1, "PDF", ref eD);
                    }

                    break;
                case "contacts": //print statewide summary.
                    fileName = fileName + "Contacts.pdf";
                    requestID = c.AddRequest(connStr, ssrsFolder + "Part_1_ContactInformation", GrantApplicantId.ToString(), "GrantApplicantId", 1, "PDF", ref eD);
                    break;
                case "pdfchecklist": //print statewide summary.
                    fileName = fileName + "CheckList.pdf";
                    requestID = c.AddRequest(connStr, ssrsFolder + "Part_10_CheckList", GrantApplicantId.ToString(), "GrantApplicantId", 1, "PDF", ref eD);
                    break;
                case "p": //print a specific proposal
                    fileName = fileName + "Proposal.pdf";
                    requestID = c.AddRequest(connStr, ssrsFolder + "ProposalSummaryHSGrant", GrantApplicantId.ToString() + "|" + Session["ProposalId"].ToString(), "GrantApplicantId|ProposalId", 2, "PDF", ref eD);
                    break;
                case "all":
                case "package":
                    fileName = fileName + "GrantSummary.pdf";
                    requestID = c.AddRequest(connStr, ssrsFolder + "GrantSummary", GrantApplicantId.ToString() + "|" + AppInfo.FiscalYear.ToString(), "GrantApplicantId|FiscalYear", 2, "PDF", ref eD);
                    break;
                case "communitiesServed":
                    fileName = fileName + "CommunitiesServed.pdf";
                    requestID = c.AddRequest(connStr, ssrsFolder + "Part_2_CommunitiesServed", GrantApplicantId.ToString() + "|" + AppInfo.FiscalYear.ToString(), "GrantApplicantId|FiscalYear", 2, "PDF", ref eD);
                    break;
                case "CoverSheet":
                    fileName = fileName + "CoverSheetPart11.pdf";
                    requestID = c.AddRequest(connStr, ssrsFolder + "Part_11_CoverSheet", GrantApplicantId.ToString(), "GrantApplicantId", 1, "PDF", ref eD);
                    break;
                case "budgetSummary":
                    fileName = fileName + "budgetSummary.pdf";
                    requestID = c.AddRequest(connStr, ssrsFolder + "BudgetSubtotals", GrantApplicantId.ToString(), "GrantApplicantId", 1, "PDF", ref eD);
                    break;
                //budgetSummaryProjected1Year
                case "budgetSummaryProjected1Year":
                    fileName = fileName + "budgetSummaryProjected1Year.pdf";
                    requestID = c.AddRequest(connStr, ssrsFolder + "BudgetSubtotalsOneYear", GrantApplicantId.ToString(), "GrantApplicantId", 1, "PDF", ref eD);
                    break;
                case "budgetSummaryProjected2Year":
                    fileName = fileName + "budgetSummaryProjected2Year.pdf";
                    requestID = c.AddRequest(connStr, ssrsFolder + "BudgetSubtotalsTwoYear", GrantApplicantId.ToString(), "GrantApplicantId", 1, "PDF", ref eD);
                    break;
                case "LanguagesServed":
                    fileName = fileName + "LanguagesServed.pdf";
                    requestID = c.AddRequest(connStr, ssrsFolder + "Part_3_LanguagesServed", GrantApplicantId.ToString(), "GrantApplicantId", 1, "PDF", ref eD);
                    break;
                case "LeadAgencyBudget":
                    fileName = fileName + "LeadAgencyBudgetPart4.pdf";
                    requestID = c.AddRequest(connStr, ssrsFolder + "Part_4_LeadAgencyBudget", GrantApplicantId.ToString() + "|1|0", "GrantApplicantId|IsLeadAgency|IsPCHP", 3, "PDF", ref eD);
                    break;
                case "SubcontractorBudget":
                    fileName = fileName + "SubcontractorBudgetPart5.pdf";
                    requestID = c.AddRequest(connStr, ssrsFolder + "Part_5_SubcontractorBudget", GrantApplicantId.ToString() + "|" + Session["SCID"].ToString(), "GrantApplicantId|SCID", 2, "PDF", ref eD);
                    break;

                case "NarrativeQuestions":
                    fileName = fileName + "NarrativeQuestionsPart7.pdf";
                    requestID = c.AddRequest(connStr, ssrsFolder + "Part_7_NarrativeQuestions", GrantApplicantId.ToString(), "GrantApplicantId", 1, "PDF", ref eD);
                    break;

                case "ProjectedDeliverable":
                    fileName = fileName + "ProjectedDeliverablePart8.pdf";
                    requestID = c.AddRequest(connStr, ssrsFolder + "Part_8_ProjectedDeliverable", GrantApplicantId.ToString(), "GrantApplicantId", 1, "PDF", ref eD);
                    break;
                case "RequiredForms":
                    fileName = fileName + "RequiredForms.pdf";
                    requestID = c.AddRequest(connStr, ssrsFolder + "Part_9_RequiredGrantForms", GrantApplicantId.ToString(), "GrantApplicantId", 1, "PDF", ref eD);
                    break;
                //case "schedulea":
                //case "part6":
                //    fileName = fileName + "ScheduleA_" + Session["OrgCode"].ToString() + ".pdf";
                //    requestID = c.AddRequest(connStr, ssrsFolder + "G262_ScheduleA", GrantApplicantId.ToString(), "GrantApplicantId", 1, "PDF", ref eD);
                //    break;
                //case "cover":
                //    fileName = fileName + "CoverPage_" + Session["OrgCode"].ToString() + ".pdf";
                //    requestID = c.AddRequest(connStr, ssrsFolder + "G262_CoverSheet", GrantApplicantId.ToString(), "GrantApplicantId", 1, "PDF", ref eD);
                //    break;
                //case "pdfchecklist":
                //    fileName = fileName + "PDFChecklist_" + Session["OrgCode"].ToString() + ".pdf";
                //    requestID = c.AddRequest(connStr, ssrsFolder + "G262_CheckList", GrantApplicantId.ToString(), "GrantApplicantId", 1, "PDF", ref eD);
                //    break;
                case "AmendmentCoverSheet":
                    fileName = fileName + "AmendmentCoverSheet.pdf";
                    requestID = c.AddRequest(connStr, ssrsFolder + "AmendmentCoverSheet", GrantApplicantId.ToString() + "|" + Session["AmendmentVersion"].ToString(), "GrantApplicantId|Version", 2, "PDF", ref eD);
                    break;
                case "BudgetAmendmentSummary":
                    fileName = fileName + "BudgetAmendmentSummary.pdf";
                    requestID = c.AddRequest(connStr, ssrsFolder + "BudgetAmendmentSummary", GrantApplicantId.ToString() + "|" + Session["AmendmentVersion"].ToString(), "GrantApplicantId|Version", 2, "PDF", ref eD);
                    break;
                case "LeadAgencyBudgetAmendment":
                    fileName = fileName + "LeadAgencyBudgetAmendment.pdf";
                    requestID = c.AddRequest(connStr, ssrsFolder + "LeadAgencyBudgetAmendment", GrantApplicantId.ToString() + "|" + Session["BudgetNarrativeID"].ToString() + "|" + Session["AmendmentVersion"].ToString(), "GrantApplicantId|BudgetNarrativeID|Version", 3, "PDF", ref eD);
                    break;
                case "SubcontractorBudgetAmendment":
                    fileName = fileName + "SubcontractorBudgetAmendment.pdf";
                    requestID = c.AddRequest(connStr, ssrsFolder + "SubcontractorBudgetAmendment", GrantApplicantId.ToString() + "|" + Session["BudgetNarrativeID"].ToString() + "|" + Session["AmendmentVersion"].ToString(), "GrantApplicantId|BudgetNarrativeID|Version", 3, "PDF", ref eD);
                    break;
                case "BudgetAmendmentAll":
                    fileName = fileName + "GrantSummaryAmendment.pdf";
                    requestID = c.AddRequest(connStr, ssrsFolder + "GrantSummaryAmendment", GrantApplicantId.ToString() + "|" + Session["AmendmentVersion"].ToString(), "GrantApplicantId|Version", 2, "PDF", ref eD);
                    break;
                case "HSSurveyCenterBasedList":
                    fileName = fileName + "_" + "Head Start Center Based Site Survey" + ".pdf";
                    requestID = c.AddRequest(connStr, ssrsFolder + "HSCenterBaseSiteSurvey ", GrantApplicantId.ToString() + "|" + AppInfo.FiscalYear.ToString(), "HeadStartLeadAgencyID|FiscalYear", 2, "PDF", ref eD);
                    break;
                case "HSSurveyFCCList":
                    fileName = fileName + "_" + "Head Start Family Childcare Site Survey" + ".pdf";
                    requestID = c.AddRequest(connStr, ssrsFolder + "HSFCCSiteSurvey ", GrantApplicantId.ToString() + "|" + AppInfo.FiscalYear.ToString(), "HeadStartLeadAgencyID|FiscalYear", 2, "PDF", ref eD);
                    break;
                case "HSSurveyHomeBasedList":
                    fileName = fileName + "_" + "Head Start Home Based Site Survey" + ".pdf";
                    requestID = c.AddRequest(connStr, ssrsFolder + "HSHomeBaseSiteSurvey ", GrantApplicantId.ToString() + "|" + AppInfo.FiscalYear.ToString(), "HeadStartLeadAgencyID|FiscalYear", 2, "PDF", ref eD);
                    break;
                default://print all
                    fileName = fileName + "GrantSummary.pdf";
                    requestID = c.AddRequest(connStr, ssrsFolder + "GrantSummary", GrantApplicantId.ToString() + "|" + AppInfo.FiscalYear.ToString(), "GrantApplicantId|FiscalYear", 2, "PDF", ref eD);
                    break;
            }

            if (requestID > 0)
                result = c.GetImage(connStr, requestID, ref eD);
            else
            {
                Response.Write(eD);
                Response.End();
            }

            // display it
            if (result != null)
            {
                try
                {
                    Response.Clear();
                    Response.ClearContent();
                    Response.ClearHeaders();
                    Response.AddHeader("Content-Disposition", "attachment;filename=" + fileName);
                    Response.ContentType = "application/pdf";
                    Response.BinaryWrite(result);
                    Response.Flush();
                    Response.End();
                }
                catch (Exception ex)
                {
                    Response.Write(ex.Message);
                    Response.End();
                }
            }
 
        }
    }
}