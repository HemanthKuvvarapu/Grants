using System;
using System.Collections;
using System.Collections.Generic;
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
using System.IO;

public partial class _ElementForms : IMBasePage
{
    private string placement;
    //private int[] formID = { 100, 200, 300, 310, 320, 330, 340, 350, 360, 400, 410, 420, 430 };
    private int[] formID = { 100, 200, 300, 310, 320, 330, 340, 350, 400, 410};
    private SortedList lstFormID;
    private DataSet dsChildInfo;
    private DataSet dsReviewerEntryInfo;
    private string authorizedAmount;

    private string strLastFormID;
    private string strLastPageUrl;
    private string HideNames;

    protected void Page_Load(object sender, EventArgs e)
    {
        hidSessionID.Value = Session.SessionID;
        if (hidSessionID.Value == "")
        {
            Response.Redirect("default.aspx");
        }

        if (!Page.IsPostBack)
        {
            RecID = GetParameter("id");
            Completed = GetParameter("completed");
            RecType = GetParameter("type");
            ServiceDate = GetParameter("date");
            Funding = GetParameter("fund");
            eID = GetParameter("eid");
            strLastPageUrl = GetParameter("lp");
            HideNames = GetParameter("hn");            

            ControlsInitialize();

            if (strLastFormID != "100" && strLastPageUrl == "1")
            {
                //ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "setForm", "fnToggle('" + strLastFormID + "');", true);
                Page.ClientScript.RegisterStartupScript(typeof(Page), "setForm", "<script language='javascript'>javascript:fnToggle('" + strLastFormID + "')</script>");
            }
        }

    }

    private void ControlsInitialize()
    {
        Master.ShowFooter = false;
        Master.ShowPageTitle = false;
        //Master.ShowNavMenu = false;
        //Master.PageTitle = "RECORD REVIEW WORKSHEET (ACF-400)";
        Master.NavMenuItem = "";   //current focus tab

        LoadFormContent();
    }

    private void LoadFormContent()
    {
        /* we need to put all available form ID to a list because we need to use databind for the datalist*/
        lstFormID = new SortedList();
        for (int i = 0; i < formID.Length; i++)
        {
            lstFormID.Add(i, formID[i]);
        }

        string sError = "";
        //if (HideNames == "")
        HideNames = Session["HideNames"].ToString();

        dsChildInfo = CChild.LoadSelectedChildInfo(RecID, Convert.ToInt16(RecType), ServiceDate, Session.SessionID, HideNames);
        dsReviewerEntryInfo = CForms.GetReviewerEntryData(ref sError, RecID);

        authorizedAmount = dsChildInfo.Tables[0].Rows[0]["Authorized Amount"].ToString();
        authorizedAmount = ((!string.IsNullOrEmpty(authorizedAmount)) ? Convert.ToDouble(authorizedAmount).ToString("N2") : "0.00");

        placement = (dsChildInfo.Tables[0].Rows[0]["Autho Type"].ToString() == "N") ? "0" : "1";

        /*begin - load the child info*/
        childDetail.recID = RecID;
        childDetail.recType = RecType;
        childDetail.serviceDate = ServiceDate;
        childDetail.funding = Funding;
        childDetail.placement = placement;
        childDetail.dsChildInfo = dsChildInfo;
        childDetail.dsReviewerEntryInfo = dsReviewerEntryInfo;
        //childDetail.eID = eID;
        pageDetailTitle.eID = eID;
        pageDetailTitle.recID = RecID;
        pageDetailTitle.recType = RecType;
        pageDetailTitle.serviceDate = ServiceDate;
        pageDetailTitle.dsChildInfo0 = dsChildInfo;
        /*end - load the child info*/

        lstForms.DataSource = lstFormID;

        DataBind();

        Page.ClientScript.RegisterStartupScript(typeof(Page), "setFirstForm", "<script language='javascript'>javascript:SetCurrentForm('100')</script>");

        /* begin - set data entry form */
        txtDataEntryTotalPaid.Text = "$" + authorizedAmount;
        txtDataEntryMonth.Text = ServiceDate;
        txtDataEntryReviewDate.Text = AppData.FormatDateStr(DateTime.Now.ToShortDateString());
        txtDataEntryChildID.Text = RecID;
        txtDataEntryCounty.Text = dsChildInfo.Tables[0].Rows[0]["county"].ToString();

        txtDataEntryTotalPaidField.Value = authorizedAmount;
        txtDataEntryMonthField.Value = txtDataEntryMonth.Text;
        txtDataEntryReviewDateField.Value = txtDataEntryReviewDate.Text;
        txtDataEntryChildIDField.Value = RecID;
        txtDataEntryCountyField.Value = txtDataEntryCounty.Text;
        /* end - set data entry form */

        strLastFormID = dsChildInfo.Tables[0].Rows[0]["LastFormID"].ToString();
        hidLastFormID.Value = strLastFormID;

        if (Session["UserName"].ToString() == "IPFedUser")
        {
            Page.ClientScript.RegisterStartupScript(typeof(Page), "AllFormCompleted", "<script>displayAllCompleted()</script>");
            btnMarkCaseComplete.Disabled = true;
            btnReviewerForm.Disabled = true;
        }
        else
        {
            if (Completed == "1")
            {
                Page.ClientScript.RegisterStartupScript(typeof(Page), "AllFormCompleted", "<script>displayAllCompleted()</script>");
                btnMarkCaseComplete.Visible = false;
                if (Session["IsAdminUser"] != null)
                {
                    if (Session["IsAdminUser"].ToString() == "1")
                        btnMarkCaseIncomplete.Visible = true;
                }
                lblCompleted.Visible = true;
            }
        }
    }

    protected void lstForms_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        DataList lstForms;
        SortedList lstFormID;

        lstForms = (DataList)sender;
        lstFormID = (SortedList)lstForms.DataSource;

        if ((e.Item.ItemType == ListItemType.Item) || (e.Item.ItemType == ListItemType.AlternatingItem))
        {
            controls_FormTemplate frmTemplate = (controls_FormTemplate)e.Item.FindControl("frmTemplate");

            frmTemplate.FormID = Convert.ToInt16(lstFormID[e.Item.ItemIndex].ToString());
            frmTemplate.RecID = RecID;
            frmTemplate.RecType = RecType;
            frmTemplate.ServiceDate = ServiceDate;
            frmTemplate.Placement = placement;

            if (Funding == "IE")
            {
                frmTemplate.FundingStream = "1";
            }
            else if (Funding == "DTA")
            {
                frmTemplate.FundingStream = "2";
            }
            else if (Funding == "DCF")
            {
                frmTemplate.FundingStream = "3";
            }
            else
            {
                frmTemplate.FundingStream = "4";
            }
        }
    }

    public string RecID
    {
        get
        {
            return ViewState["RecID"].ToString();
        }
        set
        {
            ViewState["RecID"] = value;
        }
    }

    public string Completed
    {
        get
        {
            return ViewState["Completed"].ToString();
        }
        set
        {
            ViewState["Completed"] = value;
        }
    }

    public string ServiceDate
    {
        get
        {
            return ViewState["ServiceDate"].ToString();
        }
        set
        {
            ViewState["ServiceDate"] = value;
        }
    }

    public string RecType
    {
        get
        {
            return ViewState["RecType"].ToString();
        }
        set
        {
            ViewState["RecType"] = value;
        }
    }

    public string Funding
    {
        get
        {
            return ViewState["Funding"].ToString();
        }
        set
        {
            ViewState["Funding"] = value;
        }
    }

    public string Placement
    {
        get
        {
            return ViewState["Placement"].ToString();
        }
        set
        {
            ViewState["Placement"] = value;
        }
    }

    public string eID
    {
        get
        {
            return ViewState["eID"].ToString();
        }
        set
        {
            ViewState["eID"] = value;
        }
    }

    //public string hn
    //{
    //    get
    //    {
    //        return ViewState["hn"].ToString();
    //    }
    //    set
    //    {
    //        ViewState["hn"] = value;
    //    }
    //}

    protected void btnMarkComplete_Click(object sender, EventArgs e)
    {
        string sError = "";

        CForms.SetDataEntryForm(ref sError, RecID, RecID, txtDataEntryMonthField.Value,
                                txtDataEntryReviewDateField.Value, txtReviewerName.Text,
                                txtDataEntryErrorNumField.Value, //txtDataEntryImproperPaymentField.Value,
                                //txtDataEntryImproperPaymentTypeField.Value, 
                                "0", "", txtDataEntryMissingDocField.Value,
                                txtDataEntryTotalPaidField.Value, txtDataEntryCountyField.Value);

        Completed = "1";

        //LoadFormContent();
        Response.Redirect("selectchild.aspx?hn=" + Session["Hidenames"].ToString());
    }


    protected void btnMarkCaseInComplete_Click(object sender, EventArgs e)
    {
        string sError = "";

        CForms.ResetDataEntryFormIncomplete(ref sError, RecID);

        Completed = "0";

        //LoadFormContent();
        Response.Redirect("selectchild.aspx?hn=" + Session["Hidenames"].ToString());
    }

}
