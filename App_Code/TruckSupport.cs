using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for TruckSupport
/// </summary>
public class TruckSupport
{
  public int Id { get; set; }
  public string SerialNumber { get; set; }
  public DateTime BuildDate { get; set; }
  public string VIN { get; set; }
  public string NewWayModel { get; set; }
  public int NewWayModelId { get; set; }

	public TruckSupport()
	{
		//
		// TODO: Add constructor logic here
		//
	}

  public List<TruckSupport> getATruck(string _serialNumber)
  {
    List<TruckSupport> getTruck = new List<TruckSupport>();

    using (var cxt = new NewWayModelContainer())
    {
      getTruck = (from g in cxt.ServiceSupportTrucks
                      where g.SerialNumberText.StartsWith(_serialNumber)
                      select new TruckSupport
                      {
                        Id = g.Id,
                        BuildDate = (DateTime)g.BuildDate,
                        SerialNumber = g.SerialNumberText,
                        NewWayModel = g.NewWayModel.Model,
                        NewWayModelId = g.NewWayModelId
                      }).ToList();

      return getTruck;
    }
  }

  public List<TruckSupport> getAllTrucks()
  {
   
    using (var cxt = new NewWayModelContainer())
    {

      List<TruckSupport> getTrucks = new List<TruckSupport>();

      getTrucks = (from g in cxt.ServiceSupportTrucks
                      where g.SerialNumberText != "0"
                      orderby g.SerialNumberText
                      select new TruckSupport
                      {
                        Id = g.Id,
                        BuildDate = (DateTime)g.BuildDate,
                        SerialNumber = g.SerialNumberText,
                        NewWayModel = g.NewWayModel.Model,
                        NewWayModelId = g.NewWayModelId
                      }).ToList();
      return getTrucks;
    }
  }
}