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

public partial class MIDTableForm : IPBasePage 
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Master.PageTitle = "Record Review Worksheet Missing and Insufficient Documentation Table (MID Table)";
        lblErrMsg.Visible = false;

        if (!Page.IsPostBack)
        {
            RecID = Request.QueryString["recID"].ToString();

            if (Session["UserName"] != null)
            {
                LoadMIDTable(RecID);
            }
            else
            {
                lblErrMsg.Text = "Session Timed Out -- please exit and log in again.";
                lblErrMsg.Visible = true;
            }
        }
    }

    private void LoadMIDTable(string recID)
    {
        string sError = "";

        DataSet dsMIDTable = CForms.GetMIDTableDataPivot(ref sError, recID);
        if (sError == "")
        {
            DataRow drow = dsMIDTable.Tables[0].Rows[0];
            //lblSampleID.Text = drow["SampleID"].ToString();
            //lblChildName.Text = drow["ChildName"].ToString();
            lblChildId.Text= recID;

            grdMIDList.DataSource = dsMIDTable;
            grdMIDList.DataBind();        
        }
    }

    protected void grdMIDList_RowDataBound(object sender, GridViewRowEventArgs e)
    {

        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            DataRowView dr = (DataRowView)e.Row.DataItem;

            //e.Row.Cells[0].Text = dr["Q1"].ToString();

            TextBox txtElementID = (TextBox)e.Row.FindControl("txtElementID");
            txtElementID.Text = dr["Q1"].ToString()== "410" ? "Total" : dr["Q1"].ToString();

            TextBox txtQuestion2 = (TextBox)e.Row.FindControl("txtQuestion2");
            txtQuestion2.Text = dr["Q2"].ToString();

            TextBox txtQuestion3 = (TextBox)e.Row.FindControl("txtQuestion3");
            txtQuestion3.Text = dr["Q3"].ToString();

            TextBox txtQuestion4 = (TextBox)e.Row.FindControl("txtQuestion4");
            txtQuestion4.Text = dr["Q4"].ToString();

            TextBox txtQuestion5 = (TextBox)e.Row.FindControl("txtQuestion5");
            txtQuestion5.Text = dr["Q5"].ToString();

            TextBox txtQuestion6 = (TextBox)e.Row.FindControl("txtQuestion6");
            txtQuestion6.Text = dr["Q6"].ToString();

            TextBox txtQuestion7 = (TextBox)e.Row.FindControl("txtQuestion7");
            txtQuestion7.Text = dr["Q7"].ToString();

            TextBox txtQuestion8 = (TextBox)e.Row.FindControl("txtQuestion8");
            txtQuestion8.Text = dr["Q8"].ToString();

            TextBox txtQuestion9 = (TextBox)e.Row.FindControl("txtQuestion9");
            txtQuestion9.Text = dr["Q9"].ToString();

            //If first row, set to ReadOnly and gray background color
            if (e.Row.DataItemIndex == 0)
            {
                e.Row.FindControl("Q3ValidMoney").Visible = false;
                e.Row.FindControl("Q8ValidMoney").Visible = false;

                txtQuestion2.ReadOnly = true;
                txtQuestion3.ReadOnly = true;
                txtQuestion4.ReadOnly = true;
                txtQuestion5.ReadOnly = true;
                txtQuestion6.ReadOnly = true;
                txtQuestion7.ReadOnly = true;
                txtQuestion8.ReadOnly = true;
                txtQuestion9.ReadOnly = true;

                txtQuestion2.BackColor = System.Drawing.Color.LightGray;
                txtQuestion3.BackColor = System.Drawing.Color.LightGray;
                txtQuestion4.BackColor = System.Drawing.Color.LightGray;
                txtQuestion5.BackColor = System.Drawing.Color.LightGray;
                txtQuestion6.BackColor = System.Drawing.Color.LightGray;
                txtQuestion7.BackColor = System.Drawing.Color.LightGray;
                txtQuestion8.BackColor = System.Drawing.Color.LightGray;
                txtQuestion9.BackColor = System.Drawing.Color.LightGray;

                txtElementID.Font.Bold = true;
                txtQuestion2.Font.Bold = true;
                txtQuestion3.Font.Bold = true;
                txtQuestion4.Font.Bold = true;
                txtQuestion5.Font.Bold = true;
                txtQuestion6.Font.Bold = true;
                txtQuestion7.Font.Bold = true;
                txtQuestion8.Font.Bold = true;
                txtQuestion9.Font.Bold = true;

                txtElementID.Rows = 8;
                txtQuestion2.Rows = 8;
                txtQuestion3.Rows = 8;
                txtQuestion4.Rows = 8;
                txtQuestion5.Rows = 8;
                txtQuestion6.Rows = 8;
                txtQuestion7.Rows = 8;
                txtQuestion8.Rows = 8;
                txtQuestion9.Rows = 8;
            }
        }
       
    }
    


    protected void btnSave_Click(object sender, EventArgs e)
    {
        string errorMsg = "";

        int i = 0;
        int j = 0;
        string ElementID = "";
        string QuestionID = "";
        string QuestionAns = "";


        try
        {
            for (i = 1; i < grdMIDList.Rows.Count; i++)
            {
                ElementID = ((TextBox)grdMIDList.Rows[i].Cells[0].FindControl("txtElementID")).Text.ToString();
                if(ElementID=="Total")
                {
                    ElementID = "410";
                }
                for (j = 2; j <= grdMIDList.Columns.Count; j++)
                {
                    QuestionID = "txtQuestion" + j.ToString();
                    QuestionAns = ((TextBox)grdMIDList.Rows[i].Cells[j - 1].FindControl(QuestionID)).Text.ToString();
                    CForms.SaveMIDTableData(ref errorMsg, Convert.ToInt32(RecID), Convert.ToInt32(ElementID), j, QuestionAns, Session["UserName"].ToString());
                }
            }

            lblErrMsg.Visible = false;
            LoadMIDTable(RecID);

        }
        catch (Exception ex)
        {
            lblErrMsg.Text = "Error updating the MID Table, " + ex.Message;
            lblErrMsg.Visible = true;
            return;
        }

    }

    private string RecID
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
}
