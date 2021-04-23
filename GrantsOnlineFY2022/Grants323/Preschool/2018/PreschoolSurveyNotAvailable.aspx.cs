﻿using System;
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

public partial class Preschool_2018_PreschoolSurveyNotAvailable : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["GrantApplicantId"] == null) Response.Redirect("../SessionTimeout.aspx");
    }

    protected void btnBackToHome_Click(object sender, EventArgs e)
    {
        Response.Redirect("UPKHome.aspx");
    }
}
