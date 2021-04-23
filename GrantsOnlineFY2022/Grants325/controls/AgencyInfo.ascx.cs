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

            trUPK.Visible = false;

            /*begin - for UPK only*/
            if (AppInfo.FundCode == 511)
            {
                if (Session["Program Name"] != null)
                {
                    trUPK.Visible = true;
                    lblProgramName.Text = Session["Program Name"].ToString();
                }
            }

            lblHSLeadAgency.Text = Session["Lead Agency Name"].ToString();
            lblEligAmount.Text = Session["Eligibility Amount"].ToString();

            if (AppInfo.FundCode == 391)
            {
                //(<asp:Label ID="lblOrgId" runat="server" Style="font-weight: 700;font-family:Arial; color:#3f3f3f" Text=""></asp:Label>)
                /*this is only for 391*/
                if (Session["OrgId"] != null)
                {
                    lblOrgId.Text = "(" + Session["OrgId"].ToString() + ")";
                }
                else
                {
                    lblOrgId.Visible = false;
                }
            }

            trUPK.Visible = false;
        }
    }

    public void ReloadEligibilityAmount()
    {
        lblEligAmount.Text = Session["Eligibility Amount"].ToString();
    }
}