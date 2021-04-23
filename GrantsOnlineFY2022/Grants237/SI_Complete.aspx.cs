using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Data;

public partial class SI_Complete : System.Web.UI.Page
{
    DAL dal = new DAL();
    DataSet ds;

    protected void Page_Load(object sender, EventArgs e)
    {

        MaintainScrollPositionOnPostBack = true;

        if (!IsPostBack)
        {
            //Master.PageSubTitle = "Checklist for Required Grant Application Documents";
            lblOrgname.Text = (Session["Lead Agency Name"] == null ? "" : "<b></b>" + Session["Lead Agency Name"].ToString());
            //lblOrgname1.Text = (Session["Lead Agency Name"] == null ? "" : "<b></b>" + Session["Lead Agency Name"].ToString());

            loadUploadedFiles(false);

        }
    }
    protected void btnSaveContinue_Click(object sender, EventArgs e)
    {
        NextPage("continue");
    }
    protected void btnSaveHome_Click(object sender, EventArgs e)
    {
        NextPage("home");
    }
    protected void btnPrint_Click(object sender, EventArgs e)
    {
        if (Session["PCHPAgency"].ToString() == "1")
        {
            Response.Redirect("Print.aspx?type=packagePCHP");
        }
        else
        {
            Response.Redirect("Print.aspx?type=package");
        }
    }

    private void NextPage(string action)
    {
        //if (action == "continue")
        //    Response.Redirect("ScheduleA.aspx");
        //else
            //Response.Redirect("CheckList.aspx");

        Response.Redirect("http://www.mass.gov/edu/birth-grade-12/early-education-and-care/financial-assistance/funding-opportunities/");
    }

    private string getImageIcon(string fileType)
    {
        string img = "";

        switch (fileType.ToLower())
        {
            case "pdf":
                img = "~/Images/PDFIcon_large.gif";
                break;
            case "doc":
                img = "~/Images/wordDocIcon.gif";
                break;
            case "docx":
                img = "~/Images/wordDocIcon.gif";
                break;
            case "xls":
                img = "~/Images/ExcelIcon.jpg";
                break;
            case "xlsx":
                img = "~/Images/ExcelIcon.jpg";
                break;
        }

        return img;
    }

    private void loadUploadedFiles(bool isAfterSaved)
    {
        ds = dal.GetUploadedFiles(Int32.Parse(Session["GrantApplicantId"].ToString()),
                                  AppInfo.FundCode,
                                  AppInfo.FiscalYear);
 
        dlstFile.DataSource = ds;
        dlstFile.DataBind();
    }

    protected void dlstFile_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        Literal lblCustomText;
        HtmlTableRow trFileUploaded;
        HtmlTableRow trFileChange;
        HiddenField fileUploadedType;
        LinkButton lnkFileUploaded;
        Image imgFileUploadedIcon;
        Button btnRemoveFileUploaded;

        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            DataRowView dataRow = (DataRowView)e.Item.DataItem;

            lblCustomText = (Literal)e.Item.FindControl("lblCustomText");
            trFileUploaded = (HtmlTableRow)e.Item.FindControl("trFileUploaded");
            //trFileChange = (HtmlTableRow)e.Item.FindControl("trFileChange");
            //fileUploadedType = (HiddenField)e.Item.FindControl("fileUploadedType");
            lnkFileUploaded = (LinkButton)e.Item.FindControl("lnkFileUploaded");
            imgFileUploadedIcon = (Image)e.Item.FindControl("imgFileUploadedIcon");
            //btnRemoveFileUploaded = (Button)e.Item.FindControl("btnRemoveFileUploaded");

            lblCustomText.Text = dataRow["CustomContent"].ToString();
            //fileUploadedType.Value = dataRow["FileNum"].ToString();

            if (!string.IsNullOrEmpty(dataRow["FileName"].ToString()))
            {
                lnkFileUploaded.Text = dataRow["FileName"].ToString();
                lnkFileUploaded.CommandName = "ShowFile";
                lnkFileUploaded.CommandArgument = dataRow["FileNum"].ToString();

                imgFileUploadedIcon.ImageUrl = getImageIcon(dataRow["FileType"].ToString().ToLower());

                //btnRemoveFileUploaded.CommandName = "RemoveFile";
                //btnRemoveFileUploaded.CommandArgument = dataRow["FileNum"].ToString();

                trFileUploaded.Visible = true;
                //trFileChange.Visible = true;
            }
            else
            {
                trFileUploaded.Visible = false;
                //trFileChange.Visible = false;
            }

        }
    }

    protected void dlstFile_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName == "ShowFile")
        {
            Response.Redirect("ShowUploadedFile.aspx?type=" + e.CommandArgument);
        }
        else if (e.CommandName == "RemoveFile")
        {
            dal.RemoveUploadFile(Int32.Parse(Session["GrantApplicantId"].ToString()), Int32.Parse(e.CommandArgument.ToString()));
            Response.Redirect("RequiredGrantForms.aspx");
        }
    }
}
