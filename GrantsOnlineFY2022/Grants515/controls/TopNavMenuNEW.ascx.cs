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

public partial class controls_TopNavMenuNEW : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        MenuItem1.Initialize("Home", "Home", "100px");
        MenuItem2.Initialize("", "MenuItem2", "90px");
        MenuItem3.Initialize("", "MenuItem3", "90px");
        MenuItem4.Initialize("", "MenuItem4", "90px");
        MenuItem5.Initialize("", "MenuItem5", "90px");
        MenuItem6.Initialize("", "MenuItem6", "90px");
        MenuItem7.Initialize("Log Out", "Logout", "100px");
    }

    protected override void OnPreRender(EventArgs e)
    {
        base.OnPreRender(e);

        if (Session["CurrentMenuFocus"] != null)
        {
            controls_NavMenuItemNew mItem = (controls_NavMenuItemNew)menubar1.FindControl(Session["CurrentMenuFocus"].ToString());

            if (mItem != null)
            {
                mItem.SetFocus();
            }
        }

        if (Session["GrantApplicantId"] == null)
        {
            controls_NavMenuItemNew mItem = (controls_NavMenuItemNew)menubar1.FindControl("MenuItem7");

            if (mItem != null)
            {
                mItem.Hide();
            }
        }

        


    }

    public String CurrentMenuItem
    {
        set
        {
            try
            {
                controls_NavMenuItemNew mItem = (controls_NavMenuItemNew) menubar1.FindControl(value);

                if (mItem != null)
                {
                    Session["CurrentMenuFocus"] = value;
                }
            }
            catch (Exception ex)
            {
            }
        }
    }
}
