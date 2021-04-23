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

/// <summary>
/// Summary description for AppInfo
/// </summary>
public class AppInfo
{
    public static int FiscalYear;
    public static int FundCode;
    public static string GrantName;
    public static string GrantAppType;
    public static bool Amendment1;
    public static bool Amendment2;
    public static bool Amendment3;
    public static bool Competitive;
    public static bool PCHPReport;
    public static string Adminstrator;
    public static bool DisplayPart1;
    public static bool DisplayPart2;
    public static bool DisplayPart3;
    public static bool DisplayPart4;
    public static bool DisplayPart4a;
    public static bool DisplayPart5;
    public static bool DisplayPart6a;
    public static bool DisplayPart6b;
    public static bool DisplayPart6c;
    public static bool DisplayPart7;
    public static bool DisplayPart8;
    public static bool DisplayPart9;
    public static bool DisplayPart10;
    public static bool DisplayPart11;
    public static bool FinancialReport;
   
    public static string DisplayPart1Title;
    public static string DisplayPart2Title;
    public static string DisplayPart3Title;
    public static string DisplayPart4Title;
    public static string DisplayPart4aTitle;
    public static string DisplayPart5Title;
    public static string DisplayPart6aTitle;
    public static string DisplayPart6bTitle;
    public static string DisplayPart6cTitle;
    public static string DisplayPart7Title;
    public static string DisplayPart8Title;
    public static string DisplayPart9Title;
    public static string DisplayPart10Title;
    public static string DisplayPart11Title;

    public static int MAX_NARRATIVE_ANSWER_LENGTH;
    public static int NUM_NARRATIVE_QUESTIONS;
    public static bool EligibilityAmountFromTowns;
    public static float EECAdminLimitPerc;
    public static float UPKPassFundToProviderPerc;

    public static int MailCopies;
    public static string MailCopiesEn;

    public static string AmendmentAdministrator;
    public static string LastDateOfAmendment;

    static AppInfo()
    {
        FiscalYear = Int32.Parse(System.Configuration.ConfigurationManager.AppSettings.Get("FiscalYear").ToString());
        FundCode = Int32.Parse(System.Configuration.ConfigurationManager.AppSettings.Get("FundCode").ToString());
        GrantName = System.Configuration.ConfigurationManager.AppSettings.Get("GrantName").ToString();
        GrantAppType = System.Configuration.ConfigurationManager.AppSettings.Get("GrantAppType").ToString();
        Amendment1 = Boolean.Parse(System.Configuration.ConfigurationManager.AppSettings.Get("Amendment1").ToString());
        Amendment2 = Boolean.Parse(System.Configuration.ConfigurationManager.AppSettings.Get("Amendment2").ToString());
        Amendment3 = Boolean.Parse(System.Configuration.ConfigurationManager.AppSettings.Get("Amendment3").ToString());
        Competitive = Boolean.Parse(System.Configuration.ConfigurationManager.AppSettings.Get("Competitive").ToString());
        Adminstrator = System.Configuration.ConfigurationManager.AppSettings.Get("Adminstrator").ToString();
        FinancialReport = Boolean.Parse(System.Configuration.ConfigurationManager.AppSettings.Get("FinancialReport").ToString());
        PCHPReport = Boolean.Parse(System.Configuration.ConfigurationManager.AppSettings.Get("PCHPReport").ToString());

        DisplayPart1 = Boolean.Parse(System.Configuration.ConfigurationManager.AppSettings.Get("DisplayPart1").ToString());
        DisplayPart2 = Boolean.Parse(System.Configuration.ConfigurationManager.AppSettings.Get("DisplayPart2").ToString());
        DisplayPart3 = Boolean.Parse(System.Configuration.ConfigurationManager.AppSettings.Get("DisplayPart3").ToString());
        DisplayPart4 = Boolean.Parse(System.Configuration.ConfigurationManager.AppSettings.Get("DisplayPart4").ToString());
        DisplayPart4a = Boolean.Parse(System.Configuration.ConfigurationManager.AppSettings.Get("DisplayPart4a").ToString());
        DisplayPart5 = Boolean.Parse(System.Configuration.ConfigurationManager.AppSettings.Get("DisplayPart5").ToString());
        DisplayPart6a = Boolean.Parse(System.Configuration.ConfigurationManager.AppSettings.Get("DisplayPart6a").ToString());
        DisplayPart6b = Boolean.Parse(System.Configuration.ConfigurationManager.AppSettings.Get("DisplayPart6b").ToString());
        DisplayPart6c = Boolean.Parse(System.Configuration.ConfigurationManager.AppSettings.Get("DisplayPart6c").ToString());
        DisplayPart7 = Boolean.Parse(System.Configuration.ConfigurationManager.AppSettings.Get("DisplayPart7").ToString());
        DisplayPart8 = Boolean.Parse(System.Configuration.ConfigurationManager.AppSettings.Get("DisplayPart8").ToString());
        DisplayPart9 = Boolean.Parse(System.Configuration.ConfigurationManager.AppSettings.Get("DisplayPart9").ToString());
        DisplayPart10 = Boolean.Parse(System.Configuration.ConfigurationManager.AppSettings.Get("DisplayPart10").ToString());
        DisplayPart11 = Boolean.Parse(System.Configuration.ConfigurationManager.AppSettings.Get("DisplayPart11").ToString());

        DisplayPart1Title = System.Configuration.ConfigurationManager.AppSettings.Get("DisplayPart1Title").ToString();
        DisplayPart2Title = System.Configuration.ConfigurationManager.AppSettings.Get("DisplayPart2Title").ToString();
        DisplayPart3Title = System.Configuration.ConfigurationManager.AppSettings.Get("DisplayPart3Title").ToString();
        DisplayPart4Title = System.Configuration.ConfigurationManager.AppSettings.Get("DisplayPart4Title").ToString();
        DisplayPart4aTitle = System.Configuration.ConfigurationManager.AppSettings.Get("DisplayPart4aTitle").ToString();
        DisplayPart5Title = System.Configuration.ConfigurationManager.AppSettings.Get("DisplayPart5Title").ToString();
        DisplayPart6aTitle = System.Configuration.ConfigurationManager.AppSettings.Get("DisplayPart6aTitle").ToString();
        DisplayPart6bTitle = System.Configuration.ConfigurationManager.AppSettings.Get("DisplayPart6bTitle").ToString();
        DisplayPart6cTitle = System.Configuration.ConfigurationManager.AppSettings.Get("DisplayPart6cTitle").ToString();
        DisplayPart7Title = System.Configuration.ConfigurationManager.AppSettings.Get("DisplayPart7Title").ToString();
        DisplayPart8Title = System.Configuration.ConfigurationManager.AppSettings.Get("DisplayPart8Title").ToString();
        DisplayPart9Title = System.Configuration.ConfigurationManager.AppSettings.Get("DisplayPart9Title").ToString();
        DisplayPart10Title = System.Configuration.ConfigurationManager.AppSettings.Get("DisplayPart10Title").ToString();
        DisplayPart11Title = System.Configuration.ConfigurationManager.AppSettings.Get("DisplayPart11Title").ToString();


        EligibilityAmountFromTowns = Boolean.Parse(System.Configuration.ConfigurationManager.AppSettings.Get("EligibilityAmountFromTowns").ToString());
        EECAdminLimitPerc = Single.Parse(System.Configuration.ConfigurationManager.AppSettings.Get("EECAdminLimitPerc").ToString());

        UPKPassFundToProviderPerc = Single.Parse(System.Configuration.ConfigurationManager.AppSettings.Get("UPKPassFundToProviderPerc").ToString());

        MAX_NARRATIVE_ANSWER_LENGTH = Int32.Parse(System.Configuration.ConfigurationManager.AppSettings.Get("MAX_NARRATIVE_ANSWER_LENGTH").ToString());
        NUM_NARRATIVE_QUESTIONS = Int32.Parse(System.Configuration.ConfigurationManager.AppSettings.Get("NUM_NARRATIVE_QUESTIONS").ToString());

        MailCopiesEn = System.Configuration.ConfigurationManager.AppSettings.Get("MailCopiesEn").ToString();
        MailCopies = Int32.Parse(System.Configuration.ConfigurationManager.AppSettings.Get("MailCopies").ToString());

        AmendmentAdministrator = System.Configuration.ConfigurationManager.AppSettings.Get("AmendmentAdministrator").ToString();
        LastDateOfAmendment = System.Configuration.ConfigurationManager.AppSettings.Get("LastDateOfAmendment").ToString();    
    }
}
