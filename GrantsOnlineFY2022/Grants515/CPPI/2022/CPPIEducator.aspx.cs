using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class CPPIEducator : System.Web.UI.Page
{
    [Serializable]
    private class Educator
    {
        public int EducatorId;
        public String Name;
        public String Position;
        public String HighestEducationLevel;
        public String MajorProgramStudy;
        public String AnnualSalary;
        public String PQRNumber;

        public Educator()
        {
            EducatorId = 0;
            Name = "";
            Position = "";
            HighestEducationLevel = "";
            MajorProgramStudy = "";
            AnnualSalary = "";
            PQRNumber = "";
        }
    }


    DataSet dsEducators;
    DataTable dtEducators = new DataTable();
    List<Educator> educatorList = new List<Educator>();
    string ClassroomId;
    string ProviderId;
    string ClassName;
    DAL dal = new DAL();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["GrantApplicantId"] == null) Response.Redirect("~/SessionTimeout.aspx");

        ClassroomId = Request.QueryString["cid"];
        ProviderId = Request.QueryString["pid"];
        ClassName = Request.QueryString["class"];

        ViewState["ClassroomId"] = ClassroomId;
        ViewState["SystemProviderId"] = ProviderId;

        //BindScripts();

        if (!IsPostBack)
        {
            //BindData();
            grdTeachers.Enabled = true;
            grdTeachers.Visible = true;
            tblClassroom.Visible = true;

            //Get the classroom name 
            lblClassroomName.Text = ClassName;

            BindClassroomEducators(Convert.ToInt32(ClassroomId));

            ViewState["EducatorList"] = educatorList;
        }

    }

    //private void BindScripts()
    //{
    //    //txtWeeksPerYearOperation.Attributes.Add("onchange", "javascript:calTotalHrPerYear()");
    //    //txtDaysPerWeekOperation.Attributes.Add("onchange", "javascript:calTotalHrPerYear()");
    //    //txtHoursPerDayOperation.Attributes.Add("onchange", "javascript:calTotalHrPerYear()");

    //}


    private void BindClassroomEducators(int classroomId)
    {
        dsEducators = dal.GetCPPISurveyClassroomEducators(classroomId);

        educatorList.Clear();

        for (int i = 0; i < dsEducators.Tables[0].Rows.Count; i++)
        {
            Educator educator = new Educator();

            educator.EducatorId = Convert.ToInt32(dsEducators.Tables[0].Rows[i]["EducatorId"].ToString());
            educator.Name = dsEducators.Tables[0].Rows[i]["EducatorName"].ToString();
            educator.Position = dsEducators.Tables[0].Rows[i]["Position"].ToString();
            educator.PQRNumber = dsEducators.Tables[0].Rows[i]["PQRNumber"].ToString();
            educator.HighestEducationLevel = dsEducators.Tables[0].Rows[i]["HighestEducationLevel"].ToString();
            educator.MajorProgramStudy = dsEducators.Tables[0].Rows[i]["MajorProgramStudy"].ToString();
            educator.AnnualSalary = dsEducators.Tables[0].Rows[i]["AnnualSalary"].ToString();
            
            educatorList.Add(educator);
        }

        ViewState["EducatorList"] = educatorList;

        grdTeachers.DataSource = educatorList;
        grdTeachers.DataBind();

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

    private void SaveAllEducators()
    {
        for (int i = 0; i < grdTeachers.Rows.Count; i++)
        {
            int educatorId = Convert.ToInt32(grdTeachers.Rows[i].Cells[0].Text);

            Label txtEducatorName = (Label)grdTeachers.Rows[i].FindControl("lblEducatorName");
            Label txtPosition = (Label)grdTeachers.Rows[i].FindControl("lblPosition");
            Label txtPQRNumber = (Label)grdTeachers.Rows[i].FindControl("lblPQRNumber");
            Label txtEducationLevel = (Label)grdTeachers.Rows[i].FindControl("lblEducationLevel");
            Label txtAnnualSalary = (Label)grdTeachers.Rows[i].FindControl("lblAnnualSalary");
            Label txtMajorProgramStudy = (Label)grdTeachers.Rows[i].FindControl("lblMajorProgramStudy");

            dal.SaveCPPISurveyClassroomEducator(Convert.ToInt32(ViewState["ClassroomId"].ToString()),
                                               txtEducatorName.Text,
                                               txtPosition.Text,
                                               txtPQRNumber.Text,
                                               txtEducationLevel.Text,
                                               txtMajorProgramStudy.Text,
                                               txtAnnualSalary.Text,
                                               Convert.ToInt32(ViewState["SystemProviderId"].ToString()),
                                               Convert.ToInt32(Session["GrantApplicantId"].ToString()));
        }
    }

    protected void grdTeachers_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.EmptyDataRow)
        {

        }
        else if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Educator educator = (Educator)e.Row.DataItem;

            if (grdTeachers.EditIndex != e.Row.RowIndex)
            {
                Label txtEducatorName = (Label)e.Row.FindControl("lblEducatorName");
                Label txtPosition = (Label)e.Row.FindControl("lblPosition");
                Label txtPQRNumber = (Label)e.Row.FindControl("lblPQRNumber");
                Label txtEducationLevel = (Label)e.Row.FindControl("lblEducationLevel");
                Label txtAnnualSalary = (Label)e.Row.FindControl("lblAnnualSalary");
                Label txtMajorProgramStudy = (Label)e.Row.FindControl("lblMajorProgramStudy");

                txtEducatorName.Text = educator.Name.ToString();
                txtPosition.Text = educator.Position.ToString();
                txtPQRNumber.Text = educator.PQRNumber.ToString();
                txtEducationLevel.Text = educator.HighestEducationLevel.ToString();
                txtAnnualSalary.Text = educator.AnnualSalary.ToString();
                txtMajorProgramStudy.Text = educator.MajorProgramStudy.ToString();

                e.Row.Cells[0].Text = educator.EducatorId.ToString();

                Button btnDelete = (Button)e.Row.FindControl("ButtonDelete");
                Button btnEdit = (Button)e.Row.FindControl("ButtonEdit");

                if (btnDelete != null)
                {
                    btnDelete.Attributes.Add("onclick", "javascript:return deleteConfirm('" + educator.EducatorId.ToString() + "')");
                }

                if (educator.EducatorId == 0)
                {
                    btnDelete.Visible = false;
                    btnEdit.Visible = false;
                }
            }
            else
            {
                TextBox txtEducatorName = (TextBox)e.Row.FindControl("txtEducatorName");
                DropDownList cboPosition = (DropDownList)e.Row.FindControl("cboPosition");
                DropDownList cboEducationLevel = (DropDownList)e.Row.FindControl("cboEducationLevel");
                DropDownList cboAnnualSalary = (DropDownList)e.Row.FindControl("cboAnnualSalary");
                TextBox txtPQRNumber = (TextBox)e.Row.FindControl("txtPQRNumber");
                TextBox txtMajorProgramStudy = (TextBox)e.Row.FindControl("txtMajorProgramStudy");

                txtEducatorName.Text = educator.Name.ToString();
                txtPQRNumber.Text = educator.PQRNumber.ToString();
                cboPosition.SelectedValue = educator.Position.ToString();
                cboEducationLevel.SelectedValue = educator.HighestEducationLevel.ToString();
                txtMajorProgramStudy.Text = educator.MajorProgramStudy.ToString();
                cboAnnualSalary.SelectedValue = educator.AnnualSalary.ToString();

                e.Row.Cells[0].Text = educator.EducatorId.ToString();
            }
        }

    }

    protected void grdTeachers_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "New")
        {
            Educator educator = new Educator();

            educator.EducatorId = 0;

            educatorList.Add(educator);

            grdTeachers.DataSource = educatorList;
            grdTeachers.DataBind();
        }
        else if (e.CommandName == "AddNew")
        {

            TextBox txtEducatorName = (TextBox)grdTeachers.FooterRow.FindControl("txtEducatorName");
            DropDownList cboPosition = (DropDownList)grdTeachers.FooterRow.FindControl("cboPosition");
            DropDownList cboEducationLevel = (DropDownList)grdTeachers.FooterRow.FindControl("cboEducationLevel");
            DropDownList cboAnnualSalary = (DropDownList)grdTeachers.FooterRow.FindControl("cboAnnualSalary");
            TextBox txtPQRNumber = (TextBox)grdTeachers.FooterRow.FindControl("txtPQRNumber");
            TextBox txtMajorProgramStudy = (TextBox)grdTeachers.FooterRow.FindControl("txtMajorProgramStudy");

            dal.SaveCPPISurveyClassroomEducator(Convert.ToInt32(ViewState["ClassroomId"].ToString()), 
                                               txtEducatorName.Text,
                                               cboPosition.SelectedValue,
                                               txtPQRNumber.Text,
                                               cboEducationLevel.SelectedValue,
                                               txtMajorProgramStudy.Text,
                                               cboAnnualSalary.SelectedValue,
                                               Convert.ToInt32(ViewState["SystemProviderId"].ToString()),
                                               Convert.ToInt32(Session["GrantApplicantId"].ToString()));

            //Set up a new empty Educator
            Educator educator = new Educator();

            educator.EducatorId = -1;
            educator.Name = txtEducatorName.Text;
            educator.Position = cboPosition.SelectedValue;
            educator.PQRNumber = txtPQRNumber.Text;
            educator.HighestEducationLevel = cboEducationLevel.SelectedValue;
            educator.MajorProgramStudy = txtMajorProgramStudy.Text;
            educator.AnnualSalary = cboAnnualSalary.SelectedValue;

            List<Educator> educatorList = (List<Educator>)ViewState["EducatorList"];
            educatorList.Add(educator);

            grdTeachers.DataSource = educatorList;
            grdTeachers.DataBind();
        }
    }

    protected void grdTeachers_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        List<Educator> educatorList = (List<Educator>)ViewState["EducatorList"];
        Educator educator = educatorList[e.RowIndex];

        int educatorId = Convert.ToInt32(grdTeachers.Rows[e.RowIndex].Cells[0].Text.ToString());

        if (educatorId != -1)
        {
            dal.DeleteCPPISurveyClassroomEducator(Convert.ToInt32(educatorId));
        }

        educatorList.RemoveAt(e.RowIndex);

        grdTeachers.DataSource = educatorList;
        grdTeachers.DataBind();
    }


    protected void grdTeachers_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {

        List<Educator> educatorList = (List<Educator>)ViewState["EducatorList"];
        Educator educator = educatorList[e.RowIndex];

        TextBox txtEducatorName = (TextBox)grdTeachers.Rows[e.RowIndex].FindControl("txtEducatorName");
        DropDownList cboPosition = (DropDownList)grdTeachers.Rows[e.RowIndex].FindControl("cboPosition");
        DropDownList cboEducationLevel = (DropDownList)grdTeachers.Rows[e.RowIndex].FindControl("cboEducationLevel");
        DropDownList cboAnnualSalary = (DropDownList)grdTeachers.Rows[e.RowIndex].FindControl("cboAnnualSalary");
        TextBox txtPQRNumber = (TextBox)grdTeachers.Rows[e.RowIndex].FindControl("txtPQRNumber");
        TextBox txtMajorProgramStudy = (TextBox)grdTeachers.Rows[e.RowIndex].FindControl("txtMajorProgramStudy");

        educator.EducatorId = Convert.ToInt32(grdTeachers.Rows[e.RowIndex].Cells[0].Text.ToString());
        educator.Name = txtEducatorName.Text;
        educator.Position = cboPosition.SelectedValue;
        educator.PQRNumber = txtPQRNumber.Text;
        educator.HighestEducationLevel = cboEducationLevel.SelectedValue;
        educator.MajorProgramStudy = txtMajorProgramStudy.Text;
        educator.AnnualSalary = cboAnnualSalary.SelectedValue;

        dal.UpdateCPPISurveyClassroomEducator(Convert.ToInt32(educator.EducatorId), txtEducatorName.Text,
                                             cboPosition.SelectedValue,
                                             txtPQRNumber.Text,
                                             cboEducationLevel.SelectedValue,
                                             txtMajorProgramStudy.Text,
                                             cboAnnualSalary.SelectedValue);

        grdTeachers.EditIndex = -1;

        grdTeachers.DataSource = educatorList;
        grdTeachers.DataBind();

    }

    protected void grdTeachers_RowEditing(object sender, GridViewEditEventArgs e)
    {

        grdTeachers.EditIndex = e.NewEditIndex;

        List<Educator> educatorList = (List<Educator>)ViewState["EducatorList"];

        grdTeachers.DataSource = educatorList;
        grdTeachers.DataBind();
    }

    protected void grdTeachers_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {

        grdTeachers.EditIndex = -1;

        List<Educator> educatorList = (List<Educator>)ViewState["EducatorList"];

        grdTeachers.DataSource = educatorList;
        grdTeachers.DataBind();
    }

    protected void CustomValidator5_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (educatorList.Count == 0)
        {
            args.IsValid = false;
        }
    }

    protected void btnBackToClass_Click(object sender, EventArgs e)
    {
        Response.Redirect("CPPIClass.aspx?pid=" + ViewState["SystemProviderId"].ToString());
    }
}


