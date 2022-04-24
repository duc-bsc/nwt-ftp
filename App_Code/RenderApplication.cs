using Newtonsoft.Json;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System;

/// <summary>
/// Summary description for RenderApplication
/// </summary>
public class RenderApplication
{
    public RenderApplication()
    {
    }

    public string GenerateApplicationHtml(string htmlText, int appId)
    {
        using (var ctx = new NewWayModelContainer())
        {
            var getFormData = (from e in ctx.TruckWarranties
                               where e.Id == appId
                               select new
                               {
                                   dateSubmitted = e.DateSubmitted,
                                   warrantyJson = e.WarrantyJson
                               }).ToList().First();
            TruckWarrantyApplication formApp = JsonConvert.DeserializeObject<TruckWarrantyApplication>(getFormData.warrantyJson);

            //Get Form Data
            Dictionary<string, string> fields = new Dictionary<string, string>
          {
            {"[[date]]", getFormData.dateSubmitted.ToShortDateString()},
            {"[[originalPurchaser]]", formApp.OriginalPurchaserCompany},
            {"[[customerName]]", formApp.CustomerName},
            {"[[address]]", formApp.Address},
            {"[[city]]", formApp.City},
            {"[[state]]", formApp.State},
            {"[[zip]]", formApp.Zip},
            {"[[phone]]", formApp.Phone},
            {"[[email]]", formApp.Email},
            {"[[bodyModel]]", formApp.BodyModel},
            {"[[bodySerialNumber]]", formApp.BodySerialNumber},
            {"[[chassisMake]]", formApp.ChassisMake},
            {"[[chassisModel]]", formApp.ChassisModel},
            {"[[chassisVIN]]", formApp.ChassisVIN},
            {"[[chassisMiles]]", formApp.ChassisMiles},
            {"[[purchasedFrom]]", formApp.PurchasedFrom},
            {"[[dateOfAcceptedDelivery]]", formApp.DateOfAcceptedDelivery.ToShortDateString()},
            {"[[sellingDealer]]", formApp.SellingDealer},
          };
            //populate email fields
            foreach (KeyValuePair<string, string> item in fields)
            {
                htmlText = htmlText.Replace(item.Key, item.Value);
            }
            return htmlText;
        }
    }
}