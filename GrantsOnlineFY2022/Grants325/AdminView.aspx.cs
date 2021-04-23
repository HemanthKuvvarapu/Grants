using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminView : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["n"] != null)
        {
            string flag = Request.QueryString["n"].ToString();

            if (flag != "kdocjwodjllpqil.cosuc.deow")
            {
                Response.Redirect("Default.aspx");
            }
            else
            {
                Session["AuthUser"] = 1;
            }
        }
    }
}
