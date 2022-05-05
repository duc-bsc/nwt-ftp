using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using TuesPechkin;

/// <summary>
/// Summary description for HtmlToPdfConverter
/// </summary>
public static class HtmlToPdfConverter
{
    private static string staticDeploymentPath = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "wkhtmltopdf");

    public static void CreateWkhtmltopdfPath()
    {
        if (Directory.Exists(staticDeploymentPath) == false)
        {
            Directory.CreateDirectory(staticDeploymentPath);
        }
    }


    private static readonly IConverter _pdfConverter = 
    new ThreadSafeConverter(
	    new RemotingToolset<PdfToolset>(
		    new Win32EmbeddedDeployment(
			    new StaticDeployment(staticDeploymentPath)
                )));
    public static IConverter Converter
    {
        get { return _pdfConverter; }
    }
}