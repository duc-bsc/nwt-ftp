using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using Twilio;

/// <summary>
/// Summary description for SmsService
/// </summary>
public class SmsService : IIdentityMessageService
{
    public Task SendAsync(IdentityMessage message)
    {
        var Twilio = new TwilioRestClient(
           ConfigurationManager.AppSettings["SMSSID"],
           ConfigurationManager.AppSettings["SMSAuthToken"]
       );
        var result = Twilio.SendMessage(
            ConfigurationManager.AppSettings["SMSPhoneNumber"],
           message.Destination, message.Body);

        // Status is one of Queued, Sending, Sent, Failed or null if the number is not valid
        Trace.TraceInformation(result.Status);

        // Twilio doesn't currently have an async API, so return success.
        return Task.FromResult(0);
    }
}