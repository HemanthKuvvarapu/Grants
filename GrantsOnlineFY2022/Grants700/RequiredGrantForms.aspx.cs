using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Data;

public partial class RequiredGrantForms : System.Web.UI.Page
{
    DAL dal = new DAL();
    DataSet ds;
    DataSet ds2;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["GrantApplicantId"] == null) Response.Redirect("SessionTimeout.aspx");

        Master.PartTitle = AppInfo.DisplayPart9Title;

        lblInstruction.Text = dal.GetPartInstruction(AppInfo.FundCode, AppInfo.FiscalYear, "9");

        if (!Page.IsPostBack)
        {
            loadUploadedFiles(false);
        }
    }

    private void loadUploadedFiles(bool isAfterSaved)
    {
        ds = dal.GetUploadedFiles(Int32.Parse(Session["GrantApplicantId"].ToString()),
                                  AppInfo.FundCode,
                                  AppInfo.FiscalYear);

        dlstFile.DataSource = ds;
        dlstFile.DataBind();

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

    private void saveData()
    {
        FileUpload fileUpload;
        HiddenField fileUploadedType;

        foreach (DataListItem file in dlstFile.Items)
        {
            fileUpload = (FileUpload)file.FindControl("fileUpload");
            fileUploadedType = (HiddenField)file.FindControl("fileUploadedType");

            if (fileUpload.HasFile)
            {
                string fileName = fileUpload.FileName;
                string fileType = fileName.Substring(fileName.LastIndexOf(".") + 1);

                dal.SaveUploadFile(Int32.Parse(Session["GrantApplicantId"].ToString()), Int32.Parse(fileUploadedType.Value), fileUpload.FileBytes, fileName, fileType);
            }

        }
    }

    protected void btnUploadFiles_Click(object sender, EventArgs e)
    {
        saveData();
        loadUploadedFiles(true);
    }

    private void setDefaultStyle()
    {
        FileUpload fileUpload;

        foreach (DataListItem file in dlstFile.Items)
        {
            fileUpload = (FileUpload)file.FindControl("fileUpload");

            fileUpload.CssClass = "styleUnHighlight";
        }
    }

    private bool hasValidationErrors(bool isAfterSaved)
    {
        int errorCount = 0;

        setDefaultStyle();

        List<string> lstErrorBoxes = new List<string>();

        if (!GlobalFunc.isValidRequiredForms(lstErrorBoxes, ds, ds2))
        {
            lblErrors.Text = "Please upload all the required files.";
            errorCount++;
        }

        if (lstErrorBoxes.Count > 0)
        {
            displayErrorHighlight(lstErrorBoxes);
        }

        dal.UpdateRequiredFormsErrorCount(Int32.Parse(Session["GrantApplicantId"].ToString()), "9", errorCount);

        return lstErrorBoxes.Count > 0;
    }

    private void displayErrorHighlight(List<string> lstBoxes)
    {
        FileUpload fileUpload;
        HiddenField fileUploadedType;

        foreach (DataListItem file in dlstFile.Items)
        {
            fileUpload = (FileUpload)file.FindControl("fileUpload");
            fileUploadedType = (HiddenField)file.FindControl("FileUploadedType");

            for (int i = 0; i < lstBoxes.Count; i++)
            {
                if (lstBoxes[i] == fileUploadedType.Value)
                {
                    fileUpload.CssClass = "styleHighlight";
                    break;
                }
            }
        }
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("CheckList.aspx");
    }

    protected void btnBackToHome_Click(object sender, EventArgs e)
    {
        Response.Redirect("CheckList.aspx");
    }

    protected void btnNextPart_Click(object sender, EventArgs e)
    {
        Response.Redirect("PDFCheckList.aspx");
    }

    protected void btnPrintRequiredForms_Click(object sender, EventArgs e)
    {
        try
        {
            saveData();
            Response.Redirect("Print.aspx?type=RequiredForms");

            loadUploadedFiles(true);
        }
        catch (Exception ex)
        {
            //lblMessage.Text = "Error occurred while saving the data:: " + ex.Message;
            //lblMessage.Font.Bold = true;
            //lblMessage.ForeColor = System.Drawing.Color.DarkRed;
        }
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
            trFileChange = (HtmlTableRow)e.Item.FindControl("trFileChange");
            fileUploadedType = (HiddenField)e.Item.FindControl("fileUploadedType");
            lnkFileUploaded = (LinkButton)e.Item.FindControl("lnkFileUploaded");
            imgFileUploadedIcon = (Image)e.Item.FindControl("imgFileUploadedIcon");
            btnRemoveFileUploaded = (Button)e.Item.FindControl("btnRemoveFileUploaded");

            lblCustomText.Text = dataRow["CustomContent"].ToString();
            fileUploadedType.Value = dataRow["FileNum"].ToString();

            if (!string.IsNullOrEmpty(dataRow["FileName"].ToString()))
            {
                lnkFileUploaded.Text = dataRow["FileName"].ToString();
                lnkFileUploaded.CommandName = "ShowFile";
                lnkFileUploaded.CommandArgument = dataRow["FileNum"].ToString();

                imgFileUploadedIcon.ImageUrl = getImageIcon(dataRow["FileType"].ToString().ToLower());

                btnRemoveFileUploaded.CommandName = "RemoveFile";
                btnRemoveFileUploaded.CommandArgument = dataRow["FileNum"].ToString();

                trFileUploaded.Visible = true;
                trFileChange.Visible = true;
            }
            else
            {
                trFileUploaded.Visible = false;
                trFileChange.Visible = false;
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
