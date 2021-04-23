using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ThankYou : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["GrantApplicantId"] == null) Response.Redirect("SessionTimeout.aspx");

        if (!IsPostBack)
        {
            if (Request.QueryString["register"] != null)
            {
                string reg = Request.QueryString["register"].ToString();

                if (reg == "yes")
                {
                    Session["RegisteredUser"] = true;

                    lbtnContinue.Visible = true;
                    lbtnGoHome.Visible = false;

                    string grantName = "Mental Health Consultation";
                    int grantTypeId = Convert.ToInt32(Session["GrantTypeId"]);
                    if (grantTypeId == 2) grantName = "Educator and Provider Support RFR";
                    if (grantTypeId == 3) grantName = "Coordinated Family and Community Engagement Grant";
                    if (grantTypeId == 4) grantName = "Head Start Supplemental Grant";


                    lblMessage.Text = @"Thank you for registering as a bidder for the " + grantName + @" . <br><br>
                            <font style=""background-color:#99CCFF"">Your registration number is : <b>" + Session["GrantApplicantId"].ToString() +
                            "</b></font><br><br>Please click Continue to begin the questionnaire";
                    //EEC will post the on-line RFR evaluation questionnaire once the bidders conferences have been completed.  EEC expects to make the questionnaire available on March 24, 2009.  Please log back in then to begin the questionnaire.";
                }
                else
                {
                    lbtnContinue.Visible = false;
                    lbtnGoHome.Visible = true;

                    lblMessage.Text = "Please visit the site again, if you are interested in registering as a bidder.<br><br>Thank you for your interest!";
                }
            }
            else
            {
                Session.Clear();
                Response.Redirect("default.aspx");
            }
        }
    }
    protected void lbtnGoHome_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Response.Redirect("default.aspx");
    }
    protected void lbtnContinue_Click(object sender, EventArgs e)
    {
        if (Convert.ToInt32(Session["GrantTypeId"]) == 4)
            Response.Redirect("Languages.aspx");

            Response.Redirect("Language.aspx");
    }
}
