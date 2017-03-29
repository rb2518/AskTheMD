using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Drawing;

public partial class login1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

      Response.BufferOutput = true;
        Boolean login = true;
        if (Session["login"] == null)
            login = false;
        if (login)
        {
            Response.Redirect("~/inbox.aspx");
        }

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string CS = ConfigurationManager.ConnectionStrings["DBMI"].ConnectionString;

        SqlConnection con = new SqlConnection(CS);
        con.Open();
        SqlCommand cmd = new SqlCommand("select COUNT(*)FROM tblRegistration WHERE username='" + username.Text + "' and password='" + password.Text + "'");
        cmd.Connection = con;
        int OBJ = Convert.ToInt32(cmd.ExecuteScalar());
        if (OBJ > 0)
        {
            Session["name"] = username.Text;
            Session["login"] = true;
            Response.Redirect("~/inbox.aspx");
        }
        else
        {
            Session["login"] = false;
           Label1.Text = "Invalid username or password";
           this.Label1.ForeColor = Color.Red;
        }
    }
/*   protected void Button2_Click(Object sender, EventArgs e)
    {
        Response.Redirect("~/adminlogin.aspx");
    } */
    
}