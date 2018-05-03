using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;

/// <summary>
/// Provides function for Payment
/// </summary>
public class Payment
{
    #region Private Function
    /// <summary>
    /// Prepares post form
    /// </summary>
    /// <param name="url"></param>
    /// <param name="data"></param>
    /// <returns></returns>
    private string PreparePOSTForm(string url, System.Collections.Hashtable data)      
    {
        //Set a name for the form
        string formID = "PostForm";

        //Build the form using the specified data to be posted.
        StringBuilder strForm = new StringBuilder();
        strForm.Append("<form id=\"" + formID + "\" name=\"" +
                       formID + "\" action=\"" + url +
                       "\" method=\"POST\">");

        foreach (System.Collections.DictionaryEntry key in data)
        {

            strForm.Append("<input type=\"hidden\" name=\"" + key.Key +
                           "\" value=\"" + key.Value + "\">");
        }


        strForm.Append("</form>");
        //Build the JavaScript which will do the Posting operation.
        StringBuilder strScript = new StringBuilder();
        strScript.Append("<script language='javascript'>");
        strScript.Append("var v" + formID + " = document." +
                         formID + ";");
        strScript.Append("v" + formID + ".submit();");
        strScript.Append("</script>");
        //Return the form and the script concatenated.
        //(The order is important, Form then JavaScript)
        return strForm.ToString() + strScript.ToString();
    }

    #endregion

    #region Public Function

    public void PaymentData(Transaction transaction, System.Web.UI.Page pg)
    {
        String text = transaction.Key.ToString() + "|" + transaction.Txnid.ToString() + "|" + transaction.Amount + "|" + transaction.ProductInfo.ToString() + "|" + transaction.Name.ToString() + "|" + transaction.Email.ToString() + "|" + "1" + "|" + "1" + "|" + "1" + "|" + "1" + "|" + "1" + "||||||" + transaction.Salt.ToString();
        byte[] message = Encoding.UTF8.GetBytes(text);

        UnicodeEncoding UE = new UnicodeEncoding();
        byte[] hashValue;
        SHA512Managed hashString = new SHA512Managed();
        string hex = "";
        hashValue = hashString.ComputeHash(message);
        foreach (byte x in hashValue)
        {
            hex += String.Format("{0:x2}", x);
        }
        transaction.HashValue = hex;

        System.Collections.Hashtable data = new System.Collections.Hashtable();
        data.Add("hash", transaction.HashValue);
        data.Add("txnid", transaction.TransactionID);
        data.Add("key", transaction.Key);
        data.Add("amount", transaction.Amount);
        data.Add("firstname", transaction.Name);
        data.Add("email", transaction.Email);
        data.Add("phone", transaction.PhoneNumber);
        data.Add("productinfo", transaction.ProductInfo);
        data.Add("udf1", "1");
        data.Add("udf2", "1");
        data.Add("udf3", "1");
        data.Add("udf4", "1");
        data.Add("udf5", "1");

        data.Add("surl", "http://localhost:51188/FaliurePage.aspx");
        data.Add("furl", "http://localhost:51188/SuccessPage.aspx");

        data.Add("service_provider", "");


        string strForm = PreparePOSTForm("https://test.payu.in/_payment", data);
        pg.Page.Controls.Add(new System.Web.UI.LiteralControl(strForm));

    }
    #endregion
}