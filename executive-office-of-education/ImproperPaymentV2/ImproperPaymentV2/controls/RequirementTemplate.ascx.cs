using System;
using System.Collections;
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
using System.Collections.Generic;

public partial class controls_RequirementTemplate : System.Web.UI.UserControl
{
    public string RecID;
    public string RecType;
    public string FundingStream;
    public string Placement;
    public int FormID;
    private int CheckBoxCount = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (FormID != 420 && FormID != 430)
            {
                lstRequirements.Visible = true;
                frm420.Visible = false;
                frm430.Visible = false;
                LoadRequirementList();

                if ((FundingStream == "1" || FundingStream == "4") && (FormID == 320 || FormID == 400))
                {
                    tblParents.Visible = true;
                    blkTab1.Style.Add("background-color", "#dde9d5");
                }
                else
                {
                    blkTab1.Style.Add("background-color", "#D5D8E9");
                }

                //if (FormID == 400 && FundingStream != "3")
                if (FormID == 340)
                {
                    frm340.Visible = true;

                    CreateProgramTypeInfo();
                    
                    if (Session["IsReadOnly"] == "1")
                    {
                        frm340.Disabled = true;
                    }
                }
                if (FormID == 400)
                {
                    frm400.Visible = true;

                    if (Session["IsReadOnly"] == "1")
                    {                                         
                        frm400.Disabled = true;
                    }
                }
                //if (FormID == 410 && FundingStream != "3")
                if (FormID == 410)
                {
                    frm410.Visible = true;
                    frm410Extra.Visible = true;
                }
            }
            else if (FormID == 420)
            {
                lstRequirements.Visible = false;

                if (FundingStream == "3")
                {
                    frm420DCF.Visible = true;
                    frm420.Visible = false;
                    frm430.Visible = false;
                    frm420DTA.Visible = false;
                }
                else if (FundingStream == "2")
                {
                    frm420DTA.Visible = true;
                    frm420.Visible = false;
                    frm430.Visible = false;
                    frm420DCF.Visible = false;
                }
                else
                {
                    frm420DCF.Visible = false;
                    frm420.Visible = true;
                    frm430.Visible = false;
                    frm420DTA.Visible = false;
                }
            }
            else if (FormID == 430)
            {
                lstRequirements.Visible = false;
                frm420.Visible = false;
                frm430.Visible = true;
            }
            
        }

    }

    private void CreateProgramTypeInfo()
    {

        txtReviewerProgramType340.Items.Add(new ListItem { Text = "0T", Value = "0T" });
        txtReviewerProgramType340.Items.Add(new ListItem { Text = "1T", Value = "1T" });
        txtReviewerProgramType340.Items.Add(new ListItem { Text = "2T", Value = "2T" });
        txtReviewerProgramType340.Items.Add(new ListItem { Text = "AddOn - UnderUtil", Value = "AddOn - UnderUtil" });
        txtReviewerProgramType340.Items.Add(new ListItem { Text = "ARRAVoucherReassessmentPilot", Value = "ARRAVoucherReassessmentPilot" });
        txtReviewerProgramType340.Items.Add(new ListItem { Text = "CBAftSchool", Value = "CBAftSchool" });

        txtReviewerProgramType340.Items.Add(new ListItem { Text = "CBBfrAftSchool", Value = "CBBfrAftSchool" });
        txtReviewerProgramType340.Items.Add(new ListItem { Text = "CBBfrSchool", Value = "CBBfrSchool" });
        txtReviewerProgramType340.Items.Add(new ListItem { Text = "CBBlended", Value = "CBBlended" });
        txtReviewerProgramType340.Items.Add(new ListItem { Text = "CBInfant", Value = "CBInfant" });
        txtReviewerProgramType340.Items.Add(new ListItem { Text = "CBInfantToddler", Value = "CBInfantToddler" });
        txtReviewerProgramType340.Items.Add(new ListItem { Text = "CBPreSchool", Value = "CBPreSchool" });

        txtReviewerProgramType340.Items.Add(new ListItem { Text = "CBSchoolAge", Value = "CBSchoolAge" });
        txtReviewerProgramType340.Items.Add(new ListItem { Text = "CBToddler", Value = "CBToddler" });
        txtReviewerProgramType340.Items.Add(new ListItem { Text = "Child3Tri", Value = "Child3Tri" });
        txtReviewerProgramType340.Items.Add(new ListItem { Text = "ContractExpended", Value = "ContractExpended" });
        txtReviewerProgramType340.Items.Add(new ListItem { Text = "FCC2Over", Value = "FCC2Over" });
        txtReviewerProgramType340.Items.Add(new ListItem { Text = "FCCS2Over", Value = "FCCS2Over" });
        txtReviewerProgramType340.Items.Add(new ListItem { Text = "FCCSUnder2", Value = "FCCSUnder2" });
        txtReviewerProgramType340.Items.Add(new ListItem { Text = "FCCUnder2", Value = "FCCUnder2" });
        txtReviewerProgramType340.Items.Add(new ListItem { Text = "Homeless", Value = "Homeless" });
        txtReviewerProgramType340.Items.Add(new ListItem { Text = "HSAftSchool", Value = "HSAftSchool" });
        txtReviewerProgramType340.Items.Add(new ListItem { Text = "HSBfrAftSchool", Value = "HSBfrAftSchool" });
        txtReviewerProgramType340.Items.Add(new ListItem { Text = "HSBfrSchool", Value = "HSBfrSchool" });
        txtReviewerProgramType340.Items.Add(new ListItem { Text = "HSFullDay", Value = "HSFullDay" });
        txtReviewerProgramType340.Items.Add(new ListItem { Text = "IHInChildHomeNonRel", Value = "IHInChildHomeNonRel" });
        txtReviewerProgramType340.Items.Add(new ListItem { Text = "IHInChildHomeRel", Value = "IHInChildHomeRel" });
        txtReviewerProgramType340.Items.Add(new ListItem { Text = "IHInRelHomeRel", Value = "IHInRelHomeRel" });
        txtReviewerProgramType340.Items.Add(new ListItem { Text = "KindAftSchool", Value = "KindAftSchool" });
        txtReviewerProgramType340.Items.Add(new ListItem { Text = "KindBfrAftSchool", Value = "KindBfrAftSchool" });
        txtReviewerProgramType340.Items.Add(new ListItem { Text = "KindBfrSchool", Value = "KindBfrSchool" });
        txtReviewerProgramType340.Items.Add(new ListItem { Text = "KindFullDay", Value = "KindFullDay" });
        txtReviewerProgramType340.Items.Add(new ListItem { Text = "PMLA", Value = "PMLA" });
        txtReviewerProgramType340.Items.Add(new ListItem { Text = "QRIS", Value = "QRIS" });
        txtReviewerProgramType340.Items.Add(new ListItem { Text = "QRISCBAftSchool", Value = "QRISCBAftSchool" });
        txtReviewerProgramType340.Items.Add(new ListItem { Text = "QRISCBBfrAftSchool", Value = "QRISCBBfrAftSchool" });
        txtReviewerProgramType340.Items.Add(new ListItem { Text = "QRISCBBfrSchool", Value = "QRISCBBfrSchool" });
        txtReviewerProgramType340.Items.Add(new ListItem { Text = "QRISCBInfant", Value = "QRISCBInfant" });
        txtReviewerProgramType340.Items.Add(new ListItem { Text = "QRISCBInfantToddler", Value = "QRISCBInfantToddler" });
        txtReviewerProgramType340.Items.Add(new ListItem { Text = "QRISCBPreSchool", Value = "QRISCBPreSchool" });
        txtReviewerProgramType340.Items.Add(new ListItem { Text = "QRISCBSchoolAge", Value = "QRISCBSchoolAge" });
        txtReviewerProgramType340.Items.Add(new ListItem { Text = "QRISCBToddler", Value = "QRISCBToddler" });
        txtReviewerProgramType340.Items.Add(new ListItem { Text = "QRISFCCOver2", Value = "QRISFCCOver2" });
        txtReviewerProgramType340.Items.Add(new ListItem { Text = "QRISFCCUnder2", Value = "QRISFCCUnder2" });
        txtReviewerProgramType340.Items.Add(new ListItem { Text = "QRISHSBfrAftSchool", Value = "QRISHSBfrAftSchool" });
        txtReviewerProgramType340.Items.Add(new ListItem { Text = "QRISHSFullDay", Value = "QRISHSFullDay" });
        txtReviewerProgramType340.Items.Add(new ListItem { Text = "SpecialNeeds", Value = "SpecialNeeds" });
        txtReviewerProgramType340.Items.Add(new ListItem { Text = "Sup", Value = "Sup" });
        txtReviewerProgramType340.Items.Add(new ListItem { Text = "TEEN", Value = "TEEN" });
        txtReviewerProgramType340.Items.Add(new ListItem { Text = "Transport", Value = "Transport" });
        txtReviewerProgramType340.Items.Add(new ListItem { Text = "UnderUtil", Value = "UnderUtil" });
        txtReviewerProgramType340.Items.Add(new ListItem { Text = "UnionCope", Value = "UnionCope" });
        txtReviewerProgramType340.Items.Add(new ListItem { Text = "UnionDues", Value = "UnionDues" });
    }

    private void LoadRequirementList()
    {
        string sError = "";
        DataSet dsInfo;

        dsInfo = CForms.GetRequirementInfo(ref sError, Convert.ToInt32(RecID), FormID, RecType, FundingStream.ToString(), Placement, "");
        lstRequirements.DataSource = CreateItemList(dsInfo);

        // Get second parent info, if any
        dsInfo = CForms.GetRequirementInfo(ref sError, Convert.ToInt32(RecID), FormID, RecType, FundingStream.ToString(), Placement, "2");
        lstRequirements2.DataSource = CreateItemList(dsInfo);

        DataBind();

    }

    private void ReorderItemList(List<Item> orderList, List<Item> itemList, int listLevel)
    {
        foreach (Item item in itemList)
        {
            item.ListLevel = listLevel;
            orderList.Add(item);

            if (item.ItemList.Count > 0)
            {
                ReorderItemList(orderList, item.ItemList, (listLevel + 1));
            }
        }
    }

    private List<Item> CreateSubItemList(List<Item> itemList)
    {
        List<Item> tempList = new List<Item>();

        foreach (Item item in itemList)
        {
            if (item.RefID == "")
            {
                tempList.Add(item);
            }
            else
            {
                foreach (Item i in itemList)
                {
                    if (Convert.ToInt32(i.ID) == Convert.ToInt32(item.RefID))
                    {
                        i.ItemList.Add(item);
                        break;
                    }
                }
            }
        }

        List<Item> orderedList = new List<Item>();

        ReorderItemList(orderedList, tempList, 1);

        return orderedList;
    }

    private List<Item> CreateItemList(DataSet ds)
    {
        DataRow row;

        //first, we determine where to add an item.
        List<Item> itemList = new List<Item>();

        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        {
            row = ds.Tables[0].Rows[i];

            Item item = new Item();
            item.ID = Convert.ToInt16(row["ItemID"].ToString());
            item.ElementID = Convert.ToInt16(row["ElementID"].ToString());
            item.Description = row["ItemDescription"].ToString();
            item.HelpTips = row["HelpTips"].ToString();
            item.DisplayType = Convert.ToInt16(row["displayType"].ToString());
            item.Checked = (row["checked"].ToString() == "") ? 0 : Convert.ToInt16(row["checked"].ToString());
            item.RefID = row["ItemRefID"].ToString();

            itemList.Add(item);
        }

        itemList = CreateSubItemList(itemList);

        return itemList;
    }

    protected void lstRequirements_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        Image img1;
        Image img2;
        CheckBox chkItem;
        Label txtItemDesc;
        Item item;
        HyperLink lnkHelp;
        Panel pnlHelp;
        Label lblHelp;
        FormControls formControls;

        DataList lstRequirements = (DataList)sender;
        List<Item> itemList = (List<Item>)lstRequirements.DataSource;

        if ((e.Item.ItemType == ListItemType.Item) || (e.Item.ItemType == ListItemType.AlternatingItem))
        {
            img1 = (Image)e.Item.FindControl("imgspace1");
            img2 = (Image)e.Item.FindControl("imgspace2");
            chkItem = (CheckBox)e.Item.FindControl("chkItem");
            txtItemDesc = (Label)e.Item.FindControl("txtItemDesc");
            lnkHelp = (HyperLink)e.Item.FindControl("lnkHelp");
            pnlHelp = (Panel)e.Item.FindControl("pnlHelp");
            lblHelp = (Label)e.Item.FindControl("lblHelp");

            item = (Item)e.Item.DataItem;   //get the current datasource row

            img2.Visible = false;
            txtItemDesc.Text = item.Description.Trim();
            if (item.ListLevel == 2)
            {
                img1.Style.Remove("width");
                img1.Style.Add("width", "35px");
            }
            else if (item.ListLevel == 3)
            {
                img1.Style.Remove("width");
                img1.Style.Add("width", "60px");
            }
            else if (item.ListLevel == 4)
            {
                img1.Style.Remove("width");
                img1.Style.Add("width", "85px");
            }
            if (item.DisplayType == 0)  //label
            {
                chkItem.Visible = false;
                txtItemDesc.Font.Bold = true;
                //txtItemDesc.Style.Add("color", "blue");
                img1.Style.Remove("width");
            }
            else
            {
                /*****we try to put the controls into the the form controls list, so later on we can get all the client ids****/
                ////formControls = (FormControls)formControlsList[item.ElementID];
                chkItem.Checked = (item.Checked == 1) ? true : false;
                chkItem.Attributes.Add("onclick", "javascript:changeItemValue('" + item.ID + "', this.checked);");
                ////formControls.ItemCheckBoxesList.Add(item.ID, chkItem);
                sScript.Text += "arrForms['" + FormID.ToString() + "'][1][" + CheckBoxCount++ + "] = new Array('" + item.ID + "','" + chkItem.ClientID + "');";
                sScript.Text += "arrItemValue[" + item.ID + "]=" + ((chkItem.Checked) ? "true" : "false") + ";";
            }

            if (string.IsNullOrEmpty(item.HelpTips))
            {
                lnkHelp.Visible = false;
                pnlHelp.Visible = false;
            }
            else
            {
                lnkHelp.NavigateUrl = "javascript:displayHelp('" + pnlHelp.ClientID + "');";
                lblHelp.Text = Server.HtmlEncode(item.HelpTips);
            }

            

        }
    }

    protected void grdMIDList_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            DataRowView dr = (DataRowView)e.Row.DataItem;

            e.Row.Cells[0].Text = dr["ElementId"].ToString();
            e.Row.Cells[1].Text = dr["Answer"].ToString();
        }
    }
}
