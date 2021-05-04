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

public partial class selectchild : IMBasePage
{
    public string pubHideNames = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            ControlsInitialize();
        }
    }

    private void ControlsInitialize()
    {
        Master.ShowFooter = false;
        //Master.ShowPageTitle = false;
        //Master.ShowNavMenu = false;
        Master.PageTitle = "Improper Payment (IP)";
        //Master.NavMenuItem = "";   //current focus tab
        //UserMsg.Text = "";
        //UserMsg.Visible = false;
        Session["IPReviewStartDate"] = System.Configuration.ConfigurationManager.AppSettings.Get("IPReviewStartDate");
        Session["IPReviewEndDate"] = System.Configuration.ConfigurationManager.AppSettings.Get("IPReviewEndDate");

        pubHideNames = GetParameter("hn");
        hidHideNames.Value = pubHideNames;
        if (hidHideNames.Value == "")
            hidHideNames.Value = Session["HideNames"].ToString();

        LoadAllServiceDates();
        cboMonth.SelectedIndex = 1; //set to first month of the review period; 0 = All
        //CChild.LoadAllChild(cboMonth.SelectedValue, Convert.ToInt32(hidHideNames.Value));
        //srcRecords.Update(); 
    }

    private void LoadAllServiceDates()
    {
        string sError = "";
        DateTime startDate = Convert.ToDateTime(Session["IPReviewStartDate"].ToString());
        DateTime endDate = Convert.ToDateTime(Session["IPReviewEndDate"].ToString());

        DataSet ds = CChild.GetAllServiceDates(ref sError, startDate, endDate);

        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        {
            string d = DateTime.Parse(ds.Tables[0].Rows[i]["ServiceDate"].ToString()).ToShortDateString();
            cboMonth.Items.Add(new ListItem(d, d));
        }
    }

    protected void grdChild_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        HiddenField txtRecID;
        HiddenField txtServiceDate;
        HiddenField txtType;
        LinkButton btnSelect;
        LinkButton btnView;

        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            DataRowView oRow = (DataRowView)e.Row.DataItem;

            txtRecID = (HiddenField)e.Row.Cells[8].FindControl("txtRecID");
            txtServiceDate = (HiddenField)e.Row.Cells[8].FindControl("txtServiceDate");
            txtType = (HiddenField)e.Row.Cells[8].FindControl("txtType");
            btnView = (LinkButton)e.Row.Cells[8].FindControl("btnView");
            btnSelect = (LinkButton)e.Row.Cells[9].FindControl("btnSelect");

            e.Row.Cells[3].Text = AppData.FormatDateStr(oRow["ServiceDate"].ToString());
            txtRecID.Value = oRow["RecID"].ToString();
            txtServiceDate.Value = AppData.FormatDateStr(oRow["ServiceDate"].ToString());
            txtType.Value = oRow["RecType"].ToString();

            e.Row.Cells[7].Text = (Convert.ToInt16(oRow["Completed"].ToString()) > 0)?"Yes":"No";

            if (e.Row.Cells[7].Text == "Yes")
                e.Row.Cells[7].ForeColor = System.Drawing.Color.Blue;
            else
                e.Row.Cells[7].ForeColor = System.Drawing.Color.Red;

            btnSelect.CommandArgument = e.Row.RowIndex.ToString();
            btnSelect.CommandName = "Select";

            if (Convert.ToInt16(oRow["Completed"].ToString()) > 0)
            {
                btnView.CommandArgument = e.Row.RowIndex.ToString();
                btnView.CommandName = "View";
                //Take out until we know what to do with this
                btnView.Visible = false;
            }
            else
            {
                btnView.Visible = false;
            }
        }
    }

    protected void grdChild_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        //String sError = "";
        int iIndex;
        String recID;
        String hn;

        if (pubHideNames == "")
        {
            pubHideNames = Session["HideNames"].ToString();
        }
        if (e.CommandName == "Select")
        {
            iIndex = Convert.ToInt16(e.CommandArgument);

            recID = ((HiddenField)grdChild.Rows[iIndex].Cells[7].FindControl("txtRecID")).Value;
            
            String serviceDate = ((HiddenField)grdChild.Rows[iIndex].Cells[7].FindControl("txtServiceDate")).Value;
            String recType = ((HiddenField)grdChild.Rows[iIndex].Cells[7].FindControl("txtType")).Value;
            String funding = grdChild.Rows[iIndex].Cells[4].Text;
            String source = grdChild.Rows[iIndex].Cells[5].Text;
            String completed = (grdChild.Rows[iIndex].Cells[7].Text.ToUpper() == "YES") ? "1" : "0";
            String eid = grdChild.Rows[iIndex].Cells[0].Text;

            //if (source == "CPC")
            //{
            //    DataSet ds = CChild.GetCPCAuthoInfo(recID);

            //    if (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count == 0)
            //    {
            //        Response.Redirect("CPCAuthoEntry.aspx?id=" + recID + "&date=" + serviceDate + "&type=" + recType + "&fund=" + funding);
            //    }
            //}

            Response.Redirect("ElementForms.aspx?id=" + recID + "&date=" + serviceDate + "&type=" + recType + "&fund=" + funding + "&completed=" + completed + "&eid=" + eid + "&lp=0" + "&hn=" + pubHideNames);
        }
        else if (e.CommandName == "View")
        {
            iIndex = Convert.ToInt16(e.CommandArgument);

            recID = ((HiddenField)grdChild.Rows[iIndex].Cells[7].FindControl("txtRecID")).Value;
            String completed = (grdChild.Rows[iIndex].Cells[7].Text.ToUpper() == "YES") ? "1" : "0";

            Response.Redirect("DataEntryForm.aspx?id=" + recID + "&completed=" + completed);
        }
    }

    protected void btnSelectMonth_Click(object sender, EventArgs e)
    {
        //LoadAllChildInfo(cboMonth.SelectedValue);
        srcRecords.Update();
    }
}
