﻿using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Runtime.Serialization;
using System.Runtime.Serialization.Json;
using System.Text;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class contact_us_form : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        Page.Title = "Contact Us | New Way® Trucks";
    }

    protected void btnValidateReCaptcha_Click(object sender, EventArgs e)
    {
        //start building recaptch api call
        var sb = new System.Text.StringBuilder();
        sb.Append("https://www.google.com/recaptcha/api/siteverify?secret=");

        ////our secret key
        var secretKey = "6Lfjb-0SAAAAAHQYBap9hupm7WQvEeyo9dYrSOg_";
        sb.Append(secretKey);

        ////response from recaptch control
        sb.Append("&");
        sb.Append("response=");
        var reCaptchaResponse = Request["g-recaptcha-response"];
        sb.Append(reCaptchaResponse);

        ////client ip address
        ////---- This Ip address part is optional. If you donot want to send IP address you can
        ////---- Skip(Remove below 4 lines)
        sb.Append("&");
        sb.Append("remoteip=");
        var clientIpAddress = GetUserIp();
        sb.Append(clientIpAddress);

        ////make the api call and determine validity
        using (var client = new WebClient())
        {
            var uri = sb.ToString();
            var json = client.DownloadString(uri);
            var serializer = new DataContractJsonSerializer(typeof(RecaptchaApiResponse));
            var ms = new MemoryStream(Encoding.Unicode.GetBytes(json));
            var result = serializer.ReadObject(ms) as RecaptchaApiResponse;

            //--- Check if we are able to call api or not.
            if (result == null)
            {
                lblForMessage.Text = "Captcha was unable to make the api call";
            }
            else // If Yes
            {
                //api call contains errors
                if (result.ErrorCodes != null)
                {
                    if (result.ErrorCodes.Count > 0)
                    {
                        foreach (var error in result.ErrorCodes)
                        {
                            lblForMessage.Text = "reCAPTCHA Error: " + error;
                        }
                    }
                }
                else //api does not contain errors
                {
                    if (!result.Success) //captcha was unsuccessful for some reason
                    {
                        lblForMessage.Text = "Captcha did not pass, please try again.";
                    }
                    else //---- If successfully verified. Do your rest of logic.
                    {
	                    
	                    // check for honey pot input fields
	                    if (!String.IsNullOrEmpty(emailConfirm_txt.Text) 
	                    || !String.IsNullOrEmpty(notes_txt.Text)  
	                    || !String.IsNullOrEmpty(feedback_txt.Text) 
	                    || !String.IsNullOrEmpty(companyLoation_txt.Text) 
	                    || email_txt.Text.Equals("seniamelkii312@gmail.com") 
	                    || company_txt.Text.Equals("google")
	                    ) {
	                        lblForMessage.Text = "Captcha cleared ";
	                        SendSpamEmail();
	                        FormPanel.Visible = false;
	                        SubmissionSuccessPanel.Visible = true;
	                        return;
	                    }
	                    
                        lblForMessage.Text = "Captcha cleared ";
                        SendEmail();
                        SaveToDatabase();
                        FormPanel.Visible = false;
                        SubmissionSuccessPanel.Visible = true;
                        //Response.Redirect("~/contact-us/success.asp");
                    }
                }
            }
        }
    }

    [DataContract]
    public class RecaptchaApiResponse
    {
        [DataMember(Name = "success")]
        public bool Success;

        [DataMember(Name = "error-codes")]
        public List<string> ErrorCodes;
    }

    //--- To get user IP(Optional)
    private string GetUserIp()
    {
        var visitorsIpAddr = string.Empty;

        if (Request.ServerVariables["HTTP_X_FORWARDED_FOR"] != null)
        {
            visitorsIpAddr = Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
        }
        else if (!string.IsNullOrEmpty(Request.UserHostAddress))
        {
            visitorsIpAddr = Request.UserHostAddress;
        }

        return visitorsIpAddr;
    }
    
    private void SendSpamEmail() {
        //Send Notification Email to New Way
        MailMessage msg = new MailMessage();

        var department = departmentt_ddl.SelectedValue;

        switch (department)
        {
            case "Advertising/Sponsorship Requests":
                msg.To.Add("duc@bluespacecreative.com");
                msg.CC.Add("duc@bluespacecreative.com");
                msg.CC.Add("duc@bluespacecreative.com");
                msg.Bcc.Add("duc@bluespacecreative.com");
                break;
            case "Customer Service":
                msg.To.Add("duc@bluespacecreative.com");
                msg.CC.Add("duc@bluespacecreative.com");
                msg.CC.Add("duc@bluespacecreative.com");
                msg.Bcc.Add("duc@bluespacecreative.com");
                break;
            case "FleetForce/Rentals":
                msg.To.Add("duc@bluespacecreative.com");
                msg.CC.Add("duc@bluespacecreative.com");
                msg.CC.Add("duc@bluespacecreative.com");
                msg.Bcc.Add("duc@bluespacecreative.com");
                break;
            case "HR/Personnel":
                msg.To.Add("duc@bluespacecreative.com");
                msg.CC.Add("duc@bluespacecreative.com");
                msg.CC.Add("duc@bluespacecreative.com");
                msg.Bcc.Add("duc@bluespacecreative.com");
                break;
            case "K-Pac":
                msg.To.Add("duc@bluespacecreative.com");
                msg.CC.Add("duc@bluespacecreative.com");
                msg.CC.Add("duc@bluespacecreative.com");
                msg.Bcc.Add("duc@bluespacecreative.com");
                break;
            case "New Way Truck Domestic (incl Canada) Sales":
                msg.To.Add("duc@bluespacecreative.com");
                msg.CC.Add("duc@bluespacecreative.com");
                msg.CC.Add("duc@bluespacecreative.com");
                msg.Bcc.Add("duc@bluespacecreative.com");               
                break;
            case "New Way Truck International Sales":
                msg.To.Add("duc@bluespacecreative.com");
                msg.CC.Add("duc@bluespacecreative.com");
                msg.CC.Add("duc@bluespacecreative.com");
                msg.Bcc.Add("duc@bluespacecreative.com");
                break;
            case "Parts":
                msg.To.Add("duc@bluespacecreative.com");
                msg.CC.Add("duc@bluespacecreative.com");
                msg.CC.Add("duc@bluespacecreative.com");
                msg.Bcc.Add("duc@bluespacecreative.com");
                break;
            case "Service":
                msg.To.Add("duc@bluespacecreative.com");
                msg.CC.Add("duc@bluespacecreative.com");
                msg.CC.Add("duc@bluespacecreative.com");
                msg.Bcc.Add("duc@bluespacecreative.com");
                break;
            case "Vendor/Purchasing Requests":
                msg.To.Add("duc@bluespacecreative.com");
                msg.CC.Add("duc@bluespacecreative.com");
                msg.CC.Add("duc@bluespacecreative.com");
                msg.Bcc.Add("duc@bluespacecreative.com");
                break;
            default:
                msg.To.Add("duc@bluespacecreative.com");
                msg.CC.Add("duc@bluespacecreative.com");
                msg.CC.Add("duc@bluespacecreative.com");
                msg.Bcc.Add("duc@bluespacecreative.com");
                break;
        }

        msg.Subject = "[SPAM] New Way Trucks Contact Form Completed";
        //Configure the address we are sending the mail from
        MailAddress address = new MailAddress("postmaster@refusetrucks.scrantonmfg.com");
        msg.From = address;



        var zeroDigit = 0;
        var hundredPercent = "100%";
        var bodyStyle = "width:100%";
        var tdStyle = "padding:15.0pt 15.0pt 15.0pt 15.0pt";
        var vAlign = "top";
        var pStyleNotification = "line-height:15.75pt;";
        var pStyleNotificationSpan = "font-size:10.5pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;;color:#45555F";
        var pStyleHeader = "line-height:19.5pt;";
        var pStyleHeaderSpan = "font-size:17.5pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;;color:#74ab45";
        var pStyleMain = "line-height:13.5pt;";
        var pStyleMainSpan = "font-size:9.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;;color:#45555F";
        var mailTo = "mailto:" + email_txt.Text;
        var pStyleNormalTextWeight = "font-weight:normal";

        StringBuilder body = new StringBuilder();
        body.AppendLine("<table border='" + zeroDigit + "' cellspacing='" + zeroDigit + "' cellpadding='" + zeroDigit + "' width='" + hundredPercent + "' style='" + bodyStyle + "'>");
        body.AppendLine("<tbody><tr><td valign='" + vAlign + "' style='" + tdStyle + "'>");
        body.AppendLine("<p style='" + pStyleNotification + "'><b><span style='" + pStyleNotificationSpan + "'>Website Notification</span></b></p>");
        body.AppendLine("<div><p style='" + pStyleHeader + "'><b><span style='" + pStyleHeaderSpan + "'>New Way Trucks Contact Form Completed</span></b></p></div>");
        body.AppendLine("<p style='" + pStyleMain + "'><span style='" + pStyleMainSpan + "'></span></p>");
        body.AppendLine("<div>");
        body.AppendLine("<p style='" + pStyleMain + "'><span style='" + pStyleMainSpan + "'>Hello,");
        body.AppendLine("<br><br>");
        body.AppendLine("<strong><span style='" + pStyleMainSpan + "'>" + firstName_txt.Text + " " + lastName_txt.Text + "</span></strong> has just completed the New Way Trucks Contact Form on the website.");
        body.AppendLine("<br><br>");
        body.AppendLine("Company Name: <strong><span style='" + pStyleMainSpan + "'>" + company_txt.Text + "</span></strong>");
        body.AppendLine("<br><br>");
        body.AppendLine(firstName_txt.Text + "'s phone number is: <strong><span style='" + pStyleMainSpan + "'>" + phone_txt.Text + "</span></strong>");
        body.AppendLine("<br>");
        body.AppendLine("Email:&nbsp; <strong><span style='" + pStyleMainSpan + "'><a href='" + mailTo + "'><span style='" + pStyleNormalTextWeight + "'>" + email_txt.Text + "</span></a></span></strong>");
        body.AppendLine("<br><br>");
        if (!String.IsNullOrEmpty(country_ddl.SelectedValue))
        {
            body.AppendLine("<span style='" + pStyleMainSpan + "'>Country: <strong>" + country_ddl.SelectedItem.Text + " </strong></span><br>");

            if (country_ddl.SelectedValue.Equals("US") && !String.IsNullOrEmpty(state_ddl.SelectedValue))
            {
                body.AppendLine("<span style='" + pStyleMainSpan + "'>State: <strong>" + state_ddl.SelectedItem.Text + " </strong></span><br>");
            }
            if (country_ddl.SelectedValue.Equals("CA") && !String.IsNullOrEmpty(province_ddl.SelectedValue))
            {
                body.AppendLine("<span style='" + pStyleMainSpan + "'>Province: <strong>" + province_ddl.SelectedItem.Text + " </strong></span><br>");
            }
            if (country_ddl.SelectedValue.Equals("OtherInternational") && !String.IsNullOrEmpty(otherInternational_txt.Text))
            {
                body.AppendLine("<span style='" + pStyleMainSpan + "'>Other Country: <strong>" + otherInternational_txt.Text + " </strong></span><br>");
            }
        }
        body.AppendLine("City: <strong><span style='" + pStyleMainSpan + "'>" + city_txt.Text + "</span></strong>");
        body.AppendLine("<br>");
        body.AppendLine("Postal Code: <strong><span style='" + pStyleMainSpan + "'>" + postalCode_txt.Text + "</span></strong>");
        body.AppendLine("<br><br>");
        body.AppendLine("New Way Truck Interest: <strong><span style='" + pStyleMainSpan + "'>" + newwayInterest_ddl.SelectedItem.Value + "</span></strong>");
        body.AppendLine("<br><br>");
        body.AppendLine("K-PAC Interest: <strong><span style='" + pStyleMainSpan + "'>" + kpacInterest_ddl.SelectedItem.Value + "</span></strong>");
        body.AppendLine("<br><br>");
        body.AppendLine("Inquiry Department: <strong><span style='" + pStyleMainSpan + "'>" + department + "</span></strong>");
        body.AppendLine("<br><br>");
        body.AppendLine("Comments provided in the form: <strong><span style='" + pStyleMainSpan + "'>" + comments_txt.Text + notes_txt.Text + emailConfirm_txt.Text + "</span></strong>");

        body.AppendLine("<br>");
        body.AppendLine("</p>");
        body.AppendLine("</div>");
        body.AppendLine("</td></tr></tbody></table>");


        msg.Body = body.ToString();
        msg.IsBodyHtml = true;


        //Configure an SmtpClient to send the mail.
        SmtpClient client = new SmtpClient("localhost", 25);
        client.EnableSsl = false; //only enable this if your provider requires it
                                  //Setup credentials to login to our sender email address ("UserName", "Password")
        NetworkCredential credentials = new NetworkCredential("postmaster@refusetrucks.scrantonmfg.com", "nwt@bsc");
        client.Credentials = credentials;

        //Send the msg
        client.Send(msg);
    }

    private void SendEmail()
    {
        //Send Notification Email to New Way
        MailMessage msg = new MailMessage();

        var department = departmentt_ddl.SelectedValue;

        switch (department)
        {
            case "Advertising/Sponsorship Requests":
                msg.To.Add("duc@bluespacecreative.com");
                msg.CC.Add("duc@bluespacecreative.com");
                msg.CC.Add("duc@bluespacecreative.com");
                msg.Bcc.Add("duc@bluespacecreative.com");
                break;
            case "Customer Service":
                msg.To.Add("duc@bluespacecreative.com");
                msg.CC.Add("duc@bluespacecreative.com");
                msg.CC.Add("duc@bluespacecreative.com");
                msg.Bcc.Add("duc@bluespacecreative.com");
                break;
            case "FleetForce/Rentals":
                msg.To.Add("duc@bluespacecreative.com");
                msg.CC.Add("duc@bluespacecreative.com");
                msg.CC.Add("duc@bluespacecreative.com");
                msg.Bcc.Add("duc@bluespacecreative.com");
                break;
            case "HR/Personnel":
                msg.To.Add("duc@bluespacecreative.com");
                msg.CC.Add("duc@bluespacecreative.com");
                msg.CC.Add("duc@bluespacecreative.com");
                msg.Bcc.Add("duc@bluespacecreative.com");
                break;
            case "K-Pac":
                msg.To.Add("duc@bluespacecreative.com");
                msg.CC.Add("duc@bluespacecreative.com");
                msg.CC.Add("duc@bluespacecreative.com");
                msg.Bcc.Add("duc@bluespacecreative.com");
                break;
            case "New Way Truck Domestic (incl Canada) Sales":
                msg.To.Add("duc@bluespacecreative.com");
                msg.CC.Add("duc@bluespacecreative.com");
                msg.CC.Add("duc@bluespacecreative.com");
                msg.Bcc.Add("duc@bluespacecreative.com");               
                break;
            case "New Way Truck International Sales":
                msg.To.Add("duc@bluespacecreative.com");
                msg.CC.Add("duc@bluespacecreative.com");
                msg.CC.Add("duc@bluespacecreative.com");
                msg.Bcc.Add("duc@bluespacecreative.com");
                break;
            case "Parts":
                msg.To.Add("duc@bluespacecreative.com");
                msg.CC.Add("duc@bluespacecreative.com");
                msg.CC.Add("duc@bluespacecreative.com");
                msg.Bcc.Add("duc@bluespacecreative.com");
                break;
            case "Service":
                msg.To.Add("duc@bluespacecreative.com");
                msg.CC.Add("duc@bluespacecreative.com");
                msg.CC.Add("duc@bluespacecreative.com");
                msg.Bcc.Add("duc@bluespacecreative.com");
                break;
            case "Vendor/Purchasing Requests":
                msg.To.Add("duc@bluespacecreative.com");
                msg.CC.Add("duc@bluespacecreative.com");
                msg.CC.Add("duc@bluespacecreative.com");
                msg.Bcc.Add("duc@bluespacecreative.com");
                break;
            default:
                msg.To.Add("duc@bluespacecreative.com");
                msg.CC.Add("duc@bluespacecreative.com");
                msg.CC.Add("duc@bluespacecreative.com");
                msg.Bcc.Add("duc@bluespacecreative.com");
                break;
        }

        msg.Subject = "New Way Trucks Contact Form Completed";
        //Configure the address we are sending the mail from
        MailAddress address = new MailAddress("postmaster@refusetrucks.scrantonmfg.com");
        msg.From = address;



        var zeroDigit = 0;
        var hundredPercent = "100%";
        var bodyStyle = "width:100%";
        var tdStyle = "padding:15.0pt 15.0pt 15.0pt 15.0pt";
        var vAlign = "top";
        var pStyleNotification = "line-height:15.75pt;";
        var pStyleNotificationSpan = "font-size:10.5pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;;color:#45555F";
        var pStyleHeader = "line-height:19.5pt;";
        var pStyleHeaderSpan = "font-size:17.5pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;;color:#74ab45";
        var pStyleMain = "line-height:13.5pt;";
        var pStyleMainSpan = "font-size:9.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;;color:#45555F";
        var mailTo = "mailto:" + email_txt.Text;
        var pStyleNormalTextWeight = "font-weight:normal";

        StringBuilder body = new StringBuilder();
        body.AppendLine("<table border='" + zeroDigit + "' cellspacing='" + zeroDigit + "' cellpadding='" + zeroDigit + "' width='" + hundredPercent + "' style='" + bodyStyle + "'>");
        body.AppendLine("<tbody><tr><td valign='" + vAlign + "' style='" + tdStyle + "'>");
        body.AppendLine("<p style='" + pStyleNotification + "'><b><span style='" + pStyleNotificationSpan + "'>Website Notification</span></b></p>");
        body.AppendLine("<div><p style='" + pStyleHeader + "'><b><span style='" + pStyleHeaderSpan + "'>New Way Trucks Contact Form Completed</span></b></p></div>");
        body.AppendLine("<p style='" + pStyleMain + "'><span style='" + pStyleMainSpan + "'></span></p>");
        body.AppendLine("<div>");
        body.AppendLine("<p style='" + pStyleMain + "'><span style='" + pStyleMainSpan + "'>Hello,");
        body.AppendLine("<br><br>");
        body.AppendLine("<strong><span style='" + pStyleMainSpan + "'>" + firstName_txt.Text + " " + lastName_txt.Text + "</span></strong> has just completed the New Way Trucks Contact Form on the website.");
        body.AppendLine("<br><br>");
        body.AppendLine("Company Name: <strong><span style='" + pStyleMainSpan + "'>" + company_txt.Text + "</span></strong>");
        body.AppendLine("<br><br>");
        body.AppendLine(firstName_txt.Text + "'s phone number is: <strong><span style='" + pStyleMainSpan + "'>" + phone_txt.Text + "</span></strong>");
        body.AppendLine("<br>");
        body.AppendLine("Email:&nbsp; <strong><span style='" + pStyleMainSpan + "'><a href='" + mailTo + "'><span style='" + pStyleNormalTextWeight + "'>" + email_txt.Text + "</span></a></span></strong>");
        body.AppendLine("<br><br>");
        if (!String.IsNullOrEmpty(country_ddl.SelectedValue))
        {
            body.AppendLine("<span style='" + pStyleMainSpan + "'>Country: <strong>" + country_ddl.SelectedItem.Text + " </strong></span><br>");

            if (country_ddl.SelectedValue.Equals("US") && !String.IsNullOrEmpty(state_ddl.SelectedValue))
            {
                body.AppendLine("<span style='" + pStyleMainSpan + "'>State: <strong>" + state_ddl.SelectedItem.Text + " </strong></span><br>");
            }
            if (country_ddl.SelectedValue.Equals("CA") && !String.IsNullOrEmpty(province_ddl.SelectedValue))
            {
                body.AppendLine("<span style='" + pStyleMainSpan + "'>Province: <strong>" + province_ddl.SelectedItem.Text + " </strong></span><br>");
            }
            if (country_ddl.SelectedValue.Equals("OtherInternational") && !String.IsNullOrEmpty(otherInternational_txt.Text))
            {
                body.AppendLine("<span style='" + pStyleMainSpan + "'>Other Country: <strong>" + otherInternational_txt.Text + " </strong></span><br>");
            }
        }
        body.AppendLine("City: <strong><span style='" + pStyleMainSpan + "'>" + city_txt.Text + "</span></strong>");
        body.AppendLine("<br>");
        body.AppendLine("Postal Code: <strong><span style='" + pStyleMainSpan + "'>" + postalCode_txt.Text + "</span></strong>");
        body.AppendLine("<br><br>");
        body.AppendLine("New Way Truck Interest: <strong><span style='" + pStyleMainSpan + "'>" + newwayInterest_ddl.SelectedItem.Value + "</span></strong>");
        body.AppendLine("<br><br>");
        body.AppendLine("K-PAC Interest: <strong><span style='" + pStyleMainSpan + "'>" + kpacInterest_ddl.SelectedItem.Value + "</span></strong>");
        body.AppendLine("<br><br>");
        body.AppendLine("Inquiry Department: <strong><span style='" + pStyleMainSpan + "'>" + department + "</span></strong>");
        body.AppendLine("<br><br>");
        body.AppendLine("Comments provided in the form: <strong><span style='" + pStyleMainSpan + "'>" + comments_txt.Text + "</span></strong>");

        body.AppendLine("<br>");
        body.AppendLine("</p>");
        body.AppendLine("</div>");
        body.AppendLine("</td></tr></tbody></table>");


        msg.Body = body.ToString();
        msg.IsBodyHtml = true;


        //Configure an SmtpClient to send the mail.
        SmtpClient client = new SmtpClient("localhost", 25);
        client.EnableSsl = false; //only enable this if your provider requires it
                                  //Setup credentials to login to our sender email address ("UserName", "Password")
        NetworkCredential credentials = new NetworkCredential("postmaster@refusetrucks.scrantonmfg.com", "nwt@bsc");
        client.Credentials = credentials;

        //Send the msg
        client.Send(msg);
    }

    private void SaveToDatabase()
    {
        using (var context = new NewWayModelContainer())
        {
            try
            {
                WebsiteInquiry newInquiry = new WebsiteInquiry
                {
                    dateSubmitted = DateTime.Now,
                    firstName = firstName_txt.Text,
                    lastName = lastName_txt.Text,
                    company = company_txt.Text,
                    email = email_txt.Text,
                    phone = phone_txt.Text,
                    country = country_ddl.SelectedItem.Text,
                    state = state_ddl.SelectedItem.Text,
                    newWayInterest = newwayInterest_ddl.SelectedItem.Text,
                    kPacInterest = kpacInterest_ddl.SelectedItem.Text,
                    interestArea = departmentt_ddl.SelectedItem.Text,
                    comments = comments_txt.Text,
                    InquiryTypeId = 1,
                    archived = "no"
                };
                context.WebsiteInquiries.Add(newInquiry);
                context.SaveChanges();

                firstName_txt.Text = "";
                lastName_txt.Text = "";
                company_txt.Text = "";
                email_txt.Text = "";
                phone_txt.Text = "";
                country_ddl.ClearSelection();
                newwayInterest_ddl.ClearSelection();
                kpacInterest_ddl.ClearSelection();
                comments_txt.Text = "";
            }
            catch (Exception ex)
            {
                string error = Convert.ToString(ex.InnerException);
                //Label1.Text = error;
            }
        }
    }

    protected void country_ddl_SelectedIndexChanged(object sender, EventArgs e)
    {
        //lblForMessage.Text = "Country DDL" + country_ddl.SelectedIndex;

        if (country_ddl.SelectedIndex == 1)
        {
            state_lbl.Style.Add("display", "block");
            state_ddl.Style.Add("display", "block");
            province_lbl.Style.Add("display", "none");
            province_ddl.Style.Add("display", "none");
            otherInternational_lbl.Style.Add("display", "none");
            otherInternational_txt.Style.Add("display", "none");
            ProvinceRequiredValidator.Enabled = false;
            StateRequiredValidator.Enabled = true;
            OtherInternationalValidator.Enabled = false;
        }
        else if (country_ddl.SelectedIndex == 2)
        {
            state_lbl.Style.Add("display", "none");
            state_ddl.Style.Add("display", "none");
            province_lbl.Style.Add("display", "block");
            province_ddl.Style.Add("display", "block");
            otherInternational_lbl.Style.Add("display", "none");
            otherInternational_txt.Style.Add("display", "none");
            StateRequiredValidator.Enabled = false;
            ProvinceRequiredValidator.Enabled = true;
            OtherInternationalValidator.Enabled = false;
        }
        else if (country_ddl.SelectedIndex == 3)
        {
            state_lbl.Style.Add("display", "none");
            state_ddl.Style.Add("display", "none");
            province_lbl.Style.Add("display", "none");
            province_ddl.Style.Add("display", "none");
            otherInternational_lbl.Style.Add("display", "block");
            otherInternational_txt.Style.Add("display", "block");
            ProvinceRequiredValidator.Enabled = false;
            StateRequiredValidator.Enabled = false;
            OtherInternationalValidator.Enabled = true;
        }
        else
        {
            state_lbl.Style.Add("display", "none");
            state_ddl.Style.Add("display", "none");
            province_lbl.Style.Add("display", "none");
            province_ddl.Style.Add("display", "none");
            otherInternational_lbl.Style.Add("display", "none");
            otherInternational_txt.Style.Add("display", "none");
            ProvinceRequiredValidator.Enabled = false;
            StateRequiredValidator.Enabled = false;
            OtherInternationalValidator.Enabled = false;
        }
    }
}