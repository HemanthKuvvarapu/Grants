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


public partial class controls_PageDetailFooter : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strFooter = "";

        txtPageFooter.Text = "The coding for the Results Column for Elements 100 – 400 is as follows: 1: \"0\" = no error, \"1\" = error; 2: \"Y\" = error due to missing or insufficient documentation, \"N\" = error not due to missing or insufficient documentation, \"NA\" = no error; 2A (only coded if 2 is coded as “Y”): “Y” = MID potential improper payment error, “N” = not a MID potential improper payment error.<br>";
        txtPageFooter.Text += "The coding for the Results Column for Elements 410 is as follows: 1: \"0\" = no error, \"1\" = error; 2: \"Y\" = error due to missing or insufficient documentation, \"N\" = error not due to missing or insufficient documentation, \"NA\" = no error.<br>";
        txtPageFooter.Text += "The coding for the Results Column for Element 500 is as follows: 1: \"0\" = no error, \"1\" = error; 2: \"Y\" = error due to missing or insufficient documentation, <br>";
        txtPageFooter.Text += "\"N\" = error not due to missing or insufficient documentation, \"NA\" = no error; 2A: Number of times the MID Worksheet was used because a MID potential improper payment error was identified; 2B: Total dollar amount of MID potential improper payment errors (total of column 3 on the MID Table); 2C: Number of times an additional inquiry was used (total of column 4 on the MID Worksheet); 2D: Number of times the additional inquiry mitigated an MID potential improper payment error (total of column 7 on the MID Table); 2E: Total dollar amount of improper payments mitigated (total of column 8 of the MID Worksheet); 3: “U” = Underpayment, “O” = Overpayment, \"NA\" = no improper payment; 4: Total dollar amount of improper payment; 5: Total Payment Amount for Sample Month.<br>";
        txtPageFooter.Text += "<HR>'THE PAPERWORK REDUCTION ACT OF 1995' ";
        txtPageFooter.Text += "Public reporting for this collection of information is estimated to average 6.33 hours per response, including the time for reviewing instructions, gathering and maintaining the data needed, and reviewing the collection of information.";
        strFooter = txtPageFooter.Text;
        txtPageFooter.Text = strFooter.Replace("'", "\"");
        txtPageFooter.Visible = true;
    }

}
