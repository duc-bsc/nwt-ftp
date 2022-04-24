using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for WebsiteInquiryMgr
/// </summary>
public class WebsiteInquiryMgr
{
  public int Id { get; set; }
  public DateTime dateSubmitted { get; set; }
  public string followUpCompleted { get; set; }
  public string firstName { get; set; }
  public string lastName { get; set; }
  public string email { get; set; }
  public string company { get; set; }
  public string comments { get; set; }
  public string eShowroomTruckInterest { get; set; }
  public string testimonial { get; set; }
  public string qtyDesired { get; set; }

  public WebsiteInquiryMgr()
  {
    //
    // TODO: Add constructor logic here
    //
  }

  public List<WebsiteInquiryMgr> getWebsiteInquires(int _inquiryTypeId)
  {
    var cxt = new NewWayModelContainer();
    var getInquires = (from g in cxt.WebsiteInquiries
                       where g.InquiryTypeId == _inquiryTypeId
                       where g.archived == "no"
                       orderby g.dateSubmitted descending
                       select new WebsiteInquiryMgr
                       {
                         Id = g.Id,
                         dateSubmitted = g.dateSubmitted,
                         followUpCompleted = g.followUpCompleted.ToString().Equals("") ? "" : g.followUpCompleted.ToString(),
                         firstName = g.firstName,
                         lastName = g.lastName,
                         email = g.email,
                         company = g.company,
                         comments = g.comments,
                         eShowroomTruckInterest = g.eShowroomTruckInterest,
                         testimonial = g.testimonial,
                         qtyDesired = g.qtyDesired
                       }).ToList();

    return getInquires;
  }

  public void archiveInquiry(int _inquiryId)
  {
    using (var context = new NewWayModelContainer())
    {
      try
      {

        var update = (from u in context.WebsiteInquiries
                      where u.Id == _inquiryId
                      select u).FirstOrDefault();
        update.archived = "yes";
        context.SaveChanges();

      }
      catch (Exception ex)
      {
        string error = Convert.ToString(ex.InnerException);
      }
    }
  }

}