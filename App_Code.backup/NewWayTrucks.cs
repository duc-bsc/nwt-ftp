using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for NewWayTrucks
/// </summary>
public class NewWayTrucks
{
  public bool isDealerTruck { get; set; }

	public NewWayTrucks()
	{
		//
		// TODO: Add constructor logic here
		//
	}

  public bool isTruckADealerTruck(int _serviceSupportTruckId)
  {
    using (var cxt = new NewWayModelContainer())
    {
      var dealerTruck = (from d in cxt.ServiceSupportTrucks
                         where d.Id == _serviceSupportTruckId
                         where d.DealerTruck == true
                         select new
                         {
                           id = d.Id
                         }).ToList();

      return isDealerTruck = dealerTruck.Any();
    }

  }

  public int getNewWayModelId(int _serviceSupportTruckId)
  {
    var cxt = new NewWayModelContainer();
    var newWayModelId = (from a in cxt.ServiceSupportTrucks
                         where a.Id == _serviceSupportTruckId
                         select new
                         {
                           newwaymodelid = a.NewWayModelId
                         }).First();
    int newwaymodelId = newWayModelId.newwaymodelid;
    return newwaymodelId;
  }

}