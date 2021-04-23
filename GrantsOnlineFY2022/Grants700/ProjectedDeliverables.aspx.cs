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

public partial class ProjectedDeliverables : System.Web.UI.Page
{
    DAL dal = new DAL();
    DataSet ds;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["GrantApplicantId"] == null) Response.Redirect("SessionTimeout.aspx");

        Master.PartTitle = AppInfo.DisplayPart8Title;

        lblInstruction.Text = dal.GetPartInstruction(AppInfo.FundCode, AppInfo.FiscalYear, "8");

        if (!Page.IsPostBack)
        {
            BindData(false);
        }
    }

    private void BindData(bool isAfterSaved)
    {
        ds = dal.GetProjectedDeliverables(Int32.Parse(Session["GrantApplicantId"].ToString()));

        if (ds.Tables[0].Rows.Count > 0)
        {
            DataRow dr = ds.Tables[0].Rows[0];

            txt1a.Text = dr["Q1a"].ToString();
            txt1b.Text = dr["Q1b"].ToString();
            txt1c.Text = dr["Q1c"].ToString();
            //txt1d.Text = dr["Q1d"].ToString();
            //txt1e.Text = dr["Q1e"].ToString();
            //txt1f.Text = dr["Q1f"].ToString();
            //txt1g.Text = dr["Q1g"].ToString();
            //txt1h.Text = dr["Q1h"].ToString();
            //txt1i.Text = dr["Q1i"].ToString();
            //txt1j.Text = dr["Q1j"].ToString();

            txt2a.Text = dr["Q2a"].ToString();
            txt2b.Text = dr["Q2b"].ToString();
            txt2c.Text = dr["Q2c"].ToString();
            txt2d.Text = dr["Q2d"].ToString();
            //txt2e.Text = dr["Q2e"].ToString();
            //txt2f.Text = dr["Q2f"].ToString();
            //txt2g.Text = dr["Q2g"].ToString();
            //txt2h.Text = dr["Q2h"].ToString();
            //txt2i.Text = dr["Q2i"].ToString();
            //txt2j.Text = dr["Q2j"].ToString();

            txt3a.Text = dr["Q3a"].ToString();
            txt3b.Text = dr["Q3b"].ToString();
            txt3c.Text = dr["Q3c"].ToString();
            //txt3d.Text = dr["Q3d"].ToString();
            //txt3e.Text = dr["Q3e"].ToString();
            //txt3f.Text = dr["Q3f"].ToString();
            //txt3g.Text = dr["Q3g"].ToString();
            //txt3h.Text = dr["Q3h"].ToString();
            //txt3i.Text = dr["Q3i"].ToString();
            //txt3j.Text = string.IsNullOrEmpty(dr["Q3j"].ToString()) ? "" : Decimal.Parse(dr["Q3j"].ToString()).ToString("N2");

            txt4a.Text = dr["Q4a"].ToString();
            txt4b.Text = dr["Q4b"].ToString();
            txt4c.Text = dr["Q4c"].ToString();
            txt4d.Text = dr["Q4d"].ToString();
            //txt4e.Text = dr["Q4e"].ToString();
            //txt4f.Text = dr["Q4f"].ToString();
            //txt4g.Text = dr["Q4g"].ToString();
            //txt4h.Text = dr["Q4h"].ToString();
            //txt4i.Text = string.IsNullOrEmpty(dr["Q4i"].ToString()) ? "" : Decimal.Parse(dr["Q4i"].ToString()).ToString("N2");
            //txt4j.Text = string.IsNullOrEmpty(dr["Q4j"].ToString()) ? "" : Decimal.Parse(dr["Q4j"].ToString()).ToString("N2");

            txt5a.Text = dr["Q5a"].ToString();
            txt5b.Text = dr["Q5b"].ToString();
            //txt5c.Text = dr["Q5c"].ToString();
            //txt5d.Text = dr["Q5d"].ToString();
            //txt5e.Text = dr["Q5e"].ToString();
            //txt5f.Text = dr["Q5f"].ToString();
            //txt5g.Text = dr["Q5g"].ToString();
            //txt5h.Text = dr["Q5h"].ToString();
            //txt5i.Text = dr["Q5i"].ToString();
            //txt5j.Text = dr["Q5j"].ToString();


            //txt6a.Text = dr["Q6a"].ToString();
            //txt6b.Text = dr["Q6b"].ToString();
            //txt6c.Text = dr["Q6c"].ToString();
            //txt6d.Text = dr["Q6d"].ToString();
            //txt6e.Text = dr["Q6e"].ToString();
            //txt6f.Text = dr["Q6f"].ToString();
            //txt6g.Text = dr["Q6g"].ToString();
            //txt6h.Text = dr["Q6h"].ToString();
            //txt6i.Text = dr["Q6i"].ToString();
            //txt6j.Text = dr["Q6j"].ToString();

            //txt7a.Text = dr["Q7a"].ToString();
            //txt7b.Text = dr["Q7b"].ToString();
            //txt7c.Text = dr["Q7c"].ToString();
            //txt7d.Text = dr["Q7d"].ToString();
            //txt7e.Text = dr["Q7e"].ToString();
            //txt7f.Text = dr["Q7f"].ToString();
            //txt7g.Text = dr["Q7g"].ToString();


            txt1adescr.Text = dr["Q1adescr"].ToString();
            txt1bdescr.Text = dr["Q1bdescr"].ToString();
            txt1cdescr.Text = dr["Q1cdescr"].ToString();
            //txt1ddescr.Text = dr["Q1ddescr"].ToString();
            //txt1edescr.Text = dr["Q1edescr"].ToString();
            //txt1fdescr.Text = dr["Q1fdescr"].ToString();
            //txt1gdescr.Text = dr["Q1gdescr"].ToString();
            //txt1hdescr.Text = dr["Q1hdescr"].ToString();
            //txt1idescr.Text = dr["Q1idescr"].ToString();
            //txt1jdescr.Text = dr["Q1jdescr"].ToString();

            txt2adescr.Text = dr["Q2adescr"].ToString();
            txt2bdescr.Text = dr["Q2bdescr"].ToString();
            txt2cdescr.Text = dr["Q2cdescr"].ToString();
            txt2ddescr.Text = dr["Q2ddescr"].ToString();
            //txt2edescr.Text = dr["Q2edescr"].ToString();
            //txt2fdescr.Text = dr["Q2fdescr"].ToString();
            //txt2gdescr.Text = dr["Q2gdescr"].ToString();
            //txt2hdescr.Text = dr["Q2hdescr"].ToString();
            //txt2idescr.Text = dr["Q2idescr"].ToString();
            //txt2jdescr.Text = dr["Q2jdescr"].ToString();

            txt3adescr.Text = dr["Q3adescr"].ToString();
            txt3bdescr.Text = dr["Q3bdescr"].ToString();
            txt3cdescr.Text = dr["Q3cdescr"].ToString();
            //txt3ddescr.Text = dr["Q3ddescr"].ToString();
            //txt3edescr.Text = dr["Q3edescr"].ToString();
            //txt3fdescr.Text = dr["Q3fdescr"].ToString();
            //txt3gdescr.Text = dr["Q3gdescr"].ToString();
            //txt3hdescr.Text = dr["Q3hdescr"].ToString();
            //txt3idescr.Text = dr["Q3idescr"].ToString();
            //txt3jdescr.Text = dr["Q3jdescr"].ToString();

            txt4adescr.Text = dr["Q4adescr"].ToString();
            txt4bdescr.Text = dr["Q4bdescr"].ToString();
            txt4cdescr.Text = dr["Q4cdescr"].ToString();
            txt4ddescr.Text = dr["Q4ddescr"].ToString();
            //txt4edescr.Text = dr["Q4edescr"].ToString();
            //txt4fdescr.Text = dr["Q4fdescr"].ToString();
            //txt4gdescr.Text = dr["Q4gdescr"].ToString();
            //txt4hdescr.Text = dr["Q4hdescr"].ToString();
            //txt4idescr.Text = dr["Q4idescr"].ToString();
            //txt4jdescr.Text = dr["Q4jdescr"].ToString();

            txt5adescr.Text = dr["Q5adescr"].ToString();
            txt5bdescr.Text = dr["Q5bdescr"].ToString();
            //txt5cdescr.Text = dr["Q5cdescr"].ToString();
            //txt5ddescr.Text = dr["Q5ddescr"].ToString();
            //txt5edescr.Text = dr["Q5edescr"].ToString();
            //txt5fdescr.Text = dr["Q5fdescr"].ToString();
            //txt5gdescr.Text = dr["Q5gdescr"].ToString();
            //txt5hdescr.Text = dr["Q5hdescr"].ToString();
            //txt5idescr.Text = dr["Q5idescr"].ToString();
            //txt5jdescr.Text = dr["Q5jdescr"].ToString();

            //txt6adescr.Text = dr["Q6adescr"].ToString();
            //txt6bdescr.Text = dr["Q6bdescr"].ToString();
            //txt6cdescr.Text = dr["Q6cdescr"].ToString();
            //txt6ddescr.Text = dr["Q6ddescr"].ToString();
            //txt6edescr.Text = dr["Q6edescr"].ToString();
            //txt6fdescr.Text = dr["Q6fdescr"].ToString();
            //txt6gdescr.Text = dr["Q6gdescr"].ToString();
            //txt6hdescr.Text = dr["Q6hdescr"].ToString();
            //txt6idescr.Text = dr["Q6idescr"].ToString();
            //txt6jdescr.Text = dr["Q6jdescr"].ToString();

            //txt7adescr.Text = dr["Q7adescr"].ToString();
            //txt7bdescr.Text = dr["Q7bdescr"].ToString();
            //txt7cdescr.Text = dr["Q7cdescr"].ToString();
            //txt7ddescr.Text = dr["Q7ddescr"].ToString();
            //txt7edescr.Text = dr["Q7edescr"].ToString();

            //txt7fdescr.Text = dr["Q7fdescr"].ToString();
            //txt7gdescr.Text = dr["Q7gdescr"].ToString();


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
    }

    private void setDefaultStyle()
    {
        txt1a.CssClass = "styleUnHighlight";
        txt1b.CssClass = "styleUnHighlight";
        txt1c.CssClass = "styleUnHighlight";
        //txt1d.CssClass = "styleUnHighlight";
        //txt1e.CssClass = "styleUnHighlight";
        //txt1f.CssClass = "styleUnHighlight";
        //txt1g.CssClass = "styleUnHighlight";
        //txt1h.CssClass = "styleUnHighlight";
        //txt1i.CssClass = "styleUnHighlight";
        //txt1j.CssClass = "styleUnHighlight";

        txt2a.CssClass = "styleUnHighlight";
        txt2b.CssClass = "styleUnHighlight";
        txt2c.CssClass = "styleUnHighlight";
        txt2d.CssClass = "styleUnHighlight";
        //txt2e.CssClass = "styleUnHighlight";
        //txt2f.CssClass = "styleUnHighlight";
        //txt2g.CssClass = "styleUnHighlight";
        //txt2h.CssClass = "styleUnHighlight";
        //txt2i.CssClass = "styleUnHighlight";
        //txt2j.CssClass = "styleUnHighlight";

        txt3a.CssClass = "styleUnHighlight";
        txt3b.CssClass = "styleUnHighlight";
        txt3c.CssClass = "styleUnHighlight";
        //txt3d.CssClass = "styleUnHighlight";
        //txt3e.CssClass = "styleUnHighlight";
        //txt3f.CssClass = "styleUnHighlight";
        //txt3g.CssClass = "styleUnHighlight";
        //txt3h.CssClass = "styleUnHighlight";
        //txt3i.CssClass = "styleUnHighlight";
        //txt3j.CssClass = "styleUnHighlight";

        txt4a.CssClass = "styleUnHighlight";
        txt4b.CssClass = "styleUnHighlight";
        txt4c.CssClass = "styleUnHighlight";
        txt4d.CssClass = "styleUnHighlight";
        //txt4e.CssClass = "styleUnHighlight";
        //txt4f.CssClass = "styleUnHighlight";
        //txt4g.CssClass = "styleUnHighlight";
        //txt4h.CssClass = "styleUnHighlight";
        //txt4i.CssClass = "styleUnHighlight";
        //txt4j.CssClass = "styleUnHighlight";

        txt5a.CssClass = "styleUnHighlight";
        txt5b.CssClass = "styleUnHighlight";
        //txt5c.CssClass = "styleUnHighlight";
        //txt5d.CssClass = "styleUnHighlight";
        //txt5e.CssClass = "styleUnHighlight";
        //txt5f.CssClass = "styleUnHighlight";
        //txt5g.CssClass = "styleUnHighlight";
        //txt5h.CssClass = "styleUnHighlight";
        //txt5i.CssClass = "styleUnHighlight";
        //txt5j.CssClass = "styleUnHighlight";

        //txt6a.CssClass = "styleUnHighlight";
        //txt6b.CssClass = "styleUnHighlight";
        //txt6c.CssClass = "styleUnHighlight";
        //txt6d.CssClass = "styleUnHighlight";
        //txt6e.CssClass = "styleUnHighlight";
        //txt6f.CssClass = "styleUnHighlight";
        //txt6g.CssClass = "styleUnHighlight";
        //txt6h.CssClass = "styleUnHighlight";
        //txt6i.CssClass = "styleUnHighlight";
        //txt6j.CssClass = "styleUnHighlight";

        //txt7a.CssClass = "styleUnHighlight";
        //txt7b.CssClass = "styleUnHighlight";
        //txt7c.CssClass = "styleUnHighlight";
        //txt7d.CssClass = "styleUnHighlight";
        //txt7e.CssClass = "styleUnHighlight";
        //txt7f.CssClass = "styleUnHighlight";
        //txt7g.CssClass = "styleUnHighlight";


        txt1adescr.CssClass = "styleUnHighlight";
        txt1bdescr.CssClass = "styleUnHighlight";
        txt1cdescr.CssClass = "styleUnHighlight";
        //txt1ddescr.CssClass = "styleUnHighlight";
        //txt1edescr.CssClass = "styleUnHighlight";
        //txt1fdescr.CssClass = "styleUnHighlight";
        //txt1gdescr.CssClass = "styleUnHighlight";
        //txt1hdescr.CssClass = "styleUnHighlight";
        //txt1idescr.CssClass = "styleUnHighlight";
        //txt1jdescr.CssClass = "styleUnHighlight";

        txt2adescr.CssClass = "styleUnHighlight";
        txt2bdescr.CssClass = "styleUnHighlight";
        txt2cdescr.CssClass = "styleUnHighlight";
        txt2ddescr.CssClass = "styleUnHighlight";
        //txt2edescr.CssClass = "styleUnHighlight";
        //txt2fdescr.CssClass = "styleUnHighlight";
        //txt2gdescr.CssClass = "styleUnHighlight";
        //txt2hdescr.CssClass = "styleUnHighlight";
        //txt2idescr.CssClass = "styleUnHighlight";
        //txt2jdescr.CssClass = "styleUnHighlight";

        txt3adescr.CssClass = "styleUnHighlight";
        txt3bdescr.CssClass = "styleUnHighlight";
        txt3cdescr.CssClass = "styleUnHighlight";
        //txt3ddescr.CssClass = "styleUnHighlight";
        //txt3edescr.CssClass = "styleUnHighlight";
        //txt3fdescr.CssClass = "styleUnHighlight";
        //txt3gdescr.CssClass = "styleUnHighlight";
        //txt3hdescr.CssClass = "styleUnHighlight";
        //txt3idescr.CssClass = "styleUnHighlight";
        //txt3jdescr.CssClass = "styleUnHighlight";

        txt4adescr.CssClass = "styleUnHighlight";
        txt4bdescr.CssClass = "styleUnHighlight";
        txt4cdescr.CssClass = "styleUnHighlight";
        txt4ddescr.CssClass = "styleUnHighlight";
        //txt4edescr.CssClass = "styleUnHighlight";
        //txt4fdescr.CssClass = "styleUnHighlight";
        //txt4gdescr.CssClass = "styleUnHighlight";
        //txt4hdescr.CssClass = "styleUnHighlight";
        //txt4idescr.CssClass = "styleUnHighlight";
        //txt4jdescr.CssClass = "styleUnHighlight";

        txt5adescr.CssClass = "styleUnHighlight";
        txt5bdescr.CssClass = "styleUnHighlight";
        //txt5cdescr.CssClass = "styleUnHighlight";
        //txt5ddescr.CssClass = "styleUnHighlight";
        //txt5edescr.CssClass = "styleUnHighlight";

        //txt6adescr.CssClass = "styleUnHighlight";
        //txt6bdescr.CssClass = "styleUnHighlight";
        //txt6cdescr.CssClass = "styleUnHighlight";
        //txt6ddescr.CssClass = "styleUnHighlight";
        //txt6edescr.CssClass = "styleUnHighlight";
        //txt6fdescr.CssClass = "styleUnHighlight";

        //txt7adescr.CssClass = "styleUnHighlight";
        //txt7bdescr.CssClass = "styleUnHighlight";
        //txt7cdescr.CssClass = "styleUnHighlight";
        //txt7ddescr.CssClass = "styleUnHighlight";
        //txt7edescr.CssClass = "styleUnHighlight";
        //txt7fdescr.CssClass = "styleUnHighlight";
        //txt7gdescr.CssClass = "styleUnHighlight";
    }

    private bool hasValidationErrors(bool isAfterSaved)
    {
        int errorCount = 0;

        setDefaultStyle();

        List<string> lstErrorBoxes = new List<string>();

        if (!GlobalFunc.isValidProjectedDeliverables(lstErrorBoxes, ds))
        {
            lblErrors.Text = "Please provide response to all the questions and descriptions.";
            errorCount++;
        }

        if (lstErrorBoxes.Count > 0)
        {
            displayErrorHighlight(lstErrorBoxes);
        }

        dal.UpdateProjectedDeliverablesErrorCount(Int32.Parse(Session["GrantApplicantId"].ToString()), errorCount);

        return lstErrorBoxes.Count > 0;
    }

    private void displayErrorHighlight(List<string> lstBoxes)
    {
        Control ContentPlaceHolder = Form.FindControl("ContentPlaceHolder1");

        for (int i = 0; i < lstBoxes.Count; i++)
        {
            ((WebControl)ContentPlaceHolder.FindControl(lstBoxes[i])).CssClass = "styleHighlight";
        }
    }

    private int SaveProjectedDeliverablesData()
    {
        int retVal;
        SortedList<string, string> txtList = new SortedList<string, string>();
        SortedList<string, string> descrList = new SortedList<string, string>();

        if (Page.IsValid)
        {
            txtList.Add("Q1a", txt1a.Text);
            txtList.Add("Q1b", txt1b.Text);
            txtList.Add("Q1c", txt1c.Text);
            //txtList.Add("Q1d", txt1d.Text);
            //txtList.Add("Q1e", txt1e.Text);
            //txtList.Add("Q1f", txt1f.Text);

            txtList.Add("Q2a", txt2a.Text);
            txtList.Add("Q2b", txt2b.Text);
            txtList.Add("Q2c", txt2c.Text);
            txtList.Add("Q2d", txt2d.Text);
            //txtList.Add("Q2e", txt2e.Text);
            //txtList.Add("Q2f", txt2f.Text);
            //txtList.Add("Q2g", txt2g.Text);
            //txtList.Add("Q2h", txt2h.Text);

            txtList.Add("Q3a", txt3a.Text);
            txtList.Add("Q3b", txt3b.Text);
            txtList.Add("Q3c", txt3c.Text);
            //txtList.Add("Q3d", txt3d.Text);
            //txtList.Add("Q3e", txt3e.Text);
            //txtList.Add("Q3f", txt3f.Text);
            //txtList.Add("Q3g", txt3g.Text);
            //txtList.Add("Q3h", txt3h.Text);
            //txtList.Add("Q3i", txt3i.Text);

            txtList.Add("Q4a", txt4a.Text);
            txtList.Add("Q4b", txt4b.Text);
            txtList.Add("Q4c", txt4c.Text);
            txtList.Add("Q4d", txt4d.Text);
            //txtList.Add("Q4e", txt4e.Text);
            //txtList.Add("Q4f", txt4f.Text);
            //txtList.Add("Q4g", txt4g.Text);
            //txtList.Add("Q4h", txt4h.Text);

            txtList.Add("Q5a", txt5a.Text);
            txtList.Add("Q5b", txt5b.Text);
            //txtList.Add("Q5c", txt5c.Text);
            //txtList.Add("Q5d", txt5d.Text);
            //txtList.Add("Q5e", txt5e.Text);
            //txtList.Add("Q5f", txt5f.Text);
            //txtList.Add("Q5g", txt5g.Text);
            //txtList.Add("Q5h", txt5h.Text);
            //txtList.Add("Q5i", txt5i.Text);
            //txtList.Add("Q5j", txt5j.Text);

            //txtList.Add("Q6a", txt6a.Text);
            //txtList.Add("Q6b", txt6b.Text);
            //txtList.Add("Q6c", txt6c.Text);
            //txtList.Add("Q6d", txt6d.Text);
            //txtList.Add("Q6e", txt6e.Text);
            //txtList.Add("Q6f", txt6f.Text);
            //txtList.Add("Q6g", txt6g.Text);
            //txtList.Add("Q6h", txt6h.Text);
            //txtList.Add("Q6i", txt6i.Text);
            //txtList.Add("Q6j", txt6j.Text);

            //txtList.Add("Q7a", txt7a.Text);
            //txtList.Add("Q7b", txt7b.Text);
            //txtList.Add("Q7c", txt7c.Text);
            //txtList.Add("Q7d", txt7d.Text);
            //txtList.Add("Q7e", txt7e.Text);
            //txtList.Add("Q7f", txt7f.Text);
            //txtList.Add("Q7g", txt7g.Text);



            descrList.Add("Q1adescr", txt1adescr.Text);
            descrList.Add("Q1bdescr", txt1bdescr.Text);
            descrList.Add("Q1cdescr", txt1cdescr.Text);
            //descrList.Add("Q1ddescr", txt1ddescr.Text);
            //descrList.Add("Q1edescr", txt1edescr.Text);
            //descrList.Add("Q1fdescr", txt1fdescr.Text);

            descrList.Add("Q2adescr", txt2adescr.Text);
            descrList.Add("Q2bdescr", txt2bdescr.Text);
            descrList.Add("Q2cdescr", txt2cdescr.Text);
            descrList.Add("Q2ddescr", txt2ddescr.Text);
            //descrList.Add("Q2edescr", txt2edescr.Text);
            //descrList.Add("Q2fdescr", txt2fdescr.Text);
            //descrList.Add("Q2gdescr", txt2gdescr.Text);
            //descrList.Add("Q2hdescr", txt2hdescr.Text);

            descrList.Add("Q3adescr", txt3adescr.Text);
            descrList.Add("Q3bdescr", txt3bdescr.Text);
            descrList.Add("Q3cdescr", txt3cdescr.Text);
            //descrList.Add("Q3ddescr", txt3ddescr.Text);
            //descrList.Add("Q3edescr", txt3edescr.Text);
            //descrList.Add("Q3fdescr", txt3fdescr.Text);
            //descrList.Add("Q3gdescr", txt3gdescr.Text);
            //descrList.Add("Q3hdescr", txt3hdescr.Text);
            //descrList.Add("Q3idescr", txt3idescr.Text);

            descrList.Add("Q4adescr", txt4adescr.Text);
            descrList.Add("Q4bdescr", txt4bdescr.Text);
            descrList.Add("Q4cdescr", txt4cdescr.Text);
            descrList.Add("Q4ddescr", txt4ddescr.Text);
            //descrList.Add("Q4edescr", txt4edescr.Text);
            //descrList.Add("Q4fdescr", txt4fdescr.Text);
            //descrList.Add("Q4gdescr", txt4gdescr.Text);
            //descrList.Add("Q4hdescr", txt4hdescr.Text);

            descrList.Add("Q5adescr", txt5adescr.Text);
            descrList.Add("Q5bdescr", txt5bdescr.Text);
            //descrList.Add("Q5cdescr", txt5cdescr.Text);
            //descrList.Add("Q5ddescr", txt5ddescr.Text);
            //descrList.Add("Q5edescr", txt5edescr.Text);
            //descrList.Add("Q5fdescr", txt5fdescr.Text);
            //descrList.Add("Q5gdescr", txt5gdescr.Text);
            //descrList.Add("Q5hdescr", txt5hdescr.Text);
            //descrList.Add("Q5idescr", txt5idescr.Text);
            //descrList.Add("Q5jdescr", txt5jdescr.Text);

            //descrList.Add("Q6adescr", txt6adescr.Text);
            //descrList.Add("Q6bdescr", txt6bdescr.Text);
            //descrList.Add("Q6cdescr", txt6cdescr.Text);
            //descrList.Add("Q6ddescr", txt6ddescr.Text);
            //descrList.Add("Q6edescr", txt6edescr.Text);
            //descrList.Add("Q6fdescr", txt6fdescr.Text);
            //descrList.Add("Q6gdescr", txt6gdescr.Text);
            //descrList.Add("Q6hdescr", txt6hdescr.Text);
            //descrList.Add("Q6idescr", txt6idescr.Text);
            //descrList.Add("Q6jdescr", txt6jdescr.Text);

            //descrList.Add("Q7adescr", txt7adescr.Text);
            //descrList.Add("Q7bdescr", txt7bdescr.Text);
            //descrList.Add("Q7cdescr", txt7cdescr.Text);
            //descrList.Add("Q7ddescr", txt7ddescr.Text);
            //descrList.Add("Q7edescr", txt7edescr.Text);
            //descrList.Add("Q7fdescr", txt7fdescr.Text);
            //descrList.Add("Q7gdescr", txt7gdescr.Text);

            retVal = dal.SaveProjectedDeliverables(Int32.Parse(Session["GrantApplicantId"].ToString()), txtList, descrList);
        }
        else
            retVal = -1;

        return retVal;
    }

    protected void btnCancelSave_Click(object sender, EventArgs e)
    {
        Response.Redirect("CheckList.aspx");
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        int retVal;

        try
        {
            retVal = SaveProjectedDeliverablesData();

            if (retVal > 0)
            {
                BindData(true);
            }
        }
        catch (Exception ex)
        {
            //lblMessage.Text = "Error occurred while saving the data:: " + ex.Message;
            //lblMessage.Font.Bold = true;
            //lblMessage.ForeColor = System.Drawing.Color.DarkRed;
        }
    }

    protected void btnPrintHSPD8_Click(object sender, EventArgs e)
    {
        int retVal;

        try
        {
            retVal = SaveProjectedDeliverablesData();
            Response.Redirect("Print.aspx?type=ProjectedDeliverable");

            if (retVal > 0)
            {
                BindData(true);
            }
        }
        catch (Exception ex)
        {
            //lblMessage.Text = "Error occurred while saving the data:: " + ex.Message;
            //lblMessage.Font.Bold = true;
            //lblMessage.ForeColor = System.Drawing.Color.DarkRed;
        }
    }


    protected void btnBackToHome_Click(object sender, EventArgs e)
    {
        Response.Redirect("CheckList.aspx");
    }

    protected void btnNextPart_Click(object sender, EventArgs e)
    {
        Response.Redirect("RequiredGrantForms.aspx");
    }
}
