using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class adminlogout : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.BufferOutput = true;

        Session["alogin"] =null;
         
        Response.Redirect("~/adminlogin.aspx");
        
       /* Response.BufferOutput = true;
        Session["adminlogin"] = null;
        Response.Redirect("~/adminlogin.aspx");*/
    }
}