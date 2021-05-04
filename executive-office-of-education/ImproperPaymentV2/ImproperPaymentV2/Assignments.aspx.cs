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

public partial class Assignments : System.Web.UI.Page
{
    private DataSet dsUser;

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
        Master.PageTitle = "Assignments";
        //Master.NavMenuItem = "MenuItem2";   //current focus tab

        dsUser = CUser.LoadAllUsersInfo();
    }

    //private void LoadAllChildRecords(string month)
    //{
    //    dsUser = CUser.LoadAllUsersInfo();

    //    DataSet ds = CChild.LoadAllChild(month);

    //    grdChild.DataSource = ds;

    //    DataBind();
    //}

    protected void grdChild_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        HiddenField txtRecID;
        HiddenField txtServiceDate;
        HiddenField txtType;
        HiddenField txtUserID;
        LinkButton btnAssign;
        Button btnOK;
        DropDownList cboUser;

        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            DataRowView oRow = (DataRowView)e.Row.DataItem;

            txtRecID = (HiddenField)e.Row.Cells[7].FindControl("txtRecID");
            txtServiceDate = (HiddenField)e.Row.Cells[7].FindControl("txtServiceDate");
            txtType = (HiddenField)e.Row.Cells[7].FindControl("txtType");
            txtUserID = (HiddenField)e.Row.Cells[7].FindControl("txtUserID");
            btnAssign = (LinkButton)e.Row.Cells[7].FindControl("btnAssign");
            cboUser = (DropDownList)e.Row.Cells[7].FindControl("cboUser");
            btnOK = (Button)e.Row.Cells[7].FindControl("ButtonOK");

            e.Row.Cells[2].Text = AppData.FormatDateStr(oRow["ServiceDate"].ToString());
            txtRecID.Value = oRow["RecID"].ToString();
            txtServiceDate.Value = AppData.FormatDateStr(oRow["ServiceDate"].ToString());
            txtType.Value = oRow["RecType"].ToString();
            txtUserID.Value = oRow["UserID"].ToString();

            e.Row.Cells[5].Text = (Convert.ToInt16(oRow["Completed"].ToString()) > 0) ? "Yes" : "No";

            if (e.Row.Cells[5].Text == "Yes")
                e.Row.Cells[5].ForeColor = System.Drawing.Color.Blue;
            else
                e.Row.Cells[5].ForeColor = System.Drawing.Color.Red;

            if (txtUserID.Value != "")
            {
                for (int i = 0; i < dsUser.Tables[0].Rows.Count; i++)
                {
                    if (txtUserID.Value == dsUser.Tables[0].Rows[i]["User_ID"].ToString())
                    {
                        e.Row.Cells[6].Text = dsUser.Tables[0].Rows[i]["Name"].ToString();
                        break;
                    }
                }
            }

            cboUser.DataSource = dsUser;
            cboUser.DataValueField = "User_ID";
            cboUser.DataTextField = "Name";
            cboUser.DataBind();
            cboUser.Items.Insert(0, new ListItem("", ""));

            btnAssign.CommandArgument = e.Row.RowIndex.ToString();
            btnOK.CommandArgument = e.Row.RowIndex.ToString();

            btnAssign.CommandName = "btnAssign";
            btnOK.CommandName = "btnAssign";
        }
    }

    protected void grdChild_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "btnAssign")
        {
            int iIndex = Convert.ToInt16(e.CommandArgument);

            String recID = ((HiddenField)grdChild.Rows[iIndex].Cells[7].FindControl("txtRecID")).Value;
            String serviceDate = ((HiddenField)grdChild.Rows[iIndex].Cells[7].FindControl("txtServiceDate")).Value;
            String recType = ((HiddenField)grdChild.Rows[iIndex].Cells[7].FindControl("txtType")).Value;
            String userID = ((DropDownList)grdChild.Rows[iIndex].Cells[7].FindControl("cboUser")).SelectedValue;
            String funding = grdChild.Rows[iIndex].Cells[3].Text;

            Response.Redirect("ElementForms.aspx?id=" + recID + "&date=" + serviceDate + "&type=" + recType + "&fund=" + funding);
        }

        dsUser = CUser.LoadAllUsersInfo();
    }

    protected void btnAssignMonth_Click(object sender, EventArgs e)
    {
        //LoadAllChildRecords(cboMonth.SelectedValue);
    }
}
