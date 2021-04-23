using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;

public partial class Preschool_2017_PreschoolProgramInformation : System.Web.UI.Page
{
    DAL dal = new DAL();
    DataSet ds = null;
    int TotalProgramCount = 0;
    int TotalIPLESessions = 0;
    int TotalIPLEEnrollments = 0;
    int TotalChildWithIEP = 0;
    int TotalChildWithNoIEP = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["GrantApplicantId"] == null) Response.Redirect("../SessionTimeout.aspx");

        BindScripts();

        if (!IsPostBack)
        {
            LoadControls();
        }
    }

    private void BindScripts()
    {
        txtQ10_1_0.Attributes.Add("disabled", "disabled");
        txtQ10_2_0.Attributes.Add("disabled", "disabled");
        txtQ10_3_0.Attributes.Add("disabled", "disabled");
        txtQ10_4_0.Attributes.Add("disabled", "disabled");

        txtQ12_1_0.Attributes.Add("disabled", "disabled");
        txtQ12_2_0.Attributes.Add("disabled", "disabled");
        txtQ12_3_0.Attributes.Add("disabled", "disabled");
        txtQ12_4_0.Attributes.Add("disabled", "disabled");

        txtQ13_1_0.Attributes.Add("disabled", "disabled");
        txtQ13_2_0.Attributes.Add("disabled", "disabled");
        txtQ13_3_0.Attributes.Add("disabled", "disabled");
        txtQ13_4_0.Attributes.Add("disabled", "disabled");

        txtQ14_1_0.Attributes.Add("disabled", "disabled");
        txtQ14_2_0.Attributes.Add("disabled", "disabled");
        txtQ14_3_0.Attributes.Add("disabled", "disabled");
        txtQ14_4_0.Attributes.Add("disabled", "disabled");

        txtQ15_1_1.Attributes.Add("disabled", "disabled");
        txtQ15_1_2.Attributes.Add("disabled", "disabled");
        txtQ15_1_3.Attributes.Add("disabled", "disabled");
        txtQ15_1_4.Attributes.Add("disabled", "disabled");
        txtQ15_1_5.Attributes.Add("disabled", "disabled");
        txtQ15_1_6.Attributes.Add("disabled", "disabled");

        txtQ16_1_1.Attributes.Add("disabled", "disabled");
        txtQ16_1_2.Attributes.Add("disabled", "disabled");
        txtQ16_1_3.Attributes.Add("disabled", "disabled");

        txtQ17_1_1.Attributes.Add("disabled", "disabled");
        txtQ17_1_2.Attributes.Add("disabled", "disabled");
        txtQ17_1_3.Attributes.Add("disabled", "disabled");

        txtQ18_1_1.Attributes.Add("disabled", "disabled");
        txtQ18_1_2.Attributes.Add("disabled", "disabled");
        txtQ18_1_3.Attributes.Add("disabled", "disabled");

        txtQ19_1_1.Attributes.Add("disabled", "disabled");
        txtQ19_1_2.Attributes.Add("disabled", "disabled");
        txtQ19_1_3.Attributes.Add("disabled", "disabled");

        txtQ16_9_2.Attributes.Add("disabled", "disabled");
        txtQ16_9_3.Attributes.Add("disabled", "disabled");
        txtQ17_9_2.Attributes.Add("disabled", "disabled");
        txtQ17_9_3.Attributes.Add("disabled", "disabled");
        txtQ18_9_2.Attributes.Add("disabled", "disabled");
        txtQ18_9_3.Attributes.Add("disabled", "disabled");
        txtQ19_9_2.Attributes.Add("disabled", "disabled");
        txtQ19_9_3.Attributes.Add("disabled", "disabled");

        txtQ10_1_4.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "null" + "," 
                                                                             + "null" + ","
                                                                             + "null" + ","
                                                                             + "'" + txtQ10_1_4.ClientID + "'" + ","
                                                                             + "'" + txtQ10_1_0.ClientID + "');");

        txtQ10_2_1.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ10_2_1.ClientID + "'" + ","
                                                                             + "'" + txtQ10_2_2.ClientID + "'" + ","
                                                                             + "'" + txtQ10_2_3.ClientID + "'" + ","
                                                                             + "null" + ","
                                                                             + "'" + txtQ10_2_0.ClientID + "');");

        txtQ10_2_2.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ10_2_1.ClientID + "'" + ","
                                                                             + "'" + txtQ10_2_2.ClientID + "'" + ","
                                                                             + "'" + txtQ10_2_3.ClientID + "'" + ","
                                                                             + "null" + ","
                                                                             + "'" + txtQ10_2_0.ClientID + "');");

        txtQ10_2_3.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ10_2_1.ClientID + "'" + ","
                                                                             + "'" + txtQ10_2_2.ClientID + "'" + ","
                                                                             + "'" + txtQ10_2_3.ClientID + "'" + ","
                                                                             + "null" + ","
                                                                             + "'" + txtQ10_2_0.ClientID + "');");

        txtQ10_3_1.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ10_3_1.ClientID + "'" + ","
                                                                             + "'" + txtQ10_3_2.ClientID + "'" + ","
                                                                             + "'" + txtQ10_3_3.ClientID + "'" + ","
                                                                             + "'" + txtQ10_3_4.ClientID + "'" + ","
                                                                             + "'" + txtQ10_3_0.ClientID + "');");

        txtQ10_3_2.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ10_3_1.ClientID + "'" + ","
                                                                             + "'" + txtQ10_3_2.ClientID + "'" + ","
                                                                             + "'" + txtQ10_3_3.ClientID + "'" + ","
                                                                             + "'" + txtQ10_3_4.ClientID + "'" + ","
                                                                             + "'" + txtQ10_3_0.ClientID + "');");

        txtQ10_3_3.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ10_3_1.ClientID + "'" + ","
                                                                             + "'" + txtQ10_3_2.ClientID + "'" + ","
                                                                             + "'" + txtQ10_3_3.ClientID + "'" + ","
                                                                             + "'" + txtQ10_3_4.ClientID + "'" + ","
                                                                             + "'" + txtQ10_3_0.ClientID + "');");

        txtQ10_3_4.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ10_3_1.ClientID + "'" + ","
                                                                             + "'" + txtQ10_3_2.ClientID + "'" + ","
                                                                             + "'" + txtQ10_3_3.ClientID + "'" + ","
                                                                             + "'" + txtQ10_3_4.ClientID + "'" + ","
                                                                             + "'" + txtQ10_3_0.ClientID + "');");

        txtQ10_4_1.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ10_4_1.ClientID + "'" + ","
                                                                             + "'" + txtQ10_4_2.ClientID + "'" + ","
                                                                             + "'" + txtQ10_4_3.ClientID + "'" + ","
                                                                             + "'" + txtQ10_4_4.ClientID + "'" + ","
                                                                             + "'" + txtQ10_4_0.ClientID + "');");

        txtQ10_4_2.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ10_4_1.ClientID + "'" + ","
                                                                             + "'" + txtQ10_4_2.ClientID + "'" + ","
                                                                             + "'" + txtQ10_4_3.ClientID + "'" + ","
                                                                             + "'" + txtQ10_4_4.ClientID + "'" + ","
                                                                             + "'" + txtQ10_4_0.ClientID + "');");

        txtQ10_4_3.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ10_4_1.ClientID + "'" + ","
                                                                             + "'" + txtQ10_4_2.ClientID + "'" + ","
                                                                             + "'" + txtQ10_4_3.ClientID + "'" + ","
                                                                             + "'" + txtQ10_4_4.ClientID + "'" + ","
                                                                             + "'" + txtQ10_4_0.ClientID + "');");

        txtQ10_4_4.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ10_4_1.ClientID + "'" + ","
                                                                             + "'" + txtQ10_4_2.ClientID + "'" + ","
                                                                             + "'" + txtQ10_4_3.ClientID + "'" + ","
                                                                             + "'" + txtQ10_4_4.ClientID + "'" + ","
                                                                             + "'" + txtQ10_4_0.ClientID + "');");



        txtQ12_1_4.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "null" + ","
                                                                             + "null" + ","
                                                                             + "null" + ","
                                                                             + "'" + txtQ12_1_4.ClientID + "'" + ","
                                                                             + "'" + txtQ12_1_0.ClientID + "');");

        txtQ12_2_1.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ12_2_1.ClientID + "'" + ","
                                                                             + "'" + txtQ12_2_2.ClientID + "'" + ","
                                                                             + "'" + txtQ12_2_3.ClientID + "'" + ","
                                                                             + "null" + ","
                                                                             + "'" + txtQ12_2_0.ClientID + "');");

        txtQ12_2_2.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ12_2_1.ClientID + "'" + ","
                                                                             + "'" + txtQ12_2_2.ClientID + "'" + ","
                                                                             + "'" + txtQ12_2_3.ClientID + "'" + ","
                                                                             + "null" + ","
                                                                             + "'" + txtQ12_2_0.ClientID + "');");

        txtQ12_2_3.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ12_2_1.ClientID + "'" + ","
                                                                             + "'" + txtQ12_2_2.ClientID + "'" + ","
                                                                             + "'" + txtQ12_2_3.ClientID + "'" + ","
                                                                             + "null" + ","
                                                                             + "'" + txtQ12_2_0.ClientID + "');");

        txtQ12_3_1.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ12_3_1.ClientID + "'" + ","
                                                                             + "'" + txtQ12_3_2.ClientID + "'" + ","
                                                                             + "'" + txtQ12_3_3.ClientID + "'" + ","
                                                                             + "'" + txtQ12_3_4.ClientID + "'" + ","
                                                                             + "'" + txtQ12_3_0.ClientID + "');");

        txtQ12_3_2.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ12_3_1.ClientID + "'" + ","
                                                                             + "'" + txtQ12_3_2.ClientID + "'" + ","
                                                                             + "'" + txtQ12_3_3.ClientID + "'" + ","
                                                                             + "'" + txtQ12_3_4.ClientID + "'" + ","
                                                                             + "'" + txtQ12_3_0.ClientID + "');");

        txtQ12_3_3.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ12_3_1.ClientID + "'" + ","
                                                                             + "'" + txtQ12_3_2.ClientID + "'" + ","
                                                                             + "'" + txtQ12_3_3.ClientID + "'" + ","
                                                                             + "'" + txtQ12_3_4.ClientID + "'" + ","
                                                                             + "'" + txtQ12_3_0.ClientID + "');");

        txtQ12_3_4.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ12_3_1.ClientID + "'" + ","
                                                                             + "'" + txtQ12_3_2.ClientID + "'" + ","
                                                                             + "'" + txtQ12_3_3.ClientID + "'" + ","
                                                                             + "'" + txtQ12_3_4.ClientID + "'" + ","
                                                                             + "'" + txtQ12_3_0.ClientID + "');");

        txtQ12_4_1.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ12_4_1.ClientID + "'" + ","
                                                                             + "'" + txtQ12_4_2.ClientID + "'" + ","
                                                                             + "'" + txtQ12_4_3.ClientID + "'" + ","
                                                                             + "'" + txtQ12_4_4.ClientID + "'" + ","
                                                                             + "'" + txtQ12_4_0.ClientID + "');");

        txtQ12_4_2.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ12_4_1.ClientID + "'" + ","
                                                                             + "'" + txtQ12_4_2.ClientID + "'" + ","
                                                                             + "'" + txtQ12_4_3.ClientID + "'" + ","
                                                                             + "'" + txtQ12_4_4.ClientID + "'" + ","
                                                                             + "'" + txtQ12_4_0.ClientID + "');");

        txtQ12_4_3.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ12_4_1.ClientID + "'" + ","
                                                                             + "'" + txtQ12_4_2.ClientID + "'" + ","
                                                                             + "'" + txtQ12_4_3.ClientID + "'" + ","
                                                                             + "'" + txtQ12_4_4.ClientID + "'" + ","
                                                                             + "'" + txtQ12_4_0.ClientID + "');");

        txtQ12_4_4.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ12_4_1.ClientID + "'" + ","
                                                                             + "'" + txtQ12_4_2.ClientID + "'" + ","
                                                                             + "'" + txtQ12_4_3.ClientID + "'" + ","
                                                                             + "'" + txtQ12_4_4.ClientID + "'" + ","
                                                                             + "'" + txtQ12_4_0.ClientID + "');");


        txtQ13_1_4.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "null" + ","
                                                                             + "null" + ","
                                                                             + "null" + ","
                                                                             + "'" + txtQ13_1_4.ClientID + "'" + ","
                                                                             + "'" + txtQ13_1_0.ClientID + "');");

        txtQ13_2_1.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ13_2_1.ClientID + "'" + ","
                                                                             + "'" + txtQ13_2_2.ClientID + "'" + ","
                                                                             + "'" + txtQ13_2_3.ClientID + "'" + ","
                                                                             + "null" + ","
                                                                             + "'" + txtQ13_2_0.ClientID + "');");

        txtQ13_2_2.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ13_2_1.ClientID + "'" + ","
                                                                             + "'" + txtQ13_2_2.ClientID + "'" + ","
                                                                             + "'" + txtQ13_2_3.ClientID + "'" + ","
                                                                             + "null" + ","
                                                                             + "'" + txtQ13_2_0.ClientID + "');");

        txtQ13_2_3.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ13_2_1.ClientID + "'" + ","
                                                                             + "'" + txtQ13_2_2.ClientID + "'" + ","
                                                                             + "'" + txtQ13_2_3.ClientID + "'" + ","
                                                                             + "null" + ","
                                                                             + "'" + txtQ13_2_0.ClientID + "');");

        txtQ13_3_1.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ13_3_1.ClientID + "'" + ","
                                                                             + "'" + txtQ13_3_2.ClientID + "'" + ","
                                                                             + "'" + txtQ13_3_3.ClientID + "'" + ","
                                                                             + "'" + txtQ13_3_4.ClientID + "'" + ","
                                                                             + "'" + txtQ13_3_0.ClientID + "');");

        txtQ13_3_2.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ13_3_1.ClientID + "'" + ","
                                                                             + "'" + txtQ13_3_2.ClientID + "'" + ","
                                                                             + "'" + txtQ13_3_3.ClientID + "'" + ","
                                                                             + "'" + txtQ13_3_4.ClientID + "'" + ","
                                                                             + "'" + txtQ13_3_0.ClientID + "');");

        txtQ13_3_3.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ13_3_1.ClientID + "'" + ","
                                                                             + "'" + txtQ13_3_2.ClientID + "'" + ","
                                                                             + "'" + txtQ13_3_3.ClientID + "'" + ","
                                                                             + "'" + txtQ13_3_4.ClientID + "'" + ","
                                                                             + "'" + txtQ13_3_0.ClientID + "');");

        txtQ13_3_4.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ13_3_1.ClientID + "'" + ","
                                                                             + "'" + txtQ13_3_2.ClientID + "'" + ","
                                                                             + "'" + txtQ13_3_3.ClientID + "'" + ","
                                                                             + "'" + txtQ13_3_4.ClientID + "'" + ","
                                                                             + "'" + txtQ13_3_0.ClientID + "');");

        txtQ13_4_1.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ13_4_1.ClientID + "'" + ","
                                                                             + "'" + txtQ13_4_2.ClientID + "'" + ","
                                                                             + "'" + txtQ13_4_3.ClientID + "'" + ","
                                                                             + "'" + txtQ13_4_4.ClientID + "'" + ","
                                                                             + "'" + txtQ13_4_0.ClientID + "');");

        txtQ13_4_2.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ13_4_1.ClientID + "'" + ","
                                                                             + "'" + txtQ13_4_2.ClientID + "'" + ","
                                                                             + "'" + txtQ13_4_3.ClientID + "'" + ","
                                                                             + "'" + txtQ13_4_4.ClientID + "'" + ","
                                                                             + "'" + txtQ13_4_0.ClientID + "');");

        txtQ13_4_3.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ13_4_1.ClientID + "'" + ","
                                                                             + "'" + txtQ13_4_2.ClientID + "'" + ","
                                                                             + "'" + txtQ13_4_3.ClientID + "'" + ","
                                                                             + "'" + txtQ13_4_4.ClientID + "'" + ","
                                                                             + "'" + txtQ13_4_0.ClientID + "');");

        txtQ13_4_4.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ13_4_1.ClientID + "'" + ","
                                                                             + "'" + txtQ13_4_2.ClientID + "'" + ","
                                                                             + "'" + txtQ13_4_3.ClientID + "'" + ","
                                                                             + "'" + txtQ13_4_4.ClientID + "'" + ","
                                                                             + "'" + txtQ13_4_0.ClientID + "');");


        txtQ14_1_4.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "null" + ","
                                                                             + "null" + ","
                                                                             + "null" + ","
                                                                             + "'" + txtQ14_1_4.ClientID + "'" + ","
                                                                             + "'" + txtQ14_1_0.ClientID + "');");

        txtQ14_2_1.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ14_2_1.ClientID + "'" + ","
                                                                             + "'" + txtQ14_2_2.ClientID + "'" + ","
                                                                             + "'" + txtQ14_2_3.ClientID + "'" + ","
                                                                             + "null" + ","
                                                                             + "'" + txtQ14_2_0.ClientID + "');");

        txtQ14_2_2.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ14_2_1.ClientID + "'" + ","
                                                                             + "'" + txtQ14_2_2.ClientID + "'" + ","
                                                                             + "'" + txtQ14_2_3.ClientID + "'" + ","
                                                                             + "null" + ","
                                                                             + "'" + txtQ14_2_0.ClientID + "');");

        txtQ14_2_3.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ14_2_1.ClientID + "'" + ","
                                                                             + "'" + txtQ14_2_2.ClientID + "'" + ","
                                                                             + "'" + txtQ14_2_3.ClientID + "'" + ","
                                                                             + "null" + ","
                                                                             + "'" + txtQ14_2_0.ClientID + "');");

        txtQ14_3_1.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ14_3_1.ClientID + "'" + ","
                                                                             + "'" + txtQ14_3_2.ClientID + "'" + ","
                                                                             + "'" + txtQ14_3_3.ClientID + "'" + ","
                                                                             + "'" + txtQ14_3_4.ClientID + "'" + ","
                                                                             + "'" + txtQ14_3_0.ClientID + "');");

        txtQ14_3_2.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ14_3_1.ClientID + "'" + ","
                                                                             + "'" + txtQ14_3_2.ClientID + "'" + ","
                                                                             + "'" + txtQ14_3_3.ClientID + "'" + ","
                                                                             + "'" + txtQ14_3_4.ClientID + "'" + ","
                                                                             + "'" + txtQ14_3_0.ClientID + "');");

        txtQ14_3_3.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ14_3_1.ClientID + "'" + ","
                                                                             + "'" + txtQ14_3_2.ClientID + "'" + ","
                                                                             + "'" + txtQ14_3_3.ClientID + "'" + ","
                                                                             + "'" + txtQ14_3_4.ClientID + "'" + ","
                                                                             + "'" + txtQ14_3_0.ClientID + "');");

        txtQ14_3_4.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ14_3_1.ClientID + "'" + ","
                                                                             + "'" + txtQ14_3_2.ClientID + "'" + ","
                                                                             + "'" + txtQ14_3_3.ClientID + "'" + ","
                                                                             + "'" + txtQ14_3_4.ClientID + "'" + ","
                                                                             + "'" + txtQ14_3_0.ClientID + "');");

        txtQ14_4_1.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ14_4_1.ClientID + "'" + ","
                                                                             + "'" + txtQ14_4_2.ClientID + "'" + ","
                                                                             + "'" + txtQ14_4_3.ClientID + "'" + ","
                                                                             + "'" + txtQ14_4_4.ClientID + "'" + ","
                                                                             + "'" + txtQ14_4_0.ClientID + "');");

        txtQ14_4_2.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ14_4_1.ClientID + "'" + ","
                                                                             + "'" + txtQ14_4_2.ClientID + "'" + ","
                                                                             + "'" + txtQ14_4_3.ClientID + "'" + ","
                                                                             + "'" + txtQ14_4_4.ClientID + "'" + ","
                                                                             + "'" + txtQ14_4_0.ClientID + "');");

        txtQ14_4_3.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ14_4_1.ClientID + "'" + ","
                                                                             + "'" + txtQ14_4_2.ClientID + "'" + ","
                                                                             + "'" + txtQ14_4_3.ClientID + "'" + ","
                                                                             + "'" + txtQ14_4_4.ClientID + "'" + ","
                                                                             + "'" + txtQ14_4_0.ClientID + "');");

        txtQ14_4_4.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ14_4_1.ClientID + "'" + ","
                                                                             + "'" + txtQ14_4_2.ClientID + "'" + ","
                                                                             + "'" + txtQ14_4_3.ClientID + "'" + ","
                                                                             + "'" + txtQ14_4_4.ClientID + "'" + ","
                                                                             + "'" + txtQ14_4_0.ClientID + "');");

        //Question 15
        txtQ15_2_1.Attributes.Add("onchange", BuildQuestionTotalString2("15", "1", 5, "GetTotalChildren"));
        txtQ15_3_1.Attributes.Add("onchange", BuildQuestionTotalString2("15", "1", 5, "GetTotalChildren"));
        txtQ15_4_1.Attributes.Add("onchange", BuildQuestionTotalString2("15", "1", 5, "GetTotalChildren"));
        txtQ15_5_1.Attributes.Add("onchange", BuildQuestionTotalString2("15", "1", 5, "GetTotalChildren"));


        txtQ15_2_2.Attributes.Add("onchange", BuildQuestionTotalString2("15", "2", 5, "GetTotalChildren"));
        txtQ15_3_2.Attributes.Add("onchange", BuildQuestionTotalString2("15", "2", 5, "GetTotalChildren"));
        txtQ15_4_2.Attributes.Add("onchange", BuildQuestionTotalString2("15", "2", 5, "GetTotalChildren"));
        txtQ15_5_2.Attributes.Add("onchange", BuildQuestionTotalString2("15", "2", 5, "GetTotalChildren"));

        txtQ15_2_3.Attributes.Add("onchange", BuildQuestionTotalString2("15", "3", 5, "GetTotalChildren"));
        txtQ15_3_3.Attributes.Add("onchange", BuildQuestionTotalString2("15", "3", 5, "GetTotalChildren"));
        txtQ15_4_3.Attributes.Add("onchange", BuildQuestionTotalString2("15", "3", 5, "GetTotalChildren"));
        txtQ15_5_3.Attributes.Add("onchange", BuildQuestionTotalString2("15", "3", 5, "GetTotalChildren"));

        txtQ15_2_4.Attributes.Add("onchange", BuildQuestionTotalString2("15", "4", 5, "GetTotalChildren"));
        txtQ15_3_4.Attributes.Add("onchange", BuildQuestionTotalString2("15", "4", 5, "GetTotalChildren"));
        txtQ15_4_4.Attributes.Add("onchange", BuildQuestionTotalString2("15", "4", 5, "GetTotalChildren"));
        txtQ15_5_4.Attributes.Add("onchange", BuildQuestionTotalString2("15", "4", 5, "GetTotalChildren"));

        txtQ15_2_5.Attributes.Add("onchange", BuildQuestionTotalString2("15", "5", 5, "GetTotalChildren"));
        txtQ15_3_5.Attributes.Add("onchange", BuildQuestionTotalString2("15", "5", 5, "GetTotalChildren"));
        txtQ15_4_5.Attributes.Add("onchange", BuildQuestionTotalString2("15", "5", 5, "GetTotalChildren"));
        txtQ15_5_5.Attributes.Add("onchange", BuildQuestionTotalString2("15", "5", 5, "GetTotalChildren"));

        txtQ15_2_6.Attributes.Add("onchange", BuildQuestionTotalString2("15", "6", 5, "GetTotalChildren"));
        txtQ15_3_6.Attributes.Add("onchange", BuildQuestionTotalString2("15", "6", 5, "GetTotalChildren"));
        txtQ15_4_6.Attributes.Add("onchange", BuildQuestionTotalString2("15", "6", 5, "GetTotalChildren"));
        txtQ15_5_6.Attributes.Add("onchange", BuildQuestionTotalString2("15", "6", 5, "GetTotalChildren"));

        //Question 16
        txtQ16_2_1.Attributes.Add("onchange", BuildQuestionTotalString2("16", "1", 9, "GetTotalChildren2"));
        txtQ16_3_1.Attributes.Add("onchange", BuildQuestionTotalString2("16", "1", 9, "GetTotalChildren2"));
        txtQ16_4_1.Attributes.Add("onchange", BuildQuestionTotalString2("16", "1", 9, "GetTotalChildren2"));
        txtQ16_5_1.Attributes.Add("onchange", BuildQuestionTotalString2("16", "1", 9, "GetTotalChildren2"));
        txtQ16_6_1.Attributes.Add("onchange", BuildQuestionTotalString2("16", "1", 9, "GetTotalChildren2"));
        txtQ16_7_1.Attributes.Add("onchange", BuildQuestionTotalString2("16", "1", 9, "GetTotalChildren2"));
        txtQ16_8_1.Attributes.Add("onchange", BuildQuestionTotalString2("16", "1", 9, "GetTotalChildren2"));
        txtQ16_9_1.Attributes.Add("onchange", BuildQuestionTotalString2("16", "1", 9, "GetTotalChildren2"));

        txtQ16_2_2.Attributes.Add("onchange", BuildQuestionTotalString2("16", "2", 9, "GetTotalChildren2"));
        txtQ16_3_2.Attributes.Add("onchange", BuildQuestionTotalString2("16", "2", 9, "GetTotalChildren2"));
        txtQ16_4_2.Attributes.Add("onchange", BuildQuestionTotalString2("16", "2", 9, "GetTotalChildren2"));
        txtQ16_5_2.Attributes.Add("onchange", BuildQuestionTotalString2("16", "2", 9, "GetTotalChildren2"));
        txtQ16_6_2.Attributes.Add("onchange", BuildQuestionTotalString2("16", "2", 9, "GetTotalChildren2"));
        txtQ16_7_2.Attributes.Add("onchange", BuildQuestionTotalString2("16", "2", 9, "GetTotalChildren2"));
        txtQ16_8_2.Attributes.Add("onchange", BuildQuestionTotalString2("16", "2", 9, "GetTotalChildren2"));
        txtQ16_9_2.Attributes.Add("onchange", BuildQuestionTotalString2("16", "2", 9, "GetTotalChildren2"));

        txtQ16_2_3.Attributes.Add("onchange", BuildQuestionTotalString2("16", "3", 9, "GetTotalChildren2"));
        txtQ16_3_3.Attributes.Add("onchange", BuildQuestionTotalString2("16", "3", 9, "GetTotalChildren2"));
        txtQ16_4_3.Attributes.Add("onchange", BuildQuestionTotalString2("16", "3", 9, "GetTotalChildren2"));
        txtQ16_5_3.Attributes.Add("onchange", BuildQuestionTotalString2("16", "3", 9, "GetTotalChildren2"));
        txtQ16_6_3.Attributes.Add("onchange", BuildQuestionTotalString2("16", "3", 9, "GetTotalChildren2"));
        txtQ16_7_3.Attributes.Add("onchange", BuildQuestionTotalString2("16", "3", 9, "GetTotalChildren2"));
        txtQ16_8_3.Attributes.Add("onchange", BuildQuestionTotalString2("16", "3", 9, "GetTotalChildren2"));
        txtQ16_9_3.Attributes.Add("onchange", BuildQuestionTotalString2("16", "3", 9, "GetTotalChildren2"));

        //Question 17
        txtQ17_2_1.Attributes.Add("onchange", BuildQuestionTotalString2("17", "1", 9, "GetTotalChildren2"));
        txtQ17_3_1.Attributes.Add("onchange", BuildQuestionTotalString2("17", "1", 9, "GetTotalChildren2"));
        txtQ17_4_1.Attributes.Add("onchange", BuildQuestionTotalString2("17", "1", 9, "GetTotalChildren2"));
        txtQ17_5_1.Attributes.Add("onchange", BuildQuestionTotalString2("17", "1", 9, "GetTotalChildren2"));
        txtQ17_6_1.Attributes.Add("onchange", BuildQuestionTotalString2("17", "1", 9, "GetTotalChildren2"));
        txtQ17_7_1.Attributes.Add("onchange", BuildQuestionTotalString2("17", "1", 9, "GetTotalChildren2"));
        txtQ17_8_1.Attributes.Add("onchange", BuildQuestionTotalString2("17", "1", 9, "GetTotalChildren2"));
        txtQ17_9_1.Attributes.Add("onchange", BuildQuestionTotalString2("17", "1", 9, "GetTotalChildren2"));

        txtQ17_2_2.Attributes.Add("onchange", BuildQuestionTotalString2("17", "2", 9, "GetTotalChildren2"));
        txtQ17_3_2.Attributes.Add("onchange", BuildQuestionTotalString2("17", "2", 9, "GetTotalChildren2"));
        txtQ17_4_2.Attributes.Add("onchange", BuildQuestionTotalString2("17", "2", 9, "GetTotalChildren2"));
        txtQ17_5_2.Attributes.Add("onchange", BuildQuestionTotalString2("17", "2", 9, "GetTotalChildren2"));
        txtQ17_6_2.Attributes.Add("onchange", BuildQuestionTotalString2("17", "2", 9, "GetTotalChildren2"));
        txtQ17_7_2.Attributes.Add("onchange", BuildQuestionTotalString2("17", "2", 9, "GetTotalChildren2"));
        txtQ17_8_2.Attributes.Add("onchange", BuildQuestionTotalString2("17", "2", 9, "GetTotalChildren2"));
        txtQ17_9_2.Attributes.Add("onchange", BuildQuestionTotalString2("17", "2", 9, "GetTotalChildren2"));

        txtQ17_2_3.Attributes.Add("onchange", BuildQuestionTotalString2("17", "3", 9, "GetTotalChildren2"));
        txtQ17_3_3.Attributes.Add("onchange", BuildQuestionTotalString2("17", "3", 9, "GetTotalChildren2"));
        txtQ17_4_3.Attributes.Add("onchange", BuildQuestionTotalString2("17", "3", 9, "GetTotalChildren2"));
        txtQ17_5_3.Attributes.Add("onchange", BuildQuestionTotalString2("17", "3", 9, "GetTotalChildren2"));
        txtQ17_6_3.Attributes.Add("onchange", BuildQuestionTotalString2("17", "3", 9, "GetTotalChildren2"));
        txtQ17_7_3.Attributes.Add("onchange", BuildQuestionTotalString2("17", "3", 9, "GetTotalChildren2"));
        txtQ17_8_3.Attributes.Add("onchange", BuildQuestionTotalString2("17", "3", 9, "GetTotalChildren2"));
        txtQ17_9_3.Attributes.Add("onchange", BuildQuestionTotalString2("17", "3", 9, "GetTotalChildren2"));

        //Question 18
        txtQ18_2_1.Attributes.Add("onchange", BuildQuestionTotalString2("18", "1", 9, "GetTotalChildren2"));
        txtQ18_3_1.Attributes.Add("onchange", BuildQuestionTotalString2("18", "1", 9, "GetTotalChildren2"));
        txtQ18_4_1.Attributes.Add("onchange", BuildQuestionTotalString2("18", "1", 9, "GetTotalChildren2"));
        txtQ18_5_1.Attributes.Add("onchange", BuildQuestionTotalString2("18", "1", 9, "GetTotalChildren2"));
        txtQ18_6_1.Attributes.Add("onchange", BuildQuestionTotalString2("18", "1", 9, "GetTotalChildren2"));
        txtQ18_7_1.Attributes.Add("onchange", BuildQuestionTotalString2("18", "1", 9, "GetTotalChildren2"));
        txtQ18_8_1.Attributes.Add("onchange", BuildQuestionTotalString2("18", "1", 9, "GetTotalChildren2"));
        txtQ18_9_1.Attributes.Add("onchange", BuildQuestionTotalString2("18", "1", 9, "GetTotalChildren2"));

        txtQ18_2_2.Attributes.Add("onchange", BuildQuestionTotalString2("18", "2", 9, "GetTotalChildren2"));
        txtQ18_3_2.Attributes.Add("onchange", BuildQuestionTotalString2("18", "2", 9, "GetTotalChildren2"));
        txtQ18_4_2.Attributes.Add("onchange", BuildQuestionTotalString2("18", "2", 9, "GetTotalChildren2"));
        txtQ18_5_2.Attributes.Add("onchange", BuildQuestionTotalString2("18", "2", 9, "GetTotalChildren2"));
        txtQ18_6_2.Attributes.Add("onchange", BuildQuestionTotalString2("18", "2", 9, "GetTotalChildren2"));
        txtQ18_7_2.Attributes.Add("onchange", BuildQuestionTotalString2("18", "2", 9, "GetTotalChildren2"));
        txtQ18_8_2.Attributes.Add("onchange", BuildQuestionTotalString2("18", "2", 9, "GetTotalChildren2"));
        txtQ18_9_2.Attributes.Add("onchange", BuildQuestionTotalString2("18", "2", 9, "GetTotalChildren2"));

        txtQ18_2_3.Attributes.Add("onchange", BuildQuestionTotalString2("18", "3", 9, "GetTotalChildren2"));
        txtQ18_3_3.Attributes.Add("onchange", BuildQuestionTotalString2("18", "3", 9, "GetTotalChildren2"));
        txtQ18_4_3.Attributes.Add("onchange", BuildQuestionTotalString2("18", "3", 9, "GetTotalChildren2"));
        txtQ18_5_3.Attributes.Add("onchange", BuildQuestionTotalString2("18", "3", 9, "GetTotalChildren2"));
        txtQ18_6_3.Attributes.Add("onchange", BuildQuestionTotalString2("18", "3", 9, "GetTotalChildren2"));
        txtQ18_7_3.Attributes.Add("onchange", BuildQuestionTotalString2("18", "3", 9, "GetTotalChildren2"));
        txtQ18_8_3.Attributes.Add("onchange", BuildQuestionTotalString2("18", "3", 9, "GetTotalChildren2"));
        txtQ18_9_3.Attributes.Add("onchange", BuildQuestionTotalString2("18", "3", 9, "GetTotalChildren2"));

        //Question 19
        txtQ19_2_1.Attributes.Add("onchange", BuildQuestionTotalString2("19", "1", 9, "GetTotalChildren2"));
        txtQ19_3_1.Attributes.Add("onchange", BuildQuestionTotalString2("19", "1", 9, "GetTotalChildren2"));
        txtQ19_4_1.Attributes.Add("onchange", BuildQuestionTotalString2("19", "1", 9, "GetTotalChildren2"));
        txtQ19_5_1.Attributes.Add("onchange", BuildQuestionTotalString2("19", "1", 9, "GetTotalChildren2"));
        txtQ19_6_1.Attributes.Add("onchange", BuildQuestionTotalString2("19", "1", 9, "GetTotalChildren2"));
        txtQ19_7_1.Attributes.Add("onchange", BuildQuestionTotalString2("19", "1", 9, "GetTotalChildren2"));
        txtQ19_8_1.Attributes.Add("onchange", BuildQuestionTotalString2("19", "1", 9, "GetTotalChildren2"));
        txtQ19_9_1.Attributes.Add("onchange", BuildQuestionTotalString2("19", "1", 9, "GetTotalChildren2"));

        txtQ19_2_2.Attributes.Add("onchange", BuildQuestionTotalString2("19", "2", 9, "GetTotalChildren2"));
        txtQ19_3_2.Attributes.Add("onchange", BuildQuestionTotalString2("19", "2", 9, "GetTotalChildren2"));
        txtQ19_4_2.Attributes.Add("onchange", BuildQuestionTotalString2("19", "2", 9, "GetTotalChildren2"));
        txtQ19_5_2.Attributes.Add("onchange", BuildQuestionTotalString2("19", "2", 9, "GetTotalChildren2"));
        txtQ19_6_2.Attributes.Add("onchange", BuildQuestionTotalString2("19", "2", 9, "GetTotalChildren2"));
        txtQ19_7_2.Attributes.Add("onchange", BuildQuestionTotalString2("19", "2", 9, "GetTotalChildren2"));
        txtQ19_8_2.Attributes.Add("onchange", BuildQuestionTotalString2("19", "2", 9, "GetTotalChildren2"));
        txtQ19_9_2.Attributes.Add("onchange", BuildQuestionTotalString2("19", "2", 9, "GetTotalChildren2"));

        txtQ19_2_3.Attributes.Add("onchange", BuildQuestionTotalString2("19", "3", 9, "GetTotalChildren2"));
        txtQ19_3_3.Attributes.Add("onchange", BuildQuestionTotalString2("19", "3", 9, "GetTotalChildren2"));
        txtQ19_4_3.Attributes.Add("onchange", BuildQuestionTotalString2("19", "3", 9, "GetTotalChildren2"));
        txtQ19_5_3.Attributes.Add("onchange", BuildQuestionTotalString2("19", "3", 9, "GetTotalChildren2"));
        txtQ19_6_3.Attributes.Add("onchange", BuildQuestionTotalString2("19", "3", 9, "GetTotalChildren2"));
        txtQ19_7_3.Attributes.Add("onchange", BuildQuestionTotalString2("19", "3", 9, "GetTotalChildren2"));
        txtQ19_8_3.Attributes.Add("onchange", BuildQuestionTotalString2("19", "3", 9, "GetTotalChildren2"));
        txtQ19_9_3.Attributes.Add("onchange", BuildQuestionTotalString2("19", "3", 9, "GetTotalChildren2"));
    }

    private string BuildQuestionTotalString2(string questionId, string columnId, int numOfRows, string javascriptFunc)
    {
        StringBuilder temp = new StringBuilder();
        Control ContentPlaceHolder = Form.FindControl("ContentPlaceHolder1");
        string controlId = "";

        temp.Append("javascript:").Append(javascriptFunc).Append("(");

        for (int i=0; i<numOfRows - 1; i++)
        {
            controlId = "txtQ" + questionId.ToString() + "_" + (i + 2).ToString() + "_" + columnId.ToString();

            temp.Append("'").Append(ContentPlaceHolder.FindControl(controlId).ClientID).Append("'").Append(",");
        }

        controlId = "txtQ" + questionId.ToString() + "_1_" + columnId.ToString();

        temp.Append("'").Append(ContentPlaceHolder.FindControl(controlId).ClientID).Append("');");
        
        return temp.ToString();
    }

    private void LoadControls()
    {
        DataSet ds = dal.GetPreschoolSystemProviders(Convert.ToInt32(Session["GrantApplicantId"].ToString()), AppInfo.FiscalYear, AppInfo.FundCode);

        tblSysProviders.Visible = true;
        tblCenter.Visible = false;

        grdSysProviders.DataSource = ds.Tables[0];
        grdSysProviders.DataBind();

        tblCommands.Visible = false;
        tblFootNotes.Visible = false;

        btnAddNewProgram.Visible = true;
    }

    private void BindData(bool isAfterSaved)
    {
        SortedList<string, string> questions = dal.GetPreschoolProgramSurveyData(Int32.Parse(ViewState["SystemProviderId"].ToString()));

        if (questions.Count > 0)
        {
            Control ContentPlaceHolder = Form.FindControl("ContentPlaceHolder1");

            Control[] allControls = FlattenHierachy(Page);

            foreach (Control control in allControls)
            {
                string questionId = control.ID;

                if (questionId != null && questions.ContainsKey(questionId))
                {
                    string value = questions[questionId];

                    if (control is System.Web.UI.WebControls.TextBox)
                    {
                        TextBox txtBox = (TextBox)((WebControl)ContentPlaceHolder.FindControl(questionId));
                        txtBox.Text = value;
                    }
                    else if (control is System.Web.UI.WebControls.DropDownList)
                    {
                        DropDownList dropDown = (DropDownList)((WebControl)ContentPlaceHolder.FindControl(questionId));
                        dropDown.SelectedValue = value;
                    }
                    else if (control is System.Web.UI.WebControls.RadioButton)
                    {
                        RadioButton rdoButton = (RadioButton)((WebControl)ContentPlaceHolder.FindControl(questionId));
                        rdoButton.Checked = (value == "1") ? true : false;
                    }
                    else if (control is System.Web.UI.WebControls.RadioButtonList)
                    {
                        RadioButtonList rdoButton = (RadioButtonList)((WebControl)ContentPlaceHolder.FindControl(questionId));

                        if (rdoButton.Items.FindByValue(value) != null)
                        {
                            rdoButton.SelectedValue = value;
                        }
                    }
                }                
            }

            if (string.IsNullOrEmpty(rbtnIsAccredited.SelectedValue) || rbtnIsAccredited.SelectedValue == "0")
            {
                trAccr.Visible = false;
            }
            else
            {
                trAccr.Visible = true;
            }

            //get any errors
            if (hasValidationErrors(isAfterSaved))
            {
                tblFailed.Visible = true;
            }
            else
            {
                tblFailed.Visible = false;
            }

            if (tblFailed.Visible)
            {
                tblSuccess.Visible = false;
            }
            else
            {
                tblSuccess.Visible = (isAfterSaved) ? true : false;
            }

            if (isAfterSaved)
            {
                if (tblFailed.Visible)
                {
                    lnkBackToHomeError.Visible = true;
                }
            }
            else
            {
                lnkBackToHomeError.Visible = false;
            }
        }
        else
        {
            tblFailed.Visible = false;
            tblSuccess.Visible = false;
        }

        tblCommands.Visible = true;
        tblFootNotes.Visible = true;
    }

    private bool hasValidationErrors(bool isAfterSaved)
    {
        int errorCount = 0;

        setDefaultStyle();

        lstErrors.Items.Clear();

        List<string> lstErrorBoxes = new List<string>();

        if (!isValidPreschoolProgramInformationQuestion10_FY2017(lstErrorBoxes))
        {
            lstErrors.Items.Add("The number of sessions reported in Questions 8 and 10 must be the same, please revise your response.");
            errorCount++;
        }

        if (!isValidPreschoolProgramInformationQuestion11_FY2017(lstErrorBoxes))
        {
            lstErrors.Items.Add("The sum of the enrollment capacity for children without disabilities (11a) and the enrollment capacity for children with disabilities (11b) must equal the total enrollment capacity reported in Question 11, please revise your response.");
            errorCount++;
        }

        if (!isValidPreschoolProgramInformationQuestion12_FY2017(lstErrorBoxes))
        {
            lstErrors.Items.Add("The number of children reported in Question 11 must equal the total number of children reported in Question 12. Please revise your response.");
            errorCount++;
        }

        if (!isValidPreschoolProgramInformationQuestion12_1_FY2017(lstErrorBoxes))
        {
            lstErrors.Items.Add("The number of children enrolled on October 1, 2016 must be the same number of children in for questions 12 or 15, please revise accordingly.");
            errorCount++;
        }

        if (!isValidPreschoolProgramInformationQuestion13_FY2017(lstErrorBoxes))
        {
            lstErrors.Items.Add("The number of children enrolled on December 1, 2016 must be the same number of children in for questions 13 or 15, please revise accordingly.");
            errorCount++;
        }

        if (!isValidPreschoolProgramInformationQuestion14_FY2017(lstErrorBoxes))
        {
            lstErrors.Items.Add("The number of children enrolled on June 1, 2017 must be the same number of children for questions 14 or 15, please revise accordingly.");
            errorCount++;
        }





        if (!isValidPreschoolProgramInformationQuestion16_1_FY2017(lstErrorBoxes))
        {
            lstErrors.Items.Add("For each date specified, the number of 3 year olds reported in Question 15b (children with IEPs + Children without IEPs) must equal the total number of 3 year olds reported in Question 16. Please revise your response.");
            errorCount++;
        }
        else if (!isValidPreschoolProgramInformationQuestion16_1_FY2017(lstErrorBoxes))
        {
            lstErrors.Items.Add("For each date specified, the number of 3 year olds reported in Question 15b (children with IEPs + Children without IEPs) must equal the total number of 3 year olds reported in Question 16. Please revise your response.");
            errorCount++;
        }
        else if (!isValidPreschoolProgramInformationQuestion16_1_FY2017(lstErrorBoxes))
        {
            lstErrors.Items.Add("For each date specified, the number of 3 year olds reported in Question 15b (children with IEPs + Children without IEPs) must equal the total number of 3 year olds reported in Question 16. Please revise your response.");
            errorCount++;
        }


        if (!isValidPreschoolProgramInformationQuestion17_1_FY2017(lstErrorBoxes))
        {
            lstErrors.Items.Add("For each date specified, the number of 4 year olds reported in Question 15c (children with IEPs + Children without IEPs) must equal the total number of 4 year olds reported in Question 17. Please revise your response.");
            errorCount++;
        }
        else if (!isValidPreschoolProgramInformationQuestion17_1_FY2017(lstErrorBoxes))
        {
            lstErrors.Items.Add("For each date specified, the number of 4 year olds reported in Question 15c (children with IEPs + Children without IEPs) must equal the total number of 4 year olds reported in Question 17. Please revise your response.");
            errorCount++;
        }
        else if (!isValidPreschoolProgramInformationQuestion17_1_FY2017(lstErrorBoxes))
        {
            lstErrors.Items.Add("For each date specified, the number of 4 year olds reported in Question 15c (children with IEPs + Children without IEPs) must equal the total number of 4 year olds reported in Question 17. Please revise your response.");
            errorCount++;
        }



        if (!isValidPreschoolProgramInformationQuestion18_1_FY2017(lstErrorBoxes))
        {
            lstErrors.Items.Add("For each date specified, the number of 5 year olds reported in Question 15d (children with IEPs + Children without IEPs) must equal the total number of 5 year olds reported in Question 18. Please revise your response.");
            errorCount++;
        }
        else if (!isValidPreschoolProgramInformationQuestion18_1_FY2017(lstErrorBoxes))
        {
            lstErrors.Items.Add("For each date specified, the number of 5 year olds reported in Question 15d (children with IEPs + Children without IEPs) must equal the total number of 5 year olds reported in Question 18. Please revise your response.");
            errorCount++;
        }
        else if (!isValidPreschoolProgramInformationQuestion18_1_FY2017(lstErrorBoxes))
        {
            lstErrors.Items.Add("For each date specified, the number of 5 year olds reported in Question 15d (children with IEPs + Children without IEPs) must equal the total number of 5 year olds reported in Question 18. Please revise your response.");
            errorCount++;
        }


        if (!isValidPreschoolProgramInformationQuestion19_1_FY2017(lstErrorBoxes))
        {
            lstErrors.Items.Add("For each date specified, the number of children under 3 years olds reported in Questions 15e (children with IEPs + Children without IEPs) must equal the total number of children under 3 years olds reported in Question 19. Please revise your response.");
            errorCount++;
        }
        else if (!isValidPreschoolProgramInformationQuestion19_1_FY2017(lstErrorBoxes))
        {
            lstErrors.Items.Add("For each date specified, the number of children under 3 years olds reported in Questions 15e (children with IEPs + Children without IEPs) must equal the total number of children under 3 years olds reported in Question 19. Please revise your response.");
            errorCount++;
        }
        else if (!isValidPreschoolProgramInformationQuestion19_1_FY2017(lstErrorBoxes))
        {
            lstErrors.Items.Add("For each date specified, the number of children under 3 years olds reported in Questions 15e (children with IEPs + Children without IEPs) must equal the total number of children under 3 years olds reported in Question 19. Please revise your response.");
            errorCount++;
        }

        //if (!GlobalFunc.isValidPreschoolProgramInformationRequiredFields(lstErrorBoxes, ds))
        //{
        //    lstErrors.Items.Add("Please enter all the required fields");
        //    errorCount++;
        //}
        //else
        //{
        //   if (!GlobalFunc.isValidPreschoolProgramInformationData10(lstErrorBoxes, ds))
        //    {
        //        lstErrors.Items.Add("The sum of all IPLE sessions reported in Question 10 must be equal to the total number of IPLE sessions reported in Question 8, please revise your response.");
        //        errorCount++;
        //    }

        //    if (!GlobalFunc.isValidPreschoolProgramInformationData12(lstErrorBoxes, ds))
        //    {
        //        lstErrors.Items.Add("The sum of your responses to Question 13 and Question 14 must be equal to the 'anticipated Total enrollment capacity' reported in Question 12, please revise.");
        //        errorCount++;
        //    }

        //    if (!GlobalFunc.isValidPreschoolProgramInformationData16(lstErrorBoxes, ds))
        //    {
        //        lstErrors.Items.Add("Please revise your response, as the sum of the number of children does not equal the total number of children in 16a.");
        //        errorCount++;
        //    }

        //    if (!GlobalFunc.isValidPreschoolProgramInformationData17(lstErrorBoxes, ds))
        //    {
        //        lstErrors.Items.Add("Please revise your response, as the sum of the number of children does not equal the total number of children in 17a.");
        //        errorCount++;
        //    }

        //    if (!string.IsNullOrEmpty(ds.Tables[0].Rows[0]["NumberOfWeeksSessions"].ToString()) &&
        //        Int32.Parse(ds.Tables[0].Rows[0]["NumberOfWeeksSessions"].ToString()) > 52)
        //    {
        //        lstErrorBoxes.Add("txtNumberOfWeeksSessions");
        //        lstErrors.Items.Add("Please revise your response to Question 9.  This number must be for 52 weeks or less.");
        //        errorCount++;
        //    }
        //}

        if (lstErrorBoxes.Count > 0)
        {
            displayErrorHighlight(lstErrorBoxes);
        }

        dal.UpdatePreschoolProgramInformationErrorCount(Int32.Parse(ViewState["SystemProviderId"].ToString()), errorCount);

        return lstErrorBoxes.Count > 0;
    }

    private void setDefaultStyle()
    {
        txtQ8.CssClass = "styleUnHighlight";
        txtQ10_1_0.CssClass = "styleUnHighlight";
        txtQ10_2_0.CssClass = "styleUnHighlight";
        txtQ10_3_0.CssClass = "styleUnHighlight";
        txtQ10_4_0.CssClass = "styleUnHighlight";
        txtQ11_1.CssClass = "styleUnHighlight";
        txtQ11_2.CssClass = "styleUnHighlight";
        txtQ11_3.CssClass = "styleUnHighlight";
        txtQ11_1.CssClass = "styleUnHighlight";
        txtQ12_1_0.CssClass = "styleUnHighlight";
        txtQ12_2_0.CssClass = "styleUnHighlight";
        txtQ12_3_0.CssClass = "styleUnHighlight";
        txtQ12_4_0.CssClass = "styleUnHighlight";

        txtQ13_1_0.CssClass = "styleUnHighlight";
        txtQ13_2_0.CssClass = "styleUnHighlight";
        txtQ13_3_0.CssClass = "styleUnHighlight";
        txtQ13_4_0.CssClass = "styleUnHighlight";
        txtQ15_1_1.CssClass = "styleUnHighlight";
        txtQ15_1_2.CssClass = "styleUnHighlight";
        txtQ15_1_3.CssClass = "styleUnHighlight";
        txtQ15_1_4.CssClass = "styleUnHighlight";
        txtQ14_1_0.CssClass = "styleUnHighlight";
        txtQ14_2_0.CssClass = "styleUnHighlight";
        txtQ14_3_0.CssClass = "styleUnHighlight";
        txtQ14_4_0.CssClass = "styleUnHighlight";
        txtQ15_1_5.CssClass = "styleUnHighlight";
        txtQ15_1_6.CssClass = "styleUnHighlight";
        txtQ16_1_1.CssClass = "styleUnHighlight";
        txtQ15_2_1.CssClass = "styleUnHighlight";
        txtQ15_2_2.CssClass = "styleUnHighlight";
        txtQ16_1_2.CssClass = "styleUnHighlight";
        txtQ15_2_3.CssClass = "styleUnHighlight";
        txtQ15_2_4.CssClass = "styleUnHighlight";
        txtQ16_1_3.CssClass = "styleUnHighlight";
        txtQ15_2_5.CssClass = "styleUnHighlight";
        txtQ15_2_6.CssClass = "styleUnHighlight";
        txtQ17_1_1.CssClass = "styleUnHighlight";
        txtQ15_3_1.CssClass = "styleUnHighlight";
        txtQ15_3_2.CssClass = "styleUnHighlight";
        txtQ17_1_2.CssClass = "styleUnHighlight";
        txtQ15_3_3.CssClass = "styleUnHighlight";
        txtQ15_3_4.CssClass = "styleUnHighlight";
        txtQ17_1_3.CssClass = "styleUnHighlight";
        txtQ15_3_5.CssClass = "styleUnHighlight";
        txtQ15_3_6.CssClass = "styleUnHighlight";
        txtQ18_1_1.CssClass = "styleUnHighlight";
        txtQ15_4_1.CssClass = "styleUnHighlight";
        txtQ15_4_2.CssClass = "styleUnHighlight";
        txtQ18_1_2.CssClass = "styleUnHighlight";
        txtQ15_4_3.CssClass = "styleUnHighlight";
        txtQ15_4_4.CssClass = "styleUnHighlight";
        txtQ18_1_3.CssClass = "styleUnHighlight";
        txtQ15_4_5.CssClass = "styleUnHighlight";
        txtQ15_4_6.CssClass = "styleUnHighlight";

        txtQ19_1_1.CssClass = "styleUnHighlight";

        txtQ15_5_1.CssClass = "styleUnHighlight";
        txtQ15_5_2.CssClass = "styleUnHighlight";
        txtQ19_1_2.CssClass = "styleUnHighlight";

        txtQ15_5_3.CssClass = "styleUnHighlight";
        txtQ15_5_4.CssClass = "styleUnHighlight";
        txtQ19_1_3.CssClass = "styleUnHighlight";

        txtQ15_5_5.CssClass = "styleUnHighlight";
        txtQ15_5_6.CssClass = "styleUnHighlight";

        ////////rbtnIsHeadStartProgram.CssClass = "styleUnHighlight";
        ////////rbtnIsAccredited.CssClass = "styleUnHighlight";
        ////////ddlAccreditation.CssClass = "styleUnHighlight";
        ////////txtAccreditationNumber.CssClass = "styleUnHighlight";
        ////////txtAccreditationExpDate.CssClass = "styleUnHighlight";
        ////////txtAccreditationEarnDate.CssClass = "styleUnHighlight";
        ////////rbtnIsProgramLicensed.CssClass = "styleUnHighlight";
        ////////txtEECProgramNumber.CssClass = "styleUnHighlight";
        ////////rdoQRISLevel.CssClass = "styleUnHighlight";
        ////////txtAddress.CssClass = "styleUnHighlight";
        ////////txtCity.CssClass = "styleUnHighlight";
        ////////txtZipCode.CssClass = "styleUnHighlight";
        ////////txtFirstName.CssClass = "styleUnHighlight";
        ////////txtLastName.CssClass = "styleUnHighlight";
        ////////txtJobTitle.CssClass = "styleUnHighlight";
        ////////txtPhoneNumber.CssClass = "styleUnHighlight";
        ////////txtEmail.CssClass = "styleUnHighlight";
        ////////txtQ8.CssClass = "styleUnHighlight";
        ////////txtQ9.CssClass = "styleUnHighlight";
        ////////txtQ10_1_1.CssClass = "styleUnHighlight";
        ////////txtQ10_1_2.CssClass = "styleUnHighlight";
        ////////txtQ10_1_3.CssClass = "styleUnHighlight";
        ////////txtQ10_1_4.CssClass = "styleUnHighlight";
        ////////txtQ10_1_4.CssClass = "styleUnHighlight";
        ////////txtQ10_2_1.CssClass = "styleUnHighlight";
        ////////txtQ10_2_1.CssClass = "styleUnHighlight";
        ////////txtQ10_2_2.CssClass = "styleUnHighlight";
        ////////txtQ10_2_3.CssClass = "styleUnHighlight";
        ////////txtQ10_2_5.CssClass = "styleUnHighlight";
        ////////txtQ10_3_1.CssClass = "styleUnHighlight";
        ////////txtQ10_3_1.CssClass = "styleUnHighlight";
        ////////txtQ10_3_2.CssClass = "styleUnHighlight";
        ////////txtQ10_3_3.CssClass = "styleUnHighlight";
        ////////txtQ10_3_4.CssClass = "styleUnHighlight";
        ////////txtLowestClassSize.CssClass = "styleUnHighlight";
        ////////txtHighestClassSize.CssClass = "styleUnHighlight";
        ////////txtAverageClassSize.CssClass = "styleUnHighlight";
        ////////txtQ11_1.CssClass = "styleUnHighlight";
        ////////txtTotalIEPPreschoolChildren.CssClass = "styleUnHighlight";
        ////////txtTotalNoIEPPreschoolChildren.CssClass = "styleUnHighlight";
        ////////rdoLASID.CssClass = "styleUnHighlight";
        ////////txtQ15_1_1.CssClass = "styleUnHighlight";
        ////////txtQ15_1_2.CssClass = "styleUnHighlight";
        ////////txtQ15_1_3.CssClass = "styleUnHighlight";
        ////////txtQ15_1_4.CssClass = "styleUnHighlight";
        ////////txtQ15_1_5.CssClass = "styleUnHighlight";
        ////////txtQ15_1_6.CssClass = "styleUnHighlight";
        ////////txtQ15_2_1.CssClass = "styleUnHighlight";
        ////////txtQ15_2_2.CssClass = "styleUnHighlight";
        ////////txtQ15_2_3.CssClass = "styleUnHighlight";
        ////////txtQ15_2_4.CssClass = "styleUnHighlight";
        ////////txtQ15_2_5.CssClass = "styleUnHighlight";
        ////////txtQ15_2_6.CssClass = "styleUnHighlight";
        ////////txtQ15_3_1.CssClass = "styleUnHighlight";
        ////////txtQ15_3_2.CssClass = "styleUnHighlight";
        ////////txtQ15_3_3.CssClass = "styleUnHighlight";
        ////////txtQ15_3_4.CssClass = "styleUnHighlight";
        ////////txtQ15_3_5.CssClass = "styleUnHighlight";
        ////////txtQ15_3_6.CssClass = "styleUnHighlight";

        ////////txtQ15_4_1.CssClass = "styleUnHighlight";
        ////////txtQ15_4_2.CssClass = "styleUnHighlight";
        ////////txtQ15_4_3.CssClass = "styleUnHighlight";
        ////////txtQ15_4_4.CssClass = "styleUnHighlight";
        ////////txtQ15_4_5.CssClass = "styleUnHighlight";
        ////////txtQ15_4_6.CssClass = "styleUnHighlight";

        ////////txtQ15_5_1.CssClass = "styleUnHighlight";
        ////////txtQ15_5_2.CssClass = "styleUnHighlight";
        ////////txtQ15_5_3.CssClass = "styleUnHighlight";
        ////////txtQ15_5_4.CssClass = "styleUnHighlight";
        ////////txtQ15_5_5.CssClass = "styleUnHighlight";
        ////////txtQ15_5_6.CssClass = "styleUnHighlight";

        ////////txtQ16_1_1.CssClass = "styleUnHighlight";
        ////////txtQ16_1_2.CssClass = "styleUnHighlight";
        ////////txtQ16_1_3.CssClass = "styleUnHighlight";
        ////////txtQ16_2_1.CssClass = "styleUnHighlight";
        ////////txtQ17_2_2.CssClass = "styleUnHighlight";
        ////////txtQ17_2_3.CssClass = "styleUnHighlight";
        ////////txtQ17_3_1.CssClass = "styleUnHighlight";
        ////////txtQ17_3_2.CssClass = "styleUnHighlight";
        ////////txtQ17_3_3.CssClass = "styleUnHighlight";
        ////////txtQ17_4_1.CssClass = "styleUnHighlight";
        ////////txtQ17_4_2.CssClass = "styleUnHighlight";
        ////////txtQ17_4_3.CssClass = "styleUnHighlight";
        ////////txtQ17_5_1.CssClass = "styleUnHighlight";
        ////////txtQ17_5_2.CssClass = "styleUnHighlight";
        ////////txtQ17_5_3.CssClass = "styleUnHighlight";
        ////////txtQ17_6_1.CssClass = "styleUnHighlight";
        ////////txtQ17_6_2.CssClass = "styleUnHighlight";
        ////////txtQ17_6_3.CssClass = "styleUnHighlight";
        ////////txtQ17_7_1.CssClass = "styleUnHighlight";
        ////////txtQ17_7_2.CssClass = "styleUnHighlight";
        ////////txtQ17_7_3.CssClass = "styleUnHighlight";
        ////////txtQ17_8_1.CssClass = "styleUnHighlight";
        ////////txtQ17_8_2.CssClass = "styleUnHighlight";
        ////////txtQ17_8_3.CssClass = "styleUnHighlight";
        ////////txtQ18_1_1.CssClass = "styleUnHighlight";
        ////////txtQ18_1_2.CssClass = "styleUnHighlight";
        ////////txtQ18_1_3.CssClass = "styleUnHighlight";
        ////////txtQ18_2_1.CssClass = "styleUnHighlight";
        ////////txtQ18_2_2.CssClass = "styleUnHighlight";
        ////////txtQ18_2_3.CssClass = "styleUnHighlight";
        ////////txtQ18_3_1.CssClass = "styleUnHighlight";
        ////////txtQ18_3_2.CssClass = "styleUnHighlight";
        ////////txtQ18_3_3.CssClass = "styleUnHighlight";
        ////////txtQ18_4_1.CssClass = "styleUnHighlight";
        ////////txtQ18_4_2.CssClass = "styleUnHighlight";
        ////////txtQ18_4_3.CssClass = "styleUnHighlight";
    }

    /*
    private string GetSystemProviders()
    {
        StringBuilder xmlString = new StringBuilder();
        xmlString.Append("<root>");

        foreach (GridViewRow gr in grdSysProviders.Rows)
        {
            if (((CheckBox)gr.FindControl("chkIsLinked")).Checked)
                xmlString.Append(String.Format("<Program><ProgramId>{0}</ProgramId><IsAccredited>{1}</IsAccredited><AccreditationTypeId>{2}</AccreditationTypeId><AccreditationNumber>{3}</AccreditationNumber><AccreditationExpirationDate>{4}</AccreditationExpirationDate><IsHeadstart>{5}</IsHeadstart></Program>", grdSysProviders.DataKeys[gr.RowIndex].Value, ((RadioButtonList)gr.FindControl("rbtnIsAccredited")).SelectedValue, ((DropDownList)gr.FindControl("ddlAccreditation")).SelectedValue, ((TextBox)gr.FindControl("txtAccreditationNumber")).Text.Trim(), ((TextBox)gr.FindControl("txtAccreditationExpirationDate")).Text.Trim(), ((RadioButtonList)gr.FindControl("rbtnIsHeadstart")).SelectedValue));
        }

        xmlString.Append("</root>");

        return xmlString.ToString();
    }
    */

    //protected void rbtnIsAccredited_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    ddlAccreditation.Enabled = true;
    //    ddlAccreditation.Items.Clear();
    //    ddlAccreditation.Items.Add(new ListItem("---------", "0"));
    //    ddlAccreditation.Items.Add(new ListItem("NAEYC", "1"));
    //    ddlAccreditation.Items.Add(new ListItem("NEASC", "2"));

    //    ddlAccreditation.SelectedIndex = 0;

    //    //LoadAccreditationDetailsControls();
    //}

    protected void grdSysProviders_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow || e.Row.RowType == DataControlRowType.Footer)
        {
            DataRowView dr = (DataRowView)e.Row.DataItem;

            //((CheckBox)e.Row.FindControl("chkIsLinked")).Checked = Convert.ToBoolean(dr["IsLinked"].ToString());
            //RadioButtonList rbtHS = (RadioButtonList)e.Row.FindControl("rbtnIsHeadstart");
            //RadioButtonList rbt = ((RadioButtonList)e.Row.FindControl("rbtnIsAccredited"));


            //if (!String.IsNullOrEmpty(dr["IsHeadstartProgram"].ToString()))
            //    if (Convert.ToBoolean(dr["IsHeadstartProgram"].ToString()))
            //        rbtHS.Items.FindByValue("1").Selected = true;
            //    else
            //        rbtHS.Items.FindByValue("0").Selected = true;

            //rbt.SelectedIndex = rbt.Items.IndexOf(rbt.Items.FindByValue(dr["IsAccredited"].ToString()));

            //DropDownList ddl = (DropDownList)e.Row.FindControl("ddlAccreditation");
            //ddl.DataSource = dal.GetAccreditationTypes();
            //ddl.DataTextField = "AccreditationName";
            //ddl.DataValueField = "AccreditationTypeId";
            //ddl.DataBind();
            //ddl.Items.Insert(0, new ListItem("--Select One--", "0"));

            //ddl.SelectedIndex = ddl.Items.IndexOf(ddl.Items.FindByValue(dr["AccreditationTypeId"].ToString()));

            //((TextBox)e.Row.FindControl("txtAccreditationNumber")).Text = dr["AccreditationNumber"].ToString();
            //((TextBox)e.Row.FindControl("txtAccreditationExpirationDate")).Text = dr["AccreditationExpirationDate"].ToString();

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Cells[e.Row.Cells.Count - 2].Attributes.Add("onclick", "javascript:return confirm('Are you sure you want to delete this site? All information pertaining to this site will be removed from the site survey, and the site will not be eligible FY 2016 IPLE funds.');");

                ((LinkButton)e.Row.Cells[e.Row.Cells.Count - 1].Controls[0]).CommandArgument = dr["SystemProviderId"].ToString();

                TotalProgramCount++;
                TotalIPLESessions += Int32.Parse(e.Row.Cells[4].Text);
                TotalIPLEEnrollments += Int32.Parse(e.Row.Cells[6].Text);
                TotalChildWithIEP += Int32.Parse(e.Row.Cells[7].Text);
                TotalChildWithNoIEP += Int32.Parse(e.Row.Cells[8].Text);

                //if (e.Row.Cells[3].Text == "0")
                //    e.Row.Cells[3].Text = "No QRIS Rating Granted";
                //else if (e.Row.Cells[3].Text == "1")
                //    e.Row.Cells[3].Text = "QRIS Rating Granted: EEC Review Completed";
                //else if (e.Row.Cells[3].Text == "2")
                //    e.Row.Cells[3].Text = "QRIS Rating Granted: EEC Review In Progress";
                //else if (e.Row.Cells[3].Text == "3")
                //    e.Row.Cells[3].Text = "QRIS Rating Granted: Level 1";
                //else if (e.Row.Cells[3].Text == "4")
                //    e.Row.Cells[3].Text = "QRIS Rating Granted: Level 2";
                //else if (e.Row.Cells[3].Text == "5")
                //    e.Row.Cells[3].Text = "QRIS Rating Granted: Level 3";
                //else if (e.Row.Cells[3].Text == "6")
                //    e.Row.Cells[3].Text = "QRIS Rating Granted: Level 4";
                e.Row.Cells[3].Text = dr["QRISDescription"].ToString();

            }
            else if (e.Row.RowType == DataControlRowType.Footer)
            {
                e.Row.Cells[0].Text = "Total";
                e.Row.Cells[1].Text = TotalProgramCount.ToString();
                e.Row.Cells[4].Text = TotalIPLESessions.ToString();
                e.Row.Cells[6].Text = TotalIPLEEnrollments.ToString();
                e.Row.Cells[7].Text = TotalChildWithIEP.ToString();
                e.Row.Cells[8].Text = TotalChildWithNoIEP.ToString();
            }
        }
    }
    /*
    protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
    {
        CustomValidator1.ErrorMessage = "";

        if (tblSysProviders.Visible)
        {
            int count = 0;
            RadioButtonList rbtn, rbtnHS;
            DropDownList ddl;
            CheckBox chk;
            TextBox txtNumber, txtDate;

            foreach (GridViewRow gr in grdSysProviders.Rows)
            {
                //chk = (CheckBox)gr.FindControl("chkIsLinked");
                rbtn = (RadioButtonList)gr.FindControl("rbtnIsAccredited");
                //rbtnHS = (RadioButtonList)gr.FindControl("rbtnIsHeadstart");
                ddl = (DropDownList)gr.FindControl("ddlAccreditation");
                txtNumber = (TextBox)gr.FindControl("txtAccreditationNumber");
                txtDate = (TextBox)gr.FindControl("txtAccreditationExpirationDate");

                //if (chk.Checked)
                //{
                //    count++;

                //    if (rbtn.SelectedIndex == -1 || rbtnHS.SelectedIndex == -1)
                //    {
                //        args.IsValid = false;
                //        CustomValidator1.ErrorMessage += "Please provide the accreditation/Head start information for the selected providers.<br>";
                //        break;
                //    }
                //    else if (rbtn.SelectedValue == "1" && ddl.SelectedValue != "4")
                //    {
                //        if (txtNumber.Text.Trim() == "" || txtDate.Text.Trim() == "")
                //        {
                //            args.IsValid = false;
                //            CustomValidator1.ErrorMessage += "Please provide the accreditation information for the selected providers.<br>";
                //            break;
                //        }
                //    }
                //}
            }


            if (count == 0)
            {
                args.IsValid = false;
                CustomValidator1.ErrorMessage += "Please identify the providers linked to your system by checking the box next to each program.<br>";
            }
        }
    }

    protected void CustomValidator2_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (tblCenter.Visible)
        {
            if (rbtnIsHeadStartProgram.SelectedIndex == -1)
            {
                args.IsValid = false;
            }
        }
    }

    protected void CustomValidator3_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (tblCenter.Visible)
        {
            if (rbtnIsAccredited.SelectedIndex == -1)
            {
                args.IsValid = false;
            }

        }
    }

    protected void CustomValidator4_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (tblCenter.Visible)
        {
            if (rbtnIsProgramLicensed.SelectedIndex == -1)
            {
                args.IsValid = false;
            }
        }
    }
    */
    protected void CustomValidator5_ServerValidate(object source, ServerValidateEventArgs args)
    {
        /*
        if (tblCenter.Visible)
        {
            if (rbtnIsAccredited.Items.FindByValue("1").Selected &&
                (ddlAccreditation.Items.FindByValue("0").Selected ||
                 txtAccreditationNumber.Text.Trim() == "" ||
                 txtAccreditationExpDate.Text.Trim() == ""))
            {
                args.IsValid = false;
            }
        }
         */
    }
/*
    protected void CustomValidator6_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (tblCenter.Visible)
        {
            if (rdoQRISLevel.SelectedIndex == -1)
            {
                args.IsValid = false;
            }
        }
    }
*/
    protected void btnBackToHome_Click(object sender, EventArgs e)
    {
        Response.Redirect("PreschoolProgramInformation.aspx");
    }

    public static Control[] FlattenHierachy(Control root)
    {
        List<Control> list = new List<Control>();
        list.Add(root);
        if (root.HasControls())
        {
            foreach (Control control in root.Controls)
            {
                list.AddRange(FlattenHierachy(control));
            }
        }
        return list.ToArray();
    }

    protected void btnSaveHome_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            int SystemProviderId = ViewState["SystemProviderId"] == null ? 0 : Int32.Parse(ViewState["SystemProviderId"].ToString());

            if (SystemProviderId == 0)
            {
                SystemProviderId = dal.GetNewSystemProviderId(Convert.ToInt32(Session["GrantApplicantId"].ToString()), AppInfo.FiscalYear, AppInfo.FundCode);

                if (SystemProviderId > 0)
                {
                    ViewState["SystemProviderId"] = SystemProviderId;
                }
            }

            Control[] allControls = FlattenHierachy(Page);

            foreach (Control control in allControls)
            {
                string id = control.ID;
                string value = "";

                if ((control is System.Web.UI.WebControls.TextBox) ||
                    (control is System.Web.UI.WebControls.DropDownList) ||
                    (control is System.Web.UI.WebControls.RadioButton) ||
                    (control is System.Web.UI.WebControls.RadioButtonList) ||
                    (control is System.Web.UI.WebControls.HiddenField))
                {
                    if (control is System.Web.UI.WebControls.TextBox)
                    {
                        value = (control as TextBox).Text;
                    }
                    else if (control is System.Web.UI.WebControls.HiddenField)
                    {
                        value = (control as HiddenField).Value;
                    }
                    else if (control is System.Web.UI.WebControls.DropDownList)
                    {
                        value = (control as DropDownList).SelectedValue;
                    }
                    else if (control is System.Web.UI.WebControls.RadioButton)
                    {
                        value = ((control as RadioButton).Checked) ? "1" : "0";
                    }
                    else if (control is System.Web.UI.WebControls.RadioButtonList)
                    {
                        value = (control as RadioButtonList).SelectedValue;
                    }

                    dal.SavePreschoolProgramSurveyData(SystemProviderId, id, value, Convert.ToInt32(Session["GrantApplicantId"].ToString()));
                }


            }

            //loadAgencyInfo(Convert.ToInt32(Session["GrantApplicantId"].ToString()));

            BindData(true);

        }
        ////////else
        ////////{
        ////////    //tblErrorMessage.Visible = true;
        ////////}

            //for (int i = 0; i < ContentPlaceHolder.Controls.Count; i++)
            //{
            //    string s = ContentPlaceHolder.Controls[i].ClientID;
            //    string value;

            //    foreach (Control c in Page.Controls)
            //    {
            //        foreach (Control childc in c.Controls)
            //        {
            //            if (childc is TextBox)
            //            {
            //                value = ((TextBox)((WebControl)ContentPlaceHolder.Controls[i])).Text;
            //            }
            //        }
            //    }

                //TextBox t = (TextBox)((WebControl)ContentPlaceHolder.FindControl("txtProgramName"));
                
                //if (ContentPlaceHolder.Controls[i] is System.Web.UI.WebControls.TextBox)
                //{
                //    value = ((TextBox)((WebControl)ContentPlaceHolder.Controls[i])).Text;
                //}
                //dal.SavePreschoolProgramSurveyData(Int32.Parse(Session["GrantApplicantId"].ToString()), AppInfo.FiscalYear, AppInfo.FundCode,
                //                    s, ((WebControl)ContentPlaceHolder.Controls[i]
            //}
            
            //for (int i = 0; i < AppInfo.NUM_NARRATIVE_QUESTIONS; i++)
            //{
            //    txtBox = (TextBox)((WebControl)ContentPlaceHolder.FindControl("txtA" + (i + 1).ToString()));
            //    txtBox.Text = (txtBox.Text.Length > AppInfo.MAX_NARRATIVE_ANSWER_LENGTH) ? txtBox.Text.Substring(0, AppInfo.MAX_NARRATIVE_ANSWER_LENGTH) : txtBox.Text;

            //    if (string.IsNullOrEmpty(txtBox.Text))
            //    {
            //        dal.RemoveNarrativeQuestions(Int32.Parse(Session["GrantApplicantId"].ToString()), (i + 1));
            //    }
            //    else
            //    {
            //        retVal = dal.SaveNarrativeData(Int32.Parse(Session["GrantApplicantId"].ToString()), txtBox.Text, (i + 1));
            //    }
            //}
        //}
        ////////if (Page.IsValid)
        ////////{
        ////////    int retVal = dal.SavePreschoolProgramInformation(Convert.ToInt32(Session["GrantApplicantId"].ToString())
        ////////        , ViewState["SystemProviderId"] == null ? "0" : ViewState["SystemProviderId"].ToString()
        ////////        , txtProgramName.Text
        ////////        , txtEECProgramNumber.Text
        ////////        , rdoQRISLevel.SelectedValue
        ////////        , rbtnIsHeadStartProgram.SelectedValue
        ////////        , rbtnIsAccredited.SelectedValue
        ////////        , ddlAccreditation.SelectedValue
        ////////        , txtAccreditationNumber.Text
        ////////        , txtAccreditationExpDate.Text
        ////////        , txtAccreditationEarnDate.Text
        ////////        , rbtnIsProgramLicensed.SelectedValue
        ////////        , txtAddress.Text
        ////////        , txtCity.Text
        ////////        , txtZipCode.Text
        ////////        , txtFirstName.Text
        ////////        , txtLastName.Text
        ////////        , txtJobTitle.Text
        ////////        , txtPhoneNumber.Text
        ////////        , txtEmail.Text
        ////////        , txtQ8.Text
        ////////        , txtQ9.Text
        ////////        , txtQ10_1_1.Text
        ////////        , txtQ10_1_2.Text
        ////////        , txtQ10_1_3.Text
        ////////        , txtQ10_1_4.Text
        ////////        , txtQ10_1_4.Text
        ////////        , txtQ10_2_1.Text
        ////////        , txtQ10_2_1.Text
        ////////        , txtQ10_2_2.Text
        ////////        , txtQ10_2_3.Text
        ////////        , txtQ10_2_5.Text
        ////////        , txtQ10_3_1.Text
        ////////        , txtQ10_3_1.Text
        ////////        , txtQ10_3_2.Text
        ////////        , txtQ10_3_3.Text
        ////////        , txtQ10_3_4.Text
        ////////        , txtLowestClassSize.Text
        ////////        , txtHighestClassSize.Text
        ////////        , txtAverageClassSize.Text
        ////////        , txtQ11_1.Text
        ////////        , txtTotalIEPPreschoolChildren.Text
        ////////        , txtTotalNoIEPPreschoolChildren.Text
        ////////        , rdoLASID.SelectedValue
        ////////        , txtQ15_1_1.Text
        ////////        , txtQ15_1_2.Text
        ////////        , txtQ15_1_3.Text
        ////////        , txtQ15_1_4.Text
        ////////        , txtQ15_1_5.Text
        ////////        , txtQ15_1_6.Text
        ////////        , txtQ15_2_1.Text
        ////////        , txtQ15_2_2.Text
        ////////        , txtQ15_2_3.Text
        ////////        , txtQ15_2_4.Text
        ////////        , txtQ15_2_5.Text
        ////////        , txtQ15_2_6.Text
        ////////        , txtQ15_3_1.Text
        ////////        , txtQ15_3_2.Text
        ////////        , txtQ15_3_3.Text
        ////////        , txtQ15_3_4.Text
        ////////        , txtQ15_3_5.Text
        ////////        , txtQ15_3_6.Text
        ////////        , txtQ15_4_1.Text
        ////////        , txtQ15_4_2.Text
        ////////        , txtQ15_4_3.Text
        ////////        , txtQ15_4_4.Text
        ////////        , txtQ15_4_5.Text
        ////////        , txtQ15_4_6.Text
        ////////        , txtQ15_5_1.Text
        ////////        , txtQ15_5_2.Text
        ////////        , txtQ15_5_3.Text
        ////////        , txtQ15_5_4.Text
        ////////        , txtQ15_5_5.Text
        ////////        , txtQ15_5_6.Text
        ////////        , txtQ16_1_1.Text
        ////////        , txtQ16_1_2.Text
        ////////        , txtQ16_1_3.Text
        ////////        , txtQ16_2_1.Text
        ////////        , txtQ17_2_2.Text
        ////////        , txtQ17_2_3.Text
        ////////        , txtQ17_3_1.Text
        ////////        , txtQ17_3_2.Text
        ////////        , txtQ17_3_3.Text
        ////////        , txtQ17_4_1.Text
        ////////        , txtQ17_4_2.Text
        ////////        , txtQ17_4_3.Text
        ////////        , txtQ17_5_1.Text
        ////////        , txtQ17_5_2.Text
        ////////        , txtQ17_5_3.Text
        ////////        , txtQ17_6_1.Text
        ////////        , txtQ17_6_2.Text
        ////////        , txtQ17_6_3.Text
        ////////        , txtQ17_7_1.Text
        ////////        , txtQ17_7_2.Text
        ////////        , txtQ17_7_3.Text
        ////////        , txtQ17_8_1.Text
        ////////        , txtQ17_8_2.Text
        ////////        , txtQ17_8_3.Text
        ////////        , txtQ18_1_1.Text
        ////////        , txtQ18_1_2.Text
        ////////        , txtQ18_1_3.Text
        ////////        , txtQ18_2_1.Text
        ////////        , txtQ18_2_2.Text
        ////////        , txtQ18_2_3.Text
        ////////        , txtQ18_3_1.Text
        ////////        , txtQ18_3_2.Text
        ////////        , txtQ18_3_3.Text
        ////////        , txtQ18_4_1.Text
        ////////        , txtQ18_4_2.Text
        ////////        , txtQ18_4_3.Text
        ////////        );

        ////////    ViewState["SystemProviderId"] = retVal;

        ////////    loadAgencyInfo(Convert.ToInt32(Session["GrantApplicantId"].ToString()));

        //BindData(true);
        ////////}
        ////////else
        ////////{
        ////////    //tblErrorMessage.Visible = true;
        ////////}
    }

    protected void btnCancelSave_Click(object sender, EventArgs e)
    {
        Response.Redirect("PreschoolProgramInformation.aspx");
    }

    protected void grdSysProviders_RowEditing(object sender, GridViewEditEventArgs e)
    {
        ViewState["SystemProviderId"] = grdSysProviders.DataKeys[e.NewEditIndex].Value;

        tblCenter.Visible = true;
        tblSysProviders.Visible = false;

        BindData(false);
    }

    protected void grdSysProviders_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        dal.DeletePreschoolProgram(Convert.ToInt32(grdSysProviders.DataKeys[e.RowIndex].Value));

        //float eligAmount = dal.UpdateUPKEligAmount(Convert.ToInt32(Session["GrantApplicantId"].ToString()));
        //Session["Eligibility Amount"] = eligAmount.ToString("N2");
        //Master.ReloadEligibilityAmount();

        //loadAgencyInfo(Convert.ToInt32(Session["GrantApplicantId"].ToString()));

        LoadControls();
    }

    protected void btnAddNewProgram_Click(object sender, EventArgs e)
    {
        ViewState["SystemProviderId"] = "0";

        tblSysProviders.Visible = false;
        tblCenter.Visible = true;
        tblCommands.Visible = true;
        tblFootNotes.Visible = true;

        BindData(false);
    }



    //protected void ddlAccreditation_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    if (ddlAccreditation.SelectedValue != "0")
    //    {
    //        LoadAccreditationDetailsControls();
    //    }
    //    else
    //    {
    //        txtAccreditationExpDate.Text = "";
    //        txtAccreditationEarnDate.Text = "";
    //        txtAccreditationNumber.Text = "";

    //        txtAccreditationExpDate.Enabled = false;
    //        txtAccreditationEarnDate.Enabled = false;
    //        txtAccreditationNumber.Enabled = false;
    //    }
    //}

    protected void CustomValidator20_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (tblCenter.Visible)
        {
            if (ddlAccreditation.Enabled && ddlAccreditation.SelectedIndex == 0)
            {
                args.IsValid = false;
            }
        }
    }

    protected void CustomValidator22_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (tblCenter.Visible)
        {
            if (txtAccreditationNumber.Enabled && string.IsNullOrEmpty(txtAccreditationNumber.Text.Trim()))
            {
                args.IsValid = false;
            }
        }
    }

    protected void CustomValidator21_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (tblCenter.Visible)
        {
            if (txtAccreditationEarnDate.Enabled && string.IsNullOrEmpty(txtAccreditationEarnDate.Text.Trim()))
            {
                args.IsValid = false;
            }
        }
    }

    protected void CustomValidator23_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (tblCenter.Visible)
        {
            if (txtAccreditationExpDate.Enabled && string.IsNullOrEmpty(txtAccreditationExpDate.Text.Trim()))
            {
                args.IsValid = false;
            }
        }
    }

    private void loadAgencyInfo(int grantApplicantId)
    {
        DataSet ds = dal.GetGrantApplicant(Convert.ToInt32(Session["GrantApplicantId"]), AppInfo.FundCode);

        if (ds.Tables[0].Rows.Count > 0)
        {
            Session["Lead Agency Name"] = ds.Tables[0].Rows[0]["AgencyName"].ToString();
            Session["Eligibility Amount"] = Decimal.Parse(ds.Tables[0].Rows[0]["EligibilityAmount"].ToString()).ToString("N2");
            //Session["Program Name"] = ds.Tables[0].Rows[0]["ProgramName"].ToString();
        }
    }

    private void displayErrorHighlight(List<string> lstBoxes)
    {
        Control ContentPlaceHolder = Form.FindControl("ContentPlaceHolder1");

        for (int i = 0; i < lstBoxes.Count; i++)
        {
            ((WebControl)ContentPlaceHolder.FindControl(lstBoxes[i])).CssClass = "styleHighlight";
        }
    }

    protected void rbtnIsAccredited_SelectedIndexChanged(object sender, EventArgs e)
    {
        string s = rbtnIsAccredited.SelectedValue;

        if (s == "1")
        {
            trAccr.Visible = true;
        }
        else
        {
            trAccr.Visible = false;
        }
    }

    protected void grdSysProviders_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Print")
        {
            Session["SystemProviderId"] = e.CommandArgument;

            Response.Redirect("../Print.aspx?type=PreschoolProgramInformation");
        }
    }

    protected void btnPrintProgramSummary_Click(object sender, EventArgs e)
    {
        Response.Redirect("../Print.aspx?type=AllPreschoolProgramSummary");
    }
   
    //validations
    private bool isValidPreschoolProgramInformationQuestion10_FY2017(List<string> errorBoxes)
    {
        int total1 = 0;
        int total2 = 0;

        int count = errorBoxes.Count;

        total1 = (string.IsNullOrEmpty(txtQ8.Text) ? 0 : Int32.Parse(txtQ8.Text));

        total2 = (string.IsNullOrEmpty(txtQ10_1_0.Text) ? 0 : Int32.Parse(txtQ10_1_0.Text))
                + (string.IsNullOrEmpty(txtQ10_2_0.Text) ? 0 : Int32.Parse(txtQ10_2_0.Text))
                + (string.IsNullOrEmpty(txtQ10_3_0.Text) ? 0 : Int32.Parse(txtQ10_3_0.Text))
                + (string.IsNullOrEmpty(txtQ10_4_0.Text) ? 0 : Int32.Parse(txtQ10_4_0.Text));

        if (total1 != total2)
        {
            errorBoxes.Add("txtQ8");

            errorBoxes.Add("txtQ10_1_0");
            errorBoxes.Add("txtQ10_2_0");
            errorBoxes.Add("txtQ10_3_0");
            errorBoxes.Add("txtQ10_4_0");
        }

        return errorBoxes.Count <= count;
    }

    private bool isValidPreschoolProgramInformationQuestion11_FY2017(List<string> errorBoxes)
    {
        int total1 = 0;
        int total2 = 0;

        int count = errorBoxes.Count;

        total1 = (string.IsNullOrEmpty(txtQ11_1.Text) ? 0 : Int32.Parse(txtQ11_1.Text));

        total2 = (string.IsNullOrEmpty(txtQ11_2.Text) ? 0 : Int32.Parse(txtQ11_2.Text))
                + (string.IsNullOrEmpty(txtQ11_3.Text) ? 0 : Int32.Parse(txtQ11_3.Text));

        if (total1 != total2)
        {
            errorBoxes.Add("txtQ11_1");

            errorBoxes.Add("txtQ11_2");
            errorBoxes.Add("txtQ11_3");
        }

        return errorBoxes.Count <= count;
    }

    private bool isValidPreschoolProgramInformationQuestion12_FY2017(List<string> errorBoxes)
    {
        int total1 = 0;
        int total2 = 0;

        int count = errorBoxes.Count;

        total1 = (string.IsNullOrEmpty(txtQ11_1.Text) ? 0 : Int32.Parse(txtQ11_1.Text));

        total2 = (string.IsNullOrEmpty(txtQ12_1_0.Text) ? 0 : Int32.Parse(txtQ12_1_0.Text))
                + (string.IsNullOrEmpty(txtQ12_2_0.Text) ? 0 : Int32.Parse(txtQ12_2_0.Text))
                + (string.IsNullOrEmpty(txtQ12_3_0.Text) ? 0 : Int32.Parse(txtQ12_3_0.Text))
                + (string.IsNullOrEmpty(txtQ12_4_0.Text) ? 0 : Int32.Parse(txtQ12_4_0.Text));

        if (total1 != total2)
        {
            errorBoxes.Add("txtQ11_1");

            errorBoxes.Add("txtQ12_1_0");
            errorBoxes.Add("txtQ12_2_0");
            errorBoxes.Add("txtQ12_3_0");
            errorBoxes.Add("txtQ12_4_0");
        }

        return errorBoxes.Count <= count;
    }

    private bool isValidPreschoolProgramInformationQuestion12_1_FY2017(List<string> errorBoxes)
    {
        /*
        int total1 = 0;
        int total2 = 0;

        int count = errorBoxes.Count;

        total1 = (string.IsNullOrEmpty(txtQ12_1_0.Text) ? 0 : Int32.Parse(txtQ12_1_0.Text))
                   + (string.IsNullOrEmpty(txtQ12_2_0.Text) ? 0 : Int32.Parse(txtQ12_2_0.Text))
                   + (string.IsNullOrEmpty(txtQ12_3_0.Text) ? 0 : Int32.Parse(txtQ12_3_0.Text))
                   + (string.IsNullOrEmpty(txtQ12_4_0.Text) ? 0 : Int32.Parse(txtQ12_4_0.Text));

        total2 = (string.IsNullOrEmpty(txtQ15_1_1.Text) ? 0 : Int32.Parse(txtQ15_1_1.Text))
                + (string.IsNullOrEmpty(txtQ15_1_2.Text) ? 0 : Int32.Parse(txtQ15_1_2.Text));

        if (total1 != total2)
        {
            errorBoxes.Add("txtQ12_1_0");
            errorBoxes.Add("txtQ12_2_0");
            errorBoxes.Add("txtQ12_3_0");
            errorBoxes.Add("txtQ12_4_0");

            errorBoxes.Add("txtQ15_1_1");
            errorBoxes.Add("txtQ15_1_2");
        }

        return errorBoxes.Count <= count;
        */
        return true;
    }

    private bool isValidPreschoolProgramInformationQuestion13_FY2017(List<string> errorBoxes)
    {
        int total1 = 0;
        int total2 = 0;

        int count = errorBoxes.Count;

        total1 = (string.IsNullOrEmpty(txtQ13_1_0.Text) ? 0 : Int32.Parse(txtQ13_1_0.Text))
                   + (string.IsNullOrEmpty(txtQ13_2_0.Text) ? 0 : Int32.Parse(txtQ13_2_0.Text))
                   + (string.IsNullOrEmpty(txtQ13_3_0.Text) ? 0 : Int32.Parse(txtQ13_3_0.Text))
                   + (string.IsNullOrEmpty(txtQ13_4_0.Text) ? 0 : Int32.Parse(txtQ13_4_0.Text));

        total2 = (string.IsNullOrEmpty(txtQ15_1_3.Text) ? 0 : Int32.Parse(txtQ15_1_3.Text))
                + (string.IsNullOrEmpty(txtQ15_1_4.Text) ? 0 : Int32.Parse(txtQ15_1_4.Text));

        if (total1 != total2)
        {
            errorBoxes.Add("txtQ13_1_0");
            errorBoxes.Add("txtQ13_2_0");
            errorBoxes.Add("txtQ13_3_0");
            errorBoxes.Add("txtQ13_4_0");

            errorBoxes.Add("txtQ15_1_3");
            errorBoxes.Add("txtQ15_1_4");
        }

        return errorBoxes.Count <= count;
    }

    private bool isValidPreschoolProgramInformationQuestion14_FY2017(List<string> errorBoxes)
    {
        int total1 = 0;
        int total2 = 0;

        int count = errorBoxes.Count;

        total1 = (string.IsNullOrEmpty(txtQ14_1_0.Text) ? 0 : Int32.Parse(txtQ14_1_0.Text))
                   + (string.IsNullOrEmpty(txtQ14_2_0.Text) ? 0 : Int32.Parse(txtQ14_2_0.Text))
                   + (string.IsNullOrEmpty(txtQ14_3_0.Text) ? 0 : Int32.Parse(txtQ14_3_0.Text))
                   + (string.IsNullOrEmpty(txtQ14_4_0.Text) ? 0 : Int32.Parse(txtQ14_4_0.Text));

        total2 = (string.IsNullOrEmpty(txtQ15_1_5.Text) ? 0 : Int32.Parse(txtQ15_1_5.Text))
                + (string.IsNullOrEmpty(txtQ15_1_6.Text) ? 0 : Int32.Parse(txtQ15_1_6.Text));

        if (total1 != total2)
        {
            errorBoxes.Add("txtQ14_1_0");
            errorBoxes.Add("txtQ14_2_0");
            errorBoxes.Add("txtQ14_3_0");
            errorBoxes.Add("txtQ14_4_0");

            errorBoxes.Add("txtQ15_1_5");
            errorBoxes.Add("txtQ15_1_6");
        }

        return errorBoxes.Count <= count;
    }

    private bool isValidPreschoolProgramInformationQuestion16_1_FY2017(List<string> errorBoxes)
    {
        int total1 = 0;
        int total2 = 0;

        int count = errorBoxes.Count;

        total1 = (string.IsNullOrEmpty(txtQ15_2_1.Text) ? 0 : Int32.Parse(txtQ15_2_1.Text))
                + (string.IsNullOrEmpty(txtQ15_2_2.Text) ? 0 : Int32.Parse(txtQ15_2_2.Text));

        total2 = (string.IsNullOrEmpty(txtQ16_1_1.Text) ? 0 : Int32.Parse(txtQ16_1_1.Text));

        if (total1 != total2)
        {
            errorBoxes.Add("txtQ16_1_1");

            errorBoxes.Add("txtQ15_2_1");
            errorBoxes.Add("txtQ15_2_2");
        }

        return errorBoxes.Count <= count;
    }

    private bool isValidPreschoolProgramInformationQuestion16_2_FY2017(List<string> errorBoxes)
    {
        int total1 = 0;
        int total2 = 0;

        int count = errorBoxes.Count;

        total1 = (string.IsNullOrEmpty(txtQ15_2_3.Text) ? 0 : Int32.Parse(txtQ15_2_3.Text))
                + (string.IsNullOrEmpty(txtQ15_2_4.Text) ? 0 : Int32.Parse(txtQ15_2_4.Text));

        total2 = (string.IsNullOrEmpty(txtQ16_1_2.Text) ? 0 : Int32.Parse(txtQ16_1_2.Text));

        if (total1 != total2)
        {
            errorBoxes.Add("txtQ16_1_2");

            errorBoxes.Add("txtQ15_2_3");
            errorBoxes.Add("txtQ15_2_4");
        }

        return errorBoxes.Count <= count;
    }

    private bool isValidPreschoolProgramInformationQuestion16_3_FY2017(List<string> errorBoxes)
    {
        int total1 = 0;
        int total2 = 0;

        int count = errorBoxes.Count;

        total1 = (string.IsNullOrEmpty(txtQ15_2_5.Text) ? 0 : Int32.Parse(txtQ15_2_5.Text))
                + (string.IsNullOrEmpty(txtQ15_2_6.Text) ? 0 : Int32.Parse(txtQ15_2_6.Text));

        total2 = (string.IsNullOrEmpty(txtQ16_1_3.Text) ? 0 : Int32.Parse(txtQ16_1_3.Text));

        if (total1 != total2)
        {
            errorBoxes.Add("txtQ16_1_3");

            errorBoxes.Add("txtQ15_2_5");
            errorBoxes.Add("txtQ15_2_6");
        }

        return errorBoxes.Count <= count;
    }



    private bool isValidPreschoolProgramInformationQuestion17_1_FY2017(List<string> errorBoxes)
    {
        int total1 = 0;
        int total2 = 0;

        int count = errorBoxes.Count;

        total1 = (string.IsNullOrEmpty(txtQ15_3_1.Text) ? 0 : Int32.Parse(txtQ15_3_1.Text))
                + (string.IsNullOrEmpty(txtQ15_3_2.Text) ? 0 : Int32.Parse(txtQ15_3_2.Text));

        total2 = (string.IsNullOrEmpty(txtQ17_1_1.Text) ? 0 : Int32.Parse(txtQ17_1_1.Text));

        if (total1 != total2)
        {
            errorBoxes.Add("txtQ17_1_1");

            errorBoxes.Add("txtQ15_3_1");
            errorBoxes.Add("txtQ15_3_2");
        }

        return errorBoxes.Count <= count;
    }

    private bool isValidPreschoolProgramInformationQuestion17_2_FY2017(List<string> errorBoxes)
    {
        int total1 = 0;
        int total2 = 0;

        int count = errorBoxes.Count;

        total1 = (string.IsNullOrEmpty(txtQ15_3_3.Text) ? 0 : Int32.Parse(txtQ15_3_3.Text))
                + (string.IsNullOrEmpty(txtQ15_3_4.Text) ? 0 : Int32.Parse(txtQ15_3_4.Text));

        total2 = (string.IsNullOrEmpty(txtQ17_1_2.Text) ? 0 : Int32.Parse(txtQ17_1_2.Text));

        if (total1 != total2)
        {
            errorBoxes.Add("txtQ17_1_2");

            errorBoxes.Add("txtQ15_3_3");
            errorBoxes.Add("txtQ15_3_4");
        }

        return errorBoxes.Count <= count;
    }

    private bool isValidPreschoolProgramInformationQuestion17_3_FY2017(List<string> errorBoxes)
    {
        int total1 = 0;
        int total2 = 0;

        int count = errorBoxes.Count;

        total1 = (string.IsNullOrEmpty(txtQ15_3_5.Text) ? 0 : Int32.Parse(txtQ15_3_5.Text))
                + (string.IsNullOrEmpty(txtQ15_3_6.Text) ? 0 : Int32.Parse(txtQ15_3_6.Text));

        total2 = (string.IsNullOrEmpty(txtQ17_1_3.Text) ? 0 : Int32.Parse(txtQ17_1_3.Text));

        if (total1 != total2)
        {
            errorBoxes.Add("txtQ17_1_3");

            errorBoxes.Add("txtQ15_3_5");
            errorBoxes.Add("txtQ15_3_6");
        }

        return errorBoxes.Count <= count;
    }


    private bool isValidPreschoolProgramInformationQuestion18_1_FY2017(List<string> errorBoxes)
    {
        int total1 = 0;
        int total2 = 0;

        int count = errorBoxes.Count;

        total1 = (string.IsNullOrEmpty(txtQ15_4_1.Text) ? 0 : Int32.Parse(txtQ15_4_1.Text))
                + (string.IsNullOrEmpty(txtQ15_4_2.Text) ? 0 : Int32.Parse(txtQ15_4_2.Text));

        total2 = (string.IsNullOrEmpty(txtQ18_1_1.Text) ? 0 : Int32.Parse(txtQ18_1_1.Text));

        if (total1 != total2)
        {
            errorBoxes.Add("txtQ18_1_1");

            errorBoxes.Add("txtQ15_4_1");
            errorBoxes.Add("txtQ15_4_2");
        }

        return errorBoxes.Count <= count;
    }

    private bool isValidPreschoolProgramInformationQuestion18_2_FY2017(List<string> errorBoxes)
    {
        int total1 = 0;
        int total2 = 0;

        int count = errorBoxes.Count;

        total1 = (string.IsNullOrEmpty(txtQ15_4_3.Text) ? 0 : Int32.Parse(txtQ15_4_3.Text))
                + (string.IsNullOrEmpty(txtQ15_4_4.Text) ? 0 : Int32.Parse(txtQ15_4_4.Text));

        total2 = (string.IsNullOrEmpty(txtQ18_1_2.Text) ? 0 : Int32.Parse(txtQ18_1_2.Text));

        if (total1 != total2)
        {
            errorBoxes.Add("txtQ18_1_2");

            errorBoxes.Add("txtQ15_4_3");
            errorBoxes.Add("txtQ15_4_4");
        }

        return errorBoxes.Count <= count;
    }

    private bool isValidPreschoolProgramInformationQuestion18_3_FY2017(List<string> errorBoxes)
    {
        int total1 = 0;
        int total2 = 0;

        int count = errorBoxes.Count;

        total1 = (string.IsNullOrEmpty(txtQ15_4_5.Text) ? 0 : Int32.Parse(txtQ15_4_5.Text))
                + (string.IsNullOrEmpty(txtQ15_4_6.Text) ? 0 : Int32.Parse(txtQ15_4_6.Text));

        total2 = (string.IsNullOrEmpty(txtQ18_1_3.Text) ? 0 : Int32.Parse(txtQ18_1_3.Text));

        if (total1 != total2)
        {
            errorBoxes.Add("txtQ18_1_3");

            errorBoxes.Add("txtQ15_4_5");
            errorBoxes.Add("txtQ15_4_6");
        }

        return errorBoxes.Count <= count;
    }



    private bool isValidPreschoolProgramInformationQuestion19_1_FY2017(List<string> errorBoxes)
    {
        int total1 = 0;
        int total2 = 0;

        int count = errorBoxes.Count;

        total1 = (string.IsNullOrEmpty(txtQ15_5_1.Text) ? 0 : Int32.Parse(txtQ15_5_1.Text))
                + (string.IsNullOrEmpty(txtQ15_5_2.Text) ? 0 : Int32.Parse(txtQ15_5_2.Text));

        total2 = (string.IsNullOrEmpty(txtQ19_1_1.Text) ? 0 : Int32.Parse(txtQ19_1_1.Text));

        if (total1 != total2)
        {
            errorBoxes.Add("txtQ19_1_1");

            errorBoxes.Add("txtQ15_5_1");
            errorBoxes.Add("txtQ15_5_2");
        }

        return errorBoxes.Count <= count;
    }

    private bool isValidPreschoolProgramInformationQuestion19_2_FY2017(List<string> errorBoxes)
    {
        int total1 = 0;
        int total2 = 0;

        int count = errorBoxes.Count;

        total1 = (string.IsNullOrEmpty(txtQ15_5_3.Text) ? 0 : Int32.Parse(txtQ15_5_3.Text))
                + (string.IsNullOrEmpty(txtQ15_5_4.Text) ? 0 : Int32.Parse(txtQ15_5_4.Text));

        total2 = (string.IsNullOrEmpty(txtQ19_1_2.Text) ? 0 : Int32.Parse(txtQ19_1_2.Text));

        if (total1 != total2)
        {
            errorBoxes.Add("txtQ19_1_2");

            errorBoxes.Add("txtQ15_5_3");
            errorBoxes.Add("txtQ15_5_4");
        }

        return errorBoxes.Count <= count;
    }

    private bool isValidPreschoolProgramInformationQuestion19_3_FY2017(List<string> errorBoxes)
    {
        int total1 = 0;
        int total2 = 0;

        int count = errorBoxes.Count;

        total1 = (string.IsNullOrEmpty(txtQ15_5_5.Text) ? 0 : Int32.Parse(txtQ15_5_5.Text))
                + (string.IsNullOrEmpty(txtQ15_5_6.Text) ? 0 : Int32.Parse(txtQ15_5_6.Text));

        total2 = (string.IsNullOrEmpty(txtQ19_1_3.Text) ? 0 : Int32.Parse(txtQ19_1_3.Text));

        if (total1 != total2)
        {
            errorBoxes.Add("txtQ19_1_3");

            errorBoxes.Add("txtQ15_5_5");
            errorBoxes.Add("txtQ15_5_6");
        }

        return errorBoxes.Count <= count;
    }
}


