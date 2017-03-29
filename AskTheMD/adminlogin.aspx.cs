using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Drawing;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.BufferOutput = true;
        Boolean alogin = true;
        if (Session["alogin"] == null)
            alogin = false;
        if (alogin)
        {
            Response.Redirect("~/adminregistration.aspx");
        }

    /*   Response.BufferOutput = true;
        Boolean adminlogin = true;
        if (Session["adminlogin"] == null)
           adminlogin = false;
        if (adminlogin)
        {
            Response.Redirect("~/signup.aspx");
        }*/

    }
    protected void Button1_Click1(object sender, EventArgs e)
    {
        string CS = ConfigurationManager.ConnectionStrings["DBMI"].ConnectionString;

        SqlConnection con = new SqlConnection(CS);
        con.Open();
        SqlCommand cmd = new SqlCommand("select COUNT(*)FROM tblAdminRegistration WHERE username='" + username.Text + "' and passoword='" + password.Text + "'");
        cmd.Connection = con;
        int OBJ = Convert.ToInt32(cmd.ExecuteScalar());
        if (OBJ > 0)
        {
            Session["name"] = username.Text;
            Session["alogin"] = true;
            Response.Redirect("~/userregistration.aspx");
         
        }
        else
        {
             // Session["adminlogin"] = false;
              Label1.Text = "Invalid username or password";
              this.Label1.ForeColor = Color.Red;
        }
       
    }
   
}