using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class PDFCheckList : System.Web.UI.Page
{
    DAL dal = new DAL();
    DataSet ds;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["GrantApplicantId"] == null) Response.Redirect("SessionTimeout.aspx");

        Master.PartTitle = AppInfo.DisplayPart10Title;

        lblInstruction.Text = dal.GetPartInstruction(AppInfo.FundCode, AppInfo.FiscalYear, "10");

        if (!IsPostBack)
        {
            lblOrgname.Text = (Session["Lead Agency Name"] == null ? "" : "<b></b>  " + Session["Lead Agency Name"].ToString());

            disableEECOnlyCheckboxes();

            BindData(false);
        }
    }

    private void disableEECOnlyCheckboxes()
    {
        chkE2.Enabled = false;
        chkE3.Enabled = false;
        chkE4.Enabled = false;
        chkE5.Enabled = false;
        chkE6.Enabled = false;
        chkE7.Enabled = false;
        chkE8.Enabled = false;
        //chkE9.Enabled = false;
        //chkE10.Enabled = false;
        //chkE11.Enabled = false;
       // chkE12.Enabled = false;
        chkE13.Enabled = false;
        chkE14.Enabled = false;
        chkE15.Enabled = false;
        chkE16.Enabled = false;
        chkE17.Enabled = false;
        chkE18.Enabled = false;
        chkE22.Enabled = false;
        chkE23.Enabled = false;
        chkE24.Enabled = false;
        chkE25.Enabled = false;
        chkE26.Enabled = false;
        chkF19.Enabled = false;
    }

    private void BindData(bool isAfterSaved)
    {
        ds = dal.GetPDFCheckList(Convert.ToInt32(Session["GrantApplicantId"].ToString()));

        if (AppInfo.DisplayPart6b)
        {
            BudgetSummary1Year.Visible = true;
        }
        else
        {
            BudgetSummary1Year.Visible = false;
        }

        if (AppInfo.DisplayPart6c)
        {
            BudgetSummary2Year.Visible = true;
        }
        else
        {
            BudgetSummary2Year.Visible = false;
        }

        if (ds.Tables[0].Rows.Count > 0)
        {
            DataRow dr = ds.Tables[0].Rows[0];

            chkA2.Checked = (dr["A2"].ToString() == "X");
            chkA3.Checked = (dr["A3"].ToString() == "X");
            chkA4.Checked = (dr["A4"].ToString() == "X");
            chkA5.Checked = (dr["A5"].ToString() == "X");
            chkA6.Checked = (dr["A6"].ToString() == "X");
            chkA7.Checked = (dr["A7"].ToString() == "X");
            chkA8.Checked = (dr["A8"].ToString() == "X");
            //chkA9.Checked = (dr["A9"].ToString() == "X");
            //chkA10.Checked = (dr["A10"].ToString() == "X");
            //chkA11.Checked = (dr["A11"].ToString() == "X");
           // chkA12.Checked = (dr["A12"].ToString() == "X");
            chkA13.Checked = (dr["A13"].ToString() == "X");
            chkA14.Checked = (dr["A14"].ToString() == "X");
            chkA15.Checked = (dr["A15"].ToString() == "X");
            chkA16.Checked = (dr["A16"].ToString() == "X");
            chkA17.Checked = (dr["A17"].ToString() == "X");
            chkA18.Checked = (dr["A18"].ToString() == "X");
            chkA22.Checked = (dr["A22"].ToString() == "X");
            chkA23.Checked = (dr["A23"].ToString() == "X");
            chkA24.Checked = (dr["A24"].ToString() == "X");
            chkA25.Checked = (dr["A25"].ToString() == "X");
            chkA26.Checked = (dr["A26"].ToString() == "X");


            chkE2.Checked = (dr["E2"].ToString() == "X");
            chkE3.Checked = (dr["E3"].ToString() == "X");
            chkE4.Checked = (dr["E4"].ToString() == "X");
            chkE5.Checked = (dr["E5"].ToString() == "X");
            chkE6.Checked = (dr["E6"].ToString() == "X");
            chkE7.Checked = (dr["E7"].ToString() == "X");
            chkE8.Checked = (dr["E8"].ToString() == "X");
            //chkE9.Checked = (dr["E9"].ToString() == "X");
            //chkE10.Checked = (dr["E10"].ToString() == "X");
            //chkE11.Checked = (dr["E11"].ToString() == "X");
            //chkE12.Checked = (dr["E12"].ToString() == "X");
            chkE13.Checked = (dr["E13"].ToString() == "X");
            chkE14.Checked = (dr["E14"].ToString() == "X");
            chkE15.Checked = (dr["E15"].ToString() == "X");
            chkE16.Checked = (dr["E16"].ToString() == "X");
            chkE17.Checked = (dr["E17"].ToString() == "X");
            chkE18.Checked = (dr["E18"].ToString() == "X");
            chkE22.Checked = (dr["E22"].ToString() == "X");
            chkE23.Checked = (dr["E23"].ToString() == "X");
            chkE24.Checked = (dr["E24"].ToString() == "X");
            chkE25.Checked = (dr["E25"].ToString() == "X");
            chkE26.Checked = (dr["E26"].ToString() == "X");
            chkF18.Checked = (dr["F18"].ToString() == "X");
            chkF19.Checked = (dr["F19"].ToString() == "X");
            chkA101.Checked = (dr["A101"].ToString() == "X");
            chkA102.Checked = (dr["A102"].ToString() == "X");
            chkA103.Checked = (dr["A103"].ToString() == "X");
            chkA104.Checked = (dr["A104"].ToString() == "X");
            chkA105.Checked = (dr["A105"].ToString() == "X");
        }
        else
        {
            ds = dal.GetUploadedFiles(Int32.Parse(Session["GrantApplicantId"].ToString()), AppInfo.FundCode, AppInfo.FiscalYear);

            Control ContentPlaceHolder = Form.FindControl("ContentPlaceHolder1");

            string sFileNum;

            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                DataRow row = ds.Tables[0].Rows[i];

                if (Int32.Parse(row["FileNum"].ToString()) < 10)
                {
                    sFileNum = "0" + row["FileNum"].ToString();
                }
                else
                {
                    sFileNum = row["FileNum"].ToString();
                }

                CheckBox chkBox = (CheckBox)((WebControl)ContentPlaceHolder.FindControl("chkA1" + sFileNum));

                if (chkBox != null)
                {
                    chkBox.Checked = !string.IsNullOrEmpty(row["FileName"].ToString());
                }
            }
        }

        if (isAfterSaved)
        {
            tblSuccess.Visible = true;
        }
        else
        {
            tblSuccess.Visible = false;
        }
    }

    private void save()
    {
        dal.SavePDFCheckList(Convert.ToInt32(Session["GrantApplicantId"].ToString()),
            0,
            (chkA2.Checked) ? 1 : 0,
            (chkA3.Checked) ? 1 : 0,
            (chkA4.Checked) ? 1 : 0,
            (chkA5.Checked) ? 1 : 0,
            (chkA6.Checked) ? 1 : 0,
            (chkA7.Checked) ? 1 : 0,
            (chkA8.Checked) ? 1 : 0,
            //(chkA9.Checked) ? 1 : 0,
            //(chkA10.Checked) ? 1 : 0,
            //(chkA11.Checked) ? 1 : 0,
           // (chkA12.Checked) ? 1 : 0,
            (chkA13.Checked) ? 1 : 0,
            (chkA14.Checked) ? 1 : 0,
            (chkA15.Checked) ? 1 : 0,
            (chkA16.Checked) ? 1 : 0,
            (chkA17.Checked) ? 1 : 0,
            (chkA18.Checked) ? 1 : 0,
            //(chkA19.Checked) ? 1 : 0,
            //(chkA20.Checked) ? 1 : 0,
            //(chkA21.Checked) ? 1 : 0,
            (chkA22.Checked) ? 1 : 0,
            (chkA23.Checked) ? 1 : 0,
            (chkA24.Checked) ? 1 : 0,
            (chkA25.Checked) ? 1 : 0,
            (chkA26.Checked) ? 1 : 0,
            
            (chkE2.Checked) ? 1 : 0,
            (chkE3.Checked) ? 1 : 0,
            (chkE4.Checked) ? 1 : 0,
            (chkE5.Checked) ? 1 : 0,
            (chkE6.Checked) ? 1 : 0,
            (chkE7.Checked) ? 1 : 0,
            (chkE8.Checked) ? 1 : 0,
            //(chkE9.Checked) ? 1 : 0,
            //(chkE10.Checked) ? 1 : 0,
            //(chkE11.Checked) ? 1 : 0,
           // (chkE12.Checked) ? 1 : 0,
            (chkE13.Checked) ? 1 : 0,
            (chkE14.Checked) ? 1 : 0,
            (chkE15.Checked) ? 1 : 0,
            (chkE16.Checked) ? 1 : 0,
            (chkE17.Checked) ? 1 : 0,
            (chkE18.Checked) ? 1 : 0,
            (chkE22.Checked) ? 1 : 0,
            (chkE23.Checked) ? 1 : 0,
            (chkE24.Checked) ? 1 : 0,
            (chkE25.Checked) ? 1 : 0,
            (chkE26.Checked) ? 1 : 0,
            (chkF18.Checked) ? 1 : 0,
            (chkF19.Checked) ? 1 : 0
            );

    }

    protected void btnSavePrint_Click(object sender, EventArgs e)
    {
        save();

        Response.Redirect("Print.aspx?type=pdfchecklist");
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        save();

        BindData(true);
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
        Response.Redirect("CoverPage.aspx");
    }
}
