using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Transaction
/// </summary>
public class Transaction
{
    public string ApplicationID { get; set; }
    public string TransactionID { get; set; }
    public string Key { get; set; } = "gtKFFx";

    public string Salt { get; set; } = "eCwWELxi";

    public string HashValue { get; set; }

    public string Txnid { get; } = Guid.NewGuid().ToString();

    public int Amount {  get; set; }

    public string Name {  get; set; }

    public string EmailId {  get; set; }

    public string PhoneNumber {  get; set; }
    public string ProductInfo { get; set; } = "Application Fee";
    public string Email { get; set; } = "swcsfilm@gmail.com";
}