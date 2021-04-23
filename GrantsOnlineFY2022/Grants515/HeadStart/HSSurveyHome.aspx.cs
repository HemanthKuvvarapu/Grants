using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class HeadStart_HSSurveyHome : System.Web.UI.Page
{
    HSDAL dal = new HSDAL();
    DataSet ds;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["GrantApplicantId"] == null) Response.Redirect("~/SessionTimeout.aspx");

        if (!IsPostBack)
        {

            if (Session["Lead Agency Name"] != null)
            {
                //HSAgenName.Text = Session["Lead Agency Name"].ToString();
                BindData();
                //BindDataimg();
            }
            else
            {
                Response.Redirect("~/Default.aspx");
            }
        }

    }

    /// <summary>
    /// check to see what sections have been completed/visited and change the select button and the Completed Image accordingly.
    /// Also show the Print All button and any other at the bottom based on the completion of the sections.
    /// </summary>
    private void BindData()
    {
        #region get data
        
        ds = dal.GetHSApplicantStatusData(Int32.Parse(Session["GrantApplicantId"].ToString()), AppInfo.FiscalYear);

        string applicationStatus = "";

        if (ds.Tables[0].Rows.Count > 0)
        {
            DataRow dr = ds.Tables[0].Rows[0];

            applicationStatus += (dr["HeadStartLeadAgency"].ToString() == "1" ? "part1," : "");
            applicationStatus += (dr["CenterBaseSurvey"].ToString() == "1" ? "part2," : "");
            applicationStatus += (dr["FamilyChildCareSurvey"].ToString() == "1" ? "part3," : "");
            applicationStatus += (dr["HomeBasedSurvey"].ToString() == "1" ? "part4," : "");
            applicationStatus += (dr["HSLocallyDesignedOption"].ToString() == "1" ? "part5," : "");

            ViewState["ApplicationStatus"] = applicationStatus;
            //ViewState["HSApplicantID"] = dr["HSApplicantID"];
        }
        else
        {
            ViewState["ApplicationStatus"] = "";
            //ViewState["HSApplicantID"] = "";
        }

        Session["ApplicationStatus"] = ViewState["ApplicationStatus"];
        //Session["HSApplicantID"] = ViewState["HSApplicantID"];
        #endregion

        #region Update status
        //control the buttons view based on the status
        //if (Session["ApplicationStatus"].ToString().IndexOf("part1") != -1)
        //    imgPart1.ImageUrl = "images/1.jpg";

        if (Session["ApplicationStatus"].ToString().IndexOf("part2") != -1)
            imgPart2.ImageUrl = "images/1.jpg";

        if (Session["ApplicationStatus"].ToString().IndexOf("part3") != -1)
            imgPart3.ImageUrl = "images/1.jpg";

        if (Session["ApplicationStatus"].ToString().IndexOf("part4") != -1)
            imgPart4.ImageUrl = "images/1.jpg";

        if (Session["ApplicationStatus"].ToString().IndexOf("part5") != -1)
            imgPart5.ImageUrl = "images/1.jpg";


        #endregion
    }

    protected void btnHSLeadAgenySiteInfo_Click(object sender, EventArgs e)
    {
        NextPage("part1");
    }
    protected void btnSelectHSCenterBaseSiteSurvey_Click(object sender, EventArgs e)
    {
        NextPage("part2");
    }
    protected void btnSelectHSFCCSiteSurvey_Click(object sender, EventArgs e)
    {
        NextPage("part3");
    }
    protected void btnSelectHSHomeBasedSiteSurvey_Click(object sender, EventArgs e)
    {
        NextPage("part4");
    }
    protected void btnSelectHSLocallyDesignedOption_Click(object sender, EventArgs e)
    {
        NextPage("part5");
    }

    private void NextPage(string part)
    {
        string redirectURL = "";

        switch (part.ToLower())
        {
            case "part1":
                redirectURL = "HeadStartLeadAgency.aspx";
                break;
            case "part2":
                redirectURL = "CenterBaseHome.aspx";
                break;
            case "part3":
                redirectURL = "HSFamHome.aspx";
                break;
            case "part4":
                redirectURL = "HSHome.aspx";
                break;
            case "part5":
                redirectURL = "LocallyDesignOptionHome.aspx";
                break;
            default:
                redirectURL = "HeadStartSiteSurveyChecklist.aspx";
                break;
        }

        Response.Redirect(redirectURL);

    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        Response.Redirect("HeadStartThankYou.aspx");
    }
    protected void btnPrint_Click(object sender, EventArgs e)
    {
        Response.Redirect("HSPrintOut.aspx?type=package");
    }

    //private void ShowHSDeliverableFileImage(string filename, string filetype)
    //{
    //    trHasHSDeliverable.Visible = false;
    //    lblHSDeliverable.Text = filename;

    //    switch (filetype.ToLower())
    //    {
    //        case "pdf":
    //            imgHSDeliverable.ImageUrl = "../HeadStartSite/images/PDFIcon_large.gif";
    //            break;
    //        case "doc":
    //            imgHSDeliverable.ImageUrl = "../HeadStartSite/images/wordDocIcon.gif";
    //            break;
    //        case "xls":
    //            imgHSDeliverable.ImageUrl = "../HeadStartSite/images/excelicon.jpg";
    //            break;
    //    }

    //    lblHSDeliverables.Text = "*Click browse to attach the completed FY14 Head Start State Supplemental Projected Deliverable from file.";
    //}
    //private int SaveHSDeliverableForms()
    //{
    //    int retVal = 1;


    //    if (fileHSDeliverablesform.HasFile)
    //    {
    //        string fileName = fileHSDeliverablesform.FileName;
    //        string fileType = fileName.Substring(fileName.LastIndexOf(".") + 1);

    //        retVal = dal.SaveHSDeliverableForms(Int32.Parse(Session["GrantApplicantId"].ToString()), fileHSDeliverablesform.FileBytes, fileName, fileType);
    //    }
    //    //else
    //    //    retVal = 1;

    //    return retVal;
    //}
    //protected void imgHSDeliverable_Click(object sender, ImageClickEventArgs e)
    //{
    //    Response.Redirect("ShowHSDeliverableForm.aspx");
    //}


    //protected void imgSave_Click(object sender, EventArgs e)
    //{

    //    SaveHSDeliverableForms();
    //    BindDataimg();
    //    NextPage("part5");

    //}


    //private void BindDataimg()
    //{
    //    ds = dal.GetHSDeliverablesForm(Int32.Parse(Session["GrantApplicantId"].ToString()));

    //    if (ds.Tables[0].Rows.Count > 0)
    //    {
    //        DataRow dr = ds.Tables[0].Rows[0];

    //        if (dr["HSDelivableFiletype"] != null)
    //            ShowHSDeliverableFileImage(dr["HSDelivableName"].ToString(), dr["HSDelivableFiletype"].ToString());
    //    }

    //}
}

