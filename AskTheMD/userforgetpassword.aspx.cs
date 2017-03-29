using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.BufferOutput = true;
        Boolean alogin = true;
        if (Session["alogin"] == null)
            alogin = false;
        if (!alogin)
        {
            Response.Redirect("~/adminlogin.aspx");
        }
       /* Response.BufferOutput = true;
        if (Session["adminlogin"] != null)
        {
            Response.Redirect("~/adminlogin.aspx");
        }*/
    }
}