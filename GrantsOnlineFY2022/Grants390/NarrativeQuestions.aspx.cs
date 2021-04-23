using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class NarrativeQuestions : System.Web.UI.Page
{
    DAL dal = new DAL();
    DataSet ds;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["GrantApplicantId"] == null) Response.Redirect("SessionTimeout.aspx");

        Master.PartTitle = AppInfo.DisplayPart7Title;

        lblInstruction.Text = dal.GetPartInstruction(AppInfo.FundCode, AppInfo.FiscalYear, "7");

        if (!Page.IsPostBack)
        {
            BindData(false);
        }
    }

    private void BindData(bool isAfterSaved)
    {
        ds = dal.GetNarrativeData(Int32.Parse(Session["GrantApplicantId"].ToString()));

        //if (ds.Tables[0].Rows.Count > 0)
        //{
        TextBox txtBox;
        Control ContentPlaceHolder = Form.FindControl("ContentPlaceHolder1");

        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        {
            DataRow dr = ds.Tables[0].Rows[i];

            txtBox = (TextBox)((WebControl)ContentPlaceHolder.FindControl("txtA" + dr["Num"].ToString()));
            txtBox.Text = dr["A"].ToString();
        }

        //get any errors
        if (hasValidationErrors(isAfterSaved))
        {
            tblSuccess.Visible = false;
            tblFailed.Visible = true;
        }
        else
        {
            tblSuccess.Visible = true;
            tblFailed.Visible = false;
        }

        if (isAfterSaved)
        {
            lnkBackToHomeError.Visible = true;
        }
        else
        {
            tblSuccess.Visible = false;

            if (tblFailed.Visible)
            {
                lnkBackToHomeError.Visible = false;
            }
        }
        //}
    }

    private void setDefaultStyle()
    {
        TextBox txtBox;
        Control ContentPlaceHolder = Form.FindControl("ContentPlaceHolder1");

        for (int i = 0; i < AppInfo.NUM_NARRATIVE_QUESTIONS; i++)
        {
            txtBox = (TextBox)((WebControl)ContentPlaceHolder.FindControl("txtA" + (i + 1).ToString()));
            txtBox.CssClass = "styleUnHighlight";
        }
    }

    private bool hasValidationErrors(bool isAfterSaved)
    {
        int errorCount = 0;

        setDefaultStyle();

        List<string> lstErrorBoxes = new List<string>();

        if (!GlobalFunc.isValidNarrativeQuestions(lstErrorBoxes, ds))
        {
            lblErrors.Text = "Please provide the responses for all the Narrative Questions.";
            errorCount++;
        }

        if (lstErrorBoxes.Count > 0)
        {
            displayErrorHighlight(lstErrorBoxes);
        }

        dal.UpdateNarrativeQuestionsErrorCount(Int32.Parse(Session["GrantApplicantId"].ToString()), "7", errorCount);

        return lstErrorBoxes.Count > 0;
    }

    private void displayErrorHighlight(List<string> lstBoxes)
    {
        Control ContentPlaceHolder = Form.FindControl("ContentPlaceHolder1");

        for (int i = 0; i < lstBoxes.Count; i++)
        {
            ((WebControl)ContentPlaceHolder.FindControl(lstBoxes[i])).CssClass = "styleHighlight";
        }
    }

    private int SaveNarrativeData()
    {
        int retVal;
        TextBox txtBox;
        int j = 0;

        if (Page.IsValid)
        {
            Control ContentPlaceHolder = Form.FindControl("ContentPlaceHolder1");

            for (int i = 0; i < AppInfo.NUM_NARRATIVE_QUESTIONS; i++)
            {
             
                txtBox = (TextBox)((WebControl)ContentPlaceHolder.FindControl("txtA" + (i + 1).ToString()));
                txtBox.Text = (txtBox.Text.Length > AppInfo.MAX_NARRATIVE_ANSWER_LENGTH) ? txtBox.Text.Substring(0, AppInfo.MAX_NARRATIVE_ANSWER_LENGTH) : txtBox.Text;
               
                if (string.IsNullOrEmpty(txtBox.Text))
                {
                    dal.RemoveNarrativeQuestions(Int32.Parse(Session["GrantApplicantId"].ToString()), (i + 1));
                }
                else
                {
                    retVal = dal.SaveNarrativeData(Int32.Parse(Session["GrantApplicantId"].ToString()), txtBox.Text, (i + 1));
                }
            }

            retVal = 1;
        }
        else
        {
            retVal = -1;
        }

        return retVal;
    }

    protected void btnBackToHome_Click(object sender, EventArgs e)
    {
        Response.Redirect("CheckList.aspx");
    }

    protected void btnNextPart_Click(object sender, EventArgs e)
    {
        Response.Redirect("ProjectedDeliverables.aspx");
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("CheckList.aspx");
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        int retVal;

        try
        {
            retVal = SaveNarrativeData();

            if (retVal > 0)
            {
                BindData(true);
            }
        }
        catch (Exception ex)
        {

        }
    }

    protected void btnPrintHSNQ_Click(object sender, EventArgs e)
    {
        int retVal;

        try
        {
            retVal = SaveNarrativeData();


            if (retVal > 0)
            {
                BindData(true);

            }
        }
        catch (Exception ex)
        {

        }

        Response.Redirect("Print.aspx?type=NarrativeQuestions");
    }

}