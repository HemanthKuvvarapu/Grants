using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Text;
using System.Security.Cryptography;
using System.IO;

/// <summary>
/// Summary description for CGlobal
/// </summary>
/// 
public enum Status
{
    SUCCESS,
    FAIL
}

//public enum MenuMode
//{
//    Home,
//    BRCRequests,
//    BRCResults,
//    Employment,
//    UserAdmin,
//    Logout
//}

public class CGlobal
{
    public CGlobal()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public static bool IsEmptyString(String sTemp)
    {
        return (String.IsNullOrEmpty(sTemp));
    }

    public static bool IsEmptyDataSet(DataSet sTempDS)
    {
        return (!(sTempDS.Tables.Count > 0 && sTempDS.Tables[0].Rows.Count > 0));
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

    public static string DecryptDES(string stringToDecrypt, string sEncryptionKey)
    {
        byte[] key = { };
        byte[] IV = { 10, 20, 30, 40, 50, 60, 70, 80 };
        byte[] inputByteArray = new byte[stringToDecrypt.Length];

        try
        {
            key = Encoding.UTF8.GetBytes(sEncryptionKey.Substring(0, 8));
            DESCryptoServiceProvider des = new DESCryptoServiceProvider();
            inputByteArray = Convert.FromBase64String(stringToDecrypt);

            MemoryStream ms = new MemoryStream();
            CryptoStream cs = new CryptoStream(ms, des.CreateDecryptor(key, IV), CryptoStreamMode.Write);
            cs.Write(inputByteArray, 0, inputByteArray.Length);
            cs.FlushFinalBlock();

            Encoding encoding = Encoding.UTF8;
            return encoding.GetString(ms.ToArray());
        }
        catch (System.Exception ex)
        {
            throw ex;
        }
    }

    public static string EncryptDES(string stringToEncrypt, string sEncryptionKey)
    {

        byte[] key = { };
        byte[] IV = { 10, 20, 30, 40, 50, 60, 70, 80 };
        byte[] inputByteArray; //Convert.ToByte(stringToEncrypt.Length)

        try
        {

            key = Encoding.UTF8.GetBytes(sEncryptionKey.Substring(0, 8));
            DESCryptoServiceProvider des = new DESCryptoServiceProvider();
            inputByteArray = Encoding.UTF8.GetBytes(stringToEncrypt);
            MemoryStream ms = new MemoryStream();
            CryptoStream cs = new CryptoStream(ms, des.CreateEncryptor(key, IV), CryptoStreamMode.Write);
            cs.Write(inputByteArray, 0, inputByteArray.Length);
            cs.FlushFinalBlock();

            return Convert.ToBase64String(ms.ToArray());
        }
        catch (System.Exception ex)
        {
            throw ex;
        }
    }

    public static String Scramble(String sInput)
    {
        String sTemp = "";

        if ((sInput != null) && (sInput.Trim().Length > 0))
        {
            int x;
            int y;
            String abfrom;
            String abto;

            sTemp = "";
            abfrom = "";

            for (x = 0; x <= 25; x++)
            {
                abfrom = abfrom + Convert.ToChar(65 + x);
            }

            for (x = 0; x <= 25; x++)
            {
                abfrom = abfrom + Convert.ToChar(97 + x);
            }

            for (x = 0; x <= 9; x++)
            {
                abfrom = abfrom + x.ToString();
            }

            abto = abfrom.Substring(13, abfrom.Length - 13) + abfrom.Substring(0, 13);

            for (x = 1; x <= sInput.Length; x++)
            {
                y = abto.IndexOf(sInput.Substring(x - 1, 1));

                if (y + 1 == 0)
                {
                    sTemp = sTemp + sInput.Substring(x - 1, 1);
                }
                else
                {
                    sTemp = sTemp + abfrom.Substring(y, 1);
                }
            }
        }

        return sTemp;
    }

    public static String UnScramble(String sInput)
    {
        String sTemp = "";

        if ((sInput != null) && (sInput.Trim().Length > 0))
        {
            int x;
            int y;
            String abfrom;
            String abto;

            sTemp = "";
            abfrom = "";

            for (x = 0; x <= 25; x++)
                abfrom = abfrom + Convert.ToChar(65 + x);
            for (x = 0; x <= 25; x++)
                abfrom = abfrom + Convert.ToChar(97 + x);
            for (x = 0; x <= 9; x++)
                abfrom = abfrom + x.ToString();

            abto = abfrom.Substring(13, abfrom.Length - 13) + abfrom.Substring(0, 13);

            for (x = 1; x <= sInput.Length; x++)
            {
                y = abfrom.IndexOf(sInput.Substring(x - 1, 1));

                if (y + 1 == 0)
                {
                    sTemp = sTemp + sInput.Substring(x - 1, 1);
                }
                else
                {
                    sTemp = sTemp + abto.Substring(y, 1);
                }
            }
        }

        return sTemp;
    }

    public static String WriteXMLNode(String sNodeName, String sNodeValue, bool bWriteAsEmpty)
    {
        if (IsEmptyString(sNodeValue) && (!bWriteAsEmpty))
            return "";
        else
            return ("<" + sNodeName + ">" + sNodeValue + "</" + sNodeName + ">");
    }

    public static String WriteXMLCDATANode(String sNodeName, String sNodeValue, bool bWriteAsEmpty)
    {
        if (IsEmptyString(sNodeValue) && (!bWriteAsEmpty))
            return "";
        else
            return ("<" + sNodeName + "><![CDATA[" + sNodeValue + "]]></" + sNodeName + ">");
    }

    public static String WriteXMLNodeAttr(String sAttrName, String sAttrValue, bool bWriteAsEmpty)
    {
        if (IsEmptyString(sAttrValue) && (!bWriteAsEmpty))
            return "";
        else
            return (sAttrName + "=\"" + sAttrValue + "\" ");
    }

    public static String WriteXMLNodeAttr(String sAttrName, String sAttrValue)
    {
        return WriteXMLNodeAttr(sAttrName, sAttrValue, false);
    }

    public static bool IsDigits(String searchText)
    {
        bool isAllDigits = true;

        for (int i = 0; i < searchText.Length; i++)
        {
            if ((int)searchText[i] < 48 || (int)searchText[i] > 57)
            {
                isAllDigits = false;
                break;
            }
        }

        return isAllDigits;
    }
}
