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

public partial class test : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DataSet ds = new DataSet();
        DataTable tbl = new DataTable();

        tbl.Columns.Add("ID");

        DataRow oRow = tbl.NewRow();
        oRow["ID"] = "1";

        tbl.Rows.Add(oRow);
        ds.Tables.Add(tbl);

        GridView1.DataSource = ds;
        GridView1.DataBind();

    }
}
