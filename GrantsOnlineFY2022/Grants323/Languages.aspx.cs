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
 
public partial class Languages : System.Web.UI.Page
{
    DAL dal = new DAL();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["GrantApplicantId"] == null) Response.Redirect("SessionTimeout.aspx");

        Master.PartTitle = AppInfo.DisplayPart3Title;

        lblInstruction.Text = dal.GetPartInstruction(AppInfo.FundCode, AppInfo.FiscalYear, "3");

        if (!IsPostBack)
        {
            BindData();
        }
    }

    private void BindData()
    { 
        chklLanguages.DataSource = dal.GetLookupLanguage();
        chklLanguages.DataTextField = "Description";
        chklLanguages.DataValueField = "LanguageId";
        chklLanguages.DataBind();
        chklLanguages_SelectedIndexChanged(this, new EventArgs()); 
        
        DataSet ds = dal.GetGrantLanguage(Convert.ToInt32(Session["GrantApplicantId"]));

        if (ds.Tables[0].Rows.Count > 0)
        {
            foreach (DataRow dr in ds.Tables[0].Rows)
            {
                chklLanguages.Items.FindByValue(dr["LanguageId"].ToString()).Selected = true;

                if (dr["LanguageId"].ToString() == "80") //other
                {
                    txtOther.Text = dr["OtherLanguage"].ToString();
                    txtOther.Visible = true;
                }
            }

        }

    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        //save and go to next page.
        if (Page.IsValid)
        {
            SaveData();
        }
        else
        {
            tblSuccess.Visible = false;
        }
    }

    private void SaveData()
    {
        int retVal = dal.SaveGrantLanguage(Convert.ToInt32(Session["GrantApplicantId"]), GetLanguages());

        if (retVal == 0)
        {
            tblSuccess.Visible = true;
        }
        else
        {
            //show the error message.
            //lblMessage.Text = "Error while saving language.";
        }
    }

    private DataTable GetLanguages()
    {
        DataTable dt = new DataTable();
        dt.Columns.Add(new DataColumn("LanguageId", typeof(int)));
        dt.Columns.Add(new DataColumn("OtherLanguage", typeof(string)));

        DataRow dr;

        foreach (ListItem li in chklLanguages.Items)
        {
            if (li.Selected)
            {
                dr = dt.NewRow();
                dr["LanguageId"] = Convert.ToInt32(li.Value);
                dr["OtherLanguage"] =  (li.Value == "80" ? txtOther.Text : "" );

                dt.Rows.Add(dr);
            }
        }

        return dt;
    }
    protected void chklLanguages_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (chklLanguages.Items.FindByValue("80").Selected)
            txtOther.Visible = true;
        else
            txtOther.Visible = false;
    }

    protected void chkSelectAll_CheckedChanged(object sender, EventArgs e)
    {
        if (chkSelectAll.Checked)
        {
            foreach (ListItem li in chklLanguages.Items)
                li.Selected = true;

            txtOther.Visible = true;
        }
        else
        {
            foreach (ListItem li in chklLanguages.Items)
                li.Selected = false;

            txtOther.Visible = false;
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
        Response.Redirect("BudgetNarrative.aspx");
    }

    protected void btnSavePrint_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            SaveData();

            Response.Redirect("Print.aspx?type=LanguagesServed");
        }
    }

    protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (chklLanguages.Items.FindByValue("80").Selected && txtOther.Text.Trim() == "")
        {
            args.IsValid = false;
        }
    }

    protected void CustomValidator2_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (chklLanguages.SelectedIndex == -1)
        {
            args.IsValid = false;
        }
    }
}
