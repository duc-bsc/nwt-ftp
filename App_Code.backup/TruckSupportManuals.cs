using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for TruckSupportManuals
/// </summary>
public class TruckSupportManuals
{
  public int Id { get; set; }
  public string filename { get; set; }
  public string fileDescription { get; set; }
  public string videoLink { get; set; }
  public string supportType { get; set; }

	public TruckSupportManuals()
	{
		//
		// TODO: Add constructor logic here
		//
	}

  public void addSupportManualsToNewTruck(int _ServiceSupportId, int _newTruckId)
  {
    string result = "nothing";

    List<TruckSupportManuals> truckManuals = new List<TruckSupportManuals>();

    using (var cxt = new NewWayModelContainer())
    {
      truckManuals = (from files in cxt.ServiceSupportManuals
                             where files.ServiceSupportTrucks.Any(c => c.Id == _ServiceSupportId)
                   select new TruckSupportManuals
                   {
                     Id = files.Id,
                     filename = files.Filename,
                     fileDescription = files.FileDescription,
                     videoLink = files.VideoLink
                   }).ToList();

      foreach (var item in truckManuals)
      {
        try
        {

          ServiceSupportTruck supportTruck = cxt.ServiceSupportTrucks.FirstOrDefault(s => s.Id == _newTruckId);
          ServiceSupportManual manual = cxt.ServiceSupportManuals.FirstOrDefault(s => s.Id == item.Id);
          supportTruck.ServiceSupportManuals.Add(manual);
          cxt.SaveChanges();

          result = "success input";

        }
        catch (Exception ex)
        {
          result = "failed input";
        }

      }
    }
  }

  public List<TruckSupportManuals> getSupportFilesForTruck(int _serviceSupportTruckId)
  {
    var cxt = new NewWayModelContainer();
    var files = (from manuals in cxt.ServiceSupportManuals
                where manuals.publicAccess == true
                where manuals.ServiceSupportTrucks.Any(c => c.Id == _serviceSupportTruckId)
                where manuals.Filename != "NWT_Mammoth_S_137764.pdf"
                where manuals.Filename != "NWT_Mammoth_M_137764.pdf"
                where manuals.Filename != "NWT_MammothWestern_S_137765-1.pdf"
                where manuals.Filename != "NWT_KingCobra_S_137766.pdf"
                where manuals.Filename != "NWT_CobraMag_S_137767.pdf"
                where manuals.Filename != "NWT_Cobra_S_137768.pdf"
                where manuals.Filename != "NWT_Viper_S_137769.pdf"
                where manuals.Filename != "NWT_Diamondback_S_137770.pdf"
                where manuals.Filename != "NWT_SidewinderXTR_S_137771.pdf"
                select new TruckSupportManuals
                {
                  filename = manuals.Filename,
                  fileDescription = manuals.FileDescription,
                  supportType = manuals.ServiceSupportType.SupportType
                }).ToList();

    var groupedBySupportType = files.GroupBy(x => x.supportType).SelectMany(g => g).ToList();

    return groupedBySupportType;
  }

}