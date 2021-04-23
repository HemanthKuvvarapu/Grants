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

public partial class UPK_2018_UPKQuestionnaire : System.Web.UI.Page
{
    DAL dal = new DAL();
    DataSet ds;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["GrantApplicantId"] == null) Response.Redirect("~/SessionTimeout.aspx");

        if (!Page.IsPostBack)
        {
            bindData(false);
        }
    }

    private void bindData(bool isAfterSaved)
    {
        ds = dal.GetUPKQuestionnaire(Convert.ToInt32(Session["GrantApplicantId"].ToString()));

        if (ds.Tables[0].Rows.Count > 0)
        {
            DataRow dr = ds.Tables[0].Rows[0];

            rdo1.SelectedValue = (!string.IsNullOrEmpty(dr["A1"].ToString()) ? dr["A1"].ToString() : "0");
            rdo2.SelectedValue = (!string.IsNullOrEmpty(dr["A2"].ToString()) ? dr["A2"].ToString() : "0");
            rdo3.SelectedValue = (!string.IsNullOrEmpty(dr["A3"].ToString()) ? dr["A3"].ToString() : "0");
            rdo4.SelectedValue = (!string.IsNullOrEmpty(dr["A4"].ToString()) ? dr["A4"].ToString() : "0");
            rdo5.SelectedValue = (!string.IsNullOrEmpty(dr["A5"].ToString()) ? dr["A5"].ToString() : "0");
            rdo6.SelectedValue = (!string.IsNullOrEmpty(dr["A6"].ToString()) ? dr["A6"].ToString() : "0");
            rdo7.SelectedValue = (!string.IsNullOrEmpty(dr["A7"].ToString()) ? dr["A7"].ToString() : "0");
            //rdo8.SelectedValue = (!string.IsNullOrEmpty(dr["A8"].ToString()) ? dr["A8"].ToString() : "0");
            
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
        Response.Redirect("UPKHome.aspx");
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
            aList.Add("A5", Convert.ToInt32(rdo5.SelectedValue));
            aList.Add("A6", Convert.ToInt32(rdo6.SelectedValue));
            aList.Add("A7", Convert.ToInt32(rdo7.SelectedValue));
            aList.Add("A8", 0);

            if (rdo1.SelectedValue == "1" &&
                rdo2.SelectedValue == "1" &&
                rdo3.SelectedValue == "1" &&
                rdo4.SelectedValue == "1" &&
                rdo5.SelectedValue == "1" &&
                rdo6.SelectedValue == "1" &&
                rdo7.SelectedValue == "1")
            {
                isValid = 1;
            }

            try
            {

                dal.SaveUPKQuestionnaire(Convert.ToInt32(Session["GrantApplicantId"].ToString()),
                                         isValid,
                                         aList);

                dal.SaveUPKPartStatus(Convert.ToInt32(Session["GrantApplicantId"].ToString()), "1", 1);

                bindData(true);
            }
            catch (Exception ex)
            {
            }
        }
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("UPKHome.aspx");
    }
}
