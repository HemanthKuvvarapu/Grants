using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class controls_AgencyInfo : System.Web.UI.UserControl
{
    DAL dal = new DAL();

    protected void Page_Load(object sender, EventArgs e)
    {
        tblAgency.Visible = false;

        if (Session["GrantApplicantId"] != null)
        {
            tblAgency.Visible = true;

            lblHSLeadAgency.Text = Session["Lead Agency Name"].ToString();
            lblEligAmount.Text = Session["Eligibility Amount"].ToString();
        }
    }

    public void ReloadEligibilityAmount()
    {
        lblEligAmount.Text = Session["Eligibility Amount"].ToString();
    }
}