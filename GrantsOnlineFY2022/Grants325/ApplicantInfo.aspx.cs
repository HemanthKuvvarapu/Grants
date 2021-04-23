﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class ApplicantInfo : System.Web.UI.Page
{
    DAL dal = new DAL();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["GrantApplicantId"] == null) Response.Redirect("SessionTimeout.aspx");

        Master.PartTitle = AppInfo.DisplayPart1Title;

        lblInstruction.Text = dal.GetPartInstruction(AppInfo.FundCode, AppInfo.FiscalYear, "1");

        if (!IsPostBack)
        {
            BindData();
        }

        DisplayAmendmentSection();
    }

    private void DisplayAmendmentSection()
    {
        if (AppInfo.Amendment1 || AppInfo.Amendment2 || AppInfo.Amendment3)
        {
            lnkNextPart.Visible = false;
        }
    }

    private void BindData()
    {
        if (Session["GrantApplicantId"] != null) //User has logged in.
        {
            DataSet ds = dal.GetGrantContacts(Convert.ToInt32(Session["GrantApplicantId"]));

            //there is at least one contact (current UI demands all contacts at once. 
            //TODO: let users add one at a time?
            if (ds.Tables[0].Rows.Count > 0)
            {
                foreach (DataRow dr in ds.Tables[0].Rows)
                {
                    switch (dr["ContactTypeId"].ToString())
                    {
                        case "2": //grant coordinator
                            txtFirstnameGC.Text = dr["FirstName"].ToString();
                            txtLastnameGC.Text = dr["LastName"].ToString();
                            txtAddress1GC.Text = dr["Address1"].ToString();
                            txtAddress2GC.Text = dr["Address2"].ToString();
                            txtCityGC.Text = dr["City"].ToString();
                            txtStateGC.Text = dr["State"].ToString();
                            txtZipcodeGC.Text = dr["Zipcode"].ToString();
                            txtPhoneGC.Text = dr["Phone"].ToString();
                            txtFaxGC.Text = dr["Fax"].ToString();
                            txtEmailGC.Text = dr["Email"].ToString();

                            break;
                        case "1": //Lead agency contact
                            txtFirstnameLA.Text = dr["FirstName"].ToString();
                            txtLastnameLA.Text = dr["LastName"].ToString();
                            txtAddress1LA.Text = dr["Address1"].ToString();
                            txtAddress2LA.Text = dr["Address2"].ToString();
                            txtCityLA.Text = dr["City"].ToString();
                            txtStateLA.Text = dr["State"].ToString();
                            txtZipcodeLA.Text = dr["Zipcode"].ToString();
                            txtPhoneLA.Text = dr["Phone"].ToString();
                            txtFaxLA.Text = dr["Fax"].ToString();
                            txtEmailLA.Text = dr["Email"].ToString();

                            break;
                        case "3": //director
                            txtFirstnameDir.Text = dr["FirstName"].ToString();
                            txtLastnameDir.Text = dr["LastName"].ToString();
                            txtAddress1Dir.Text = dr["Address1"].ToString();
                            txtAddress2Dir.Text = dr["Address2"].ToString();
                            txtCityDir.Text = dr["City"].ToString();
                            txtStateDir.Text = dr["State"].ToString();
                            txtZipcodeDir.Text = dr["Zipcode"].ToString();
                            txtPhoneDir.Text = dr["Phone"].ToString();
                            txtFaxDir.Text = dr["Fax"].ToString();
                            txtEmailDir.Text = dr["Email"].ToString();

                            break;
                        case "4": //summer
                            txtFirstnameSC.Text = dr["FirstName"].ToString();
                            txtLastnameSC.Text = dr["LastName"].ToString();
                            txtAddress1SC.Text = dr["Address1"].ToString();
                            txtAddress2SC.Text = dr["Address2"].ToString();
                            txtCitySC.Text = dr["City"].ToString();
                            txtStateSC.Text = dr["State"].ToString();
                            txtZipcodeSC.Text = dr["Zipcode"].ToString();
                            txtPhoneSC.Text = dr["Phone"].ToString();
                            txtFaxSC.Text = dr["Fax"].ToString();
                            txtEmailSC.Text = dr["Email"].ToString();

                            break;
                        case "5": //fiscal
                            txtFirstnameFiscal.Text = dr["FirstName"].ToString();
                            txtLastnameFiscal.Text = dr["LastName"].ToString();
                            txtAddress1Fiscal.Text = dr["Address1"].ToString();
                            txtAddress2Fiscal.Text = dr["Address2"].ToString();
                            txtCityFiscal.Text = dr["City"].ToString();
                            txtStateFiscal.Text = dr["State"].ToString();
                            txtZipcodeFiscal.Text = dr["Zipcode"].ToString();
                            txtPhoneFiscal.Text = dr["Phone"].ToString();
                            txtFaxFiscal.Text = dr["Fax"].ToString();
                            txtEmailFiscal.Text = dr["Email"].ToString();

                            break;
                        default:
                            break;
                    }
                }
            }
        }
    }

    private DataTable GetContacts()
    {
        DataTable dt = new DataTable();
        dt.Columns.Add(new DataColumn("ContactTypeId", typeof(int)));
        dt.Columns.Add(new DataColumn("FirstName", typeof(string)));
        dt.Columns.Add(new DataColumn("LastName", typeof(string)));
        dt.Columns.Add(new DataColumn("Address1", typeof(string)));
        dt.Columns.Add(new DataColumn("Address2", typeof(string)));
        dt.Columns.Add(new DataColumn("City", typeof(string)));
        dt.Columns.Add(new DataColumn("State", typeof(string)));
        dt.Columns.Add(new DataColumn("Zipcode", typeof(string)));
        dt.Columns.Add(new DataColumn("Phone", typeof(string)));
        dt.Columns.Add(new DataColumn("Fax", typeof(string)));
        dt.Columns.Add(new DataColumn("Email", typeof(string)));
        dt.Columns.Add(new DataColumn("WebAddress", typeof(string)));

        DataRow dr;

        //Grant coord
        dr = dt.NewRow();
        dr["ContactTypeId"] = 2;
        dr["FirstName"] = txtFirstnameGC.Text;
        dr["LastName"] = txtLastnameGC.Text;
        dr["Address1"] = txtAddress1GC.Text;
        dr["Address2"] = txtAddress2GC.Text;
        dr["City"] = txtCityGC.Text;
        dr["State"] = txtStateGC.Text;
        dr["Zipcode"] = txtZipcodeGC.Text;
        dr["Phone"] = txtPhoneGC.Text;
        dr["Fax"] = txtFaxGC.Text;
        dr["Email"] = txtEmailGC.Text;
        dr["WebAddress"] = "";

        dt.Rows.Add(dr);

        //Lead agency contact
        dr = dt.NewRow();
        dr["ContactTypeId"] = 1;
        dr["FirstName"] = txtFirstnameLA.Text;
        dr["LastName"] = txtLastnameLA.Text;
        dr["Address1"] = txtAddress1LA.Text;
        dr["Address2"] = txtAddress2LA.Text;
        dr["City"] = txtCityLA.Text;
        dr["State"] = txtStateLA.Text;
        dr["Zipcode"] = txtZipcodeLA.Text;
        dr["Phone"] = txtPhoneLA.Text;
        dr["Fax"] = txtFaxLA.Text;
        dr["Email"] = txtEmailLA.Text;
        dr["WebAddress"] = "";

        dt.Rows.Add(dr);

        //director
        dr = dt.NewRow();
        dr["ContactTypeId"] = 3;
        dr["FirstName"] = txtFirstnameDir.Text;
        dr["LastName"] = txtLastnameDir.Text;
        dr["Address1"] = txtAddress1Dir.Text;
        dr["Address2"] = txtAddress2Dir.Text;
        dr["City"] = txtCityDir.Text;
        dr["State"] = txtStateDir.Text;
        dr["Zipcode"] = txtZipcodeDir.Text;
        dr["Phone"] = txtPhoneDir.Text;
        dr["Fax"] = txtFaxDir.Text;
        dr["Email"] = txtEmailDir.Text;
        dr["WebAddress"] = "";

        dt.Rows.Add(dr);

        //summer
        dr = dt.NewRow();
        dr["ContactTypeId"] = 4;
        dr["FirstName"] = txtFirstnameSC.Text;
        dr["LastName"] = txtLastnameSC.Text;
        dr["Address1"] = txtAddress1SC.Text;
        dr["Address2"] = txtAddress2SC.Text;
        dr["City"] = txtCitySC.Text;
        dr["State"] = txtStateSC.Text;
        dr["Zipcode"] = txtZipcodeSC.Text;
        dr["Phone"] = txtPhoneSC.Text;
        dr["Fax"] = txtFaxSC.Text;
        dr["Email"] = txtEmailSC.Text;
        dr["WebAddress"] = "";

        dt.Rows.Add(dr);

        //fiscal
        dr = dt.NewRow();
        dr["ContactTypeId"] = 5;
        dr["FirstName"] = txtFirstnameFiscal.Text;
        dr["LastName"] = txtLastnameFiscal.Text;
        dr["Address1"] = txtAddress1Fiscal.Text;
        dr["Address2"] = txtAddress2Fiscal.Text;
        dr["City"] = txtCityFiscal.Text;
        dr["State"] = txtStateFiscal.Text;
        dr["Zipcode"] = txtZipcodeFiscal.Text;
        dr["Phone"] = txtPhoneFiscal.Text;
        dr["Fax"] = txtFaxFiscal.Text;
        dr["Email"] = txtEmailFiscal.Text;
        dr["WebAddress"] = "";

        dt.Rows.Add(dr);


        return dt;
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            int retVal = dal.SaveGrantContacts(Convert.ToInt32(Session["GrantApplicantId"]), 1, GetContacts());

            if (retVal == 0)
            {
                tblSuccess.Visible = true;
            }
        }
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("CheckList.aspx");
    }

    protected void btnNextPart_Click(object sender, EventArgs e)
    {
        Response.Redirect("Languages.aspx");
    }

    protected void btnBackToHome_Click(object sender, EventArgs e)
    {
        Response.Redirect("CheckList.aspx");
    }

    protected void btnSavePrint_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            dal.SaveGrantContacts(Convert.ToInt32(Session["GrantApplicantId"]), 1, GetContacts());

            Response.Redirect("Print.aspx?type=contacts");
        }
    }
}