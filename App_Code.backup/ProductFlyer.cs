using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for ProductFlyer
/// </summary>
public class ProductFlyer
{
    public string ProductFlyerName { get; set; }

	public ProductFlyer()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public static List<ProductFlyer> ProductFlyerList()
    {
        return new List<ProductFlyer> {

            new ProductFlyer{ProductFlyerName="Cobra"},
            new ProductFlyer{ProductFlyerName="Cobra Magnum"},
            new ProductFlyer{ProductFlyerName="King Cobra"},
            new ProductFlyer{ProductFlyerName="Diamondback"},
            new ProductFlyer{ProductFlyerName="Viper"},
            new ProductFlyer{ProductFlyerName="Mamba"},
            new ProductFlyer{ProductFlyerName="Mammoth"},
            new ProductFlyer{ProductFlyerName="Western Series Mammoth"},
            new ProductFlyer{ProductFlyerName="Sidewinder XTR"},
            new ProductFlyer{ProductFlyerName="ROTO-PAC"}
        };
    }

}