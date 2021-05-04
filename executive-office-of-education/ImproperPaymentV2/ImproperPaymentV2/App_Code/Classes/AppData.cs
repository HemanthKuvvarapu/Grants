using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Collections.Generic;
using System.Collections;

/// <summary>
/// Summary description for AppData
/// </summary>
public class AppData
{
    public static String DBConnectionString;
    public static int numOfForms;


    public static void Initialize()
    {
        DBConnectionString = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;

        numOfForms = 13;
    }

    public static String GetValue(String sKey)
    {
        return ConfigurationManager.AppSettings[sKey].ToString();
    }

    public static String FormatMonthYearStr(String sDate)
    {
        if (!String.IsNullOrEmpty(sDate))
        {
            try
            {
                DateTime tempDate;
                bool b = DateTime.TryParse(sDate, out tempDate);

                if (b)
                {
                    String sMonth;
                    String sDay;
                    String sYear;

                    sMonth = Convert.ToString(DateTime.Parse(sDate).Date.Month);
                    sDay = Convert.ToString(DateTime.Parse(sDate).Date.Day);
                    sYear = Convert.ToString(DateTime.Parse(sDate).Date.Year);

                    return (sMonth.Length == 1 ? "0" + sMonth : sMonth) + "/" + (sYear.Length == 2 ? "20" + sYear : sYear);
                }
                else
                {
                    throw new Exception("Invalid Date String!");
                }
            }
            catch (Exception e)
            {
                return "";
            }
        }
        else
        {
            return "";
        }

        return sDate;
    }

    public static String FormatDateStr(String sDate)
    {
        if (!String.IsNullOrEmpty(sDate))
        {
            try
            {
                DateTime tempDate;
                bool b = DateTime.TryParse(sDate, out tempDate);

                if (b)
                {
                    String sMonth;
                    String sDay;
                    String sYear;

                    sMonth = Convert.ToString(DateTime.Parse(sDate).Date.Month);
                    sDay = Convert.ToString(DateTime.Parse(sDate).Date.Day);
                    sYear = Convert.ToString(DateTime.Parse(sDate).Date.Year);

                    return (sMonth.Length == 1 ? "0" + sMonth : sMonth) + "/" + (sDay.Length == 1 ? "0" + sDay : sDay) + "/" + (sYear.Length == 2 ? "20" + sYear : sYear);
                }
                else
                {
                    throw new Exception("Invalid Date String!");
                }
            }
            catch (Exception e)
            {
                return "";
            }
        }
        else
        {
            return "";
        }

        return sDate;
    }
    public static string GetLogonUsername(HttpRequest request)
    {
        string username = "";

        username = request.ServerVariables["AUTH_USER"].Substring(request.ServerVariables["AUTH_USER"].IndexOf("\\") + 1);

        return username;
    }
}

public class Element
{
    public int ID;
    public string Title;
    public string Description;
    public string SectionDescription;
    public string TextAnalysis = "";
    public string TextFindings = "";
    public string TextResult = "";
    public string TextAmount = "";
    public int Completed = 0;
    public List<Item> ItemList;

    public Element()
    {
        ItemList = new List<Item>();
    }
}

public class Item
{
    public int ID;
    public int ElementID;
    public string Description;
    public string HelpTips = "";
    public int Checked = 0;
    public int ListLevel;
    public int DisplayType;
    public string RefID;
    public List<Item> ItemList;

    public Item()
    {
        ItemList = new List<Item>();
    }
}

public class FormControls
{
    public HtmlTable formTable;
    public SortedList ItemCheckBoxesList = new SortedList();
    public TextBox txtAnalysis;
    public TextBox txtFindings;
    public RadioButtonList rdoResultsList;
    //public TextBox txtTotalAmount;
    public TextBox txtTotalAmountIAP;
    public HiddenField txtResult;
    public Panel pnlAnalysis;
    public Label lblAnalysis;
    public Panel pnlFindings;
    public Label lblFindings;
    public Label lblCompleted;
    public int completed;

    public FormControls()
    {
    }
}