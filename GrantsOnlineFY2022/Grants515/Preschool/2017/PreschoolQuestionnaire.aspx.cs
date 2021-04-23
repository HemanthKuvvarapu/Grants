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

public partial class Preschool_2017_PreschoolQuestionnaire : System.Web.UI.Page
{
    DAL dal = new DAL();
    DataSet ds;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["GrantApplicantId"] == null) Response.Redirect("../SessionTimeout.aspx");

        if (!Page.IsPostBack)
        {
            bindData(false);
        }
    }

    private void bindData(bool isAfterSaved)
    {
        ds = dal.GetPreschoolQuestionnaire(Convert.ToInt32(Session["GrantApplicantId"].ToString()), AppInfo.FiscalYear);

        if (ds.Tables[0].Rows.Count > 0)
        {
            DataRow dr = ds.Tables[0].Rows[0];

            rdo1.SelectedValue = (!string.IsNullOrEmpty(dr["A1"].ToString()) ? dr["A1"].ToString() : "0");
            rdo2.SelectedValue = (!string.IsNullOrEmpty(dr["A2"].ToString()) ? dr["A2"].ToString() : "0");
            rdo3.SelectedValue = (!string.IsNullOrEmpty(dr["A3"].ToString()) ? dr["A3"].ToString() : "0");
            rdo4.SelectedValue = (!string.IsNullOrEmpty(dr["A4"].ToString()) ? dr["A4"].ToString() : "0");
            //rdo5.SelectedValue = (!string.IsNullOrEmpty(dr["A5"].ToString()) ? dr["A5"].ToString() : "0");

            //txtQuestion3Reason.Text = dr["Q3Reason"].ToString();
            //txtQuestion4Reason.Text = dr["Q4Reason"].ToString();

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

    private bool hasValidationErrors(bool isAfterSaved)
    {
        if (ds.Tables[0].Rows[0]["isValid"].ToString() == "1")
            return false;
        else
            return true;
    }

    protected void btnBackToHome_Click(object sender, EventArgs e)
    {
        Response.Redirect("PreschoolHome.aspx");
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            int isValid = 0;
            SortedList<string, int> aList = new SortedList<string, int>();

            aList.Add("A1", Convert.ToInt32(rdo1.SelectedValue));
            aList.Add("A2", Convert.ToInt32(rdo2.SelectedValue));
            aList.Add("A3", Convert.ToInt32(rdo3.SelectedValue));
            aList.Add("A4", Convert.ToInt32(rdo4.SelectedValue));
            //aList.Add("A5", Convert.ToInt32(rdo5.SelectedValue));

            //if (rdo1.SelectedValue == "1" &&
            //    rdo2.SelectedValue == "1" &&
            //    (rdo3.SelectedValue == "1" || (rdo3.SelectedValue == "0" && !string.IsNullOrEmpty(txtQuestion3Reason.Text))) &&
            //    (rdo4.SelectedValue == "1" || (rdo4.SelectedValue == "0" && !string.IsNullOrEmpty(txtQuestion4Reason.Text))) &&
            //    rdo5.SelectedValue == "1" )
            if (rdo1.SelectedValue == "1" && rdo2.SelectedValue == "1" && rdo3.SelectedValue == "1" && rdo4.SelectedValue == "1")
            {
                isValid = 1;
            }

            try
            {

                //if (rdo3.SelectedValue == "1") txtQuestion3Reason.Text = "";
                //if (rdo4.SelectedValue == "1") txtQuestion4Reason.Text = "";

                dal.SavePreschoolQuestionnaire(Convert.ToInt32(Session["GrantApplicantId"].ToString()),
                                         isValid,
                                         aList, "", "", AppInfo.FiscalYear);

                dal.SavePreschoolPartStatus(Convert.ToInt32(Session["GrantApplicantId"].ToString()), "1", 1);

                bindData(true);
            }
            catch (Exception ex)
            {
            }
        }
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("PreschoolHome.aspx");
    }

    //protected void CustomValidatorQ3Reason_ServerValidate(object source, ServerValidateEventArgs args)
    //{
    //    if (rdo3.SelectedValue == "0" && string.IsNullOrEmpty(txtQuestion3Reason.Text))
    //    {
    //        args.IsValid = false;
    //    }
    //}

    //protected void CustomValidatorQ4Reason_ServerValidate(object source, ServerValidateEventArgs args)
    //{
    //    if (rdo4.SelectedValue == "0" && string.IsNullOrEmpty(txtQuestion4Reason.Text))
    //    {
    //        args.IsValid = false;
    //    }
    //}
}
