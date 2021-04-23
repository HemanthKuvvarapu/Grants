using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class CPPI_2020_CPPIClass : System.Web.UI.Page
{
    //[Serializable]
    //private class Educator
    //{
    //    public int EducatorId;
    //    public String Name;
    //    public String Position;
    //    public String HighestEducationLevel;
    //    public String MajorProgramStudy;
    //    public String AnnualSalary;

    //    public Educator()
    //    {
    //        EducatorId = 0;
    //        Name = "";
    //        Position = "";
    //        HighestEducationLevel = "";
    //        MajorProgramStudy = "";
    //        AnnualSalary = "";
    //    }
    //}

    DAL dal = new DAL();
    //DataSet dsEducators;
    //DataTable dtEducators = new DataTable();
    //List<Educator> educatorList = new List<Educator>();

    // Which Survey update period is this?
    int UpdatePeriod;
    bool IsInitialUpdate = AppInfo.InitialUpdate;
    bool IsMarchUpdate = AppInfo.MarchUpdate;
    bool IsJuneUpdate = AppInfo.JuneUpdate;

    // Maximum number of kids for the Program
    int MaxPSChildren = 0;
    int Max3YearOld = 0;
    int Max4YearOld = 0;
    int MaxUnder3Year = 0;

    //Cur* are the Total amounts stored across all classrooms
    int CurPSChildren = 0;
    int Cur3YearOld = 0;
    int Cur4YearOld = 0;
    int CurUnder3Year = 0;

    //int OldPSChildren = 0;
    //int Old3YearOld = 0;
    //int Old4YearOld = 0;
    //int OldUnder3Year = 0;

    // What is available now
    int AvailPSChildren = 0;
    int Avail3YearOld = 0;
    int Avail4YearOld = 0;
    int AvailUnder3Year = 0;

    //This* are the last amounts updated for this classroom
    int ThisPSChildren = 0;
    int This3YearOld = 0;
    int This4YearOld = 0;
    int ThisUnder3Year = 0;


    string IsFirstTime = "0";
    string IsNewClass = "0";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["GrantApplicantId"] == null) Response.Redirect("~/SessionTimeout.aspx");

        string providerId = Request.QueryString["pid"];

        ViewState["SystemProviderId"] = providerId;

        BindScripts();

        if (!IsPostBack)
        {
            //Get all the Classes for this Provider and load the grid 
            BindData();

            //ViewState["EducatorList"] = educatorList;
        }

        //Get UpdatePeriod
        if (IsInitialUpdate)
            UpdatePeriod = 1;
        else if (IsMarchUpdate)
            UpdatePeriod = 2;
        else if (IsJuneUpdate)
            UpdatePeriod = 3;

        //Get Program Level data
        SortedList<string, string> questions = dal.GetCPPIProgramSurveyData(Int32.Parse(ViewState["SystemProviderId"].ToString()));

        MaxPSChildren = Convert.ToInt32(questions["txtQ1_1_1"]);
        Max3YearOld = Convert.ToInt32(questions["txtQ1_2_1"]);
        Max4YearOld = Convert.ToInt32(questions["txtQ1_3_1"]);
        MaxUnder3Year = Convert.ToInt32(questions["txtQ1_5_1"]);

        hidMaxPSChildren.Value = MaxPSChildren.ToString();
        hidMax3YearOld.Value = Max3YearOld.ToString();
        hidMax4YearOld.Value = Max4YearOld.ToString();
        hidMaxUnder3Year.Value = MaxUnder3Year.ToString();

        //Get Current counts of kids in all classrooms
        DataSet dsClassCount = dal.GetCPPIClassroomCounts(Convert.ToInt32(providerId), Convert.ToInt32(Session["GrantApplicantId"].ToString()), UpdatePeriod);

        if (dsClassCount.Tables[0].Rows.Count > 0)
        {
            //Need to modify the class counts if this is an update to an existing classroom - subtract out counts for this class
            DataRow dr = dsClassCount.Tables[0].Rows[0];

            //if (IsPostBack)
            //{
            //    //Need to modify the class counts if this is an update to an existing classroom - subtract out counts for this class
            //    CurPSChildren = Convert.ToInt32(dr["TotalPSClassCount"].ToString()) - Convert.ToInt32(txtQ1_1_1.Text);
            //    Cur3YearOld = Convert.ToInt32(dr["Total3YearOldCount"].ToString()) - Convert.ToInt32(txtQ1_2_1.Text);
            //    Cur4YearOld = Convert.ToInt32(dr["Total4YearOldCount"].ToString()) - Convert.ToInt32(txtQ1_3_1.Text);
            //    CurUnder3Year = Convert.ToInt32(dr["TotalUnder3YearCount"].ToString()) - Convert.ToInt32(txtQ1_5_1.Text);
            //}

            CurPSChildren = Convert.ToInt32(dr["TotalPSClassCount"].ToString());
            Cur3YearOld = Convert.ToInt32(dr["Total3YearOldCount"].ToString());
            Cur4YearOld = Convert.ToInt32(dr["Total4YearOldCount"].ToString());
            CurUnder3Year = Convert.ToInt32(dr["TotalUnder3YearCount"].ToString());

            hidCurPSChildren.Value = CurPSChildren.ToString();
            hidCur3YearOld.Value = Cur3YearOld.ToString();
            hidCur4YearOld.Value = Cur4YearOld.ToString();
            hidCurUnder3Year.Value = CurUnder3Year.ToString();


            // Now calculate what numbers rre avalable that can be used by this classroom:

            AvailPSChildren = MaxPSChildren - Convert.ToInt32(dr["TotalPSClassCount"].ToString());
            Avail3YearOld = Max3YearOld - Convert.ToInt32(dr["Total3YearOldCount"].ToString());
            Avail4YearOld = Max4YearOld - Convert.ToInt32(dr["Total4YearOldCount"].ToString());
            AvailUnder3Year = MaxUnder3Year - Convert.ToInt32(dr["TotalUnder3YearCount"].ToString());

            hidAvailPSChildren.Value = AvailPSChildren.ToString();
            hidAvail3YearOld.Value = Avail3YearOld.ToString();
            hidAvail4YearOld.Value = Avail4YearOld.ToString();
            hidAvailUnder3Year.Value = AvailUnder3Year.ToString();

        }

        //if (!string.IsNullOrEmpty(ViewState["ClassroomId"].ToString()))
        //{
        //    SortedList<string, string> classes = dal.GetCPPIClassroomNew(Convert.ToInt32(ViewState["ClassroomId"].ToString()));

        //    if (classes.Count > 0)
        //    {
        //        ThisPSChildren = Convert.ToInt32(classes["txtQ1_1_1"].ToString());
        //        This3YearOld = Convert.ToInt32(classes["txtQ1_2_1"].ToString());
        //        This4YearOld = Convert.ToInt32(classes["txtQ1_3_1"].ToString());
        //        ThisUnder3Year = Convert.ToInt32(classes["txtQ1_5_1"].ToString());
        //    }
        //}

        //hidThisPSChildren.Value = ThisPSChildren.ToString();
        //hidThis3YearOld.Value = This3YearOld.ToString();
        //hidThis4YearOld.Value = This4YearOld.ToString();
        //hidThisUnder3Year.Value = ThisUnder3Year.ToString();

        //Response.Write("MaxPS =" + MaxPSChildren.ToString() + ", Max3 = " + Max3YearOld.ToString() + ", Max4 = " + Max4YearOld.ToString() + ", MaxUnder = " + MaxUnder3Year.ToString() + "<br/>");
        //Response.Write("CurPS =" + CurPSChildren.ToString() + ", Cur3 = " + Cur3YearOld.ToString() + ", Cur4 = " + Cur4YearOld.ToString() + ", CurUnder = " + CurUnder3Year.ToString() + "<br/>");
        //Response.Write("2 OldPS =" + OldPSChildren.ToString() + ", Old3 = " + Old3YearOld.ToString() + ", Old4 = " + Old4YearOld.ToString() + ", OldUnder = " + OldUnder3Year.ToString() + "<br/>");

    }

    private void BindScripts()
    {
        txtWeeksPerYearOperation.Attributes.Add("onchange", "javascript:calTotalHrPerYear()");
        txtDaysPerWeekOperation.Attributes.Add("onchange", "javascript:calTotalHrPerYear()");
        txtHoursPerDayOperation.Attributes.Add("onchange", "javascript:calTotalHrPerYear()");

        //txtQ1_1_1.Attributes.Add("disabled", "disabled");
        txtQ1_1_2.Attributes.Add("disabled", "disabled");
        txtQ1_1_3.Attributes.Add("disabled", "disabled");

        //txtQ2_1_1.Attributes.Add("disabled", "disabled");
        //txtQ2_1_2.Attributes.Add("disabled", "disabled");
        //txtQ2_1_3.Attributes.Add("disabled", "disabled");
        //txtQ2_1_4.Attributes.Add("disabled", "disabled");
        //txtQ2_1_5.Attributes.Add("disabled", "disabled");
        //txtQ2_1_6.Attributes.Add("disabled", "disabled");

        //txtQ3_1_1.Attributes.Add("disabled", "disabled");
        //txtQ3_1_2.Attributes.Add("disabled", "disabled");
        //txtQ3_1_3.Attributes.Add("disabled", "disabled");

        //txtQ4_1_1.Attributes.Add("disabled", "disabled");
        //txtQ4_1_2.Attributes.Add("disabled", "disabled");
        //txtQ4_1_3.Attributes.Add("disabled", "disabled");

        txtQ1_2_1.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ1_2_1.ClientID + "'" + ","
                                                                             + "'" + txtQ1_3_1.ClientID + "'" + ","
                                                                             + "'" + txtQ1_5_1.ClientID + "'" + ","
                                                                             + "'" + txtQ1_1_1.ClientID + "');");

        txtQ1_3_1.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ1_2_1.ClientID + "'" + ","
                                                                             + "'" + txtQ1_3_1.ClientID + "'" + ","
                                                                             + "'" + txtQ1_5_1.ClientID + "'" + ","
                                                                             + "'" + txtQ1_1_1.ClientID + "');");

        //txtQ1_4_1.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ1_2_1.ClientID + "'" + ","
        //                                                                     + "'" + txtQ1_3_1.ClientID + "'" + ","
        //                                                                     + "'" + txtQ1_4_1.ClientID + "'" + ","
        //                                                                     + "'" + txtQ1_5_1.ClientID + "'" + ","
        //                                                                     + "'" + txtQ1_1_1.ClientID + "');");

        txtQ1_5_1.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ1_2_1.ClientID + "'" + ","
                                                                             + "'" + txtQ1_3_1.ClientID + "'" + ","
                                                                             + "'" + txtQ1_5_1.ClientID + "'" + ","
                                                                             + "'" + txtQ1_1_1.ClientID + "');");

        //txtQ1_2_2.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ1_2_2.ClientID + "'" + ","
        //                                                                     + "'" + txtQ1_3_2.ClientID + "'" + ","
        //                                                                     + "'" + txtQ1_5_2.ClientID + "'" + ","
        //                                                                     + "'" + txtQ1_1_2.ClientID + "');");

        //txtQ1_3_2.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ1_2_2.ClientID + "'" + ","
        //                                                                     + "'" + txtQ1_3_2.ClientID + "'" + ","
        //                                                                     + "'" + txtQ1_5_2.ClientID + "'" + ","
        //                                                                     + "'" + txtQ1_1_2.ClientID + "');");

        //txtQ1_4_2.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ1_2_2.ClientID + "'" + ","
        //                                                                     + "'" + txtQ1_3_2.ClientID + "'" + ","
        //                                                                     + "'" + txtQ1_4_2.ClientID + "'" + ","
        //                                                                     + "'" + txtQ1_5_2.ClientID + "'" + ","
        //                                                                     + "'" + txtQ1_1_2.ClientID + "');");

        //txtQ1_5_2.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ1_2_2.ClientID + "'" + ","
        //                                                                     + "'" + txtQ1_3_2.ClientID + "'" + ","
        //                                                                     + "'" + txtQ1_5_2.ClientID + "'" + ","
        //                                                                     + "'" + txtQ1_1_2.ClientID + "');");

        //txtQ1_2_3.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ1_2_3.ClientID + "'" + ","
        //                                                                     + "'" + txtQ1_3_3.ClientID + "'" + ","
        //                                                                     + "'" + txtQ1_5_3.ClientID + "'" + ","
        //                                                                     + "'" + txtQ1_1_3.ClientID + "');");

        //txtQ1_3_3.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ1_2_3.ClientID + "'" + ","
        //                                                                     + "'" + txtQ1_3_3.ClientID + "'" + ","
        //                                                                     + "'" + txtQ1_5_3.ClientID + "'" + ","
        //                                                                     + "'" + txtQ1_1_3.ClientID + "');");

        //txtQ1_4_3.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ1_2_3.ClientID + "'" + ","
        //                                                                     + "'" + txtQ1_3_3.ClientID + "'" + ","
        //                                                                     + "'" + txtQ1_4_3.ClientID + "'" + ","
        //                                                                     + "'" + txtQ1_5_3.ClientID + "'" + ","
        //                                                                     + "'" + txtQ1_1_3.ClientID + "');");

        //txtQ1_5_3.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ1_2_3.ClientID + "'" + ","
        //                                                                     + "'" + txtQ1_3_3.ClientID + "'" + ","
        //                                                                     + "'" + txtQ1_5_3.ClientID + "'" + ","
        //                                                                     + "'" + txtQ1_1_3.ClientID + "');");



        //txtQ3_2_1.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ3_2_1.ClientID + "'" + ","
        //                                                                     + "'" + txtQ3_3_1.ClientID + "'" + ","
        //                                                                     //+ "'" + txtQ3_4_1.ClientID + "'" + ","
        //                                                                     + "'" + txtQ3_5_1.ClientID + "'" + ","
        //                                                                     + "'" + txtQ3_1_1.ClientID + "');");

        //txtQ3_3_1.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ3_2_1.ClientID + "'" + ","
        //                                                                     + "'" + txtQ3_3_1.ClientID + "'" + ","
        //                                                                     //+ "'" + txtQ3_4_1.ClientID + "'" + ","
        //                                                                     + "'" + txtQ3_5_1.ClientID + "'" + ","
        //                                                                     + "'" + txtQ3_1_1.ClientID + "');");

        ////txtQ3_4_1.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ3_2_1.ClientID + "'" + ","
        ////                                                                     + "'" + txtQ3_3_1.ClientID + "'" + ","
        ////                                                                     + "'" + txtQ3_4_1.ClientID + "'" + ","
        ////                                                                     + "'" + txtQ3_5_1.ClientID + "'" + ","
        ////                                                                     + "'" + txtQ3_1_1.ClientID + "');");

        //txtQ3_5_1.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ3_2_1.ClientID + "'" + ","
        //                                                                     + "'" + txtQ3_3_1.ClientID + "'" + ","
        //                                                                     //+ "'" + txtQ3_4_1.ClientID + "'" + ","
        //                                                                     + "'" + txtQ3_5_1.ClientID + "'" + ","
        //                                                                     + "'" + txtQ3_1_1.ClientID + "');");


        //txtQ3_2_2.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ3_2_2.ClientID + "'" + ","
        //                                                                     + "'" + txtQ3_3_2.ClientID + "'" + ","
        //                                                                     //+ "'" + txtQ3_4_2.ClientID + "'" + ","
        //                                                                     + "'" + txtQ3_5_2.ClientID + "'" + ","
        //                                                                     + "'" + txtQ3_1_2.ClientID + "');");

        //txtQ3_3_2.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ3_2_2.ClientID + "'" + ","
        //                                                                     + "'" + txtQ3_3_2.ClientID + "'" + ","
        //                                                                     //+ "'" + txtQ3_4_2.ClientID + "'" + ","
        //                                                                     + "'" + txtQ3_5_2.ClientID + "'" + ","
        //                                                                     + "'" + txtQ3_1_2.ClientID + "');");

        ////txtQ3_4_2.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ3_2_2.ClientID + "'" + ","
        ////                                                                     + "'" + txtQ3_3_2.ClientID + "'" + ","
        ////                                                                     + "'" + txtQ3_4_2.ClientID + "'" + ","
        ////                                                                     + "'" + txtQ3_5_2.ClientID + "'" + ","
        ////                                                                     + "'" + txtQ3_1_2.ClientID + "');");

        //txtQ3_5_2.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ3_2_2.ClientID + "'" + ","
        //                                                                     + "'" + txtQ3_3_2.ClientID + "'" + ","
        //                                                                     //+ "'" + txtQ3_4_2.ClientID + "'" + ","
        //                                                                     + "'" + txtQ3_5_2.ClientID + "'" + ","
        //                                                                     + "'" + txtQ3_1_2.ClientID + "');");

        //txtQ3_2_3.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ3_2_3.ClientID + "'" + ","
        //                                                                     + "'" + txtQ3_3_3.ClientID + "'" + ","
        //                                                                     //+ "'" + txtQ3_4_3.ClientID + "'" + ","
        //                                                                     + "'" + txtQ3_5_3.ClientID + "'" + ","
        //                                                                     + "'" + txtQ3_1_3.ClientID + "');");

        //txtQ3_3_3.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ3_2_3.ClientID + "'" + ","
        //                                                                     + "'" + txtQ3_3_3.ClientID + "'" + ","
        //                                                                     //+ "'" + txtQ3_4_3.ClientID + "'" + ","
        //                                                                     + "'" + txtQ3_5_3.ClientID + "'" + ","
        //                                                                     + "'" + txtQ3_1_3.ClientID + "');");

        ////txtQ3_4_3.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ3_2_3.ClientID + "'" + ","
        ////                                                                     + "'" + txtQ3_3_3.ClientID + "'" + ","
        ////                                                                     + "'" + txtQ3_4_3.ClientID + "'" + ","
        ////                                                                     + "'" + txtQ3_5_3.ClientID + "'" + ","
        ////                                                                     + "'" + txtQ3_1_3.ClientID + "');");

        //txtQ3_5_3.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ3_2_3.ClientID + "'" + ","
        //                                                                     + "'" + txtQ3_3_3.ClientID + "'" + ","
        //                                                                     //+ "'" + txtQ3_4_3.ClientID + "'" + ","
        //                                                                     + "'" + txtQ3_5_3.ClientID + "'" + ","
        //                                                                     + "'" + txtQ3_1_3.ClientID + "');");



        //txtQ4_2_1.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ4_2_1.ClientID + "'" + ","
        //                                                                     + "'" + txtQ4_3_1.ClientID + "'" + ","
        //                                                                     //+ "'" + txtQ4_4_1.ClientID + "'" + ","
        //                                                                     + "'" + txtQ4_5_1.ClientID + "'" + ","
        //                                                                     + "'" + txtQ4_1_1.ClientID + "');");

        //txtQ4_3_1.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ4_2_1.ClientID + "'" + ","
        //                                                                     + "'" + txtQ4_3_1.ClientID + "'" + ","
        //                                                                     //+ "'" + txtQ4_4_1.ClientID + "'" + ","
        //                                                                     + "'" + txtQ4_5_1.ClientID + "'" + ","
        //                                                                     + "'" + txtQ4_1_1.ClientID + "');");

        ////txtQ4_4_1.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ4_2_1.ClientID + "'" + ","
        ////                                                                     + "'" + txtQ4_3_1.ClientID + "'" + ","
        ////                                                                     + "'" + txtQ4_4_1.ClientID + "'" + ","
        ////                                                                     + "'" + txtQ4_5_1.ClientID + "'" + ","
        ////                                                                     + "'" + txtQ4_1_1.ClientID + "');");

        //txtQ4_5_1.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ4_2_1.ClientID + "'" + ","
        //                                                                     + "'" + txtQ4_3_1.ClientID + "'" + ","
        //                                                                     //+ "'" + txtQ4_4_1.ClientID + "'" + ","
        //                                                                     + "'" + txtQ4_5_1.ClientID + "'" + ","
        //                                                                     + "'" + txtQ4_1_1.ClientID + "');");


        //txtQ4_2_2.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ4_2_2.ClientID + "'" + ","
        //                                                                     + "'" + txtQ4_3_2.ClientID + "'" + ","
        //                                                                     //+ "'" + txtQ4_4_2.ClientID + "'" + ","
        //                                                                     + "'" + txtQ4_5_2.ClientID + "'" + ","
        //                                                                     + "'" + txtQ4_1_2.ClientID + "');");

        //txtQ4_3_2.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ4_2_2.ClientID + "'" + ","
        //                                                                     + "'" + txtQ4_3_2.ClientID + "'" + ","
        //                                                                     //+ "'" + txtQ4_4_2.ClientID + "'" + ","
        //                                                                     + "'" + txtQ4_5_2.ClientID + "'" + ","
        //                                                                     + "'" + txtQ4_1_2.ClientID + "');");

        ////txtQ4_4_2.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ4_2_2.ClientID + "'" + ","
        ////                                                                     + "'" + txtQ4_3_2.ClientID + "'" + ","
        ////                                                                     + "'" + txtQ4_4_2.ClientID + "'" + ","
        ////                                                                     + "'" + txtQ4_5_2.ClientID + "'" + ","
        ////                                                                     + "'" + txtQ4_1_2.ClientID + "');");

        //txtQ4_5_2.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ4_2_2.ClientID + "'" + ","
        //                                                                     + "'" + txtQ4_3_2.ClientID + "'" + ","
        //                                                                     //+ "'" + txtQ4_4_2.ClientID + "'" + ","
        //                                                                     + "'" + txtQ4_5_2.ClientID + "'" + ","
        //                                                                     + "'" + txtQ4_1_2.ClientID + "');");

        //txtQ4_2_3.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ4_2_3.ClientID + "'" + ","
        //                                                                     + "'" + txtQ4_3_3.ClientID + "'" + ","
        //                                                                     //+ "'" + txtQ4_4_3.ClientID + "'" + ","
        //                                                                     + "'" + txtQ4_5_3.ClientID + "'" + ","
        //                                                                     + "'" + txtQ4_1_3.ClientID + "');");

        //txtQ4_3_3.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ4_2_3.ClientID + "'" + ","
        //                                                                     + "'" + txtQ4_3_3.ClientID + "'" + ","
        //                                                                     //+ "'" + txtQ4_4_3.ClientID + "'" + ","
        //                                                                     + "'" + txtQ4_5_3.ClientID + "'" + ","
        //                                                                     + "'" + txtQ4_1_3.ClientID + "');");

        ////txtQ4_4_3.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ4_2_3.ClientID + "'" + ","
        ////                                                                     + "'" + txtQ4_3_3.ClientID + "'" + ","
        ////                                                                     + "'" + txtQ4_4_3.ClientID + "'" + ","
        ////                                                                     + "'" + txtQ4_5_3.ClientID + "'" + ","
        ////                                                                     + "'" + txtQ4_1_3.ClientID + "');");

        //txtQ4_5_3.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ4_2_3.ClientID + "'" + ","
        //                                                                     + "'" + txtQ4_3_3.ClientID + "'" + ","
        //                                                                     //+ "'" + txtQ4_4_3.ClientID + "'" + ","
        //                                                                     + "'" + txtQ4_5_3.ClientID + "'" + ","
        //                                                                     + "'" + txtQ4_1_3.ClientID + "');");



        //txtQ2_2_1.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ2_2_1.ClientID + "'" + ","
        //                                                                     + "'" + txtQ2_3_1.ClientID + "'" + ","
        //                                                                     //+ "'" + txtQ2_4_1.ClientID + "'" + ","
        //                                                                     + "'" + txtQ2_5_1.ClientID + "'" + ","
        //                                                                     + "'" + txtQ2_1_1.ClientID + "');");

        //txtQ2_3_1.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ2_2_1.ClientID + "'" + ","
        //                                                                     + "'" + txtQ2_3_1.ClientID + "'" + ","
        //                                                                     //+ "'" + txtQ2_4_1.ClientID + "'" + ","
        //                                                                     + "'" + txtQ2_5_1.ClientID + "'" + ","
        //                                                                     + "'" + txtQ2_1_1.ClientID + "');");

        ////txtQ2_4_1.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ2_2_1.ClientID + "'" + ","
        ////                                                                     + "'" + txtQ2_3_1.ClientID + "'" + ","
        ////                                                                     + "'" + txtQ2_4_1.ClientID + "'" + ","
        ////                                                                     + "'" + txtQ2_5_1.ClientID + "'" + ","
        ////                                                                     + "'" + txtQ2_1_1.ClientID + "');");

        //txtQ2_5_1.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ2_2_1.ClientID + "'" + ","
        //                                                                     + "'" + txtQ2_3_1.ClientID + "'" + ","
        //                                                                     //+ "'" + txtQ2_4_1.ClientID + "'" + ","
        //                                                                     + "'" + txtQ2_5_1.ClientID + "'" + ","
        //                                                                     + "'" + txtQ2_1_1.ClientID + "');");


        //txtQ2_2_2.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ2_2_2.ClientID + "'" + ","
        //                                                                     + "'" + txtQ2_3_2.ClientID + "'" + ","
        //                                                                     //+ "'" + txtQ2_4_2.ClientID + "'" + ","
        //                                                                     + "'" + txtQ2_5_2.ClientID + "'" + ","
        //                                                                     + "'" + txtQ2_1_2.ClientID + "');");

        //txtQ2_3_2.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ2_2_2.ClientID + "'" + ","
        //                                                                     + "'" + txtQ2_3_2.ClientID + "'" + ","
        //                                                                     //+ "'" + txtQ2_4_2.ClientID + "'" + ","
        //                                                                     + "'" + txtQ2_5_2.ClientID + "'" + ","
        //                                                                     + "'" + txtQ2_1_2.ClientID + "');");

        ////txtQ2_4_2.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ2_2_2.ClientID + "'" + ","
        ////                                                                     + "'" + txtQ2_3_2.ClientID + "'" + ","
        ////                                                                     + "'" + txtQ2_4_2.ClientID + "'" + ","
        ////                                                                     + "'" + txtQ2_5_2.ClientID + "'" + ","
        ////                                                                     + "'" + txtQ2_1_2.ClientID + "');");

        //txtQ2_5_2.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ2_2_2.ClientID + "'" + ","
        //                                                                     + "'" + txtQ2_3_2.ClientID + "'" + ","
        //                                                                     //+ "'" + txtQ2_4_2.ClientID + "'" + ","
        //                                                                     + "'" + txtQ2_5_2.ClientID + "'" + ","
        //                                                                     + "'" + txtQ2_1_2.ClientID + "');");

        //txtQ2_2_3.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ2_2_3.ClientID + "'" + ","
        //                                                                     + "'" + txtQ2_3_3.ClientID + "'" + ","
        //                                                                     //+ "'" + txtQ2_4_3.ClientID + "'" + ","
        //                                                                     + "'" + txtQ2_5_3.ClientID + "'" + ","
        //                                                                     + "'" + txtQ2_1_3.ClientID + "');");

        //txtQ2_3_3.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ2_2_3.ClientID + "'" + ","
        //                                                                     + "'" + txtQ2_3_3.ClientID + "'" + ","
        //                                                                     //+ "'" + txtQ2_4_3.ClientID + "'" + ","
        //                                                                     + "'" + txtQ2_5_3.ClientID + "'" + ","
        //                                                                     + "'" + txtQ2_1_3.ClientID + "');");

        ////txtQ2_4_3.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ2_2_3.ClientID + "'" + ","
        ////                                                                     + "'" + txtQ2_3_3.ClientID + "'" + ","
        ////                                                                     + "'" + txtQ2_4_3.ClientID + "'" + ","
        ////                                                                     + "'" + txtQ2_5_3.ClientID + "'" + ","
        ////                                                                     + "'" + txtQ2_1_3.ClientID + "');");

        //txtQ2_5_3.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ2_2_3.ClientID + "'" + ","
        //                                                                     + "'" + txtQ2_3_3.ClientID + "'" + ","
        //                                                                     //+ "'" + txtQ2_4_3.ClientID + "'" + ","
        //                                                                     + "'" + txtQ2_5_3.ClientID + "'" + ","
        //                                                                     + "'" + txtQ2_1_3.ClientID + "');");


        //txtQ2_2_4.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ2_2_4.ClientID + "'" + ","
        //                                                                             + "'" + txtQ2_3_4.ClientID + "'" + ","
        //                                                                             //+ "'" + txtQ2_4_4.ClientID + "'" + ","
        //                                                                             + "'" + txtQ2_5_4.ClientID + "'" + ","
        //                                                                             + "'" + txtQ2_1_4.ClientID + "');");

        //txtQ2_3_4.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ2_2_4.ClientID + "'" + ","
        //                                                                     + "'" + txtQ2_3_4.ClientID + "'" + ","
        //                                                                     //+ "'" + txtQ2_4_4.ClientID + "'" + ","
        //                                                                     + "'" + txtQ2_5_4.ClientID + "'" + ","
        //                                                                     + "'" + txtQ2_1_4.ClientID + "');");

        ////txtQ2_4_4.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ2_2_4.ClientID + "'" + ","
        ////                                                                     + "'" + txtQ2_3_4.ClientID + "'" + ","
        ////                                                                     + "'" + txtQ2_4_4.ClientID + "'" + ","
        ////                                                                     + "'" + txtQ2_5_4.ClientID + "'" + ","
        ////                                                                     + "'" + txtQ2_1_4.ClientID + "');");

        //txtQ2_5_4.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ2_2_4.ClientID + "'" + ","
        //                                                                     + "'" + txtQ2_3_4.ClientID + "'" + ","
        //                                                                     //+ "'" + txtQ2_4_4.ClientID + "'" + ","
        //                                                                     + "'" + txtQ2_5_4.ClientID + "'" + ","
        //                                                                     + "'" + txtQ2_1_4.ClientID + "');");

        //txtQ2_2_5.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ2_2_5.ClientID + "'" + ","
        //                                                                             + "'" + txtQ2_3_5.ClientID + "'" + ","
        //                                                                             //+ "'" + txtQ2_4_5.ClientID + "'" + ","
        //                                                                             + "'" + txtQ2_5_5.ClientID + "'" + ","
        //                                                                             + "'" + txtQ2_1_5.ClientID + "');");

        //txtQ2_3_5.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ2_2_5.ClientID + "'" + ","
        //                                                                     + "'" + txtQ2_3_5.ClientID + "'" + ","
        //                                                                     //+ "'" + txtQ2_4_5.ClientID + "'" + ","
        //                                                                     + "'" + txtQ2_5_5.ClientID + "'" + ","
        //                                                                     + "'" + txtQ2_1_5.ClientID + "');");

        ////txtQ2_4_5.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ2_2_5.ClientID + "'" + ","
        ////                                                                     + "'" + txtQ2_3_5.ClientID + "'" + ","
        ////                                                                     + "'" + txtQ2_4_5.ClientID + "'" + ","
        ////                                                                     + "'" + txtQ2_5_5.ClientID + "'" + ","
        ////                                                                     + "'" + txtQ2_1_5.ClientID + "');");

        //txtQ2_5_5.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ2_2_5.ClientID + "'" + ","
        //                                                                     + "'" + txtQ2_3_5.ClientID + "'" + ","
        //                                                                     //+ "'" + txtQ2_4_5.ClientID + "'" + ","
        //                                                                     + "'" + txtQ2_5_5.ClientID + "'" + ","
        //                                                                     + "'" + txtQ2_1_5.ClientID + "');");

        //txtQ2_2_6.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ2_2_6.ClientID + "'" + ","
        //                                                                             + "'" + txtQ2_3_6.ClientID + "'" + ","
        //                                                                             //+ "'" + txtQ2_4_6.ClientID + "'" + ","
        //                                                                             + "'" + txtQ2_5_6.ClientID + "'" + ","
        //                                                                             + "'" + txtQ2_1_6.ClientID + "');");

        //txtQ2_3_6.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ2_2_6.ClientID + "'" + ","
        //                                                                     + "'" + txtQ2_3_6.ClientID + "'" + ","
        //                                                                     //+ "'" + txtQ2_4_6.ClientID + "'" + ","
        //                                                                     + "'" + txtQ2_5_6.ClientID + "'" + ","
        //                                                                     + "'" + txtQ2_1_6.ClientID + "');");

        ////txtQ2_4_6.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ2_2_6.ClientID + "'" + ","
        ////                                                                     + "'" + txtQ2_3_6.ClientID + "'" + ","
        ////                                                                     + "'" + txtQ2_4_6.ClientID + "'" + ","
        ////                                                                     + "'" + txtQ2_5_6.ClientID + "'" + ","
        ////                                                                     + "'" + txtQ2_1_6.ClientID + "');");

        //txtQ2_5_6.Attributes.Add("onchange", "javascript:GetTotalChildren(" + "'" + txtQ2_2_6.ClientID + "'" + ","
        //                                                                     + "'" + txtQ2_3_6.ClientID + "'" + ","
        //                                                                     //+ "'" + txtQ2_4_6.ClientID + "'" + ","
        //                                                                     + "'" + txtQ2_5_6.ClientID + "'" + ","
        //                                                                     + "'" + txtQ2_1_6.ClientID + "');");
    }

    private void BindData()
    {
        DataSet ds = dal.GetCPPIClassroomsNew(Convert.ToInt32(ViewState["SystemProviderId"].ToString()), Convert.ToInt32(Session["GrantApplicantId"].ToString()));

        if (ds.Tables.Count > 0)
        {
            grdClasses.DataSource = ds.Tables[0];
            grdClasses.DataBind();
        }

        if (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count == 0)
        {
            ViewState["ClassroomId"] = "-1";

            tblClassroom.Visible = false;
            tblClassroomSummary.Visible = true;
            tblHome.Visible = true;

            dal.SaveCPPIPartStatus(Convert.ToInt32(Session["GrantApplicantId"].ToString()), "4", 0);
        }
        else
        {
            dal.SaveCPPIPartStatus(Convert.ToInt32(Session["GrantApplicantId"].ToString()), "4", 1);
        }

        //if (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0 && Session["ProgramTypeId"].ToString() == "4")
        //{
        //    btnAddNewClass.Visible = false;
        //}
        //else
        {
            btnAddNewClass.Visible = true;
        }
    }

    protected void btnAddNewClass_Click(object sender, EventArgs e)
    {
        int ClassroomId = dal.GetCPPIClassroomNewId(Convert.ToInt32(ViewState["SystemProviderId"].ToString()), Convert.ToInt32(Session["GrantApplicantId"].ToString()));       
        //ViewState["ClassroomId"] = -1;

        ViewState["ClassroomId"] = ClassroomId;
        IsNewClass = "1";
        hidIsNewClass.Value = "1";

        ResetClass();
        tblClassroom.Visible = true;
        tblClassroomSummary.Visible = false;
        tblHome.Visible = false;
                
        //BindClassroomEducators(Convert.ToInt32(ViewState["ClassroomId"].ToString()));
        //BindClassroomEducators(ClassroomId);
    }

    protected void btnCancelClass_Click(object sender, EventArgs e)
    {
        tblClassroomSummary.Visible = true;
        tblHome.Visible = true;
        tblClassroom.Visible = false;

        ResetClass();
    }

    protected void btnSaveClass_Click(object sender, EventArgs e)
    {
        SaveClass();
    }

    private void SaveClass()
    {
        if (Page.IsValid && IsValidClassData())
        //if (IsValidClassData())
        {

                int ClassroomId = ViewState["ClassroomId"] == null ? -1 : Int32.Parse(ViewState["ClassroomId"].ToString());
                //int ClassroomId = Int32.Parse(ViewState["ClassroomId"].ToString());
                int ReturnValue = 0;

                Control[] allControls = FlattenHierachy(Page);

                foreach (Control control in allControls)
                {
                    string id = control.ID;
                    string value = "";

                    if ((control is System.Web.UI.WebControls.TextBox) ||
                        (control is System.Web.UI.WebControls.DropDownList) ||
                        (control is System.Web.UI.WebControls.RadioButton) ||
                        (control is System.Web.UI.WebControls.RadioButtonList) ||
                        //(control is System.Web.UI.WebControls.HiddenField) ||
                        (control is System.Web.UI.WebControls.CheckBox) ||
                        (control is System.Web.UI.WebControls.CheckBoxList))
                    {

                        if (control is System.Web.UI.WebControls.TextBox)
                        {
                            if (id == "txtQ1_1_1")
                            {
                                value = (Int32.Parse(string.IsNullOrEmpty(txtQ1_2_1.Text) ? "0" : txtQ1_2_1.Text) +
                                Int32.Parse(string.IsNullOrEmpty(txtQ1_3_1.Text) ? "0" : txtQ1_3_1.Text) +
                                Int32.Parse(string.IsNullOrEmpty(txtQ1_5_1.Text) ? "0" : txtQ1_5_1.Text)).ToString();
                            }
                            else if (id == "txtQ1_1_2")
                            {
                                value = (Int32.Parse(string.IsNullOrEmpty(txtQ1_2_2.Text) ? "0" : txtQ1_2_2.Text) +
                                Int32.Parse(string.IsNullOrEmpty(txtQ1_3_2.Text) ? "0" : txtQ1_3_2.Text) +
                                Int32.Parse(string.IsNullOrEmpty(txtQ1_5_2.Text) ? "0" : txtQ1_5_2.Text)).ToString();
                            }
                            else if (id == "txtQ1_1_3")
                            {
                                value = (Int32.Parse(string.IsNullOrEmpty(txtQ1_2_3.Text) ? "0" : txtQ1_2_3.Text) +
                                Int32.Parse(string.IsNullOrEmpty(txtQ1_3_3.Text) ? "0" : txtQ1_3_3.Text) +
                                Int32.Parse(string.IsNullOrEmpty(txtQ1_5_3.Text) ? "0" : txtQ1_5_3.Text)).ToString();
                            }
                            else
                                value = (control as TextBox).Text;
                        }
                        // Don't save the hidden fields
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

                        if (!string.IsNullOrEmpty(id))
                            ReturnValue = dal.SaveCPPIClassroomSurveyData(ClassroomId, Int32.Parse(ViewState["SystemProviderId"].ToString()), id, value, Convert.ToInt32(Session["GrantApplicantId"].ToString()));
                    }

                }

                ViewState["ClassroomId"] = ClassroomId;

                //SaveAllEducators();

                dal.SaveCPPIPartStatus(Convert.ToInt32(Session["GrantApplicantId"].ToString()), "4", 1);

                if (ClassroomId == -1)
                {
                    tblErrorMessage1.Visible = true;
                    lblErrorMessage1.Text = "Error while saving the information. Please contact EEC.";
                }
                else
                {
                    //if (AppInfo.Competitive)
                    //{
                    //float classAmount = dal.UpdateCPPIClassroomAmountNew(Convert.ToInt32(ViewState["ClassroomId"].ToString()),
                    //                                                   Convert.ToInt32(ViewState["SystemProviderId"].ToString()),
                    //                                                   Convert.ToInt32(Session["GrantApplicantId"].ToString()));

                    //float eligAmount = dal.UpdateCPPIEligAmountNew(Convert.ToInt32(Session["GrantApplicantId"].ToString()));

                    //Session["Eligibility Amount"] = eligAmount.ToString("N2");

                    //Master.ReloadEligibilityAmount();
                    //}

                    //ViewState["ClassroomId"] = "-1";
                    ViewState["ClassroomId"] = ClassroomId;
                    tblClassroom.Visible = false;
                    tblClassroomSummary.Visible = true;
                    tblHome.Visible = true;
                    BindData();
                }

                tblErrorMessage1.Visible = false;
        }
        else
        {           
            if (lblErrorMessage1.Text == "")
            {
                lblErrorMessage1.Text = "Please correct the following error(s)";
            }
            tblErrorMessage1.Visible = true;
        }
    }
    
    private bool IsValidClassData()
    {
        
        bool validData = true;
        string errMsg = "";

        // First check what last entries were (if any) to validate new entries
        SortedList<string, string> questions = dal.GetCPPIClassroomNew(Convert.ToInt32(ViewState["ClassroomId"].ToString()));

        if (questions.Count > 0)
        {
            ThisPSChildren = Convert.ToInt32(questions["txtQ1_1_1"].ToString());
            This3YearOld = Convert.ToInt32(questions["txtQ1_2_1"].ToString());
            This4YearOld = Convert.ToInt32(questions["txtQ1_3_1"].ToString());
            ThisUnder3Year = Convert.ToInt32(questions["txtQ1_5_1"].ToString());

            hidThisPSChildren.Value = questions["txtQ1_1_1"].ToString();
            hidThis3YearOld.Value = questions["txtQ1_2_1"].ToString();
            hidThis4YearOld.Value = questions["txtQ1_3_1"].ToString();
            hidThisUnder3Year.Value = questions["txtQ1_5_1"].ToString();
        }

        // Get totals for all classrooms (if any)
        DataSet dsClassCount = dal.GetCPPIClassroomCounts(Convert.ToInt32(ViewState["SystemProviderId"].ToString()), Convert.ToInt32(Session["GrantApplicantId"].ToString()), 1);

        if (dsClassCount.Tables[0].Rows.Count > 0)
        {
            DataRow dr = dsClassCount.Tables[0].Rows[0];

            CurPSChildren = Convert.ToInt32(dr["TotalPSClassCount"].ToString());
            Cur3YearOld = Convert.ToInt32(dr["Total3YearOldCount"].ToString());
            Cur4YearOld = Convert.ToInt32(dr["Total4YearOldCount"].ToString());
            CurUnder3Year = Convert.ToInt32(dr["TotalUnder3YearCount"].ToString());

            if (IsNewClass == "0")
            {
                //Need to modify the class counts if this is an update to an existing classroom - subtract out counts for this class
                CurPSChildren = Convert.ToInt32(dr["TotalPSClassCount"].ToString()) - ThisPSChildren;
                Cur3YearOld = Convert.ToInt32(dr["Total3YearOldCount"].ToString()) - This3YearOld;
                Cur4YearOld = Convert.ToInt32(dr["Total4YearOldCount"].ToString()) - This4YearOld;
                CurUnder3Year = Convert.ToInt32(dr["TotalUnder3YearCount"].ToString()) - ThisUnder3Year;
            }

            hidCurPSChildren.Value = CurPSChildren.ToString();
            hidCur3YearOld.Value = Cur3YearOld.ToString();
            hidCur4YearOld.Value = Cur4YearOld.ToString();
            hidCurUnder3Year.Value = CurUnder3Year.ToString();

            // Now calculate what numbers are avalable that can be used by this classroom:
            AvailPSChildren = MaxPSChildren - CurPSChildren;
            Avail3YearOld = Max3YearOld - Cur3YearOld;
            Avail4YearOld = Max4YearOld - Cur4YearOld;
            AvailUnder3Year = MaxUnder3Year - CurUnder3Year;

            hidAvailPSChildren.Value = AvailPSChildren.ToString();
            hidAvail3YearOld.Value = Avail3YearOld.ToString();
            hidAvail4YearOld.Value = Avail4YearOld.ToString();
            hidAvailUnder3Year.Value = AvailUnder3Year.ToString();
        }

        if (CurPSChildren > 0)
        {
            hidIsFirstTime.Value = "0";
            IsFirstTime = "0";
        }
        else
        {
            hidIsFirstTime.Value = "1";
            IsFirstTime = "1";
            AvailPSChildren = MaxPSChildren;
            Avail3YearOld = Max3YearOld;
            Avail4YearOld = Max4YearOld;
            AvailUnder3Year = MaxUnder3Year;
        }
        hidIsNewClass.Value = IsNewClass;

        //Response.Write("IsFirstTime=" + IsFirstTime + ", IsNewClass=" + IsNewClass + ", LastPS=" + ThisPSChildren + ", AvailalablePS = " + AvailPSChildren + ", TotalPS = " + Convert.ToString(Convert.ToInt32(txtQ1_5_1.Text) + Convert.ToInt32(txtQ1_3_1.Text) + Convert.ToInt32(txtQ1_2_1.Text)) + ", hidTotPS = " + CurPSChildren + ", MaxPS = " + MaxPSChildren + "<br/>");

        errMsg = "<ul>";
        if ((Convert.ToInt32(ThisPSChildren) > 0 && Convert.ToInt32(txtQ1_5_1.Text) + Convert.ToInt32(txtQ1_3_1.Text) + Convert.ToInt32(txtQ1_2_1.Text) > Convert.ToInt32(ThisPSChildren)
            && Convert.ToInt32(ThisPSChildren) - (Convert.ToInt32(txtQ1_5_1.Text) + Convert.ToInt32(txtQ1_3_1.Text) + Convert.ToInt32(txtQ1_2_1.Text)) > Convert.ToInt32(AvailPSChildren))
            || (Convert.ToInt32(ThisPSChildren) == 0 && (Convert.ToInt32(txtQ1_5_1.Text) + Convert.ToInt32(txtQ1_3_1.Text) + Convert.ToInt32(txtQ1_2_1.Text)) > Convert.ToInt32(AvailPSChildren))
            // If this is an update to an existing classroom, and you want to increase the numbers, make sure it doesn't accept more than available
            //|| (IsNewClass == "0" && (Convert.ToInt32(txtQ1_5_1.Text) + Convert.ToInt32(txtQ1_3_1.Text) + Convert.ToInt32(txtQ1_2_1.Text) > ThisPSChildren) && (AvailPSChildren < ThisPSChildren - (Convert.ToInt32(txtQ1_5_1.Text) + Convert.ToInt32(txtQ1_3_1.Text) + Convert.ToInt32(txtQ1_2_1.Text)))))
            || (IsNewClass == "0" && (Convert.ToInt32(txtQ1_5_1.Text) + Convert.ToInt32(txtQ1_3_1.Text) + Convert.ToInt32(txtQ1_2_1.Text) > AvailPSChildren)))
        {
            validData = false;
            errMsg += "<li>The total number of preschool-aged children should not exceed the total number of children in the program. Please double-check the numbers that you have entered.</li>";
        }
        if ((Convert.ToInt32(ThisUnder3Year) > 0 && Convert.ToInt32(txtQ1_5_1.Text) > Convert.ToInt32(ThisUnder3Year) && Convert.ToInt32(ThisUnder3Year) - Convert.ToInt32(txtQ1_5_1.Text) > Convert.ToInt32(AvailUnder3Year))
            || (Convert.ToInt32(ThisUnder3Year) == 0 && Convert.ToInt32(txtQ1_5_1.Text) > Convert.ToInt32(AvailUnder3Year))
            // If this is an update to an existing classroom, and you want to increase the numbers, make sure it doesn't accept more than available
            //|| (IsNewClass == "0" && (Convert.ToInt32(txtQ1_5_1.Text) > ThisUnder3Year) && (AvailUnder3Year < ThisUnder3Year - Convert.ToInt32(txtQ1_5_1.Text))))
            || (IsNewClass == "0" && Convert.ToInt32(txtQ1_5_1.Text) > AvailUnder3Year))
        {
            validData = false;
            errMsg += "<li>The total number of under-3 year-old children should not exceed the total number of under-3 year-old children in the program. Please double-check the numbers that you have entered.</li>";
        }
        if ((Convert.ToInt32(This4YearOld) > 0 && Convert.ToInt32(txtQ1_3_1.Text) > Convert.ToInt32(This4YearOld) && Convert.ToInt32(This4YearOld) - Convert.ToInt32(txtQ1_3_1.Text) > Convert.ToInt32(Avail4YearOld))
            || (Convert.ToInt32(This4YearOld) == 0 && Convert.ToInt32(txtQ1_3_1.Text) > Convert.ToInt32(Avail4YearOld))
            // If this is an update to an existing classroom, and you want to increase the numbers, make sure it doesn't accept more than available
            //|| (IsNewClass == "0" && (Convert.ToInt32(txtQ1_3_1.Text) > This3YearOld) && (Avail4YearOld < This4YearOld - Convert.ToInt32(txtQ1_3_1.Text))))
            || (IsNewClass == "0" && Convert.ToInt32(txtQ1_3_1.Text) > Avail4YearOld))
        {
            validData = false;
            errMsg += "<li>The total number of 4 year-old children should not exceed the total number of 4 year-old children in the program. Please double-check the numbers that you have entered.</li>";
        }
        if ((Convert.ToInt32(This3YearOld) > 0 && Convert.ToInt32(txtQ1_2_1.Text) > Convert.ToInt32(This3YearOld) && Convert.ToInt32(This3YearOld) - Convert.ToInt32(txtQ1_2_1.Text) > Convert.ToInt32(Avail3YearOld))
            || (Convert.ToInt32(This3YearOld) == 0 && Convert.ToInt32(txtQ1_2_1.Text) > Convert.ToInt32(Avail3YearOld))
            // If this is an update to an existing classroom, and you want to increase the numbers, make sure it doesn't accept more than available
            //|| (IsNewClass == "0" && (Convert.ToInt32(txtQ1_2_1.Text) > This3YearOld) && (Avail3YearOld < This3YearOld - Convert.ToInt32(txtQ1_2_1.Text))))
            || (IsNewClass == "0" && Convert.ToInt32(txtQ1_2_1.Text) > Avail3YearOld))
        {
            validData = false;
            errMsg += "<li>The total number of under-3 year-old children should not exceed the total number of under-3 year-old children in the program. Please double-check the numbers that you have entered.</li>";
        }
             

        errMsg += "</ul>";

        if (validData)
        {
            lblErrorMessage1.Text = "";
            tblErrorMessage1.Visible = false;
        }
        else
        {
            lblErrorMessage1.Text = errMsg;
            tblErrorMessage1.Visible = true;
        }

        return validData;

    }
    
    private void ResetClass()
    {
        txtClassroomName.Text = "";

        txtWeeksPerYearOperation.Text = "";
        txtDaysPerWeekOperation.Text = "5";
        txtHoursPerDayOperation.Text = "";
        txtTotalHoursPerYear.Text = "";

        txtQ1_1_1.Text = "0";
        txtQ1_1_2.Text = "0";
        txtQ1_1_3.Text = "0";

        txtQ1_2_1.Text = "0";
        txtQ1_2_2.Text = "0";
        txtQ1_2_3.Text = "0";

        txtQ1_3_1.Text = "0";
        txtQ1_3_2.Text = "0";
        txtQ1_3_3.Text = "0";

        //txtQ1_4_1.Text = "0";
        //txtQ1_4_2.Text = "0";
        //txtQ1_4_3.Text = "0";

        txtQ1_5_1.Text = "0";
        txtQ1_5_2.Text = "0";
        txtQ1_5_3.Text = "0";

        //txtQ3_1_1.Text = "0";
        //txtQ3_1_2.Text = "0";
        //txtQ3_1_3.Text = "0";

        //txtQ3_2_1.Text = "0";
        //txtQ3_2_2.Text = "0";
        //txtQ3_2_3.Text = "0";

        //txtQ3_3_1.Text = "0";
        //txtQ3_3_2.Text = "0";
        //txtQ3_3_3.Text = "0";

        //txtQ3_4_1.Text = "0";
        //txtQ3_4_2.Text = "0";
        //txtQ3_4_3.Text = "0";

        //txtQ3_5_1.Text = "0";
        //txtQ3_5_2.Text = "0";
        //txtQ3_5_3.Text = "0";

        //txtQ2_1_1.Text = "0";
        //txtQ2_1_2.Text = "0";
        //txtQ2_1_3.Text = "0";
        //txtQ2_1_4.Text = "0";
        //txtQ2_1_5.Text = "0";
        //txtQ2_1_6.Text = "0";


        //txtQ2_2_1.Text = "0";
        //txtQ2_2_2.Text = "0";
        //txtQ2_2_3.Text = "0";
        //txtQ2_2_4.Text = "0";
        //txtQ2_2_5.Text = "0";
        //txtQ2_2_6.Text = "0";

        //txtQ2_3_1.Text = "0";
        //txtQ2_3_2.Text = "0";
        //txtQ2_3_3.Text = "0";
        //txtQ2_3_4.Text = "0";
        //txtQ2_3_5.Text = "0";
        //txtQ2_3_6.Text = "0";

        //txtQ2_4_1.Text = "0";
        //txtQ2_4_2.Text = "0";
        //txtQ2_4_3.Text = "0";
        //txtQ2_4_4.Text = "0";
        //txtQ2_4_5.Text = "0";
        //txtQ2_4_6.Text = "0";

        //txtQ2_5_1.Text = "0";
        //txtQ2_5_2.Text = "0";
        //txtQ2_5_3.Text = "0";
        //txtQ2_5_4.Text = "0";
        //txtQ2_5_5.Text = "0";
        //txtQ2_5_6.Text = "0";

        //txtQ4_1_1.Text = "0";
        //txtQ4_1_2.Text = "0";
        //txtQ4_1_3.Text = "0";

        //txtQ4_2_1.Text = "0";
        //txtQ4_2_2.Text = "0";
        //txtQ4_2_3.Text = "0";

        //txtQ4_3_1.Text = "0";
        //txtQ4_3_2.Text = "0";
        //txtQ4_3_3.Text = "0";

        //txtQ4_4_1.Text = "0";
        //txtQ4_4_2.Text = "0";
        //txtQ4_4_3.Text = "0";

        //txtQ4_5_1.Text = "0";
        //txtQ4_5_2.Text = "0";
        //txtQ4_5_3.Text = "0";

        lblErrorMessage1.Text = "";

        tblErrorMessage1.Visible = false;
    }

    protected void grdClasses_RowEditing(object sender, GridViewEditEventArgs e)
    {
        ViewState["ClassroomId"] = grdClasses.DataKeys[e.NewEditIndex].Value;

        //btnAddNewClass.Enabled = false;
        tblClassroom.Visible = true;
        tblClassroomSummary.Visible = false;
        tblHome.Visible = false;
        BindClassroom(Convert.ToInt32(ViewState["ClassroomId"].ToString()));
        //BindClassroomEducators(Convert.ToInt32(ViewState["ClassroomId"].ToString()));
    }

    //private void BindClassroomEducators(int classroomId)
    //{
    //    dsEducators = dal.GetCPPISurveyClassroomEducators(classroomId);

    //    educatorList.Clear();

    //    for (int i = 0; i < dsEducators.Tables[0].Rows.Count; i++)
    //    {
    //        Educator educator = new Educator();

    //        educator.EducatorId = Convert.ToInt32(dsEducators.Tables[0].Rows[i]["EducatorId"].ToString());
    //        educator.Name = dsEducators.Tables[0].Rows[i]["EducatorName"].ToString();
    //        educator.Position = dsEducators.Tables[0].Rows[i]["Position"].ToString();
    //        educator.HighestEducationLevel = dsEducators.Tables[0].Rows[i]["HighestEducationLevel"].ToString();
    //        educator.MajorProgramStudy = dsEducators.Tables[0].Rows[i]["MajorProgramStudy"].ToString();
    //        educator.AnnualSalary = dsEducators.Tables[0].Rows[i]["AnnualSalary"].ToString();

    //        educatorList.Add(educator);
    //    }

    //    ViewState["EducatorList"] = educatorList;

    //    grdEducators.DataSource = educatorList;
    //    grdEducators.DataBind();

    //}

    private void BindClassroom(int ClassroomId)
    {
        SortedList<string, string> questions = dal.GetCPPIClassroomNew(ClassroomId);

        if (questions.Count > 0)
        {

            ThisPSChildren = Convert.ToInt32(questions["txtQ1_1_1"].ToString());
            This3YearOld = Convert.ToInt32(questions["txtQ1_2_1"].ToString());
            This4YearOld = Convert.ToInt32(questions["txtQ1_3_1"].ToString());
            ThisUnder3Year = Convert.ToInt32(questions["txtQ1_5_1"].ToString());

            hidThisPSChildren.Value = questions["txtQ1_1_1"].ToString();
            hidThis3YearOld.Value = questions["txtQ1_2_1"].ToString();
            hidThis4YearOld.Value = questions["txtQ1_3_1"].ToString();
            hidThisUnder3Year.Value = questions["txtQ1_5_1"].ToString();

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

                        if (txtBox != null)
                        {
                            txtBox.Text = value;
                        }
                    }
                    else if (control is System.Web.UI.WebControls.DropDownList)
                    {
                        DropDownList dropDown = (DropDownList)((WebControl)ContentPlaceHolder.FindControl(questionId));

                        if (dropDown != null)
                        {
                            dropDown.SelectedValue = value;
                        }
                    }
                    else if (control is System.Web.UI.WebControls.RadioButton)
                    {
                        RadioButton rdoButton = (RadioButton)((WebControl)ContentPlaceHolder.FindControl(questionId));

                        if (rdoButton != null)
                        {
                            rdoButton.Checked = (value == "1") ? true : false;
                        }
                    }
                    else if (control is System.Web.UI.WebControls.RadioButtonList)
                    {
                        RadioButtonList rdoButton = (RadioButtonList)((WebControl)ContentPlaceHolder.FindControl(questionId));

                        if (rdoButton != null)
                        {
                            if (rdoButton.Items.FindByValue(value) != null)
                            {
                                rdoButton.SelectedValue = value;
                            }
                        }
                    }
                    else if (control is System.Web.UI.WebControls.CheckBox)
                    {
                        CheckBox rdoButton = (CheckBox)((WebControl)ContentPlaceHolder.FindControl(questionId));

                        if (rdoButton != null)
                        {
                            rdoButton.Checked = (value == "1") ? true : false;
                        }
                    }
                    else if (control is System.Web.UI.WebControls.CheckBoxList)
                    {
                        CheckBoxList rdoButton = (CheckBoxList)((WebControl)ContentPlaceHolder.FindControl(questionId));

                        if (rdoButton != null)
                        {
                            if (rdoButton.Items.FindByValue(value) != null)
                            {
                                rdoButton.SelectedValue = value;
                            }
                        }
                    }
                }
            }
        }

        txtTotalHoursPerYear.Text = (Int32.Parse(string.IsNullOrEmpty(txtWeeksPerYearOperation.Text) ? "0" : txtWeeksPerYearOperation.Text) *
                 Int32.Parse(string.IsNullOrEmpty(txtDaysPerWeekOperation.Text) ? "0" : txtDaysPerWeekOperation.Text) *
                 Int32.Parse(string.IsNullOrEmpty(txtHoursPerDayOperation.Text) ? "0" : txtHoursPerDayOperation.Text)).ToString();

    }

    protected void grdClasses_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            DataRowView dr = (DataRowView)e.Row.DataItem;

            e.Row.Cells[e.Row.Cells.Count - 2].Attributes.Add("onclick", "javascript:return confirm('Are you sure you want to delete this classroom?');");

            ((HyperLink)e.Row.FindControl("lnkEducators")).Text = "Edit Educator(s)";
            ((HyperLink)e.Row.FindControl("lnkEducators")).NavigateUrl = "CPPIEducator.aspx?cid=" + dr["ClassroomId"].ToString() + "&pid=" + dr["SystemProviderId"].ToString() + "&class=" + e.Row.Cells[0].Text ;

            /*jwong
            if (AppInfo.Competitive)
            {
                e.Row.Cells[3].Text = "$" + Single.Parse(dr["Amount"].ToString()).ToString("N2");
            }
            else
            {
                e.Row.Cells[3].Text = "------";
            }
            */
        }
    }

    protected void grdClasses_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        dal.DeleteCPPIClassroomNew(Convert.ToInt32(grdClasses.DataKeys[e.RowIndex].Value));

        //if (AppInfo.Competitive)
        //{
        //    float eligAmount = dal.UpdateCPPIEligAmountNew(Convert.ToInt32(Session["GrantApplicantId"].ToString()));
        //    Session["Eligibility Amount"] = eligAmount.ToString("N2");
        //    Master.ReloadEligibilityAmount();
        //}

        BindData();
    }

    protected void btnBackToHome_Click(object sender, EventArgs e)
    {
        Response.Redirect("CPPIProgramInformation.aspx");
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

    //private void SaveAllEducators()
    //{
    //    for (int i = 0; i < grdEducators.Rows.Count; i++)
    //    {
    //        int educatorId = Convert.ToInt32(grdEducators.Rows[i].Cells[0].Text);

    //        Label txtEducatorName = (Label)grdEducators.Rows[i].FindControl("lblEducatorName");
    //        Label txtPosition = (Label)grdEducators.Rows[i].FindControl("lblPosition");
    //        Label txtEducationLevel = (Label)grdEducators.Rows[i].FindControl("lblEducationLevel");
    //        Label txtAnnualSalary = (Label)grdEducators.Rows[i].FindControl("lblAnnualSalary");
    //        Label txtMajorProgramStudy = (Label)grdEducators.Rows[i].FindControl("lblMajorProgramStudy");

    //        //if (educatorId == -1)
    //        //{
    //            dal.SaveCPPISurveyClassroomEducator(Convert.ToInt32(ViewState["ClassroomId"].ToString()),
    //                                               txtEducatorName.Text,
    //                                               txtPosition.Text,
    //                                               txtEducationLevel.Text,
    //                                               txtMajorProgramStudy.Text,
    //                                               txtAnnualSalary.Text,
    //                                               Convert.ToInt32(ViewState["SystemProviderId"].ToString()),
    //                                               Convert.ToInt32(Session["GrantApplicantId"].ToString()));
    //        //}
    //        //else
    //        //{
    //        //    dal.UpdateCPPISurveyClassroomEducator(Convert.ToInt32(educatorId),
    //        //                                         txtEducatorName.Text,
    //        //                                         txtPosition.Text,
    //        //                                         txtEducationLevel.Text,
    //        //                                         txtAnnualSalary.Text);
    //        //}
    //    }
    //}

    //protected void grdEducators_RowDataBound(object sender, GridViewRowEventArgs e)
    //{
    //    //List<Educator> educators = e.Row.DataItem;

    //    if (e.Row.RowType == DataControlRowType.EmptyDataRow)
    //    {

    //    }
    //    else if (e.Row.RowType == DataControlRowType.DataRow)
    //    {
    //        Educator educator = (Educator)e.Row.DataItem;

    //        if (grdEducators.EditIndex != e.Row.RowIndex)
    //        {
    //            Label txtEducatorName = (Label)e.Row.FindControl("lblEducatorName");
    //            Label txtPosition = (Label)e.Row.FindControl("lblPosition");
    //            Label txtEducationLevel = (Label)e.Row.FindControl("lblEducationLevel");
    //            Label txtAnnualSalary = (Label)e.Row.FindControl("lblAnnualSalary");
    //            Label txtMajorProgramStudy = (Label)e.Row.FindControl("lblMajorProgramStudy");

    //            txtEducatorName.Text = educator.Name.ToString();
    //            txtPosition.Text = educator.Position.ToString();
    //            txtEducationLevel.Text = educator.HighestEducationLevel.ToString();
    //            txtAnnualSalary.Text = educator.AnnualSalary.ToString();
    //            txtMajorProgramStudy.Text = educator.MajorProgramStudy.ToString();

    //            e.Row.Cells[0].Text = educator.EducatorId.ToString();

    //            //string stor_id = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "stor_id"));
    //            Button btnDelete = (Button)e.Row.FindControl("ButtonDelete");
    //            Button btnEdit = (Button)e.Row.FindControl("ButtonEdit");

    //            if (btnDelete != null)
    //            {
    //                btnDelete.Attributes.Add("onclick", "javascript:return deleteConfirm('" + educator.EducatorId.ToString() + "')");
    //            }

    //            if (educator.EducatorId == 0)
    //            {
    //                btnDelete.Visible = false;
    //                btnEdit.Visible = false;
    //            }
    //        }
    //        else
    //        {
    //            TextBox txtEducatorName = (TextBox)e.Row.FindControl("txtEducatorName");
    //            DropDownList cboPosition = (DropDownList)e.Row.FindControl("cboPosition");
    //            DropDownList cboEducationLevel = (DropDownList)e.Row.FindControl("cboEducationLevel");
    //            DropDownList cboAnnualSalary = (DropDownList)e.Row.FindControl("cboAnnualSalary");
    //            TextBox txtOtherPosition = (TextBox)e.Row.FindControl("txtOtherPosition");
    //            //TextBox txtOtherEducationLevel = (TextBox)e.Row.FindControl("txtOtherEducationLevel");
    //            TextBox txtMajorProgramStudy = (TextBox)e.Row.FindControl("txtMajorProgramStudy");

    //            txtEducatorName.Text = educator.Name.ToString();

    //            if (educator.Position.ToString().Contains("Other:"))
    //            {
    //                txtOtherPosition.Text = educator.Position.ToString().Replace("Other:", "");
    //                cboPosition.SelectedValue = "Other";
    //            }
    //            else
    //            {
    //                cboPosition.SelectedValue = educator.Position.ToString();
    //            }

    //            //if (educator.HighestEducationLevel.ToString().Contains("Other:"))
    //            //{
    //            //    txtOtherEducationLevel.Text = educator.HighestEducationLevel.ToString().Replace("Other:", "");
    //            //    cboEducationLevel.SelectedValue = "Other";
    //            //}
    //            //else
    //            {
    //                cboEducationLevel.SelectedValue = educator.HighestEducationLevel.ToString();
    //            }

    //            txtMajorProgramStudy.Text = educator.MajorProgramStudy.ToString();

    //            cboAnnualSalary.SelectedValue = educator.AnnualSalary.ToString();

    //            e.Row.Cells[0].Text = educator.EducatorId.ToString();
    //        }
    //    }

    //}

    //protected void grdEducators_RowCommand(object sender, GridViewCommandEventArgs e)
    //{
    //    if (e.CommandName == "New")
    //    {
    //        //dsEducators = dal.GetCPPISurveyClassroomEducators(Convert.ToInt32(ViewState["ClassroomId"].ToString()));

    //        //dsEducators.Tables[0].Rows.Add(dsEducators.Tables[0].NewRow());
    //        Educator educator = new Educator();

    //        educator.EducatorId = 0;

    //        educatorList.Add(educator);

    //        grdEducators.DataSource = educatorList;
    //        grdEducators.DataBind();

    //    }
    //    else if (e.CommandName == "AddNew")
    //    {
    //        TextBox txtEducatorName = (TextBox)grdEducators.FooterRow.FindControl("txtEducatorName");
    //        DropDownList cboPosition = (DropDownList)grdEducators.FooterRow.FindControl("cboPosition");
    //        DropDownList cboEducationLevel = (DropDownList)grdEducators.FooterRow.FindControl("cboEducationLevel");
    //        DropDownList cboAnnualSalary = (DropDownList)grdEducators.FooterRow.FindControl("cboAnnualSalary");
    //        TextBox txtOtherPosition = (TextBox)grdEducators.FooterRow.FindControl("txtOtherPosition");
    //        //TextBox txtOtherEducationLevel = (TextBox)grdEducators.FooterRow.FindControl("txtOtherEducationLevel");
    //        TextBox txtMajorProgramStudy = (TextBox)grdEducators.FooterRow.FindControl("txtMajorProgramStudy");


    //        dal.SaveCPPISurveyClassroomEducator(Convert.ToInt32(ViewState["ClassroomId"].ToString()),
    //                                           txtEducatorName.Text,
    //                                           ((cboPosition.SelectedValue.ToUpper() == "OTHER") ? "Other:"+txtOtherPosition.Text : cboPosition.SelectedValue),
    //                                           //((cboEducationLevel.SelectedValue.ToUpper() == "OTHER") ? "Other:"+txtOtherEducationLevel.Text : cboEducationLevel.SelectedValue),
    //                                           cboEducationLevel.SelectedValue,
    //                                           txtMajorProgramStudy.Text,
    //                                           cboAnnualSalary.SelectedValue,
    //                                           Convert.ToInt32(ViewState["SystemProviderId"].ToString()),
    //                                           Convert.ToInt32(Session["GrantApplicantId"].ToString()));
            
    //        //Set up a new empty Educator
    //        Educator educator = new Educator();

    //        educator.EducatorId = -1;
    //        educator.Name = txtEducatorName.Text;
    //        educator.Position = ((cboPosition.SelectedValue.ToUpper() == "OTHER") ? "Other:" + txtOtherPosition.Text : cboPosition.SelectedValue);
    //        //educator.HighestEducationLevel = ((cboEducationLevel.SelectedValue.ToUpper() == "OTHER") ? "Other:" + txtOtherEducationLevel.Text : cboEducationLevel.SelectedValue);
    //        educator.HighestEducationLevel = cboEducationLevel.SelectedValue;
    //        educator.MajorProgramStudy = txtMajorProgramStudy.Text;
    //        educator.AnnualSalary = cboAnnualSalary.SelectedValue;

    //        List<Educator> educatorList = (List<Educator>) ViewState["EducatorList"];
    //        educatorList.Add(educator);

    //        grdEducators.DataSource = educatorList;
    //        grdEducators.DataBind();
    //    }
    //}

    //protected void grdEducators_RowDeleting(object sender, GridViewDeleteEventArgs e)
    //{
    //    List<Educator> educatorList = (List<Educator>)ViewState["EducatorList"];
    //    Educator educator = educatorList[e.RowIndex];

    //    int educatorId = Convert.ToInt32(grdEducators.Rows[e.RowIndex].Cells[0].Text.ToString());

    //    if (educatorId != -1)
    //    {
    //        dal.DeleteCPPISurveyClassroomEducator(Convert.ToInt32(educatorId));
    //    }

    //    educatorList.RemoveAt(e.RowIndex);

    //    grdEducators.DataSource = educatorList;
    //    grdEducators.DataBind();
    //}

    //protected void grdEducators_RowUpdating(object sender, GridViewUpdateEventArgs e)
    //{
    //    List<Educator> educatorList = (List<Educator>)ViewState["EducatorList"];
    //    Educator educator = educatorList[e.RowIndex];

    //    TextBox txtEducatorName = (TextBox)grdEducators.Rows[e.RowIndex].FindControl("txtEducatorName");
    //    DropDownList cboPosition = (DropDownList)grdEducators.Rows[e.RowIndex].FindControl("cboPosition");
    //    DropDownList cboEducationLevel = (DropDownList)grdEducators.Rows[e.RowIndex].FindControl("cboEducationLevel");
    //    DropDownList cboAnnualSalary = (DropDownList)grdEducators.Rows[e.RowIndex].FindControl("cboAnnualSalary");
    //    TextBox txtOtherPosition = (TextBox)grdEducators.Rows[e.RowIndex].FindControl("txtOtherPosition");
    //    //TextBox txtOtherEducationLevel = (TextBox)grdEducators.Rows[e.RowIndex].FindControl("txtOtherEducationLevel");
    //    TextBox txtMajorProgramStudy = (TextBox)grdEducators.Rows[e.RowIndex].FindControl("txtMajorProgramStudy");

    //    educator.EducatorId = Convert.ToInt32(grdEducators.Rows[e.RowIndex].Cells[0].Text.ToString());
    //    educator.Name = txtEducatorName.Text;
    //    educator.Position = ((cboPosition.SelectedValue.ToUpper() == "OTHER") ? "Other:" + txtOtherPosition.Text : cboPosition.SelectedValue);
    //    //educator.HighestEducationLevel = ((cboEducationLevel.SelectedValue.ToUpper() == "OTHER") ? "Other:" + txtOtherEducationLevel.Text :
    //    educator.HighestEducationLevel = cboEducationLevel.SelectedValue;
    //    educator.MajorProgramStudy = txtMajorProgramStudy.Text;
    //    educator.AnnualSalary = cboAnnualSalary.SelectedValue;

    //    // Why was this commented out?  -- Not needed Done in the Save of the Page
    //    //dal.UpdateCPPISurveyClassroomEducator(Convert.ToInt32(educator.EducatorId), txtEducatorName.Text,
    //    //                                     ((cboPosition.SelectedValue.ToUpper() == "OTHER") ? "Other:" + txtOtherPosition.Text : cboPosition.SelectedValue),
    //    //                                     //((cboEducationLevel.SelectedValue.ToUpper() == "OTHER") ? "Other:" + txtOtherEducationLevel.Text : cboEducationLevel.SelectedValue),
    //    //                                     cboEducationLevel.SelectedValue,
    //    //                                     txtMajorProgramStudy.Text,
    //    //                                     cboAnnualSalary.SelectedValue);


    //    grdEducators.EditIndex = -1;

    //    grdEducators.DataSource = educatorList;
    //    grdEducators.DataBind();
    //}

    //protected void grdEducators_RowEditing(object sender, GridViewEditEventArgs e)
    //{
    //    grdEducators.EditIndex = e.NewEditIndex;

    //    List<Educator> educatorList = (List<Educator>)ViewState["EducatorList"];

    //    grdEducators.DataSource = educatorList;
    //    grdEducators.DataBind();
    //}

    //protected void grdEducators_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    //{
    //    grdEducators.EditIndex = -1;

    //    List<Educator> educatorList = (List<Educator>)ViewState["EducatorList"];

    //    grdEducators.DataSource = educatorList;
    //    grdEducators.DataBind();
    //}

    protected void CustomValidator4_ServerValidate(object source, ServerValidateEventArgs args)
    {
        //Response.Write("IsFirstTime=" + hidIsFirstTime.Value + ", IsNewClass=" + hidIsNewClass.Value + ", LastPS=" + hidThisPSChildren.Value + ", AvailalablePS = " + hidAvailPSChildren.Value + ", TotalPS = " + Convert.ToString(Convert.ToInt32(txtQ1_5_1.Text) + Convert.ToInt32(txtQ1_3_1.Text) + Convert.ToInt32(txtQ1_2_1.Text)) + ", hidTotPS = " + hidCurPSChildren.Value + ", MaxPS = " + hidMaxPSChildren.Value + "<br/>");
        if (Convert.ToInt32(hidThisPSChildren.Value) > 0 && Convert.ToInt32(txtQ1_5_1.Text) + Convert.ToInt32(txtQ1_3_1.Text) + Convert.ToInt32(txtQ1_2_1.Text) > Convert.ToInt32(hidThisPSChildren.Value)
             && Convert.ToInt32(hidThisPSChildren.Value) - (Convert.ToInt32(txtQ1_5_1.Text) + Convert.ToInt32(txtQ1_3_1.Text) + Convert.ToInt32(txtQ1_2_1.Text)) > Convert.ToInt32(hidAvailPSChildren.Value))
        {
            Response.Write("1st test<br/>");
            args.IsValid = false;
        }
        else if (Convert.ToInt32(hidThisPSChildren.Value) > 0 && Convert.ToInt32(txtQ1_5_1.Text) + Convert.ToInt32(txtQ1_3_1.Text) + Convert.ToInt32(txtQ1_2_1.Text) <= Convert.ToInt32(hidThisPSChildren.Value) && (Convert.ToInt32(txtQ1_5_1.Text) + Convert.ToInt32(txtQ1_3_1.Text) + Convert.ToInt32(txtQ1_2_1.Text)) > Convert.ToInt32(hidMaxPSChildren.Value))
        {
            Response.Write("2nd test<br/>");
            args.IsValid = false;
        }
        else if (Convert.ToInt32(hidIsFirstTime.Value) == 1 && Convert.ToInt32(txtQ1_5_1.Text) + Convert.ToInt32(txtQ1_3_1.Text) + Convert.ToInt32(txtQ1_2_1.Text) > Convert.ToInt32(hidAvailPSChildren.Value))
        {
            Response.Write("3rd test<br/>");
            args.IsValid = false;
        }
        else if (Convert.ToInt32(hidThisPSChildren.Value) == 0 && (Convert.ToInt32(txtQ1_5_1.Text) + Convert.ToInt32(txtQ1_3_1.Text) + Convert.ToInt32(txtQ1_2_1.Text)) > Convert.ToInt32(hidAvailPSChildren.Value))
        {
            Response.Write("4th test<br/>");
            args.IsValid = false;
        }
    }

    protected void CustomValidator3_ServerValidate(object source, ServerValidateEventArgs args)
    {
        //Response.Write("IsFirstTime=" + hidIsFirstTime.Value + ", IsNewClass=" + hidIsNewClass.Value + ", LastUnder3=" + hidThisUnder3Year.Value + ", AvailalableUnder3 = " + Convert.ToInt32(hidAvailUnder3Year.Value) + ", TotalUnder3 = " + txtQ1_5_1.Text + ", hidUnder3 = " + Convert.ToString(hidCurUnder3Year.Value) + ", MaxUnder3 = " + Convert.ToString(hidMaxUnder3Year.Value) + "<br/>");
        if (Convert.ToInt32(hidThisUnder3Year.Value) > 0 && Convert.ToInt32(txtQ1_5_1.Text) > Convert.ToInt32(hidThisUnder3Year.Value) && Convert.ToInt32(hidThisUnder3Year.Value) - Convert.ToInt32(txtQ1_5_1.Text) > Convert.ToInt32(hidAvailUnder3Year.Value))
        {
            args.IsValid = false;
        }
        else if (Convert.ToInt32(hidThisUnder3Year.Value) > 0 && Convert.ToInt32(txtQ1_5_1.Text) <= Convert.ToInt32(hidThisUnder3Year.Value) && Convert.ToInt32(txtQ1_5_1.Text) > Convert.ToInt32(hidMaxUnder3Year.Value))
        {
            args.IsValid = false;
        }
        else if (Convert.ToInt32(hidIsFirstTime.Value) == 1 && Convert.ToInt32(txtQ1_5_1.Text) > Convert.ToInt32(hidAvailUnder3Year.Value))
        {
            args.IsValid = false;
        }
        else if (Convert.ToInt32(hidThisUnder3Year.Value) == 0 && Convert.ToInt32(txtQ1_5_1.Text) > Convert.ToInt32(hidAvailUnder3Year.Value))
        {
            args.IsValid = false;
        }
    }

    protected void CustomValidator2_ServerValidate(object source, ServerValidateEventArgs args)
    {
        Response.Write("IsFirstTime=" + hidIsFirstTime.Value + ", IsNewClass=" + hidIsNewClass.Value + ", Last4Year=" + hidThis4YearOld.Value + ", Availalable4 = " + Convert.ToInt32(hidAvail4YearOld.Value) + ", Total4Year = " + txtQ1_3_1.Text + ", hid4 = " + Convert.ToString(hidCur4YearOld.Value) + ", Max4Year = " + Convert.ToString(hidMax4YearOld.Value) + "<br/>");
        if (Convert.ToInt32(hidThis4YearOld.Value) > 0 && Convert.ToInt32(txtQ1_3_1.Text) > Convert.ToInt32(hidThis4YearOld.Value) && Convert.ToInt32(hidThis4YearOld.Value) - Convert.ToInt32(txtQ1_3_1.Text) > Convert.ToInt32(hidAvail4YearOld.Value))
        {
            args.IsValid = false;
        }
        else if (Convert.ToInt32(hidThis4YearOld.Value) > 0 && Convert.ToInt32(hidIsNewClass.Value) == 0 && Convert.ToInt32(txtQ1_3_1.Text) <= Convert.ToInt32(hidThis4YearOld.Value) && Convert.ToInt32(txtQ1_3_1.Text) > Convert.ToInt32(hidMax4YearOld.Value))
        {
            args.IsValid = false;
        }
        else if (Convert.ToInt32(hidIsFirstTime.Value) == 1 && Convert.ToInt32(txtQ1_3_1.Text) > Convert.ToInt32(hidAvail4YearOld.Value))
        {
            args.IsValid = false;
        }
        else if (Convert.ToInt32(hidThis4YearOld.Value) == 0 && Convert.ToInt32(txtQ1_3_1.Text) > Convert.ToInt32(hidAvail4YearOld.Value))
        {
            args.IsValid = false;
        }
    }

    protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
    {
        Response.Write("IsFirstTime=" + hidIsFirstTime.Value + ", IsNewClass=" + hidIsNewClass.Value + ", Last3year=" + hidThis3YearOld.Value + ", Availalable3 = " + Convert.ToInt32(hidAvail3YearOld.Value) + ", Total3Year = " + txtQ1_2_1.Text + ", hid3 = " + Convert.ToString(hidCur3YearOld.Value) + ", Max3Year = " + Convert.ToString(hidMax3YearOld.Value) + "<br/>");
        if (Convert.ToInt32(hidThis3YearOld.Value) > 0 && Convert.ToInt32(txtQ1_2_1.Text) > Convert.ToInt32(hidThis3YearOld.Value) && Convert.ToInt32(hidThis3YearOld.Value) - Convert.ToInt32(txtQ1_2_1.Text) > Convert.ToInt32(hidAvail3YearOld.Value))
        {
            args.IsValid = false;
        }
        else if (Convert.ToInt32(hidThis3YearOld.Value) > 0 && Convert.ToInt32(txtQ1_2_1.Text) <= Convert.ToInt32(hidThis3YearOld.Value) && Convert.ToInt32(txtQ1_2_1.Text) > Convert.ToInt32(hidMax3YearOld.Value))
        {
            args.IsValid = false;
        }
        else if (Convert.ToInt32(hidIsFirstTime.Value) == 1 && Convert.ToInt32(txtQ1_2_1.Text) > Convert.ToInt32(hidAvail3YearOld.Value))
        {
            args.IsValid = false;
        }
        else if (Convert.ToInt32(hidThis3YearOld.Value) == 0 && Convert.ToInt32(txtQ1_2_1.Text) > Convert.ToInt32(hidAvail3YearOld.Value))
        {
            args.IsValid = false;
        }

    }

    //protected void CustomValidator5_ServerValidate(object source, ServerValidateEventArgs args)
    //{
    //    //if (grdEducators.Rows.Count == 0)
    //    List<Educator> educatorList = (List<Educator>)ViewState["EducatorList"];

    //    if (educatorList.Count == 0)
    //    {
    //        args.IsValid = false;
    //    }
    //}

    //protected void CustomValidator5_ServerValidate(object source, ServerValidateEventArgs args)
    //{
    //    if (Convert.ToInt32(txtQ2_3_1.Text) + Convert.ToInt32(txtQ2_3_2.Text) != Convert.ToInt32(txtQ1_3_1.Text))
    //    {
    //        args.IsValid = false;
    //    }
    //}

    //protected void CustomValidator6_ServerValidate(object source, ServerValidateEventArgs args)
    //{
    //    if (Convert.ToInt32(txtQ2_4_1.Text) + Convert.ToInt32(txtQ2_4_2.Text) != Convert.ToInt32(txtQ1_4_1.Text))
    //    {
    //        args.IsValid = false;
    //    }
    //}

    //protected void CustomValidator7_ServerValidate(object source, ServerValidateEventArgs args)
    //{
    //    if (Convert.ToInt32(txtQ2_5_1.Text) + Convert.ToInt32(txtQ2_5_2.Text) != Convert.ToInt32(txtQ1_5_1.Text))
    //    {
    //        args.IsValid = false;
    //    }
    //}

    //protected void CustomValidator8_ServerValidate(object source, ServerValidateEventArgs args)
    //{
    //    if (Convert.ToInt32(txtQ3_3_1.Text) > Convert.ToInt32(txtQ1_3_1.Text))
    //    {
    //        args.IsValid = false;
    //    }
    //}

    //protected void CustomValidator9_ServerValidate(object source, ServerValidateEventArgs args)
    //{
    //    if (Convert.ToInt32(txtQ3_4_1.Text) > Convert.ToInt32(txtQ1_4_1.Text))
    //    {
    //        args.IsValid = false;
    //    }
    //}

    //protected void CustomValidator10_ServerValidate(object source, ServerValidateEventArgs args)
    //{
    //    if (Convert.ToInt32(txtQ3_5_1.Text) > Convert.ToInt32(txtQ1_5_1.Text))
    //    {
    //        args.IsValid = false;
    //    }
    //}

    //protected void CustomValidator11_ServerValidate(object source, ServerValidateEventArgs args)
    //{
    //    if (Convert.ToInt32(txtQ4_3_1.Text) > Convert.ToInt32(txtQ1_3_1.Text))
    //    {
    //        args.IsValid = false;
    //    }
    //}

    //protected void CustomValidator12_ServerValidate(object source, ServerValidateEventArgs args)
    //{
    //    if (Convert.ToInt32(txtQ4_4_1.Text) > Convert.ToInt32(txtQ1_4_1.Text))
    //    {
    //        args.IsValid = false;
    //    }
    //}

    //protected void CustomValidator13_ServerValidate(object source, ServerValidateEventArgs args)
    //{
    //    if (Convert.ToInt32(txtQ4_5_1.Text) > Convert.ToInt32(txtQ1_5_1.Text))
    //    {
    //        args.IsValid = false;
    //    }
    //}

    //protected void CustomValidator14_ServerValidate(object source, ServerValidateEventArgs args)
    //{
    //    if (txtQ1_1_1.Text == "")
    //    {
    //        args.IsValid = false;
    //    }
    //}

}

