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

public partial class Admin_TemplateInstructionText : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            txtPart1.Text = "<ul style=\"list-style-type: circle;\">\r\n<li><b>helllo</b></li>\r\n<li><b>fdsfsdaf</b></li>\r\n<li>fsdfsa</li>\r\n</ul>";
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        string s;

        s = txtPart1.Text;
        s = txtPart2.Text;
    }
}
