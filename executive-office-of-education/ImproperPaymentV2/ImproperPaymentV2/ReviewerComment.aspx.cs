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

public partial class ReviewerComment : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            RecID = Request.QueryString["recID"].ToString();

            if (Session["UserName"] != null)
            {
                LoadSelfComment(RecID);
                LoadReviewerComment(RecID);
            }
        }
    }

    private void LoadSelfComment(string recID)
    {
        string sError = "";
        string username = Session["UserName"].ToString();   // AppData.GetLogonUsername(Request);

        DataSet dsComment = CForms.GetReviewerFinalComment(ref sError, recID, username);

        lblReviewerName.Text = username;
        lblDate.Text = DateTime.Now.ToShortDateString();

        if (dsComment.Tables.Count > 0 && dsComment.Tables[0].Rows.Count > 0)
        {
            cboStatus.SelectedValue = dsComment.Tables[0].Rows[0]["Status"].ToString();
            txtComment.Text = dsComment.Tables[0].Rows[0]["Comment"].ToString();
        }
    }

    private void LoadReviewerComment(string recID)
    {
        string sError = "";

        DataSet dsComment = CForms.GetReviewerFinalComment(ref sError, recID, "");

        grdComment.DataSource = dsComment;
        grdComment.DataBind();
    }

    protected void grdComment_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        Label lblReviewerName;
        Label lblReviewDate;
        Label lblStatus;
        TextBox txtComment;

        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            DataRowView rowView = (DataRowView)e.Row.DataItem;

            lblReviewerName = (Label)e.Row.Cells[0].FindControl("lblReviewerName");
            lblReviewDate = (Label)e.Row.Cells[0].FindControl("lblDate");
            lblStatus = (Label)e.Row.Cells[0].FindControl("lblStatus");
            txtComment = (TextBox)e.Row.Cells[0].FindControl("txtComment");

            lblReviewerName.Text = rowView["ReviewerName"].ToString();
            lblReviewDate.Text = AppData.FormatDateStr(rowView["ReviewDate"].ToString());
            lblStatus.Text = (rowView["Status"].ToString() == "1")?"Completed": "Pending";
            txtComment.Text = rowView["Comment"].ToString();
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        string errorMsg = "";
        string status = cboStatus.SelectedValue.ToString();
        string username = Session["UserName"].ToString();   // AppData.GetLogonUsername(Request);
        string date = DateTime.Now.ToShortDateString();
        string comment = txtComment.Text;

        CForms.SetFinalReviewerComment(ref errorMsg, RecID, username, date, status, comment);

        LoadReviewerComment(RecID);
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
