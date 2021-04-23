

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Collections;
using System.Text;

public partial class CommunitiesServed : System.Web.UI.Page
{
    DataSet ds;
    DAL dal = new DAL();
    string startUpFunctionCalls = "";
    string checkBoxList = "";
    StringBuilder regularDataPointList = new StringBuilder();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["GrantApplicantId"] == null) Response.Redirect("SessionTimeout.aspx");

        Master.PartTitle = AppInfo.DisplayPart2Title;

        lblInstruction.Text = dal.GetPartInstruction(AppInfo.FundCode, AppInfo.FiscalYear, "2");

        txtCensusHouseholds.Attributes.Add("readonly", "true");
        txtCensusChildren0to5.Attributes.Add("readonly", "true");
        txtCensusChildren.Attributes.Add("readonly", "true");
        txtFirstLanguageNotEnglish.Attributes.Add("readonly", "true");
        txtEnglishLanguageLearner.Attributes.Add("readonly", "true");
        txtStudentsWithDisabilities.Attributes.Add("readonly", "true");
        txtLicensePrograms.Attributes.Add("readonly", "true");
        txtMedFamiliesPerMonth.Attributes.Add("readonly", "true");
        txtMedChildrenPerMonth.Attributes.Add("readonly", "true");
        txtProvidersFamilies.Attributes.Add("readonly", "true");
        txtHighNeeds.Attributes.Add("readonly", "true");
        txtEconomicallyDisadvantaged.Attributes.Add("readonly", "true");

        if (!IsPostBack)
        {
            InitializePageControls();

            BindData(false);
        }

        //BindScripts();
    }

    private void BindScripts()
    {
        DataSet dsData = dal.GetAllDistrictData(Int32.Parse(Session["GrantApplicantId"].ToString()), AppInfo.FiscalYear);

        if (dsData.Tables[0].Rows.Count > 0)
        {
            if (!ClientScript.IsClientScriptBlockRegistered("districtData"))
            {
                StringBuilder cstext = new StringBuilder();
                cstext.Append("<script type=\"text/javascript\">\n");
                /*constant for district data point*/
                cstext.Append("var FirstLanguageNotEnglish = 0;\n");
                cstext.Append("var EnglishLanguageLearner = 1;\n");
                cstext.Append("var StudentsWithDisabilities = 2;\n");
                cstext.Append("var ChildrenWithDisabilities = 3;\n");
                cstext.Append("var HighNeeds = 4;\n");
                cstext.Append("var EconomicallyDisadvantaged = 5;\n");
                cstext.Append("var TotalDistrictDataPoint = 6;\n"); //need to update this constant if new data point added
                cstext.Append("var districtData = new Array();\n");
                cstext.Append("var districtDataUsed = new Array();\n");
                cstext.Append("var townIdToDistrict = new Array();\n");

                /*constant for regular data point*/
                cstext.Append("var TownId = 0;\n");
                cstext.Append("var TownCensusHouseholds = 1;\n");
                cstext.Append("var TownCensusChildren0to5 = 2;\n");
                cstext.Append("var TownCensusChildren = 3;\n");
                cstext.Append("var TownLicensedPrograms = 4;\n");
                cstext.Append("var TownProviders = 5;\n");
                cstext.Append("var TownFamilies = 6;\n");
                cstext.Append("var TownChildren = 7;\n");
                cstext.Append("var Funding = 8;\n");
                cstext.Append("var AvgNumberProvidersFamilies = 9;\n");
                cstext.Append("var MedianNumberofFamiliesReceivingServicesPerMonth = 10;\n");
                cstext.Append("var MedianNumberofChildrenReceivingServicesPerMonth = 11;\n");
                cstext.Append("var TotalRegularDataPoint = 12;\n"); //need to update this constant if new data point added
                cstext.Append("var regularDataPoint = new Array();\n");

                for (int i = 0; i < dsData.Tables[0].Rows.Count; i++)
                {
                    DataRow row = dsData.Tables[0].Rows[i];

                    cstext.Append("districtData[\"" + row["District"].ToString() + "\"] = new Array(" + row["First Language Not English"].ToString() + "," +
                                                                                                      row["English Language Learner"].ToString() + "," +
                                                                                                      row["Students With Disabilities"].ToString() + "," +
                                                                                                      row["Children with Disabilities"].ToString() + "," +
                                                                                                      row["High Needs"].ToString() + "," +
                                                                                                      row["EconomicallyDisadvantaged"].ToString() + ");\n");
                }

                for (int i = 0; i < dsData.Tables[0].Rows.Count; i++)
                {
                    DataRow row = dsData.Tables[0].Rows[i];

                    cstext.Append("districtDataUsed[\"" + row["District"].ToString() + "\"] = new Array(0, 0, 0, 0, 0, 0);\n");
                }

                int count = 0;
                string townId = dsData.Tables[1].Rows[0]["CityTownId"].ToString();
                string districtList = "";

                while (count < dsData.Tables[1].Rows.Count)
                {
                    DataRow row = dsData.Tables[1].Rows[count];

                    if (townId != row["CityTownId"].ToString())
                    {
                        cstext.Append(districtList.Substring(0, districtList.Length - 1) + ");\n");
                        districtList = "";
                    }

                    townId = row["CityTownId"].ToString();

                    if (string.IsNullOrEmpty(districtList))
                        districtList = "townIdToDistrict[\"" + row["CityTownId"].ToString() + "\"] = new Array(" + "\"" + row["DISTRICT"].ToString() + "\",";
                    else
                        districtList = districtList + "\"" + row["DISTRICT"].ToString() + "\",";

                    count++;
                }
                cstext.Append("</script>\n");

                ClientScript.RegisterClientScriptBlock(typeof(Page), "districtData", cstext.ToString());
                ClientScript.RegisterClientScriptBlock(typeof(Page), "regularDataPoint", "<script type=\"text/javascript\">\n" + regularDataPointList.ToString() + "</script>\n");
            }
        }
    }

    private void DisplayForPreschool()
    {
        trCensusChildren0to5.Visible = true;
        trEnglishLanguageLearner.Visible = false;
        trFirstLanguageNotEnglish.Visible = false;
        trStudentsWithDisabilities.Visible = false;
        trCensusHouseholds.Visible = true;
        trLicensedProviders.Visible = true;
        trChildrenWithDisabilities.Visible = true;
        trLevel4Indicator.Visible = false;
        trGatewayIndicator.Visible = true;
        trRuralCommunities.Visible = true;
        trHighRiskText.Visible = true;
        trHighNeeds.Visible = true;
        trEconomicallyDisadvantaged.Visible = true;
    }

    private void DisplayForUPK()
    {
        trCensusChildren0to5.Visible = true;
        trCensusHouseholds.Visible = true;
        trAvgProvidersFamilies.Visible = true;
        trLicensedProviders.Visible = true;
        trMedFamiliesPerMonth.Visible = true; 
        trMedChildrenPerMonth.Visible = true;
        trEnglishLanguageLearner.Visible = true;
        trFirstLanguageNotEnglish.Visible = true;
        trLevel4Indicator.Visible = false;
        trGatewayIndicator.Visible = true;
        trRuralCommunities.Visible = true;
        trHighRiskText.Visible = true; 
        trHighNeeds.Visible = false;
        trEconomicallyDisadvantaged.Visible = false;
    }

    private void DisplayForMentalHealth()
    {
        trTotalFunding.Visible = true;
        trLicensedProviders.Visible = true;
        trAvgProviders.Visible = true;
        trFamilies.Visible = true;
        trChildren.Visible = true;
        trLevel4Indicator.Visible = false;
        trHighNeeds.Visible = false;
        trEconomicallyDisadvantaged.Visible = false;
    }
    private void DisplayForEPS()
    {
        trEnglishLanguageLearner.Visible = true;
        trFirstLanguageNotEnglish.Visible = true;
        trAvgProvidersFamilies.Visible = true;
        trLicensedProviders.Visible = true;        
        trLevel4Indicator.Visible = false;
        trGatewayIndicator.Visible = true;
        trRuralCommunities.Visible = true;
        trHighRiskText.Visible = true;
        trHighNeeds.Visible = false;
        trEconomicallyDisadvantaged.Visible = false;
    }
    private void DisplayForCFCE()
    {
        trTotalFunding.Visible = false;
        trCensusHouseholds.Visible = true;
        trCensusChildren.Visible = true;

        trLicensedProviders.Visible = true;
        trEnglishLanguageLearner.Visible = true;
        trFirstLanguageNotEnglish.Visible = true;

        trStudentsWithDisabilities.Visible = true;
        trAvgProvidersFamilies.Visible = true;
        trMedFamiliesPerMonth.Visible = false;
        trMedChildrenPerMonth.Visible = false;
        trLevel4Indicator.Visible = false;
        trGatewayIndicator.Visible = true;
        trRuralCommunities.Visible = true;
        trHighRiskText.Visible = true;

        trHighNeeds.Visible = true;
        trEconomicallyDisadvantaged.Visible = true;
    }

    private void DisplayForHeadStart()
    {
        trCensusHouseholds.Visible = true;
        trCensusChildren.Visible = false;
        trCensusChildren0to5.Visible = true;
        trFirstLanguageNotEnglish.Visible = true;
        trEnglishLanguageLearner.Visible = true;
        trStudentsWithDisabilities.Visible = false;
        trChildrenWithDisabilities.Visible = true;
        trLicensedProviders.Visible = true;
        trMedFamiliesPerMonth.Visible = true;
        trMedChildrenPerMonth.Visible = true;
        trAvgProvidersFamilies.Visible = true;
        trLevel4Indicator.Visible = false;
        trGatewayIndicator.Visible = true;
        trHighRiskText.Visible = true;
        trRuralCommunities.Visible = true;
        trHighNeeds.Visible = false;
        trEconomicallyDisadvantaged.Visible = false;
    }

    private void DisplayForCPPI()
    {
        trCensusChildren0to5.Visible = true;
        trCensusHouseholds.Visible = true;
        trAvgProvidersFamilies.Visible = true;
        trChildrenWithDisabilities.Visible = true;  //added
        trLicensedProviders.Visible = true;
        trMedFamiliesPerMonth.Visible = false;  //changed
        trMedChildrenPerMonth.Visible = true;
        trEnglishLanguageLearner.Visible = false;   //changed
        trFirstLanguageNotEnglish.Visible = true;
        trLevel4Indicator.Visible = true;     //changed
        trGatewayIndicator.Visible = true;
        trRuralCommunities.Visible = true;
        trHighRiskText.Visible = false;     //changed
        trHighNeeds.Visible = true;     //changed
        trEconomicallyDisadvantaged.Visible = true;     //changed
    }

    private void InitializePageControls()
    {
        switch (AppInfo.FundCode)
        {
            case 1:
                DisplayForMentalHealth();
                break;
            case 322:
                DisplayForEPS();
                break;
            case 237:
                DisplayForCFCE();
                break;
            case 390:
                DisplayForHeadStart();
                break;
            case 391:
                DisplayForPreschool();
                break;
            case 511:
                DisplayForUPK();
                break;
            case 515:
                DisplayForCPPI();
                break;
            default:
                DisplayForMentalHealth();
                break;
        }
    }

    private void BindData(bool isAfterSaved)
    {
        ds = dal.GetCommunitiesTotalDataPoint(Convert.ToInt32(Session["GrantApplicantId"].ToString()));

        if (ds.Tables[0].Rows.Count > 0)
        {
            DataRow dr = ds.Tables[0].Rows[0];

            txtCensusHouseholds.Text = dr["TotalCensusHouseholds"].ToString();
            txtCensusChildren0to5.Text = dr["TotalCensusChildren0to5"].ToString();
            txtCensusChildren.Text = dr["TotalCensusChildren"].ToString();
            txtEnglishLanguageLearner.Text = dr["TotalEnglishLanguageLearner"].ToString();
            txtFirstLanguageNotEnglish.Text = dr["TotalFirstLanguageNotEnglish"].ToString();
            txtStudentsWithDisabilities.Text = dr["TotalStudentsWithDisabilities"].ToString();
            txtLicensePrograms.Text = dr["TotalLicensePrograms"].ToString();
            txtHighNeeds.Text = dr["TotalHighNeeds"].ToString();
            txtEconomicallyDisadvantaged.Text = dr["TotalEconomicallyDisadvantaged"].ToString();
            txtChildrenWithDisabilities.Text = dr["TotalChildrenWithDisabilities"].ToString();
            txtProvidersFamilies.Text = dr["TotalAvgProvidersFamilies"].ToString();
            txtMedFamiliesPerMonth.Text = dr["TotalMedianNumberofFamiliesReceivingServicesPerMonth"].ToString();
            txtMedChildrenPerMonth.Text = dr["TotalMedianNumberofChildrenReceivingServicesPerMonth"].ToString();
        }

        if (AppInfo.EligibilityAmountFromTowns)
        {
            ds = dal.GetGrantApplicant(Convert.ToInt32(Session["GrantApplicantId"]), AppInfo.FundCode);

            if (ds.Tables[0].Rows.Count > 0)
            {
                txtTotalFunding.Text = Decimal.Parse(ds.Tables[0].Rows[0]["EligibilityAmount"].ToString()).ToString("N2");
            }
        }

        if (AppInfo.EligibilityAmountFromTowns)
        {
            ds = dal.GetAllCommunitiesServed(Convert.ToInt32(Session["GrantApplicantId"].ToString()), AppInfo.FiscalYear, AppInfo.FundCode, 1);
        }
        else
        {
            ds = dal.GetAllCommunitiesServed(Convert.ToInt32(Session["GrantApplicantId"].ToString()), AppInfo.FiscalYear);
        }

        //bind all the towns for a given region
        dlRegionList.DataSource = ds.Tables[0];
        dlRegionList.DataBind();

        ClientScript.RegisterStartupScript(typeof(Page), "startup", "<script language=\"JavaScript\" type=\"text/javascript\">\n" + startUpFunctionCalls + "</script>\n");

        tblSuccess.Visible = (isAfterSaved) ? true : false;

        BindScripts();
    }

    protected void dlRegionList_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        Label lblRegionName;
        CheckBox chkSelectAll;

        DataList dlTownList;

        DataList lstRegion = (DataList)sender;

        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            DataRowView dataRow = (DataRowView)e.Item.DataItem;

            lblRegionName = (Label)e.Item.FindControl("lblRegionName");
            chkSelectAll = (CheckBox)e.Item.FindControl("chkSelectAll");

            dlTownList = (DataList)e.Item.FindControl("dlTownList");

            lblRegionName.Text = dataRow["CCRRRegionName"].ToString();

            DataView dv = new DataView(ds.Tables[1]);
            dv.RowFilter = "CCRRRegionId = " + dataRow["CCRRRegionId"].ToString();

            checkBoxList = "";

            dlTownList.DataSource = dv;
            dlTownList.DataBind();

            chkSelectAll.Attributes.Add("OnClick", "checkAll(" + "'" + chkSelectAll.ClientID + "'," + checkBoxList.Substring(0, checkBoxList.Length - 1) + ");");
        }
    }

    protected void dlTownList_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        Label lblTown;
        CheckBox chkTown;
        Label lblHighRiskFactor, lblLevel4Indicator, lblGatewayIndicator, lblRuralCommunities;

        HiddenField hfCityTownId;

        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            DataRowView dataRow = (DataRowView)e.Item.DataItem;

            lblTown = (Label)e.Item.FindControl("lblTown");
            chkTown = (CheckBox)e.Item.FindControl("chkTown");

            lblHighRiskFactor = (Label)e.Item.FindControl("lblHighRiskFactor");
            lblLevel4Indicator = (Label)e.Item.FindControl("lblLevel4Indicator");
            lblGatewayIndicator = (Label)e.Item.FindControl("lblGatewayIndicator");
            lblRuralCommunities = (Label)e.Item.FindControl("lblRuralCommunities");
            hfCityTownId = (HiddenField)e.Item.FindControl("hfCityTownId");

            lblTown.Text = dataRow["Town"].ToString();
            chkTown.Text = dataRow["Town"].ToString();

            lblHighRiskFactor.Text = "(" + dataRow["HighRiskVisitingFactor"].ToString() + ")";
            lblHighRiskFactor.Visible = trHighRiskText.Visible;
            lblLevel4Indicator.Visible = Convert.ToBoolean(dataRow["IsLevel4Community"].ToString()) && trLevel4Indicator.Visible;
            lblGatewayIndicator.Visible = Convert.ToBoolean(dataRow["IsGatewayCommunity"].ToString()) && trGatewayIndicator.Visible;
            lblRuralCommunities.Visible = Convert.ToBoolean(dataRow["IsRuralCommunities"].ToString()) && trRuralCommunities.Visible;

            hfCityTownId.Value = dataRow["CityTownId"].ToString();

            chkTown.Checked = (dataRow["IsSelected"].ToString() == "1");
            chkTown.Attributes["onclick"] = "javascript:UpdateTotals(this, '" + hfCityTownId.Value + "');";

            checkBoxList += "'" + chkTown.ClientID + "',";

            if (chkTown.Checked)
            {
                startUpFunctionCalls += "incrementSpecialDataPointUsed('" + hfCityTownId.Value + "',EnglishLanguageLearner);\n";
                startUpFunctionCalls += "incrementSpecialDataPointUsed('" + hfCityTownId.Value + "',FirstLanguageNotEnglish);\n";
                startUpFunctionCalls += "incrementSpecialDataPointUsed('" + hfCityTownId.Value + "',StudentsWithDisabilities);\n";
                startUpFunctionCalls += "incrementSpecialDataPointUsed('" + hfCityTownId.Value + "',HighNeeds);\n";
                startUpFunctionCalls += "incrementSpecialDataPointUsed('" + hfCityTownId.Value + "',ChildrenWithDisabilities);\n";
                startUpFunctionCalls += "incrementSpecialDataPointUsed('" + hfCityTownId.Value + "',EconomicallyDisadvantaged);\n";
            }

            regularDataPointList.Append("regularDataPoint[\"" + chkTown.ClientID + "\"] = new Array(" + hfCityTownId.Value + "," +
                                                                                                dataRow["CensusHouseholds"].ToString() + "," +
                                                                                                dataRow["CensusChildren0to5"].ToString() + "," +
                                                                                                dataRow["CensusChildren"].ToString() + "," +
                                                                                                dataRow["LicensedPrograms"].ToString() + "," +
                                                                                                dataRow["Providers"].ToString() + "," +
                                                                                                dataRow["FamiliesRecievingServices"].ToString() + "," +
                                                                                                dataRow["ChildrenReceivingServices"].ToString() + "," +
                                                                                                dataRow["FundDistribution"].ToString() + "," +
                                                                                                dataRow["Avg# Number of Providers in Towns with Families Receiving Servic"].ToString() + "," +
                                                                                                dataRow["Median Number of Families Receiving Services Per Month"].ToString() + "," +
                                                                                                dataRow["Median Number of Children Receiving Services Per Month"].ToString() + ");\n");

            lblTown.Visible = false;
        }
    }

    private string GetSelectedTownsInXml()
    {
        DataTable dt = new DataTable("Towns");
        dt.Columns.Add("CityTownId");

        DataRow dr;

        foreach (DataListItem di in dlRegionList.Items)
        {
            DataList dlTownList = (DataList)di.FindControl("dlTownList");

            foreach (DataListItem town in dlTownList.Items)
            {
                if (((CheckBox)town.FindControl("chkTown")).Checked)
                {
                    dr = dt.NewRow();
                    dr["CityTownId"] = ((HiddenField)town.FindControl("hfCityTownId")).Value;

                    dt.Rows.Add(dr);
                }
            }
        }

        DataSet ds = new DataSet("Proposal");
        ds.Tables.Add(dt);
        return ds.GetXml();
    }

    private void SaveData()
    {
        try
        {
            //save proposal : Region, towns, levels.
            string xmlCityTowns = GetSelectedTownsInXml();

            dal.SaveGrantProposal(Convert.ToInt32(Session["GrantApplicantId"])
                    , xmlCityTowns
                    , txtCensusHouseholds.Text
                    , txtCensusChildren0to5.Text
                    , txtCensusChildren.Text
                    , txtEnglishLanguageLearner.Text
                    , txtFirstLanguageNotEnglish.Text
                    , txtStudentsWithDisabilities.Text
                    , txtChildrenWithDisabilities.Text
                    , txtHighNeeds.Text
                    , txtLicensePrograms.Text
                    , txtProvidersFamilies.Text
                    , txtMedChildrenPerMonth.Text
                    , txtMedFamiliesPerMonth.Text
                    , txtEconomicallyDisadvantaged.Text);

            if (AppInfo.EligibilityAmountFromTowns)
            {
                dal.UpdateEligibilityAmount(Convert.ToInt32(Session["GrantApplicantId"]), AppInfo.FiscalYear, AppInfo.FundCode);
                Session["Eligibility Amount"] = Decimal.Parse(txtTotalFunding.Text).ToString("N2");
                Master.ReloadEligibilityAmount();
            }
        }
        catch (Exception ex)
        {
            //lblMessage.Text = ex.Message;
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            SaveData();

            BindData(true);
        }
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("CheckList.aspx");
    }

    protected void btnSavePrint_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            SaveData();

            Response.Redirect("Print.aspx?type=communitiesServed");
        }
    }

    protected void btnBackToHome_Click(object sender, EventArgs e)
    {
        Response.Redirect("CheckList.aspx");
    }

    protected void btnNextPart_Click(object sender, EventArgs e)
    {
        Response.Redirect("Languages.aspx");
    }
}
