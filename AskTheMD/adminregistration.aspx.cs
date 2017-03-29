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
       /*  Response.BufferOutput = true;
          if (Session["adminlogin"] != null)
          {
              Response.Redirect("~/adminlogin.aspx");
          }*/
        Response.BufferOutput = true;
        Boolean alogin = true;
        if (Session["alogin"] == null)
            alogin = false;
        if (!alogin)
        {
            Response.Redirect("~/adminlogin.aspx");
        }
    }
    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {
        string CS = ConfigurationManager.ConnectionStrings["DBMI"].ConnectionString;

        SqlConnection con = new SqlConnection(CS);
        con.Open();
        SqlCommand cmd = new SqlCommand("Select *from tblAdminRegistration where username='" + TextBox1.Text + "'", con);
        SqlDataReader dr = cmd.ExecuteReader();

        if (dr.Read())
        {
              Label1.Text = "Admin Name is Already Exist";
            this.Label1.ForeColor = Color.Red;
        }
        else
        {
            Label1.Text = "AdminName is Available";
            this.Label1.ForeColor = Color.Red;
        }
        con.Close();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        // captcha1.ValidateRecaptcha(TextBox6.Text.Trim());
        if (IsPostBack)
        {
            //future work disconnected mode

            string CS = ConfigurationManager.ConnectionStrings["DBMI"].ConnectionString;

            SqlConnection con = new SqlConnection(CS);
            con.Open();
            String str = "insert into tblAdminRegistration values('" + firstname.Text + "','" + lastname.Text + "','" + TextBox1.Text + "','" + password.Text + "','" + email.Text + "')";
            SqlCommand cmd = new SqlCommand(str, con);
            cmd.ExecuteNonQuery();

            Session["name"] = TextBox1.Text;
            Response.Redirect("~/adminlogin.aspx");
            con.Close();
            firstname.Text = "";
            lastname.Text = "";
            TextBox1.Text = "";
            password.Text = "";
            email.Text = "";
        }
        else
        {
            //Response.Redirect("Registration.aspx");
            //  Label2.ForeColor = System.Drawing.Color.Red;
            // Label2.Text = "You have Entered InValid Captcha Characters please Enter again";
        }
    }
}