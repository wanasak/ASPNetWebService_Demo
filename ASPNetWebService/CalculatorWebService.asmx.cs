using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace ASPNetWebService
{
    /// <summary>
    /// Summary description for CalculatorWebService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class CalculatorWebService : System.Web.Services.WebService
    {

        [WebMethod(EnableSession = true, Description = "Adds 2 numbers and return their sum", CacheDuration = 10)]
        public int Add(int firstNumber, int secondNumber)
        {
            List<string> calculations;

            if (Session["CALCULATIONS"] == null)
                calculations = new List<string>();
            else
                calculations = (List<String>)Session["CALCULATIONS"];

            string strTransaction = firstNumber.ToString() + " + " + secondNumber.ToString() + " = " + (firstNumber + secondNumber).ToString();
            calculations.Add(strTransaction);
            Session["CALCULATIONS"] = calculations;

            return firstNumber + secondNumber;
        }

        [WebMethod(EnableSession = true, Description = "Returns all the recent transactions", BufferResponse = true)]
        public List<string> GetCalculations()
        {
            if (Session["CALCULATIONS"] == null)
            {
                List<string> calculations = new List<string>();
                calculations.Add("You have not performed any calculations");
                return calculations;
            }
            return (List<string>)Session["CALCULATIONS"];
        }
    }
}
