<%@ Page Title='<%# Title %>' Language="C#" AutoEventWireup="true" CodeFile="duc.aspx.cs" Inherits="contact_us_form" MaintainScrollPositionOnPostback="true" %>

<!doctype html>
<html class="no-js" lang="en">
<head prefix="og: http://ogp.me/ns#" runat="server">
  <meta charset="utf-8" />
  <!-- Use the .htaccess and remove these lines to avoid edge case issues. More info: h5bp.com/i/378 -->
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta content="text/html; charset=UTF-8" http-equiv="Content-Type" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <meta name="title" content="Contact Us | New Way&reg; Trucks" />
  <meta name="description" content="Get in touch with New Way Trucks to learn more about our refuse trucks and waste compaction products, or to connect with a sales representative." />
  <meta name="robots" content="index, follow" />
  <link rel="canonical" href="https://refusetrucks.scrantonmfg.com/contact-us/duc.aspx" />

  <!-- Facebook sharing -->
  <meta property="og:title" content="Contact Us | New Way&reg; Trucks" />
  <meta property="og:description" content="Get in touch with New Way Trucks to learn more about out products or to connect with a sales representative." />
  <meta property="og:type" content="website" />
  <meta property="og:image" content="https://refusetrucks.scrantonmfg.com/images/logo-nwt-transparent.png" />
  <meta property="og:url" content="https://refusetrucks.scrantonmfg.com/contact-us/duc.aspx" />

  <title>Contact Us | New Way&reg; Trucks</title>

  <link rel="stylesheet" href="../css/normalize.css" />
  <link rel="stylesheet" href="../css/foundation.min.css" />
  <link rel="stylesheet" href="../css/main.css" />
  <link rel="stylesheet" href="../css/icon-styles.css" />

  <link rel="shortcut icon" href="https://refusetrucks.scrantonmfg.com/favicon.ico" type="image/x-icon" />
  <link rel="apple-touch-icon" href="https://refusetrucks.scrantonmfg.com/apple-touch-icon.png" />
  <link rel="apple-touch-icon" sizes="57x57" href="https://refusetrucks.scrantonmfg.com/apple-touch-icon-57x57.png" />
  <link rel="apple-touch-icon" sizes="72x72" href="https://refusetrucks.scrantonmfg.com/apple-touch-icon-72x72.png" />
  <link rel="apple-touch-icon" sizes="76x76" href="https://refusetrucks.scrantonmfg.com/apple-touch-icon-76x76.png" />
  <link rel="apple-touch-icon" sizes="114x114" href="https://refusetrucks.scrantonmfg.com/apple-touch-icon-114x114.png" />
  <link rel="apple-touch-icon" sizes="120x120" href="https://refusetrucks.scrantonmfg.com/apple-touch-icon-120x120.png" />
  <link rel="apple-touch-icon" sizes="144x144" href="https://refusetrucks.scrantonmfg.com/apple-touch-icon-144x144.png" />
  <link rel="apple-touch-icon" sizes="152x152" href="https://refusetrucks.scrantonmfg.com/apple-touch-icon-152x152.png" />

  <script src="../js/vendor/modernizr.js"></script>
  <script src="https://www.google.com/recaptcha/api.js"></script>
  <!--#include file="../includes/typekit.html" -->
  <!--#include file="../includes/hotjar.html" -->
</head>
<body class="sec contact-us overview">
  <!--#include file="../includes/browser-frame.html" -->
  <a name="top"></a>
  <form runat="server" autocomplete="false">
    <div class="outer-wrapper">
      <div class="inner-wrapper">
        <!--#include file="../includes/main-nav.html" -->
        <div class="content-wrapper">
          <div class="row">
            <div class="large-12 small-12 medium-12 columns clearfix">
              <div class="two-column-wrapper" >
                <div class="large-8 medium-8 small-12 columns left-col">
                  <section class="intro-pane">
                    <h1>Contact Us.</h1>
                    <h2>General Feedback &amp; Questions</h2>
                    <p>Wondering about a <a href="https://refusetrucks.scrantonmfg.com/">New Way</a> or <a href="/kpac-compactors/">K-PAC</a> product? Use the form below to inquire about our extensive line of refuse trucks and waste compaction products. With satisfied customers around the globe, get in touch today to find out how New Way can improve your operation.</p>
                    <div class="form-wrapper">
                      <asp:Panel ID="SubmissionSuccessPanel" runat="server" Visible="false">
                        <table class="contact-form">
                          <tr>
                            <td>
                              <h4 class="text-center" style="color:#8dc63f;">Your information has been successfully sent.</h4>
                            </td>
                          </tr>
                        </table>
                      </asp:Panel>
                      <!-- Generating the form -->
                      <asp:Panel ID="FormPanel" runat="server">
                      <table class="contact-form" width="100%" cellpadding="0" cellspacing="0">
                        <tr id="firstName_row">
                          <td>
                            <asp:Label AssociatedControlID="firstName_txt" ID="firstName_lbl" CssClass="required" runat="server">First Name:</asp:Label>
                          </td>
                          <td>
                            <asp:TextBox ID="firstName_txt" CssClass="required" runat="server"></asp:TextBox>
                            <small><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="firstName_txt" Display="Dynamic" ErrorMessage="Required" CssClass="error"></asp:RequiredFieldValidator></small>
                          </td>
                        </tr>
                        <tr id="lastName_row">
                          <td>
                            <asp:Label AssociatedControlID="lastName_txt" ID="lastName_lbl" CssClass="required" runat="server">Last Name:</asp:Label>
                          </td>
                          <td>
                            <asp:TextBox ID="lastName_txt" CssClass="required" runat="server"></asp:TextBox>
                            <small><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="lastName_txt" Display="Dynamic" ErrorMessage="Required" CssClass="error"></asp:RequiredFieldValidator></small>
                          </td>
                        </tr>
                        <tr id="company_row">
                          <td>
                            <asp:Label AssociatedControlID="company_txt" ID="company_lbl" runat="server">Company:</asp:Label>
                          </td>
                          <td>
                            <asp:TextBox ID="company_txt" runat="server"></asp:TextBox>
                          </td>
                        </tr>
                        <tr id="companyLocation_row">
                          <td>
                            <asp:Label AssociatedControlID="companyLoation_txt" ID="companyLocation_lbl" runat="server">Company Address:</asp:Label>
                          </td>
                          <td>
                            <asp:TextBox ID="companyLoation_txt" runat="server"></asp:TextBox>
                          </td>
                        </tr>
	                      <tr id="emailConfirm_row">
		                      <td>
							  	<asp:Label AssociatedControlID="emailConfirm_txt" ID="emailConfirm_lbl" runat="server">Email Confirm:</asp:Label></td>
		                      <td>
							  	<asp:TextBox ID="emailConfirm_txt" runat="server"></asp:TextBox>
		                      </td>
		                      
	                      </tr>
                        <tr id="email_row">
                          <td>
                            <asp:Label AssociatedControlID="email_txt" ID="email_lbl" CssClass="required" runat="server">Email:</asp:Label>
                          </td>
                          <td>
                            <asp:TextBox ID="email_txt" CssClass="required" runat="server"></asp:TextBox>
                            <small><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="email_txt" Display="Dynamic" ErrorMessage="Required" CssClass="error"></asp:RequiredFieldValidator></small>
                          </td>
                        </tr>
                        <tr id="phone_row">
                          <td>
                            <asp:Label AssociatedControlID="phone_txt" ID="phone_lbl" CssClass="required" runat="server">Phone:</asp:Label>
                          </td>
                          <td>
                            <asp:TextBox ID="phone_txt" CssClass="required" runat="server"></asp:TextBox>
                            <small><asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="phone_txt" Display="Dynamic" ErrorMessage="Required" CssClass="error"></asp:RequiredFieldValidator></small>
                          </td>
                        </tr>
                        <tr id="country_row">
                            <td>
                                <asp:Label AssociatedControlID="country_ddl" ID="country_lbl" runat="server" CssClass="required">Country:</asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="country_ddl" runat="server" OnChange="countrySelectionChanged();" OnSelectedIndexChanged="country_ddl_SelectedIndexChanged" AutoPostBack="true">
                                    <asp:ListItem Value="Empty" Text="Please Select"></asp:ListItem>
                                    <asp:ListItem Value="US" Text="United States"></asp:ListItem>
                                    <asp:ListItem Value="CA" Text="Canada"></asp:ListItem>
                                    <asp:ListItem Value="OtherInternational" Text="International except Canada"></asp:ListItem>
                                </asp:DropDownList>
                                <small>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" InitialValue="Empty" ControlToValidate="country_ddl" Display="Dynamic" ErrorMessage="Required" CssClass="error"></asp:RequiredFieldValidator></small>
                            </td>
                        </tr>
                        <tr id="state_row">
                            <td>
                                <asp:Label AssociatedControlID="state_ddl" ID="state_lbl" runat="server" CssClass="required" Style="display: none;">State:</asp:Label>

                                <asp:Label AssociatedControlID="otherInternational_txt" ID="otherInternational_lbl" runat="server" Style="display: none;" CssClass="required">Other Country:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="otherInternational_txt" runat="server" Style="display: none;"></asp:TextBox>
                                <small>
                                    <asp:RequiredFieldValidator ID="OtherInternationalValidator" runat="server" ControlToValidate="otherInternational_txt" Display="Dynamic" Enabled="false" ErrorMessage="Required" CssClass="error"></asp:RequiredFieldValidator></small>

                                <asp:DropDownList ID="state_ddl" runat="server" CssClass="required" Style="display: none;">
                                    <asp:ListItem Value="Empty">Select State</asp:ListItem>
                                    <asp:ListItem Value="AL">Alabama</asp:ListItem>
                                    <asp:ListItem Value="AK">Alaska</asp:ListItem>
                                    <asp:ListItem Value="AS">American Samoa</asp:ListItem>
                                    <asp:ListItem Value="AZ">Arizona</asp:ListItem>
                                    <asp:ListItem Value="AR">Arkansas</asp:ListItem>
                                    <asp:ListItem Value="CA">California</asp:ListItem>
                                    <asp:ListItem Value="CO">Colorado</asp:ListItem>
                                    <asp:ListItem Value="CT">Connecticut</asp:ListItem>
                                    <asp:ListItem Value="DE">Delaware</asp:ListItem>
                                    <asp:ListItem Value="DC">District of Columbia</asp:ListItem>
                                    <asp:ListItem Value="FL">Florida</asp:ListItem>
                                    <asp:ListItem Value="GA">Georgia</asp:ListItem>
                                    <asp:ListItem Value="GU">Guam</asp:ListItem>
                                    <asp:ListItem Value="HI">Hawaii</asp:ListItem>
                                    <asp:ListItem Value="ID">Idaho</asp:ListItem>
                                    <asp:ListItem Value="IL">Illinois</asp:ListItem>
                                    <asp:ListItem Value="IN">Indiana</asp:ListItem>
                                    <asp:ListItem Value="IA">Iowa</asp:ListItem>
                                    <asp:ListItem Value="KS">Kansas</asp:ListItem>
                                    <asp:ListItem Value="KY">Kentucky</asp:ListItem>
                                    <asp:ListItem Value="LA">Louisiana</asp:ListItem>
                                    <asp:ListItem Value="ME">Maine</asp:ListItem>
                                    <asp:ListItem Value="MD">Maryland</asp:ListItem>
                                    <asp:ListItem Value="MA">Massachusetts</asp:ListItem>
                                    <asp:ListItem Value="MI">Michigan</asp:ListItem>
                                    <asp:ListItem Value="MN">Minnesota</asp:ListItem>
                                    <asp:ListItem Value="MS">Mississippi</asp:ListItem>
                                    <asp:ListItem Value="MO">Missouri</asp:ListItem>
                                    <asp:ListItem Value="MT">Montana</asp:ListItem>
                                    <asp:ListItem Value="NE">Nebraska</asp:ListItem>
                                    <asp:ListItem Value="NV">Nevada</asp:ListItem>
                                    <asp:ListItem Value="NH">New Hampshire</asp:ListItem>
                                    <asp:ListItem Value="NJ">New Jersey</asp:ListItem>
                                    <asp:ListItem Value="NM">New Mexico</asp:ListItem>
                                    <asp:ListItem Value="NY">New York</asp:ListItem>
                                    <asp:ListItem Value="NC">North Carolina</asp:ListItem>
                                    <asp:ListItem Value="ND">North Dakota</asp:ListItem>
                                    <asp:ListItem Value="OH">Ohio</asp:ListItem>
                                    <asp:ListItem Value="OK">Oklahoma</asp:ListItem>
                                    <asp:ListItem Value="OR">Oregon</asp:ListItem>
                                    <asp:ListItem Value="PI">Pacific Islands</asp:ListItem>
                                    <asp:ListItem Value="PA">Pennsylvania</asp:ListItem>
                                    <asp:ListItem Value="PR">Puerto Rico</asp:ListItem>
                                    <asp:ListItem Value="RI">Rhode Island</asp:ListItem>
                                    <asp:ListItem Value="SC">South Carolina</asp:ListItem>
                                    <asp:ListItem Value="SD">South Dakota</asp:ListItem>
                                    <asp:ListItem Value="TN">Tennessee</asp:ListItem>
                                    <asp:ListItem Value="TX">Texas</asp:ListItem>
                                    <asp:ListItem Value="VI">US Virgin Islands</asp:ListItem>
                                    <asp:ListItem Value="UT">Utah</asp:ListItem>
                                    <asp:ListItem Value="VT">Vermont</asp:ListItem>
                                    <asp:ListItem Value="VA">Virginia</asp:ListItem>
                                    <asp:ListItem Value="WA">Washington</asp:ListItem>
                                    <asp:ListItem Value="WV">West Virginia</asp:ListItem>
                                    <asp:ListItem Value="WI">Wisconsin</asp:ListItem>
                                    <asp:ListItem Value="WY">Wyoming</asp:ListItem>
                                </asp:DropDownList>
                                <small>
                                    <asp:RequiredFieldValidator ID="StateRequiredValidator" runat="server" InitialValue="Empty" ControlToValidate="state_ddl" Display="Dynamic" Enabled="false" ErrorMessage="Required" CssClass="error"></asp:RequiredFieldValidator></small>

                            </td>
                        </tr>
                        <tr id="province_row">
                            <td>
                                <asp:Label AssociatedControlID="province_ddl" ID="province_lbl" runat="server" Style="display: none;" CssClass="required">Province:</asp:Label></td>
                            <td>
                                <asp:DropDownList ID="province_ddl" runat="server" CssClass="required" Style="display: none;">
                                    <asp:ListItem Value="Empty">Select Province</asp:ListItem>
                                    <asp:ListItem Value="AB">Alberta</asp:ListItem>
                                    <asp:ListItem Value="BC">British Columbia</asp:ListItem>
                                    <asp:ListItem Value="MB">Manitoba</asp:ListItem>
                                    <asp:ListItem Value="NB">New Brunswick</asp:ListItem>
                                    <asp:ListItem Value="NL">Newfoundland/Labrador</asp:ListItem>
                                    <asp:ListItem Value="NT">Northwest Territories</asp:ListItem>
                                    <asp:ListItem Value="NU">Nunavut</asp:ListItem>
                                    <asp:ListItem Value="ON">Ontario</asp:ListItem>
                                    <asp:ListItem Value="PE">Prince Edward Island</asp:ListItem>
                                    <asp:ListItem Value="QC">Quebec</asp:ListItem>
                                    <asp:ListItem Value="SK">Saskatchewan</asp:ListItem>
                                    <asp:ListItem Value="YT">Yukon</asp:ListItem>
                                </asp:DropDownList>
                                <small>
                                    <asp:RequiredFieldValidator ID="ProvinceRequiredValidator" runat="server" InitialValue="Empty" ControlToValidate="province_ddl" Enabled="false" Display="Dynamic" ErrorMessage="Required" CssClass="error"></asp:RequiredFieldValidator></small></td>
                        </tr>
                        <tr id="city_row">
                          <td>
                            <asp:Label AssociatedControlID="city_txt" ID="Label1" CssClass="required" runat="server">City:</asp:Label>
                          </td>
                          <td>
                            <asp:TextBox ID="city_txt" CssClass="required" runat="server"></asp:TextBox>
                            <small><asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="city_txt" Display="Dynamic" ErrorMessage="Required" CssClass="error"></asp:RequiredFieldValidator></small>
                          </td>
                        </tr>
                        <tr id="postalCode_row">
                          <td>
                            <asp:Label AssociatedControlID="postalCode_txt" ID="Label2" runat="server">Postal Code:</asp:Label>
                          </td>
                          <td>
                            <asp:TextBox ID="postalCode_txt" CssClass="required" runat="server"></asp:TextBox>
                          </td>
                        </tr>
                        <tr id="newwayInterest_row">
                          <td>
                            <asp:Label AssociatedControlID="newwayInterest_ddl" ID="newwayInterest_lbl" runat="server">New Way<sup>&reg;</sup> Truck Interest:</asp:Label>
                          </td>
                          <td>
                            <asp:DropDownList ID="newwayInterest_ddl" CssClass="required" runat="server">
                              <asp:ListItem Value="Empty">Please Select</asp:ListItem>
                              <asp:ListItem Value="Rear Loader">Rear Loader</asp:ListItem>
                              <asp:ListItem Value="Front Loader">Front Loader</asp:ListItem>
                              <asp:ListItem Value="Automated Side Loaders">Automated Side Loaders</asp:ListItem>
                              <asp:ListItem Value="Satellites">Satellites</asp:ListItem>
                            </asp:DropDownList>
                          </td>
                        </tr>
                        <tr id="kpacInterest_row">
                          <td>
                            <asp:Label AssociatedControlID="kpacInterest_ddl" ID="kpacInterest_lbl" runat="server">K-PAC Interest:</asp:Label>
                          </td>
                          <td>
                            <asp:DropDownList ID="kpacInterest_ddl" CssClass="required" runat="server">
                              <asp:ListItem Value="Empty">Please Select</asp:ListItem>
                              <asp:ListItem Value="Self Contained Waste Compactors">Self Contained Waste Compactors</asp:ListItem>
                              <asp:ListItem Value="Stationary Waste Compactors">Stationary Waste Compactors</asp:ListItem>
                              <asp:ListItem Value="All Compaction Products">All Compaction Products</asp:ListItem>
                            </asp:DropDownList>
                          </td>
                        </tr>
                        <tr id="departmentt_row">
                          <td>
                            <asp:Label AssociatedControlID="departmentt_ddl" ID="Label3" CssClass="required" runat="server">Choose Department for your Inquiry:</asp:Label>
                          </td>
                          <td>
                              <asp:DropDownList ID="departmentt_ddl" CssClass="required" runat="server">
                                  <asp:ListItem Value="Empty">Please Select</asp:ListItem>
                                  <asp:ListItem Value="Advertising/Sponsorship Requests">Advertising/Sponsorship Requests</asp:ListItem>
                                  
                                  <asp:ListItem Value="FleetForce/Rentals">FleetForce/Rentals</asp:ListItem>
                                  <asp:ListItem Value="HR/Personnel">HR/Personnel</asp:ListItem>
                                  <asp:ListItem Value="K-Pac">K-Pac</asp:ListItem>
                                  <asp:ListItem Value="New Way Truck Domestic (incl Canada) Sales">New Way Truck Domestic (incl Canada) Sales</asp:ListItem>
                                  <asp:ListItem Value="New Way Truck International Sales">New Way Truck International Sales</asp:ListItem>
                                  <asp:ListItem Value="Parts">Parts</asp:ListItem>
                                  <asp:ListItem Value="Service">Service</asp:ListItem>
                                  <asp:ListItem Value="Vendor/Purchasing Requests">Vendor/Purchasing Requests</asp:ListItem>
                              </asp:DropDownList>
                            <small><asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" InitialValue="Empty" ControlToValidate="departmentt_ddl" Display="Dynamic" ErrorMessage="Required" CssClass="error"></asp:RequiredFieldValidator></small>
                          </td>
                        </tr>
                        <tr id="comments_row">
                          <td>
                            <asp:Label AssociatedControlID="comments_txt" ID="comments_lbl" runat="server">Comments/Questions:</asp:Label>
                          </td>
                          <td>
                            <asp:TextBox ID="comments_txt" Rows="5" TextMode="MultiLine" runat="server"></asp:TextBox>
                          </td>
                        </tr>
	                      <tr id="notes_row">
		                      <td>
							  	<asp:Label AssociatedControlID="notes_txt" ID="notes_lbl" runat="server">Notes:</asp:Label></td>
		                      <td>
							  	<asp:TextBox ID="notes_txt" Rows="5" TextMode="MultiLine" runat="server"></asp:TextBox>
		                      </td>
	                      </tr>
	                      <tr id="feedback_row">
		                      <td>
							  	<asp:Label AssociatedControlID="feedback_txt" ID="feedback_lbl" runat="server">Notes:</asp:Label></td>
		                      <td>
							  	<asp:TextBox ID="feedback_txt" Rows="5" TextMode="MultiLine" runat="server"></asp:TextBox>
		                      </td>
	                      </tr>
                        <tr>
                          <td><strong>
                            <asp:Label ID="lblForMessage"  runat="server" />
                          </strong></td>
                        </tr>
                        <tr>
                          <td>&nbsp;</td>
                          <td>
                            <div class="g-recaptcha" data-sitekey="6Lfjb-0SAAAAAKIgaAvGrPwF9Rg67OEExG1vaSv5"></div>
                          </td>
                        </tr>
                        <tr>
                          <td>&nbsp;</td>
                          <td>
                            <asp:Button CssClass="button small submit" CausesValidation="true" OnClick="btnValidateReCaptcha_Click" Text="Submit Information" ID="btnValidateRecaptcha" runat="server" />
                          </td>
                        </tr>
                      </table>
                      </asp:Panel>
                    </div>
                  </section>
                </div>
                <div class="large-4 medium-4 hide-for-small columns right-col" >
                  <!--#include file="../includes/sn-contact-us.html" -->
                  <!--#include file="../includes/sn-callouts.html" -->
                </div>
              </div>

              <!--#include file="../includes/bottom-callouts.html" -->
            </div>
          </div>
        </div>
      </div>
    </div>
  </form>
  <!-------------'<asp:ListItem Value="Customer Service">Customer Service</asp:ListItem>------------>
  
  <!--#include file="../includes/footer.html" -->

  <script src="../js/vendor/jquery.js"></script>
  <script src="../js/foundation.min.js"></script>
  <script>
    function countrySelectionChanged() {
      $country = $("#" + '<%= country_ddl.ClientID %>');
      $state_lbl = $("#" + '<%= state_lbl.ClientID %>');
      $state_ddl = $("#" + '<%= state_ddl.ClientID %>');
      $province_lbl = $("#" + '<%= province_lbl.ClientID %>');
      $province_ddl = $("#" + '<%= province_ddl.ClientID %>');
      $otherInternational_lbl = $("#" + '<%= otherInternational_lbl.ClientID %>');
      $otherInternational_txt = $("#" + '<%= otherInternational_txt.ClientID %>');

      if ($country.val() === "US") {
        $state_ddl.show();
        $state_lbl.show();
        $province_ddl.hide();
        $province_lbl.hide();
        $otherInternational_lbl.hide();
        $otherInternational_txt.hide();

      }
      else if ($country.val() === "CA") {
        $state_ddl.hide();
        $state_lbl.hide();
        $province_ddl.show();
        $province_lbl.show();
        $otherInternational_lbl.hide();
        $otherInternational_txt.hide();

      } else if ($country.val() === "OtherInternational") {
        $state_ddl.hide();
        $state_lbl.hide();
        $province_ddl.hide();
        $province_lbl.hide();
        $otherInternational_lbl.show();
        $otherInternational_txt.show();
      }
      else {
        $state_ddl.hide();
        $state_lbl.hide();
        $province_ddl.hide();
        $province_lbl.hide();
        $otherInternational_lbl.hide();
        $otherInternational_txt.hide();
      }
    }
    $(document).foundation();

    $('form')
.on('invalid.fndtn.abide', function () {
  var invalid_fields = $(this).find('[data-invalid]');
  console.log(invalid_fields);
})
.on('valid.fndtn.abide', function () {
  console.log('valid!');
});
  </script>
  <script src="//cdn.jsdelivr.net/headroomjs/0.5.0/headroom.min.js"></script>
  <script src="//cdn.jsdelivr.net/headroomjs/0.5.0/jQuery.headroom.min.js"></script>
  <script>
    // simple as this!
    // NOTE: init() is implicitly called with the plugin
    $(".header-wrapper").headroom();
  </script>
  <!--#include file="../includes/google-analytics.html" -->
</body>
</html>
