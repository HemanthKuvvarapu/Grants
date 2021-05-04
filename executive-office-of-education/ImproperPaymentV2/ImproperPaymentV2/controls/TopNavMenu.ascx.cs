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

public partial class controls_TopNavMenu : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        MenuItem1.Initialize("My Caseload", "MenuItem1", "160px");
        MenuItem2.Initialize("Report", "MenuItem2", "160px");
        MenuItem3.Initialize("Logout", "MenuItem3", "160px");
        MenuItem4.Initialize("My EEC Apps", "MenuItem4", "160px");
        //MenuItem2.Initialize("Menu 2", "MenuItem2", "110px");
        //MenuItem3.Initialize("Menu 3", "MenuItem3", "110px");
        //MenuItem4.Initialize("Menu 4", "MenuItem4", "110px");
        //MenuItem5.Initialize("Menu 5", "MenuItem5", "110px");
    }

    protected override void OnPreRender(EventArgs e)
    {
        base.OnPreRender(e);

        if (Session["CurrentMenuFocus"] != null)
        {
            controls_NavMenuItem mItem = (controls_NavMenuItem)menubar1.FindControl(Session["CurrentMenuFocus"].ToString());

            if (mItem != null)
            {
                mItem.SetFocus();
            }
        }
    }

    public String CurrentMenuItem
    {
        set
        {
            try
            {
                controls_NavMenuItem mItem = (controls_NavMenuItem) menubar1.FindControl(value);

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
