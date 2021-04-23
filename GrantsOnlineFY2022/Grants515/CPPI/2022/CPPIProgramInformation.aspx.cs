using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;

public partial class CPPI_2019_CPPIProgramInformation : System.Web.UI.Page
{
    DAL dal = new DAL();
    bool IsNewProgram = true;
    int ContactID = -1;

    // Which Survey update period is this?
    int UpdatePeriod;
    bool IsInitialUpdate = AppInfo.InitialUpdate;
    bool IsMarchUpdate = AppInfo.MarchUpdate;
    bool IsJuneUpdate = AppInfo.JuneUpdate;

     
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["GrantApplicantId"] == null) Response.Redirect("~/SessionTimeout.aspx");

        //Get UpdatePeriod
        if (IsInitialUpdate)
            UpdatePeriod = 1;
        else if (IsMarchUpdate)
            UpdatePeriod = 2;
        else if (IsJuneUpdate)
            UpdatePeriod = 3;

        BindScripts();

        if (!IsPostBack)
        {
            //ResetProgram();
            LoadControls();
        }
    }

    //private void ResetProgram()
    //{
    //    //txtQ1_4_1.Text = "0";
    //    //txtQ1_4_2.Text = "0";
    //    //txtQ1_4_3.Text = "0";

    //    //txtQ1_5_1.Text = "0";
    //    //txtQ1_5_2.Text = "0";
    //    //txtQ1_5_3.Text = "0";

    //    txtQ3_1_1.Text = "0";
    //    txtQ3_1_2.Text = "0";
    //    txtQ3_1_3.Text = "0";

    //    txtQ3_2_1.Text = "0";
    //    txtQ3_2_2.Text = "0";
    //    txtQ3_2_3.Text = "0";

    //    txtQ3_3_1.Text = "0";
    //    txtQ3_3_2.Text = "0";
    //    txtQ3_3_3.Text = "0";

    //    //txtQ3_4_1.Text = "0";
    //    //txtQ3_4_2.Text = "0";
    //    //txtQ3_4_3.Text = "0";

    //    txtQ3_5_1.Text = "0";
    //    txtQ3_5_2.Text = "0";
    //    txtQ3_5_3.Text = "0";

    //    txtQ2_1_1.Text = "0";
    //    txtQ2_1_2.Text = "0";
    //    txtQ2_1_3.Text = "0";
    //    txtQ2_1_4.Text = "0";
    //    txtQ2_1_5.Text = "0";
    //    txtQ2_1_6.Text = "0";


    //    txtQ2_2_1.Text = "0";
    //    txtQ2_2_2.Text = "0";
    //    txtQ2_2_3.Text = "0";
    //    txtQ2_2_4.Text = "0";
    //    txtQ2_2_5.Text = "0";
    //    txtQ2_2_6.Text = "0";

    //    txtQ2_3_1.Text = "0";
    //    txtQ2_3_2.Text = "0";
    //    txtQ2_3_3.Text = "0";
    //    txtQ2_3_4.Text = "0";
    //    txtQ2_3_5.Text = "0";
    //    txtQ2_3_6.Text = "0";

    //    //txtQ2_4_1.Text = "0";
    //    //txtQ2_4_2.Text = "0";
    //    //txtQ2_4_3.Text = "0";
    //    //txtQ2_4_4.Text = "0";
    //    //txtQ2_4_5.Text = "0";
    //    //txtQ2_4_6.Text = "0";

    //    txtQ2_5_1.Text = "0";
    //    txtQ2_5_2.Text = "0";
    //    txtQ2_5_3.Text = "0";
    //    txtQ2_5_4.Text = "0";
    //    txtQ2_5_5.Text = "0";
    //    txtQ2_5_6.Text = "0";

    //    txtQ4_1_1.Text = "0";
    //    txtQ4_1_2.Text = "0";
    //    txtQ4_1_3.Text = "0";

    //    txtQ4_2_1.Text = "0";
    //    txtQ4_2_2.Text = "0";
    //    txtQ4_2_3.Text = "0";

    //    txtQ4_3_1.Text = "0";
    //    txtQ4_3_2.Text = "0";
    //    txtQ4_3_3.Text = "0";

    //    //txtQ4_4_1.Text = "0";
    //    //txtQ4_4_2.Text = "0";
    //    //txtQ4_4_3.Text = "0";

    //    txtQ4_5_1.Text = "0";
    //    txtQ4_5_2.Text = "0";
    //    txtQ4_5_3.Text = "0";

    //}

    private void BindScripts()
    {
        //txtQ2_1_1.Attributes.Add("disabled", "disabled");
        //txtQ2_1_2.Attributes.Add("disabled", "disabled");
        //txtQ2_1_3.Attributes.Add("disabled", "disabled");
        //txtQ2_1_4.Attributes.Add("disabled", "disabled");
        //txtQ2_1_5.Attributes.Add("disabled", "disabled");
        //txtQ2_1_6.Attributes.Add("disabled", "disabled");

        ////txtQ3_1_1.Attributes.Add("disabled", "disabled");
        //txtQ3_1_2.Attributes.Add("disabled", "disabled");
        //txtQ3_1_3.Attributes.Add("disabled", "disabled");

        ////txtQ4_1_1.Attributes.Add("disabled", "disabled");
        //txtQ4_1_2.Attributes.Add("disabled", "disabled");
        //txtQ4_1_3.Attributes.Add("disabled", "disabled");



        txtQ1_2_1.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ1_2_1.ClientID + "'" + ","
                                                                             + "'" + txtQ1_3_1.ClientID + "'" + ","
                                                                             //+ "'" + txtQ1_4_1.ClientID + "'" + ","
                                                                             + "'" + txtQ1_5_1.ClientID + "'" + ","
                                                                             + "'" + txtQ1_1_1.ClientID + "');");

        txtQ1_3_1.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ1_2_1.ClientID + "'" + ","
                                                                             + "'" + txtQ1_3_1.ClientID + "'" + ","
                                                                             //+ "'" + txtQ1_4_1.ClientID + "'" + ","
                                                                             + "'" + txtQ1_5_1.ClientID + "'" + ","
                                                                             + "'" + txtQ1_1_1.ClientID + "');");

        //txtQ1_4_1.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ1_2_1.ClientID + "'" + ","
        //                                                                     + "'" + txtQ1_3_1.ClientID + "'" + ","
        //                                                                     + "'" + txtQ1_4_1.ClientID + "'" + ","
        //                                                                     + "'" + txtQ1_5_1.ClientID + "'" + ","
        //                                                                     + "'" + txtQ1_1_1.ClientID + "');");

        txtQ1_5_1.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ1_2_1.ClientID + "'" + ","
                                                                             + "'" + txtQ1_3_1.ClientID + "'" + ","
                                                                             //+ "'" + txtQ1_4_1.ClientID + "'" + ","
                                                                             + "'" + txtQ1_5_1.ClientID + "'" + ","
                                                                             + "'" + txtQ1_1_1.ClientID + "');");


        //    txtQ1_2_2.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ1_2_2.ClientID + "'" + ","
        //                                                                         + "'" + txtQ1_3_2.ClientID + "'" + ","
        //                                                                         //+ "'" + txtQ1_4_2.ClientID + "'" + ","
        //                                                                         + "'" + txtQ1_5_2.ClientID + "'" + ","
        //                                                                         + "'" + txtQ1_1_2.ClientID + "');");

        //    txtQ1_3_2.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ1_2_2.ClientID + "'" + ","
        //                                                                         + "'" + txtQ1_3_2.ClientID + "'" + ","
        //                                                                         //+ "'" + txtQ1_4_2.ClientID + "'" + ","
        //                                                                         + "'" + txtQ1_5_2.ClientID + "'" + ","
        //                                                                         + "'" + txtQ1_1_2.ClientID + "');");

        //    //txtQ1_4_2.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ1_2_2.ClientID + "'" + ","
        //    //                                                                     + "'" + txtQ1_3_2.ClientID + "'" + ","
        //    //                                                                     + "'" + txtQ1_4_2.ClientID + "'" + ","
        //    //                                                                     + "'" + txtQ1_5_2.ClientID + "'" + ","
        //    //                                                                     + "'" + txtQ1_1_2.ClientID + "');");

        //    txtQ1_5_2.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ1_2_2.ClientID + "'" + ","
        //                                                                         + "'" + txtQ1_3_2.ClientID + "'" + ","
        //                                                                         //+ "'" + txtQ1_4_2.ClientID + "'" + ","
        //                                                                         + "'" + txtQ1_5_2.ClientID + "'" + ","
        //                                                                         + "'" + txtQ1_1_2.ClientID + "');");

        //    txtQ1_2_3.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ1_2_3.ClientID + "'" + ","
        //                                                                         + "'" + txtQ1_3_3.ClientID + "'" + ","
        //                                                                         //+ "'" + txtQ1_4_3.ClientID + "'" + ","
        //                                                                         + "'" + txtQ1_5_3.ClientID + "'" + ","
        //                                                                         + "'" + txtQ1_1_3.ClientID + "');");

        //    txtQ1_3_3.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ1_2_3.ClientID + "'" + ","
        //                                                                         + "'" + txtQ1_3_3.ClientID + "'" + ","
        //                                                                         //+ "'" + txtQ1_4_3.ClientID + "'" + ","
        //                                                                         + "'" + txtQ1_5_3.ClientID + "'" + ","
        //                                                                         + "'" + txtQ1_1_3.ClientID + "');");

        //    //txtQ1_4_3.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ1_2_3.ClientID + "'" + ","
        //    //                                                                     + "'" + txtQ1_3_3.ClientID + "'" + ","
        //    //                                                                     + "'" + txtQ1_4_3.ClientID + "'" + ","
        //    //                                                                     + "'" + txtQ1_5_3.ClientID + "'" + ","
        //    //                                                                     + "'" + txtQ1_1_3.ClientID + "');");

        //    txtQ1_5_3.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ1_2_3.ClientID + "'" + ","
        //                                                                         + "'" + txtQ1_3_3.ClientID + "'" + ","
        //                                                                         //+ "'" + txtQ1_4_3.ClientID + "'" + ","
        //                                                                         + "'" + txtQ1_5_3.ClientID + "'" + ","
        //                                                                         + "'" + txtQ1_1_3.ClientID + "');");

        //    txtQ3_2_1.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ3_2_1.ClientID + "'" + ","
        //                                                                         + "'" + txtQ3_3_1.ClientID + "'" + ","
        //                                                                         //+ "'" + txtQ3_4_1.ClientID + "'" + ","
        //                                                                         + "'" + txtQ3_5_1.ClientID + "'" + ","
        //                                                                         + "'" + txtQ3_1_1.ClientID + "');");

        //    txtQ3_3_1.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ3_2_1.ClientID + "'" + ","
        //                                                                         + "'" + txtQ3_3_1.ClientID + "'" + ","
        //                                                                         //+ "'" + txtQ3_4_1.ClientID + "'" + ","
        //                                                                         + "'" + txtQ3_5_1.ClientID + "'" + ","
        //                                                                         + "'" + txtQ3_1_1.ClientID + "');");

        //    //txtQ3_4_1.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ3_2_1.ClientID + "'" + ","
        //    //                                                                     + "'" + txtQ3_3_1.ClientID + "'" + ","
        //    //                                                                     + "'" + txtQ3_4_1.ClientID + "'" + ","
        //    //                                                                     + "'" + txtQ3_5_1.ClientID + "'" + ","
        //    //                                                                     + "'" + txtQ3_1_1.ClientID + "');");

        //    txtQ3_5_1.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ3_2_1.ClientID + "'" + ","
        //                                                                         + "'" + txtQ3_3_1.ClientID + "'" + ","
        //                                                                         //+ "'" + txtQ3_4_1.ClientID + "'" + ","
        //                                                                         + "'" + txtQ3_5_1.ClientID + "'" + ","
        //                                                                         + "'" + txtQ3_1_1.ClientID + "');");


        //    txtQ3_2_2.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ3_2_2.ClientID + "'" + ","
        //                                                                         + "'" + txtQ3_3_2.ClientID + "'" + ","
        //                                                                         //+ "'" + txtQ3_4_2.ClientID + "'" + ","
        //                                                                         + "'" + txtQ3_5_2.ClientID + "'" + ","
        //                                                                         + "'" + txtQ3_1_2.ClientID + "');");

        //    txtQ3_3_2.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ3_2_2.ClientID + "'" + ","
        //                                                                         + "'" + txtQ3_3_2.ClientID + "'" + ","
        //                                                                         //+ "'" + txtQ3_4_2.ClientID + "'" + ","
        //                                                                         + "'" + txtQ3_5_2.ClientID + "'" + ","
        //                                                                         + "'" + txtQ3_1_2.ClientID + "');");

        //    //txtQ3_4_2.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ3_2_2.ClientID + "'" + ","
        //    //                                                                     + "'" + txtQ3_3_2.ClientID + "'" + ","
        //    //                                                                     + "'" + txtQ3_4_2.ClientID + "'" + ","
        //    //                                                                     + "'" + txtQ3_5_2.ClientID + "'" + ","
        //    //                                                                     + "'" + txtQ3_1_2.ClientID + "');");

        //    txtQ3_5_2.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ3_2_2.ClientID + "'" + ","
        //                                                                         + "'" + txtQ3_3_2.ClientID + "'" + ","
        //                                                                         //+ "'" + txtQ3_4_2.ClientID + "'" + ","
        //                                                                         + "'" + txtQ3_5_2.ClientID + "'" + ","
        //                                                                         + "'" + txtQ3_1_2.ClientID + "');");

        //    txtQ3_2_3.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ3_2_3.ClientID + "'" + ","
        //                                                                         + "'" + txtQ3_3_3.ClientID + "'" + ","
        //                                                                         //+ "'" + txtQ3_4_3.ClientID + "'" + ","
        //                                                                         + "'" + txtQ3_5_3.ClientID + "'" + ","
        //                                                                         + "'" + txtQ3_1_3.ClientID + "');");

        //    txtQ3_3_3.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ3_2_3.ClientID + "'" + ","
        //                                                                         + "'" + txtQ3_3_3.ClientID + "'" + ","
        //                                                                         //+ "'" + txtQ3_4_3.ClientID + "'" + ","
        //                                                                         + "'" + txtQ3_5_3.ClientID + "'" + ","
        //                                                                         + "'" + txtQ3_1_3.ClientID + "');");

        //    //txtQ3_4_3.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ3_2_3.ClientID + "'" + ","
        //    //                                                                     + "'" + txtQ3_3_3.ClientID + "'" + ","
        //    //                                                                     + "'" + txtQ3_4_3.ClientID + "'" + ","
        //    //                                                                     + "'" + txtQ3_5_3.ClientID + "'" + ","
        //    //                                                                     + "'" + txtQ3_1_3.ClientID + "');");

        //    txtQ3_5_3.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ3_2_3.ClientID + "'" + ","
        //                                                                         + "'" + txtQ3_3_3.ClientID + "'" + ","
        //                                                                         //+ "'" + txtQ3_4_3.ClientID + "'" + ","
        //                                                                         + "'" + txtQ3_5_3.ClientID + "'" + ","
        //                                                                         + "'" + txtQ3_1_3.ClientID + "');");



        //    txtQ4_2_1.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ4_2_1.ClientID + "'" + ","
        //                                                                         + "'" + txtQ4_3_1.ClientID + "'" + ","
        //                                                                         //+ "'" + txtQ4_4_1.ClientID + "'" + ","
        //                                                                         + "'" + txtQ4_5_1.ClientID + "'" + ","
        //                                                                         + "'" + txtQ4_1_1.ClientID + "');");

        //    txtQ4_3_1.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ4_2_1.ClientID + "'" + ","
        //                                                                         + "'" + txtQ4_3_1.ClientID + "'" + ","
        //                                                                         //+ "'" + txtQ4_4_1.ClientID + "'" + ","
        //                                                                         + "'" + txtQ4_5_1.ClientID + "'" + ","
        //                                                                         + "'" + txtQ4_1_1.ClientID + "');");

        //    //txtQ4_4_1.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ4_2_1.ClientID + "'" + ","
        //    //                                                                     + "'" + txtQ4_3_1.ClientID + "'" + ","
        //    //                                                                     + "'" + txtQ4_4_1.ClientID + "'" + ","
        //    //                                                                     + "'" + txtQ4_5_1.ClientID + "'" + ","
        //    //                                                                     + "'" + txtQ4_1_1.ClientID + "');");

        //    txtQ4_5_1.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ4_2_1.ClientID + "'" + ","
        //                                                                         + "'" + txtQ4_3_1.ClientID + "'" + ","
        //                                                                         //+ "'" + txtQ4_4_1.ClientID + "'" + ","
        //                                                                         + "'" + txtQ4_5_1.ClientID + "'" + ","
        //                                                                         + "'" + txtQ4_1_1.ClientID + "');");


        //    txtQ4_2_2.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ4_2_2.ClientID + "'" + ","
        //                                                                         + "'" + txtQ4_3_2.ClientID + "'" + ","
        //                                                                         //+ "'" + txtQ4_4_2.ClientID + "'" + ","
        //                                                                         + "'" + txtQ4_5_2.ClientID + "'" + ","
        //                                                                         + "'" + txtQ4_1_2.ClientID + "');");

        //    txtQ4_3_2.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ4_2_2.ClientID + "'" + ","
        //                                                                         + "'" + txtQ4_3_2.ClientID + "'" + ","
        //                                                                         //+ "'" + txtQ4_4_2.ClientID + "'" + ","
        //                                                                         + "'" + txtQ4_5_2.ClientID + "'" + ","
        //                                                                         + "'" + txtQ4_1_2.ClientID + "');");

        //    //txtQ4_4_2.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ4_2_2.ClientID + "'" + ","
        //    //                                                                     + "'" + txtQ4_3_2.ClientID + "'" + ","
        //    //                                                                     + "'" + txtQ4_4_2.ClientID + "'" + ","
        //    //                                                                     + "'" + txtQ4_5_2.ClientID + "'" + ","
        //    //                                                                     + "'" + txtQ4_1_2.ClientID + "');");

        //    txtQ4_5_2.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ4_2_2.ClientID + "'" + ","
        //                                                                         + "'" + txtQ4_3_2.ClientID + "'" + ","
        //                                                                         //+ "'" + txtQ4_4_2.ClientID + "'" + ","
        //                                                                         + "'" + txtQ4_5_2.ClientID + "'" + ","
        //                                                                         + "'" + txtQ4_1_2.ClientID + "');");

        //    txtQ4_2_3.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ4_2_3.ClientID + "'" + ","
        //                                                                         + "'" + txtQ4_3_3.ClientID + "'" + ","
        //                                                                         //+ "'" + txtQ4_4_3.ClientID + "'" + ","
        //                                                                         + "'" + txtQ4_5_3.ClientID + "'" + ","
        //                                                                         + "'" + txtQ4_1_3.ClientID + "');");

        //    txtQ4_3_3.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ4_2_3.ClientID + "'" + ","
        //                                                                         + "'" + txtQ4_3_3.ClientID + "'" + ","
        //                                                                         //+ "'" + txtQ4_4_3.ClientID + "'" + ","
        //                                                                         + "'" + txtQ4_5_3.ClientID + "'" + ","
        //                                                                         + "'" + txtQ4_1_3.ClientID + "');");

        //    //txtQ4_4_3.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ4_2_3.ClientID + "'" + ","
        //    //                                                                     + "'" + txtQ4_3_3.ClientID + "'" + ","
        //    //                                                                     + "'" + txtQ4_4_3.ClientID + "'" + ","
        //    //                                                                     + "'" + txtQ4_5_3.ClientID + "'" + ","
        //    //                                                                     + "'" + txtQ4_1_3.ClientID + "');");

        //    txtQ4_5_3.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ4_2_3.ClientID + "'" + ","
        //                                                                         + "'" + txtQ4_3_3.ClientID + "'" + ","
        //                                                                         //+ "'" + txtQ4_4_3.ClientID + "'" + ","
        //                                                                         + "'" + txtQ4_5_3.ClientID + "'" + ","
        //                                                                         + "'" + txtQ4_1_3.ClientID + "');");



        //    txtQ2_2_1.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ2_2_1.ClientID + "'" + ","
        //                                                                         + "'" + txtQ2_3_1.ClientID + "'" + ","
        //                                                                         //+ "'" + txtQ2_4_1.ClientID + "'" + ","
        //                                                                         + "'" + txtQ2_5_1.ClientID + "'" + ","
        //                                                                         + "'" + txtQ2_1_1.ClientID + "');");

        //    txtQ2_3_1.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ2_2_1.ClientID + "'" + ","
        //                                                                         + "'" + txtQ2_3_1.ClientID + "'" + ","
        //                                                                         //+ "'" + txtQ2_4_1.ClientID + "'" + ","
        //                                                                         + "'" + txtQ2_5_1.ClientID + "'" + ","
        //                                                                         + "'" + txtQ2_1_1.ClientID + "');");

        //    //txtQ2_4_1.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ2_2_1.ClientID + "'" + ","
        //    //                                                                     + "'" + txtQ2_3_1.ClientID + "'" + ","
        //    //                                                                     + "'" + txtQ2_4_1.ClientID + "'" + ","
        //    //                                                                     + "'" + txtQ2_5_1.ClientID + "'" + ","
        //    //                                                                     + "'" + txtQ2_1_1.ClientID + "');");

        //    txtQ2_5_1.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ2_2_1.ClientID + "'" + ","
        //                                                                         + "'" + txtQ2_3_1.ClientID + "'" + ","
        //                                                                         //+ "'" + txtQ2_4_1.ClientID + "'" + ","
        //                                                                         + "'" + txtQ2_5_1.ClientID + "'" + ","
        //                                                                         + "'" + txtQ2_1_1.ClientID + "');");


        //    txtQ2_2_2.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ2_2_2.ClientID + "'" + ","
        //                                                                         + "'" + txtQ2_3_2.ClientID + "'" + ","
        //                                                                         //+ "'" + txtQ2_4_2.ClientID + "'" + ","
        //                                                                         + "'" + txtQ2_5_2.ClientID + "'" + ","
        //                                                                         + "'" + txtQ2_1_2.ClientID + "');");

        //    txtQ2_3_2.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ2_2_2.ClientID + "'" + ","
        //                                                                         + "'" + txtQ2_3_2.ClientID + "'" + ","
        //                                                                         //+ "'" + txtQ2_4_2.ClientID + "'" + ","
        //                                                                         + "'" + txtQ2_5_2.ClientID + "'" + ","
        //                                                                         + "'" + txtQ2_1_2.ClientID + "');");

        //    //txtQ2_4_2.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ2_2_2.ClientID + "'" + ","
        //    //                                                                     + "'" + txtQ2_3_2.ClientID + "'" + ","
        //    //                                                                     + "'" + txtQ2_4_2.ClientID + "'" + ","
        //    //                                                                     + "'" + txtQ2_5_2.ClientID + "'" + ","
        //    //                                                                     + "'" + txtQ2_1_2.ClientID + "');");

        //    txtQ2_5_2.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ2_2_2.ClientID + "'" + ","
        //                                                                         + "'" + txtQ2_3_2.ClientID + "'" + ","
        //                                                                         //+ "'" + txtQ2_4_2.ClientID + "'" + ","
        //                                                                         + "'" + txtQ2_5_2.ClientID + "'" + ","
        //                                                                         + "'" + txtQ2_1_2.ClientID + "');");

        //    txtQ2_2_3.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ2_2_3.ClientID + "'" + ","
        //                                                                         + "'" + txtQ2_3_3.ClientID + "'" + ","
        //                                                                         //+ "'" + txtQ2_4_3.ClientID + "'" + ","
        //                                                                         + "'" + txtQ2_5_3.ClientID + "'" + ","
        //                                                                         + "'" + txtQ2_1_3.ClientID + "');");

        //    txtQ2_3_3.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ2_2_3.ClientID + "'" + ","
        //                                                                         + "'" + txtQ2_3_3.ClientID + "'" + ","
        //                                                                         //+ "'" + txtQ2_4_3.ClientID + "'" + ","
        //                                                                         + "'" + txtQ2_5_3.ClientID + "'" + ","
        //                                                                         + "'" + txtQ2_1_3.ClientID + "');");

        //    //txtQ2_4_3.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ2_2_3.ClientID + "'" + ","
        //    //                                                                     + "'" + txtQ2_3_3.ClientID + "'" + ","
        //    //                                                                     + "'" + txtQ2_4_3.ClientID + "'" + ","
        //    //                                                                     + "'" + txtQ2_5_3.ClientID + "'" + ","
        //    //                                                                     + "'" + txtQ2_1_3.ClientID + "');");

        //    txtQ2_5_3.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ2_2_3.ClientID + "'" + ","
        //                                                                         + "'" + txtQ2_3_3.ClientID + "'" + ","
        //                                                                         //+ "'" + txtQ2_4_3.ClientID + "'" + ","
        //                                                                         + "'" + txtQ2_5_3.ClientID + "'" + ","
        //                                                                         + "'" + txtQ2_1_3.ClientID + "');");


        //    txtQ2_2_4.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ2_2_4.ClientID + "'" + ","
        //                                                                                 + "'" + txtQ2_3_4.ClientID + "'" + ","
        //                                                                                 //+ "'" + txtQ2_4_4.ClientID + "'" + ","
        //                                                                                 + "'" + txtQ2_5_4.ClientID + "'" + ","
        //                                                                                 + "'" + txtQ2_1_4.ClientID + "');");

        //    txtQ2_3_4.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ2_2_4.ClientID + "'" + ","
        //                                                                         + "'" + txtQ2_3_4.ClientID + "'" + ","
        //                                                                         //+ "'" + txtQ2_4_4.ClientID + "'" + ","
        //                                                                         + "'" + txtQ2_5_4.ClientID + "'" + ","
        //                                                                         + "'" + txtQ2_1_4.ClientID + "');");

        //    //txtQ2_4_4.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ2_2_4.ClientID + "'" + ","
        //    //                                                                     + "'" + txtQ2_3_4.ClientID + "'" + ","
        //    //                                                                     + "'" + txtQ2_4_4.ClientID + "'" + ","
        //    //                                                                     + "'" + txtQ2_5_4.ClientID + "'" + ","
        //    //                                                                     + "'" + txtQ2_1_4.ClientID + "');");

        //    txtQ2_5_4.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ2_2_4.ClientID + "'" + ","
        //                                                                         + "'" + txtQ2_3_4.ClientID + "'" + ","
        //                                                                         //+ "'" + txtQ2_4_4.ClientID + "'" + ","
        //                                                                         + "'" + txtQ2_5_4.ClientID + "'" + ","
        //                                                                         + "'" + txtQ2_1_4.ClientID + "');");

        //    txtQ2_2_5.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ2_2_5.ClientID + "'" + ","
        //                                                                                 + "'" + txtQ2_3_5.ClientID + "'" + ","
        //                                                                                 //+ "'" + txtQ2_4_5.ClientID + "'" + ","
        //                                                                                 + "'" + txtQ2_5_5.ClientID + "'" + ","
        //                                                                                 + "'" + txtQ2_1_5.ClientID + "');");

        //    txtQ2_3_5.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ2_2_5.ClientID + "'" + ","
        //                                                                         + "'" + txtQ2_3_5.ClientID + "'" + ","
        //                                                                         //+ "'" + txtQ2_4_5.ClientID + "'" + ","
        //                                                                         + "'" + txtQ2_5_5.ClientID + "'" + ","
        //                                                                         + "'" + txtQ2_1_5.ClientID + "');");

        //    //txtQ2_4_5.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ2_2_5.ClientID + "'" + ","
        //    //                                                                     + "'" + txtQ2_3_5.ClientID + "'" + ","
        //    //                                                                     + "'" + txtQ2_4_5.ClientID + "'" + ","
        //    //                                                                     + "'" + txtQ2_5_5.ClientID + "'" + ","
        //    //                                                                     + "'" + txtQ2_1_5.ClientID + "');");

        //    txtQ2_5_5.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ2_2_5.ClientID + "'" + ","
        //                                                                         + "'" + txtQ2_3_5.ClientID + "'" + ","
        //                                                                         //+ "'" + txtQ2_4_5.ClientID + "'" + ","
        //                                                                         + "'" + txtQ2_5_5.ClientID + "'" + ","
        //                                                                         + "'" + txtQ2_1_5.ClientID + "');");

        //    txtQ2_2_6.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ2_2_6.ClientID + "'" + ","
        //                                                                                 + "'" + txtQ2_3_6.ClientID + "'" + ","
        //                                                                                 //+ "'" + txtQ2_4_6.ClientID + "'" + ","
        //                                                                                 + "'" + txtQ2_5_6.ClientID + "'" + ","
        //                                                                                 + "'" + txtQ2_1_6.ClientID + "');");

        //    txtQ2_3_6.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ2_2_6.ClientID + "'" + ","
        //                                                                         + "'" + txtQ2_3_6.ClientID + "'" + ","
        //                                                                         //+ "'" + txtQ2_4_6.ClientID + "'" + ","
        //                                                                         + "'" + txtQ2_5_6.ClientID + "'" + ","
        //                                                                         + "'" + txtQ2_1_6.ClientID + "');");

        //    //txtQ2_4_6.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ2_2_6.ClientID + "'" + ","
        //    //                                                                     + "'" + txtQ2_3_6.ClientID + "'" + ","
        //    //                                                                     + "'" + txtQ2_4_6.ClientID + "'" + ","
        //    //                                                                     + "'" + txtQ2_5_6.ClientID + "'" + ","
        //    //                                                                     + "'" + txtQ2_1_6.ClientID + "');");

        //    txtQ2_5_6.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ2_2_6.ClientID + "'" + ","
        //                                                                         + "'" + txtQ2_3_6.ClientID + "'" + ","
        //                                                                         //+ "'" + txtQ2_4_6.ClientID + "'" + ","
        //                                                                         + "'" + txtQ2_5_6.ClientID + "'" + ","
        //                                                                         + "'" + txtQ2_1_6.ClientID + "');");
    }

    private void LoadControls()
    {
        DataSet ds = dal.GetCPPISystemProvidersNew(Convert.ToInt32(Session["GrantApplicantId"].ToString()), AppInfo.FiscalYear);

        tblSysProviders.Visible = true;
        tblCenter.Visible = false;

        if (ds.Tables.Count > 0)
        {
            IsNewProgram = false;
            grdSysProviders.DataSource = ds.Tables[0];
            grdSysProviders.DataBind();
        }

        tblCommands.Visible = false;

        //if (Session["ProgramTypeId"].ToString() != "4")
        //{
        //    if (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count >= 1)
        //    {
        //        btnAddNewProgram.Visible = false;
        //    }
        //    else
        //    {
        //        btnAddNewProgram.Visible = true;
        //    }
        //}
        //else
        {
            btnAddNewProgram.Visible = true;
        }
    }

    /*
    private void BindData(bool isAfterSaved)
    {
        DataSet ds = dal.GetUpkProgramInformation(Int32.Parse(ViewState["GrantUpkSystemProvidersId"].ToString()));

        if (ds.Tables[0].Rows.Count > 0)
        {
            DataRow dr = ds.Tables[0].Rows[0];


            if (tblCenter.Visible)
            {



                rbtnIsAccredited.SelectedIndex = rbtnIsAccredited.Items.IndexOf(rbtnIsAccredited.Items.FindByValue(dr["IsAccredited"].ToString()));

                rbtnIsAccredited_SelectedIndexChanged(this, new EventArgs());


                ddlAccreditation.SelectedIndex = ddlAccreditation.Items.IndexOf(ddlAccreditation.Items.FindByValue(dr["AccreditationTypeId"].ToString()));

                LoadAccreditationDetailsControls();

                if (txtAccreditationNumber.Enabled)
                {
                    txtAccreditationNumber.Text = dr["AccreditationNumber"].ToString();
                }

                if (txtAccreditationExpDate.Enabled)
                {
                    txtAccreditationExpDate.Text = dr["AccreditationExpirationDate"].ToString();
                }

                if (txtAccreditationEarnDate.Enabled)
                {
                    txtAccreditationEarnDate.Text = dr["AccreditationEarnDate"].ToString();
                }
            }

        }
        else
        {
            LoadAccreditationDetailsControls();
        }

        tblCommands.Visible = true;

        if (isAfterSaved)
        {
            tblSuccess.Visible = true;
        }
        else
        {
            tblSuccess.Visible = false;
        }



        if (ds.Tables[1].Rows.Count > 0)
        {
            foreach (DataRow dr in ds.Tables[1].Rows)
            {
                chklAssessmentInstrument.Items.FindByValue(dr["AssessmentInstrumentId"].ToString()).Selected = true;
            }
        }
    }
    */

    //New
    private void BindData(bool isAfterSaved)
    {
        tblSuccess.Visible = false;

        SortedList<string, string> questions = dal.GetCPPIProgramSurveyData(Int32.Parse(ViewState["SystemProviderId"].ToString()));

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

                        if (dropDown.Items.FindByValue(value) != null)
                        {
                            dropDown.SelectedValue = value;
                        }
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
                    else if (control is System.Web.UI.WebControls.CheckBox)
                    {
                        CheckBox rdoButton = (CheckBox)((WebControl)ContentPlaceHolder.FindControl(questionId));
                        rdoButton.Checked = (value == "1") ? true : false;
                    }
                    else if (control is System.Web.UI.WebControls.CheckBoxList)
                    {
                        CheckBoxList rdoButton = (CheckBoxList)((WebControl)ContentPlaceHolder.FindControl(questionId));

                        if (rdoButton.Items.FindByValue(value) != null)
                        {
                            rdoButton.SelectedValue = value;
                        }
                    }
                }
            }

            rbtnIsAccredited_SelectedIndexChanged(null, null);

            ddlAccreditation.SelectedValue = questions["ddlAccreditation"];
            txtAccreditationEarnDate.Text = questions["txtAccreditationEarnDate"];
            txtAccreditationExpDate.Text = questions["txtAccreditationExpDate"];
            txtAccreditationNumber.Text = questions["txtAccreditationNumber"];

            if (rbtnIsCQIP.SelectedValue == "1")
            {
                txtCQIPLastUpdated.Enabled = true;
            }
            else
            {
                txtCQIPLastUpdated.Enabled = false;
            }

            if (rdoQRISLevel.SelectedValue == "0")
            {
                rbtnIsCQIP.Enabled = false;
                rbtnIsCQIP.SelectedIndex = 1;
                CustomValidator7.Enabled = false;
                txtCQIPLastUpdated.Enabled = false;
                txtCQIPLastUpdated.Text = "";
                CustomValidator26.Enabled = false;
            }

            if (rbtnIsProgramLicensed.SelectedValue == "0")
            {
                txtEECProgramNumber.Enabled = false;
                txtEECProgramNumber.Text = "";
                RequiredFieldValidator1.Enabled = false;
                CompareValidator14.Enabled = false;
            }

            //if (rbtnFormalCurriculum.SelectedValue == "1")
            //{
            //    EnableQuestion8Options(true);
            //}
            //else
            //{
            //    EnableQuestion8Options(false);
            //}

            if (rbtnScreenTool.SelectedValue == "1")
            {
                EnableQuestion9Options(true);
            }
            else
            {
                EnableQuestion9Options(false);
            }

            //if (rbtnAssessmentTool.SelectedValue == "1")
            //{
            //    EnableQuestion10Options(true);
            //}
            //else
            //{
            //    EnableQuestion10Options(false);
            //}
            /*
            if (string.IsNullOrEmpty(rbtnIsAccredited.SelectedValue) || rbtnIsAccredited.SelectedValue == "0")
            {
                trAccr.Visible = false;
            }
            else
            {
                trAccr.Visible = true;
            }
            */

            //if (rbtnFormalCurriculum.SelectedValue == "1")
            //{
            //    EnableQuestion8Options(true);
            //}
            //else
            //{
            //    EnableQuestion8Options(false);
            //}

            if (rbtnScreenTool.SelectedValue == "1")
            {
                EnableQuestion9Options(true);
            }
            else
            {
                EnableQuestion9Options(false);
            }

            //Get Contact info data
            DataSet dsContact = dal.GetSubcontractorContactData(Int32.Parse(ViewState["SystemProviderId"].ToString()), Int32.Parse(Session["GrantApplicantID"].ToString()), ContactID, 0);

            if (dsContact.Tables.Count > 0 && dsContact.Tables[0].Rows.Count >= 1)
            {
                DataRow drContact = dsContact.Tables[0].Rows[0];
                ContactID = Int32.Parse(drContact["ContactID"].ToString());
                txtProgContactName.Text = drContact["SubcontractorContactName"].ToString();
                txtProgAddress1.Text = drContact["SubcontractorAddress1"].ToString();
                txtProgAddress2.Text = drContact["SubcontractorAddress2"].ToString();
                txtProgCity.Text = drContact["SubcontractorCity"].ToString();
                txtProgState.Text = drContact["SubcontractorState"].ToString();
                txtProgZipcode.Text = drContact["SubcontractorZipcode"].ToString();
                txtProgPhone.Text = drContact["SubcontractorPhone"].ToString();
                txtProgFAX.Text = drContact["SubcontractorFAX"].ToString();
                txtProgEmail.Text = drContact["SubcontractorEmail"].ToString();
            }
            else
            {
                ContactID = -1;
            }

            //get any errors
            if (hasValidationErrors(isAfterSaved))
            {
                tblFailed.Visible = true;
                tblSuccess.Visible = false;
            }
            else
            {
                tblFailed.Visible = false;
                tblSuccess.Visible = true;
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

        //if (Session["ProgramTypeId"].ToString() != "4")
        //{
        //    txtProgramName.Text = Session["Program Name"].ToString();
        //    txtProgramName.Enabled = false;
        //}

        tblCommands.Visible = true;
    }

    private bool hasValidationErrors(bool isAfterSaved)
    {
        int errorCount = 0;

        //setDefaultStyle();
        //lstErrors.Items.Clear();

        List<string> lstErrorBoxes = new List<string>();

        return lstErrorBoxes.Count > 0;
    }
    /*
    private string GetAssessmentInstruments()
    {
        StringBuilder xmlString = new StringBuilder();
        xmlString.Append("<root>");

        foreach (ListItem li in chklAssessmentInstrument.Items)
        {
            if (li.Selected)
                xmlString.Append(String.Format("<Tool><AssessmentInstrumentId>{0}</AssessmentInstrumentId></Tool>", li.Value));
        }
        xmlString.Append("</root>");

        return xmlString.ToString();
    }
    */

    protected void rbtnIsAccredited_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlAccreditation.Enabled = true;
        ddlAccreditation.Items.Clear();
        ddlAccreditation.Items.Add(new ListItem("---------", "0"));

        //if (Session["ProgramTypeId"].ToString() == "1" || Session["ProgramTypeId"].ToString() == "2" || Session["ProgramTypeId"].ToString() == "3")
        if (cboProgramType.SelectedValue.ToString() == "1" || cboProgramType.SelectedValue.ToString() == "2" || cboProgramType.SelectedValue.ToString() == "3")
        {
            if (rbtnIsAccredited.SelectedValue == "1")
            {
                ddlAccreditation.Items.Add(new ListItem("NAEYC", "1"));
                ddlAccreditation.Items.Add(new ListItem("NEASC", "2"));
            }
            else
            {
                ddlAccreditation.Enabled = false;
            }
        }
        //else if (Session["ProgramTypeId"].ToString() == "4")
        else if (cboProgramType.SelectedValue.ToString() == "4")
        {
            if (rbtnIsAccredited.SelectedValue == "1")
            {
                ddlAccreditation.Items.Add(new ListItem("NAFCC", "3"));
            }
            else
            {
                ddlAccreditation.Enabled = false;
                /*
                ddlAccreditation.Items.Add(new ListItem("CDA", "4"));
                ddlAccreditation.Items.Add(new ListItem("AA", "5"));
                ddlAccreditation.Items.Add(new ListItem("BA", "6"));
                ddlAccreditation.Items.Add(new ListItem("Master's Degree", "7"));
                */
            }
        }

        ddlAccreditation.SelectedIndex = 0;

        LoadAccreditationDetailsControls();

        /*
        if (string.IsNullOrEmpty(rbtnIsAccredited.SelectedValue) || rbtnIsAccredited.SelectedValue == "0")
        {
            trAccr.Visible = true;
        }
        else
        {
            trAccr.Visible = false;
        }
        */
    }

    protected void grdSysProviders_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            DataRowView dr = (DataRowView)e.Row.DataItem;

            if (e.Row.RowType == DataControlRowType.DataRow)
                e.Row.Cells[e.Row.Cells.Count - 2].Attributes.Add("onclick", "javascript:return confirm('Are you sure you want to delete this program?');");

            e.Row.Cells[2].Text = "";   //Moved Address to Cell[1]; Remove Amount from display forn 
            //e.Row.Cells[2].Text = "$" + Single.Parse(dr["Amount"].ToString()).ToString("N2");

            ((HyperLink)e.Row.FindControl("lnkClassrooms")).Text = "Edit Classroom(s)";
            ((HyperLink)e.Row.FindControl("lnkClassrooms")).NavigateUrl = "CPPIClass.aspx?pid=" + dr["SystemProviderId"].ToString();
        }
    }

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

                rbtn = (RadioButtonList)gr.FindControl("rbtnIsAccredited");

                ddl = (DropDownList)gr.FindControl("ddlAccreditation");
                txtNumber = (TextBox)gr.FindControl("txtAccreditationNumber");
                txtDate = (TextBox)gr.FindControl("txtAccreditationExpirationDate");
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
            if (rbtnIsProgramLicensed.SelectedIndex == 1)
            {
                RequiredFieldValidator1.Enabled = false;
                txtEECProgramNumber.Enabled = false;
                txtEECProgramNumber.Text = "";
                CompareValidator14.Enabled = false;
            }
            else
            {
                RequiredFieldValidator1.Enabled = true;
                txtEECProgramNumber.Enabled = true;
                CompareValidator14.Enabled = true;
                         
            }
        }
    }

    protected void CustomValidator5_ServerValidate(object source, ServerValidateEventArgs args)
    {
    }

    protected void CustomValidator6_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (tblCenter.Visible)
        {
            if (rdoQRISLevel.SelectedIndex == -1)
            {
                args.IsValid = false;
            }
            if (rdoQRISLevel.SelectedIndex == 4)
            {
                rbtnIsCQIP.Enabled = false;
                rbtnIsCQIP.SelectedIndex = 1;
                CustomValidator7.Enabled = false;
                txtCQIPLastUpdated.Enabled = false;
                txtCQIPLastUpdated.Text = "";
                CustomValidator26.Enabled = false;
            }
            else
            {
                rbtnIsCQIP.Enabled = true;
                //rbtnIsCQIP.SelectedIndex = -1;
                CustomValidator7.Enabled = true;
                txtCQIPLastUpdated.Enabled = true;
                CustomValidator26.Enabled = true;
            }
        }
    }

    protected void CustomValidatorHispanic_ServerValidate(object source, ServerValidateEventArgs args)
    {
        string TotalPct;
        TotalPct = (Double.Parse(txtHispanicPctCommunity.Text) + Double.Parse(txtNonHispanicPctCommunity.Text)).ToString("#0.00");
        //Response.Write("TotalPct =" + TotalPct);
        if (TotalPct != "100.00")
        {
            args.IsValid = false;
        }
    }

    protected void btnBackToHome_Click(object sender, EventArgs e)
    {
        Response.Redirect("CPPIProgramInformation.aspx");
    }

    /*
       protected void btnSaveHomeOld_Click(object sender, EventArgs e)
       {
           if (Page.IsValid)
           {
               Nullable<DateTime> dt = null;

               int retVal = dal.SaveCPPIProgramInformation(Convert.ToInt32(Session["GrantApplicantId"].ToString())
                       , ViewState["GrantCPPISystemProvidersId"].ToString()
                       , txtProgramName.Text
                       , Int32.Parse(cboProgramType.SelectedValue.ToString())
                       , txtEECProgramNumber.Text
                       , rdoQRISLevel.SelectedValue
                       , tblCenter.Visible ? (rbtnIsHeadStartProgram.SelectedValue == "1" ? true : false) : false
                       , tblCenter.Visible ? (rbtnIsProgramLicensed.SelectedValue == "1" ? true : false) : false
                       , tblCenter.Visible ? (rbtnIsCQIP.SelectedValue == "1" ? true : false) : false
                       , txtCQIPLastUpdated.Enabled ? DateTime.Parse(txtCQIPLastUpdated.Text.Trim()) : dt
                       , tblCenter.Visible ? (rbtnScreenTool.SelectedValue == "1" ? true : false) : false                   
                       //, GetAssessmentInstruments()
                       //, txtAssessmentInstrumentNotes.Text
                       //, Convert.ToInt32(rbtnCPPIVersion.SelectedValue)
                       , Convert.ToInt32(rbtnIsAccredited.SelectedValue)
                       , Convert.ToInt32(ddlAccreditation.SelectedValue)
                       , txtAccreditationNumber.Text.Trim()
                       , txtAccreditationExpDate.Enabled ? DateTime.Parse(txtAccreditationExpDate.Text.Trim()) : dt
                       , txtAccreditationEarnDate.Enabled ? DateTime.Parse(txtAccreditationEarnDate.Text.Trim()) : dt
                       , txtCurriculaPlan.Text.Trim()
                       //
                       , txtHispanicPctCommunity.Text == "" ? 0 : Convert.ToDecimal(txtHispanicPctCommunity.Text)
                       , txtHispanicPctMarch1.Text == "" ? 0 : Convert.ToDecimal(txtHispanicPctMarch1.Text)
                       , txtHispanicPctJune1.Text == "" ? 0 : Convert.ToDecimal(txtHispanicPctJune1.Text)
                       , txtNonHispanicPctCommunity.Text == "" ? 0 : Convert.ToDecimal(txtNonHispanicPctCommunity.Text)
                       , txtNonHispanicPctMarch1.Text == "" ? 0 : Convert.ToDecimal(txtNonHispanicPctMarch1.Text)
                       , txtNonHispanicPctJune1.Text == "" ? 0 : Convert.ToDecimal(txtNonHispanicPctJune1.Text)
                       , txtAmericanIndianAlaskaPctCommunity.Text == "" ? 0 : Convert.ToDecimal(txtAmericanIndianAlaskaPctCommunity.Text)
                       , txtAmericanIndianAlaskaPctMarch1.Text == "" ? 0 : Convert.ToDecimal(txtAmericanIndianAlaskaPctMarch1.Text)
                       , txtAmericanIndianAlaskaPctJune1.Text == "" ? 0 : Convert.ToDecimal(txtAmericanIndianAlaskaPctJune1.Text)
                       , txtAsianPctCommunity.Text == "" ? 0 : Convert.ToDecimal(txtAsianPctCommunity.Text)
                       , txtAsianPctMarch1.Text == "" ? 0 : Convert.ToDecimal(txtAsianPctMarch1.Text)
                       , txtAsianPctJune1.Text == "" ? 0 : Convert.ToDecimal(txtAsianPctJune1.Text)
                       , txtBlackAfricanPctCommunity.Text == "" ? 0 : Convert.ToDecimal(txtBlackAfricanPctCommunity.Text)
                       , txtBlackAfricanPctMarch1.Text == "" ? 0 : Convert.ToDecimal(txtBlackAfricanPctMarch1.Text)
                       , txtBlackAfricanPctJune1.Text == "" ? 0 : Convert.ToDecimal(txtBlackAfricanPctJune1.Text)
                       , txtHawaiianPacificPctCommunity.Text == "" ? 0 : Convert.ToDecimal(txtHawaiianPacificPctCommunity.Text)
                       , txtHawaiianPacificPctMarch1.Text == "" ? 0 : Convert.ToDecimal(txtHawaiianPacificPctMarch1.Text)
                       , txtHawaiianPacificPctJune1.Text == "" ? 0 : Convert.ToDecimal(txtHawaiianPacificPctJune1.Text)
                       , txtWhiteCaucasianPctCommunity.Text == "" ? 0 : Convert.ToDecimal(txtWhiteCaucasianPctCommunity.Text)
                       , txtWhiteCaucasianPctMarch1.Text == "" ? 0 : Convert.ToDecimal(txtWhiteCaucasianPctMarch1.Text)
                       , txtWhiteCaucasianPctJune1.Text == "" ? 0 : Convert.ToDecimal(txtWhiteCaucasianPctJune1.Text)
                       , txtBiracialMultiPctCommunity.Text == "" ? 0 : Convert.ToDecimal(txtBiracialMultiPctCommunity.Text)
                       , txtBiracialMultiPctMarch1.Text == "" ? 0 : Convert.ToDecimal(txtBiracialMultiPctMarch1.Text)
                       , txtBiracialMultiPctJune1.Text == "" ? 0 : Convert.ToDecimal(txtBiracialMultiPctJune1.Text)
                       , txtOtherRacePctCommunity.Text == "" ? 0 : Convert.ToDecimal(txtOtherRacePctCommunity.Text)
                       , txtOtherRacePctMarch1.Text == "" ? 0 : Convert.ToDecimal(txtOtherRacePctMarch1.Text)
                       , txtOtherRacePctJune1.Text == "" ? 0 : Convert.ToDecimal(txtOtherRacePctJune1.Text)
                       , txtUnspecifiedPctCommunity.Text == "" ? 0 : Convert.ToDecimal(txtUnspecifiedPctCommunity.Text)
                       , txtUnspecifiedPctMarch1.Text == "" ? 0 : Convert.ToDecimal(txtUnspecifiedPctMarch1.Text)
                       , txtUnspecifiedPctJune1.Text == "" ? 0 : Convert.ToDecimal(txtUnspecifiedPctJune1.Text)
                       , Convert.ToInt32(txtChildrenWithIEPProposed.Text)
                       , Convert.ToInt32(txtChildrenWithIEPMarch1.Text)
                       , Convert.ToInt32(txtChildrenWithIEPJune1.Text)
                       , Convert.ToInt32(txtChildrenSpeakNonEnglishProposed.Text)
                       , Convert.ToInt32(txtChildrenSpeakNonEnglishMarch1.Text)
                       , Convert.ToInt32(txtChildrenSpeakNonEnglishJune1.Text)
                       , AppInfo.FiscalYear );

               ViewState["GrantCPPISystemProvidersId"] = retVal;

               dal.SaveCPPIPartStatus(Convert.ToInt32(Session["GrantApplicantId"].ToString()), "2", 1);

               //if (AppInfo.Competitive)
               //{
               //    float eligAmount = dal.UpdateUPKEligAmount(Convert.ToInt32(Session["GrantApplicantId"].ToString()));
               //    Session["Eligibility Amount"] = eligAmount.ToString("N2");
               //    Master.ReloadEligibilityAmount();
               //}

               loadAgencyInfo(Convert.ToInt32(Session["GrantApplicantId"].ToString()));

               BindData(true);
           }
           else
           {
               //tblErrorMessage.Visible = true;
           }
       }

   */
    //New
    protected void btnSaveHome_Click(object sender, EventArgs e)
    {
        tblSuccess.Visible = false;

        if (!Page.IsValid)
        {
            tblFailed.Visible = true;
        }
        else
        {
            tblFailed.Visible = false;

            int SystemProviderId = ViewState["SystemProviderId"] == null ? -1 : Int32.Parse(ViewState["SystemProviderId"].ToString());

            Control[] allControls = FlattenHierachy(Page);
            string id;
            string value = "";

            foreach (Control control in allControls)
            {
                id = control.ID;
                if ((control is System.Web.UI.WebControls.TextBox) ||
                    (control is System.Web.UI.WebControls.DropDownList) ||
                    (control is System.Web.UI.WebControls.RadioButton) ||
                    (control is System.Web.UI.WebControls.RadioButtonList) ||
                    (control is System.Web.UI.WebControls.HiddenField) ||
                    (control is System.Web.UI.WebControls.CheckBox) ||
                    (control is System.Web.UI.WebControls.CheckBoxList))
                {
                    if (control is System.Web.UI.WebControls.TextBox)
                    {
                        //if (id == "txtQ2_1_1")
                        //{
                        //    value = (Int32.Parse(string.IsNullOrEmpty(txtQ2_2_1.Text) ? "0" : txtQ2_2_1.Text) +
                        //    Int32.Parse(string.IsNullOrEmpty(txtQ2_3_1.Text) ? "0" : txtQ2_3_1.Text) +
                        //    Int32.Parse(string.IsNullOrEmpty(txtQ2_5_1.Text) ? "0" : txtQ2_5_1.Text)).ToString();
                        //}
                        //else if (id == "txtQ2_1_2")
                        //{
                        //    value = (Int32.Parse(string.IsNullOrEmpty(txtQ2_2_2.Text) ? "0" : txtQ2_2_2.Text) +
                        //    Int32.Parse(string.IsNullOrEmpty(txtQ2_3_2.Text) ? "0" : txtQ2_3_2.Text) +
                        //    Int32.Parse(string.IsNullOrEmpty(txtQ2_5_2.Text) ? "0" : txtQ2_5_2.Text)).ToString();
                        //}
                        //else if (id == "txtQ4_1_1")
                        //{
                        //    value = (Int32.Parse(string.IsNullOrEmpty(txtQ4_2_1.Text) ? "0" : txtQ4_2_1.Text) +
                        //    Int32.Parse(string.IsNullOrEmpty(txtQ4_3_1.Text) ? "0" : txtQ4_3_1.Text) +
                        //    Int32.Parse(string.IsNullOrEmpty(txtQ4_5_1.Text) ? "0" : txtQ4_5_1.Text)).ToString();
                        //}
                        //else if (id == "txtQ3_1_1")
                        //{
                        //    value = (Int32.Parse(string.IsNullOrEmpty(txtQ3_2_1.Text) ? "0" : txtQ3_2_1.Text) +
                        //    Int32.Parse(string.IsNullOrEmpty(txtQ3_3_1.Text) ? "0" : txtQ3_3_1.Text) +
                        //    Int32.Parse(string.IsNullOrEmpty(txtQ3_5_1.Text) ? "0" : txtQ3_5_1.Text)).ToString();
                        //}
                        //else 
                        if (id == "txtQ1_1_1")
                        {
                            value = (Int32.Parse(string.IsNullOrEmpty(txtQ1_2_1.Text) ? "0" : txtQ1_2_1.Text) +
                            Int32.Parse(string.IsNullOrEmpty(txtQ1_3_1.Text) ? "0" : txtQ1_3_1.Text) +
                            Int32.Parse(string.IsNullOrEmpty(txtQ1_5_1.Text) ? "0" : txtQ1_5_1.Text)).ToString();
                        }
                        //else if (id == "txtQ1_1_2")
                        //{
                        //    value = (Int32.Parse(string.IsNullOrEmpty(txtQ1_2_2.Text) ? "0" : txtQ1_2_2.Text) +
                        //    Int32.Parse(string.IsNullOrEmpty(txtQ1_3_2.Text) ? "0" : txtQ1_3_2.Text) +
                        //    Int32.Parse(string.IsNullOrEmpty(txtQ1_5_2.Text) ? "0" : txtQ1_5_2.Text)).ToString();
                        //}
                        //else if (id == "txtQ1_1_3")
                        //{
                        //    value = (Int32.Parse(string.IsNullOrEmpty(txtQ1_2_3.Text) ? "0" : txtQ1_2_3.Text) +
                        //    Int32.Parse(string.IsNullOrEmpty(txtQ1_3_3.Text) ? "0" : txtQ1_3_3.Text) +
                        //    Int32.Parse(string.IsNullOrEmpty(txtQ1_5_3.Text) ? "0" : txtQ1_5_3.Text)).ToString();
                        //}
                        else if (id == "txtProgAddress")
                        {
                            value = (txtProgAddress1.Text + " " + txtProgAddress2.Text + " " + txtProgCity + ", " + txtProgState + " " + txtProgZipcode.Text);
                        }
                        else
                            value = (control as TextBox).Text;

                    }
                    //else if (control is System.Web.UI.WebControls.HiddenField)
                    //{
                    //    value = (control as HiddenField).Value;
                    //}
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
                    else if (control is System.Web.UI.WebControls.CheckBox)
                    {
                        value = ((control as CheckBox).Checked) ? "1" : "0";
                    }
                    else if (control is System.Web.UI.WebControls.CheckBoxList)
                    {
                        value = (control as CheckBoxList).SelectedValue;
                    }

                    SystemProviderId = dal.SaveCPPIProgramSurveyData(SystemProviderId, id, value, Convert.ToInt32(Session["GrantApplicantId"].ToString()), UpdatePeriod);
                }
            }

            //if (AppInfo.Competitive)
            //{
            //    float eligAmount = dal.UpdateUPKEligAmountNew(Convert.ToInt32(Session["GrantApplicantId"].ToString()));
            //    Session["Eligibility Amount"] = eligAmount.ToString("N2");
            //    Master.ReloadEligibilityAmount();
            //}

            ViewState["SystemProviderId"] = SystemProviderId;

            //Now save the Contact info
            ContactID = dal.SaveSubcontractorContactData(ContactID, Convert.ToInt32(Session["GrantApplicantId"].ToString()), SystemProviderId, 0,
                                                    txtProgramName.Text, txtProgContactName.Text, txtProgAddress1.Text, txtProgAddress2.Text,
                                                    txtProgCity.Text, txtProgState.Text, txtProgZipcode.Text, txtProgPhone.Text, txtProgFAX.Text, txtProgEmail.Text, 0);

            BindData(true);
        }
    }

    protected void btnCancelSave_Click(object sender, EventArgs e)
    {
        Response.Redirect("CPPIProgramInformation.aspx");
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
        dal.DeleteCPPIProgramNew(Convert.ToInt32(grdSysProviders.DataKeys[e.RowIndex].Value));

        //if (AppInfo.Competitive)
        //{
        //    float eligAmount = dal.UpdateUPKEligAmountNew(Convert.ToInt32(Session["GrantApplicantId"].ToString()));
        //    Session["Eligibility Amount"] = eligAmount.ToString("N2");
        //    Master.ReloadEligibilityAmount();
        //}

        loadAgencyInfo(Convert.ToInt32(Session["GrantApplicantId"].ToString()));

        LoadControls();
    }

    protected void btnAddNewProgram_Click(object sender, EventArgs e)
    {
        ViewState["SystemProviderId"] = "-1";

        tblSysProviders.Visible = false;
        tblCenter.Visible = true;
        tblCommands.Visible = true;

        BindData(false);
    }

    private void LoadAccreditationDetailsControls()
    {
        //Accreditation Date Earned
        txtAccreditationEarnDate.Text = "";
        btnCalendarEarnDate.Visible = false;

        //if (rbtnIsAccredited.SelectedValue == "1")
        //{
        //    txtAccreditationEarnDate.Enabled = false;
        //}
        //else
        //{
        //if (ddlAccreditation.SelectedItem.ToString() == "AA" ||
        //    ddlAccreditation.SelectedItem.ToString() == "BA" ||
        //    ddlAccreditation.SelectedItem.ToString() == "Master's Degree")
        if (ddlAccreditation.SelectedItem.ToString() == "NAEYC" ||
        ddlAccreditation.SelectedItem.ToString() == "NEASC" ||
        ddlAccreditation.SelectedItem.ToString() == "NAFCC" ||
        ddlAccreditation.SelectedItem.ToString() == "CDA")
        {
                txtAccreditationEarnDate.Enabled = true;
                btnCalendarEarnDate.Visible = true;
            }
            else
            {
                txtAccreditationEarnDate.Enabled = false;
            }
        //}

        //Accreditation Expiration Earned
        txtAccreditationExpDate.Text = "";
        btnCalendarExpDate.Visible = false;

        if (ddlAccreditation.SelectedItem.ToString() == "NAEYC" ||
            ddlAccreditation.SelectedItem.ToString() == "NEASC" ||
            ddlAccreditation.SelectedItem.ToString() == "NAFCC" ||
            ddlAccreditation.SelectedItem.ToString() == "CDA")
        {
            txtAccreditationExpDate.Enabled = true;
            btnCalendarExpDate.Visible = true;
        }
        else
        {
            txtAccreditationExpDate.Enabled = false;
        }

        //Accreditation number
        txtAccreditationNumber.Text = "";

        if (ddlAccreditation.SelectedItem.ToString() == "NAEYC" ||
            ddlAccreditation.SelectedItem.ToString() == "NEASC" ||
            ddlAccreditation.SelectedItem.ToString() == "NAFCC")
        {
            txtAccreditationNumber.Enabled = true;
        }
        else
        {
            txtAccreditationNumber.Enabled = false;
        }
    }

    protected void ddlAccreditation_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlAccreditation.SelectedValue != "0")
        {
            LoadAccreditationDetailsControls();
        }
        else
        {
            txtAccreditationExpDate.Text = "";
            txtAccreditationEarnDate.Text = "";
            txtAccreditationNumber.Text = "";

            txtAccreditationExpDate.Enabled = false;
            txtAccreditationEarnDate.Enabled = false;
            txtAccreditationNumber.Enabled = false;
        }
    }

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
            Session["Program Name"] = ds.Tables[0].Rows[0]["ProgramName"].ToString();
            Session["ProgramTypeId"] = ds.Tables[0].Rows[0]["ProgramTypeId"].ToString();
        }
    }

    protected void CustomValidator24_ServerValidate(object source, ServerValidateEventArgs args)
    {
        /*
        if (rbtnIsAccredited.SelectedValue == "0" && (Session["ProgramTypeId"].ToString() == "1" || Session["ProgramTypeId"].ToString() == "2" || Session["ProgramTypeId"].ToString() == "3"))
        {
            tblFailed.Visible = true;
            args.IsValid = false;
        }
        else
        {
            tblFailed.Visible = false;
            args.IsValid = true;
        }
        */
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

    //private void EnableQuestion8Options(bool enabled)
    //{
    //    txtQ8YesOption1.Enabled = enabled;
    //    txtQ8YesOption2.Enabled = enabled;
    //    txtQ8YesOption3.Enabled = enabled;
    //    txtQ8YesOption4.Enabled = enabled;
    //    txtQ8YesOption5.Enabled = enabled;
    //    txtQ8YesOption6.Enabled = enabled;
    //    txtQ8YesOption7.Enabled = enabled;

    //    if (!enabled)
    //    {
    //        txtQ8YesOption1.Checked = false;
    //        txtQ8YesOption2.Checked = false;
    //        txtQ8YesOption3.Checked = false;
    //        txtQ8YesOption4.Checked = false;
    //        txtQ8YesOption5.Checked = false;
    //        txtQ8YesOption6.Checked = false;
    //        txtQ8YesOption7.Checked = false;
    //    }
    //}

    private void EnableQuestion9Options(bool enabled)
    {
        txtQ9YesOption1.Enabled = enabled;
        txtQ9YesOption2.Enabled = enabled;
        txtQ9YesOption3.Enabled = enabled;
        txtQ9YesOption4.Enabled = enabled;
        txtQ9YesOption5.Enabled = enabled;

        if (!enabled)
        {
            txtQ9YesOption1.Checked = false;
            txtQ9YesOption2.Checked = false;
            txtQ9YesOption3.Checked = false;
            txtQ9YesOption4.Checked = false;
            txtQ9YesOption5.Checked = false;

            txtScreenToolOther.Text = "";
            txtScreenToolOther.Enabled = false;
        }
        else
        {
            txtScreenToolOther.Enabled = true;
        }
    }

    //private void EnableQuestion10Options(bool enabled)
    //{
    //    txtQ10YesOption1.Enabled = enabled;
    //    txtQ10YesOption2.Enabled = enabled;
    //    txtQ10YesOption3.Enabled = enabled;

    //    if (!enabled)
    //    {
    //        txtQ10YesOption1.Checked = false;
    //        txtQ10YesOption2.Checked = false;
    //        txtQ10YesOption3.Checked = false;
    //    }
    //}

    //protected void rbtnFormalCurriculum_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    if (rbtnFormalCurriculum.SelectedValue == "1")
    //    {
    //        EnableQuestion8Options(true);
    //    }
    //    else
    //    {
    //        EnableQuestion8Options(false);
    //    }
    //}

    protected void rbtnScreenTool_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (rbtnScreenTool.SelectedValue == "1")
        {
            EnableQuestion9Options(true);
        }
        else
        {
            EnableQuestion9Options(false);
        }
    }

    //protected void rbtnAssessmentTool_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    if (rbtnAssessmentTool.SelectedValue == "1")
    //    {
    //        EnableQuestion10Options(true);
    //    }
    //    else
    //    {
    //        EnableQuestion10Options(false);
    //    }
    //}

    //protected void CustomValidator10_ServerValidate(object source, ServerValidateEventArgs args)
    //{
    //    if (rbtnFormalCurriculum.SelectedValue == "1" &&
    //        !txtQ8YesOption1.Checked &&
    //        !txtQ8YesOption2.Checked &&
    //        !txtQ8YesOption3.Checked &&
    //        !txtQ8YesOption4.Checked &&
    //        !txtQ8YesOption5.Checked &&
    //        !txtQ8YesOption6.Checked &&
    //        !txtQ8YesOption7.Checked)
    //    {
    //        args.IsValid = false;
    //    }
    //}

    protected void CustomValidator12_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (rbtnScreenTool.SelectedValue == "1" &&
            !txtQ9YesOption1.Checked &&
            !txtQ9YesOption2.Checked &&
            !txtQ9YesOption3.Checked &&
            !txtQ9YesOption4.Checked &&
            !txtQ9YesOption5.Checked)
        {
            args.IsValid = false;
        }
    }

    //protected void CustomValidator14_ServerValidate(object source, ServerValidateEventArgs args)
    //{
    //    if (rbtnAssessmentTool.SelectedValue == "1" &&
    //        !txtQ10YesOption1.Checked &&
    //        !txtQ10YesOption2.Checked &&
    //        !txtQ10YesOption3.Checked)
    //    {
    //        args.IsValid = false;
    //    }
    //}

    protected void CustomValidator25_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (txtQ9YesOption5.Checked && string.IsNullOrEmpty(txtScreenToolOther.Text))
        {
            args.IsValid = false;
        }
    }

    protected void rbtnIsCQIP_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (rbtnIsCQIP.SelectedValue == "1")
        {
            txtCQIPLastUpdated.Enabled = true;
            CustomValidator7.Enabled = true;
        }
        else
        {
            txtCQIPLastUpdated.Text = "";
            txtCQIPLastUpdated.Enabled = false;
            CustomValidator7.Enabled = false;
        }
    }

    protected void CustomValidator7_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (tblCenter.Visible)
        {
            if (rbtnIsCQIP.SelectedIndex == -1)
            {
                args.IsValid = false;
            }
            else if (rbtnIsCQIP.SelectedValue == "1")
            {
                txtCQIPLastUpdated.Enabled = true;
                CustomValidator7.Enabled = true;
            }
            else
            {
                txtCQIPLastUpdated.Text = "";
                txtCQIPLastUpdated.Enabled = false;
                CustomValidator7.Enabled = false;
            }


        }
    }

    protected void CustomValidator11_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (tblCenter.Visible)
        {
            if (rbtnScreenTool.SelectedIndex == -1)
            {
                args.IsValid = false;
            }

        }
    }

    //protected void CustomValidator13_ServerValidate(object source, ServerValidateEventArgs args)
    //{
    //    if (tblCenter.Visible)
    //    {
    //        if (rbtnAssessmentTool.SelectedIndex == -1)
    //        {
    //            args.IsValid = false;
    //        }

    //    }
    //}

    //protected void CustomValidator9_ServerValidate(object source, ServerValidateEventArgs args)
    //{
    //    if (tblCenter.Visible)
    //    {
    //        if (rbtnFormalCurriculum.SelectedIndex == -1)
    //        {
    //            args.IsValid = false;
    //        }

    //    }
    //}

    protected void CustomValidator26_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (txtCQIPLastUpdated.Enabled && string.IsNullOrEmpty(txtCQIPLastUpdated.Text.Trim()))
        {
            args.IsValid = false;
        }
    }

    //Table 3 4-year-old need to be <= Table 1
    //protected void CustomValidator8_ServerValidate(object source, ServerValidateEventArgs args)
    //{
    //    if (Convert.ToInt32(txtQ3_3_1.Text) > Convert.ToInt32(txtQ1_3_1.Text)
    //     || Convert.ToInt32(txtQ3_3_2.Text) > Convert.ToInt32(txtQ1_3_2.Text)
    //     || Convert.ToInt32(txtQ3_3_3.Text) > Convert.ToInt32(txtQ1_3_3.Text))
    //    {
    //        args.IsValid = false;
    //    }
    //}

    //Table 2 3-year-old IEP children need to add to Table 1
    //protected void CustomValidator9_ServerValidate(object source, ServerValidateEventArgs args)
    //{
    //    if (Convert.ToInt32(txtQ2_2_1.Text) + Convert.ToInt32(txtQ2_2_2.Text) != Convert.ToInt32(txtQ1_2_1.Text)
    //     || Convert.ToInt32(txtQ2_2_3.Text) + Convert.ToInt32(txtQ2_2_4.Text) != Convert.ToInt32(txtQ1_2_2.Text)
    //     || Convert.ToInt32(txtQ2_2_5.Text) + Convert.ToInt32(txtQ2_2_6.Text) != Convert.ToInt32(txtQ1_2_3.Text))
    //    {
    //        args.IsValid = false;
    //    }
    //}

    //Table 2 4-year-old IEP children need to add to Table 1
    //protected void CustomValidator10_ServerValidate(object source, ServerValidateEventArgs args)
    //{
    //    if (Convert.ToInt32(txtQ2_3_1.Text) + Convert.ToInt32(txtQ2_3_2.Text) != Convert.ToInt32(txtQ1_3_1.Text)
    //     || Convert.ToInt32(txtQ2_3_3.Text) + Convert.ToInt32(txtQ2_3_4.Text) != Convert.ToInt32(txtQ1_3_2.Text)
    //     || Convert.ToInt32(txtQ2_3_5.Text) + Convert.ToInt32(txtQ2_3_6.Text) != Convert.ToInt32(txtQ1_3_3.Text))
    //    {
    //        args.IsValid = false;
    //    }
    //}

    //Table 2 Under3-year-old IEP children need to add to Table 1
    //protected void CustomValidator13_ServerValidate(object source, ServerValidateEventArgs args)
    //{
    //    if (Convert.ToInt32(txtQ2_5_1.Text) + Convert.ToInt32(txtQ2_5_2.Text) != Convert.ToInt32(txtQ1_5_1.Text)
    //     || Convert.ToInt32(txtQ2_5_3.Text) + Convert.ToInt32(txtQ2_5_4.Text) != Convert.ToInt32(txtQ1_5_2.Text)
    //     || Convert.ToInt32(txtQ2_5_5.Text) + Convert.ToInt32(txtQ2_5_6.Text) != Convert.ToInt32(txtQ1_5_3.Text))
    //    {
    //        args.IsValid = false;
    //    }
    //}

    //Table 3 3-year-old children need to be <= to Table 1
    //protected void CustomValidator14_ServerValidate(object source, ServerValidateEventArgs args)
    //{
    //    if (Convert.ToInt32(txtQ3_2_1.Text) > Convert.ToInt32(txtQ1_2_1.Text)
    //     || Convert.ToInt32(txtQ3_2_2.Text) > Convert.ToInt32(txtQ1_2_2.Text)
    //     || Convert.ToInt32(txtQ3_2_3.Text) > Convert.ToInt32(txtQ1_2_3.Text))
    //    {
    //        args.IsValid = false;
    //    }

    //}

    //Table 1 Total needs to be > 0
    protected void CustomValidator15_ServerValidate(object source, ServerValidateEventArgs args)
    {
        //if ((txtQ1_1_1.Text == "0") || (txtQ1_1_1.Text == "0" && txtQ1_2_1.Text == "0" && txtQ1_3_1.Text == "0" && txtQ1_5_1.Text == "0"))
        if (txtQ1_1_1.Text == "0" && txtQ1_2_1.Text == "0" && txtQ1_3_1.Text == "0" && txtQ1_5_1.Text == "0")
        {
            args.IsValid = false;
        }

    }

    //Table 3 Under-3year-old need to be <= Table 1
    //protected void CustomValidator16_ServerValidate(object source, ServerValidateEventArgs args)
    //{
    //    if (Convert.ToInt32(txtQ3_5_1.Text) > Convert.ToInt32(txtQ1_5_1.Text)
    //     || Convert.ToInt32(txtQ3_5_2.Text) > Convert.ToInt32(txtQ1_5_2.Text)
    //     || Convert.ToInt32(txtQ3_5_3.Text) > Convert.ToInt32(txtQ1_5_3.Text))
    //    {
    //        args.IsValid = false;
    //    }
    //}

    //Table 4 3-year-olds need to be <= Table 1
    //protected void CustomValidator17_ServerValidate(object source, ServerValidateEventArgs args)
    //{
    //    if (Convert.ToInt32(txtQ4_2_1.Text) > Convert.ToInt32(txtQ1_2_1.Text)
    //     || Convert.ToInt32(txtQ4_2_2.Text) > Convert.ToInt32(txtQ1_2_2.Text)
    //     || Convert.ToInt32(txtQ4_2_3.Text) > Convert.ToInt32(txtQ1_2_3.Text))
    //    {
    //        args.IsValid = false;
    //    }
    //}

    //Table 4 4-year-olds need to be <= Table 1
    //protected void CustomValidator18_ServerValidate(object source, ServerValidateEventArgs args)
    //{
    //    if (Convert.ToInt32(txtQ4_3_1.Text) > Convert.ToInt32(txtQ1_3_1.Text)
    //     || Convert.ToInt32(txtQ4_3_2.Text) > Convert.ToInt32(txtQ1_3_2.Text)
    //     || Convert.ToInt32(txtQ4_3_3.Text) > Convert.ToInt32(txtQ1_3_3.Text))
    //    {
    //        args.IsValid = false;
    //    }
    //}

    //Table 4 under-3year-olds need to be <= Table 1
    //protected void CustomValidator19_ServerValidate(object source, ServerValidateEventArgs args)
    //{
    //    if (Convert.ToInt32(txtQ4_5_1.Text) > Convert.ToInt32(txtQ1_5_1.Text)
    //     || Convert.ToInt32(txtQ4_5_2.Text) > Convert.ToInt32(txtQ1_5_2.Text)
    //     || Convert.ToInt32(txtQ4_5_3.Text) > Convert.ToInt32(txtQ1_5_3.Text))
    //    {
    //        args.IsValid = false;
    //    }
    //}


    protected void cboProgramType_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["ProgramTypeId"] = cboProgramType.SelectedValue.ToString();
        rbtnIsAccredited.SelectedValue = "0";
        ddlAccreditation.Enabled = false;
        ddlAccreditation.SelectedValue = "0";
        txtAccreditationExpDate.Text = "";
        txtAccreditationEarnDate.Text = "";
        txtAccreditationNumber.Text = "";

        txtAccreditationExpDate.Enabled = false;
        txtAccreditationEarnDate.Enabled = false;
        txtAccreditationNumber.Enabled = false;
    }

    protected void rbtnIsProgramLicensed_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (rbtnIsProgramLicensed.SelectedValue == "0")
        {
            RequiredFieldValidator1.Enabled = false;
            txtEECProgramNumber.Enabled = false;
            txtEECProgramNumber.Text = "";
            CompareValidator14.Enabled = false;
        }
        else
        {
            RequiredFieldValidator1.Enabled = true;
            txtEECProgramNumber.Enabled = true;
            CompareValidator14.Enabled = true;
        }
    }

    protected void rdoQRISLevel_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (rdoQRISLevel.SelectedIndex == 4)
        {
            rbtnIsCQIP.Enabled = false;
            rbtnIsCQIP.SelectedIndex = 1;
            CustomValidator7.Enabled = false;
            txtCQIPLastUpdated.Enabled = false;
            CustomValidator26.Enabled = false;
        }
        else 
        {
            rbtnIsCQIP.Enabled = true;
            rbtnIsCQIP.SelectedIndex = -1;
            CustomValidator7.Enabled = true;
            txtCQIPLastUpdated.Enabled = true;
            CustomValidator26.Enabled = true;
        }
    }
}


