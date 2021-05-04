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
using System.Text;

public partial class controls_FormTemplate : System.Web.UI.UserControl
{
    public string RecID;
    public string RecType;
    public string ServiceDate;
    public string FundingStream;
    public string Placement;
    public int FormID;
    public string eID;
    public string hn;

    protected void Page_Load(object sender, EventArgs e)
    {
        ControlsInitialize();
    }

    private void ControlsInitialize()
    {
        sScript.Text = "arrForms['" + FormID.ToString() + "']=new Array();";
        sScript.Text += "arrForms['" + FormID.ToString() + "'][0]='" + tblForm.ClientID.ToString() + "';";
        sScript.Text += "arrForms['" + FormID.ToString() + "'][1]=new Array();";
        sScript.Text += "arrForms['" + FormID.ToString() + "'][2]='" + txtAnalysis.ClientID.ToString() + "';";
        sScript.Text += "arrForms['" + FormID.ToString() + "'][3]='" + txtFindings.ClientID.ToString() + "';";
        sScript.Text += "arrForms['" + FormID.ToString() + "'][4]='" + "" + "';";
        sScript.Text += "arrForms['" + FormID.ToString() + "'][5]=new Array();";
        sScript.Text += "arrForms['" + FormID.ToString() + "'][5][0]='" + cboError.ClientID.ToString() + "';";
        sScript.Text += "arrForms['" + FormID.ToString() + "'][5][1]='" + cboMissDoc.ClientID.ToString() + "';";
        sScript.Text += "arrForms['" + FormID.ToString() + "'][5][2]='" + cboMidOption.ClientID.ToString() + "';";
        //sScript.Text += "arrForms['" + FormID.ToString() + "'][6]='" + txtTotalAmount.ClientID.ToString() + "';";
        sScript.Text += "arrForms['" + FormID.ToString() + "'][7]='" + pnlAnalysis.ClientID.ToString() + "';";
        sScript.Text += "arrForms['" + FormID.ToString() + "'][8]='" + lblAnalysis.ClientID.ToString() + "';";
        sScript.Text += "arrForms['" + FormID.ToString() + "'][9]='" + pnlFindings.ClientID.ToString() + "';";
        sScript.Text += "arrForms['" + FormID.ToString() + "'][10]='" + lblFindings.ClientID.ToString() + "';";
        //sScript.Text += "arrForms['" + FormID.ToString() + "'][11]='" + lblCompleted.ClientID.ToString() + "';";

        if (FormID == 410)
        {
            //    sScript.Text += "arrForms['" + FormID.ToString() + "'][5][2]='" + cboErrorAutho.ClientID.ToString() + "';";
            //    //sScript.Text += "arrForms['" + FormID.ToString() + "'][5][3]='" + cboErrorAutho.ClientID.ToString() + "';";
            //    sScript.Text += "arrForms['" + FormID.ToString() + "'][6]='" + txtTotalAmountIAP.ClientID.ToString() + "';";
            //    frm410Only.Visible = true;
            form410Disable.Visible = false;
            trForm410Disable.Visible = false;
        }

        LoadFormData();

        //cboError.Attributes.Add("onchange", "changeResultOptions(this, '" + cboMissDoc.ClientID + "', '" + cboErrorAutho.ClientID + "')");
        cboError.Attributes.Add("onchange", "changeResultOptions(this, '" + cboMissDoc.ClientID + "')");
        if (FormID != 410)
        {
            cboMissDoc.Attributes.Add("onchange", "changeMidResultOptions(this, '" + cboMidOption.ClientID + "')");
        }

    }

    /* This is not called anywhere */
    //private void LoadReviewerEntryData()
    //{
    //    string sError = "";

    //    /*begin - load the form static description element*/
    //    DataSet ds = CForms.GetReviewerEntryData(ref sError, RecID);

        
    //}

    private void LoadFormData()
    {
        string sError = "";

        /*begin - load the form static description element*/
        DataSet dsFormTemplateInfo = CForms.GetFormTemplateInfo(ref sError, FormID);

        if (dsFormTemplateInfo.Tables.Count > 0 && dsFormTemplateInfo.Tables[0].Rows.Count > 0)
        {
            lblSectionHeader.Text = dsFormTemplateInfo.Tables[0].Rows[0]["SectionDescription"].ToString();
            lblFormTitle.Text = dsFormTemplateInfo.Tables[0].Rows[0]["FormTitle"].ToString();
            lblFormDescription.Text = dsFormTemplateInfo.Tables[0].Rows[0]["FormDescription"].ToString();
        }

        /*begin - load the form saved data into this form*/
        DataSet dsFormSavedData = CForms.GetFormSavedData(ref sError, Convert.ToInt32(RecID), FormID);

        if (dsFormSavedData.Tables.Count > 0 && dsFormSavedData.Tables[0].Rows.Count > 0)
        {
            txtAnalysis.Text = dsFormSavedData.Tables[0].Rows[0]["Analysis"].ToString();
            txtFindings.Text = dsFormSavedData.Tables[0].Rows[0]["Findings"].ToString();
            cboError.SelectedValue = dsFormSavedData.Tables[0].Rows[0]["Result1"].ToString().Trim();
            cboMissDoc.SelectedValue = dsFormSavedData.Tables[0].Rows[0]["Result2"].ToString().Trim();
            cboMidOption.SelectedValue= dsFormSavedData.Tables[0].Rows[0]["Result3"].ToString().Trim();

            if (cboError.SelectedValue == "0")
            {
                cboMissDoc.Enabled = false;

                //if (FormID == 410)
                //{
                //    cboErrorAutho.Enabled = false;

                //}
            }
            //if (FormID == 410)
            //{
            //    cboErrorAutho.SelectedValue = dsFormSavedData.Tables[0].Rows[0]["Result3"].ToString().Trim();
            //    txtTotalAmountIAP.Text = dsFormSavedData.Tables[0].Rows[0]["Amount"].ToString();
            //    txtTotalPayment.Text = dsFormSavedData.Tables[0].Rows[0]["TotalPaid"].ToString();
            //}
        }
        else
        {
            sScript.Text += "arrForms['" + FormID.ToString() + "'][12]='0';";
        }
        
        /*begin - load the requirement list control*/
        lstRequirements.FormID = FormID;
        lstRequirements.RecID = RecID;
        lstRequirements.FundingStream = FundingStream;
        lstRequirements.Placement = Placement;
        lstRequirements.RecType = RecType;
        //lstRequirements.eID = eID;
        //if (FormID == 410)
        //{
        //    LastFormFooter.Visible = true;
        //}
    }
}
