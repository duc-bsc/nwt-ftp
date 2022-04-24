using System;
using System.Collections.Generic;
using System.Data;
using System.Data.OleDb;
using System.Linq;
using System.Web;
using System.Web.Services;

/// <summary>
/// Summary description for SearchTruck
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
[System.ComponentModel.ToolboxItem(false)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
 [System.Web.Script.Services.ScriptService]
public class SearchTruck : System.Web.Services.WebService {

    public SearchTruck () {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }

    [WebMethod]
    public string[] AutoCompleteAjaxRequest(string prefixText, int count)
    {
      List<string> ajaxDataCollection = new List<string>();
      DataTable _objdt = new DataTable();
      _objdt = GetDataFromDataBase(prefixText);
      if (_objdt.Rows.Count > 0)
      {
        for (int i = 0; i < _objdt.Rows.Count; i++)
        {
          ajaxDataCollection.Add(_objdt.Rows[i]["SerialNumber"].ToString());
        }
      }
      return ajaxDataCollection.ToArray();
    }
    /// <summary>
    /// Function for retriving data from database
    /// </summary>
    /// <returns></returns>
    public DataTable GetDataFromDataBase(string prefixText)
    {
      string connectionstring = "Data Source=tcp:sql2k804.discountasp.net; Initial Catalog=SQL2008R2_948528_newwaytrucks; Persist Security Info=True;User ID=SQL2008R2_948528_newwaytrucks_user;Password=nwt@bsc;";
      DataTable _objdt = new DataTable();
      string querystring = "select * from ServiceSupportTrucks where SerialNumber like '%" + 1 + "%';";
      OleDbConnection _objcon = new OleDbConnection(connectionstring);
      OleDbDataAdapter _objda = new OleDbDataAdapter(querystring, _objcon);
      _objcon.Open();
      _objda.Fill(_objdt);
      return _objdt;
    }
    
}
