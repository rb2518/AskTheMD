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
        if (Session["login"] == null || (!(Boolean)Session["login"]))
        {
            Response.Redirect("~/login.aspx");
        }
        if (IsPostBack)
        {
            
        }
    }
     protected void TextBox1_TextChanged(object sender, EventArgs e)
      {
          string CS = ConfigurationManager.ConnectionStrings["DBMI"].ConnectionString;

          SqlConnection con = new SqlConnection(CS);
          con.Open();
          SqlCommand cmd = new SqlCommand("Select *from tblMessage where Subject='" + TextBox1.Text + "'", con);
          SqlDataReader dr = cmd.ExecuteReader();

          if (dr.Read())
          {
              Label1.Text = "Suject is Already Exist";
              this.Label1.ForeColor = Color.Red;
          }
          con.Close();
      }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
        string CS = ConfigurationManager.ConnectionStrings["DBMI"].ConnectionString;
        SqlConnection con = new SqlConnection(CS);

        SqlCommand cmd = new SqlCommand("spMessageInsert", con);
        cmd.CommandType = System.Data.CommandType.StoredProcedure;
        // cmd.Parameters.AddWithValue("@Username", Request.QueryString["Username"].ToString());
        cmd.Parameters.AddWithValue("@Subject", TextBox1.Text);
        cmd.Parameters.AddWithValue("@CommentMessage", txtComment.Text);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
        TextBox1.Text = "";
        txtComment.Text = "";
        //call CommentsBind Method
        // CommentsBind();
        Response.Redirect("~/inbox.aspx");
        }
    }

}