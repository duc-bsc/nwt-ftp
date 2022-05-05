using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for TruckWarranty
/// </summary>
public class TruckWarrantyApplication
{
    public string OriginalPurchaserCompany { get; set; }
    public string CustomerName { get; set; }
    public string Address { get; set; }
    public string City { get; set; }
    public string State { get; set; }
    public string Zip { get; set; }
    public string Phone { get; set; }
    public string Email { get; set; }
    public string BodyModel { get; set; }
    public string BodySerialNumber { get; set; }
    public string ChassisMake { get; set; }
    public string ChassisModel { get; set; }
    public string ChassisVIN { get; set; }
    public string ChassisMiles { get; set; }
    public string PurchasedFrom { get; set; }
    public DateTime DateOfAcceptedDelivery { get; set; }
    public string SellingDealer { get; set; }

    public TruckWarrantyApplication()
    {
        //
        // TODO: Add constructor logic here
        //
    }
}
