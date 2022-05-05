using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Model for holding formatted data from the Eshowroom listing table
/// </summary>
public class EshowroomListing
{
    public int Id { get; set; }
    public string workOrder { get; set; }
    public string type { get; set; }
    public string model { get; set; }
    public string style { get; set; }
    public string capacity { get; set; }
    public string hours { get; set; }
    public int year { get; set; }
    public string chassis { get; set; }
    public string transmission { get; set; }
    public string engine { get; set; }
    public string youTubeLink { get; set; }
    public string GVWR { get; set; }
    public int mileage { get; set; }
    public string comments { get; set; }
    public string GVM { get; set; }
    

	public EshowroomListing()
	{

	}

}