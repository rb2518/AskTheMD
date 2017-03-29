using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class inbox : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(Session["login"]==null||(!(Boolean)Session["login"]))
        {
            Response.Redirect("~/login.aspx");
        }
        if (!IsPostBack)
        {
            string CS = ConfigurationManager.ConnectionStrings["DBMI"].ConnectionString;
            SqlConnection con = new SqlConnection(CS);
            SqlCommand cmd = new SqlCommand("spGetSubject", con);
            con.Open();
            GridView1.DataSource = cmd.ExecuteReader();
            GridView1.DataBind();
            con.Close();
        }
    }

    protected void LinkButton1_Click(Object sender, EventArgs e)
    {
        LinkButton id = ((LinkButton)sender);
        string ids = id.Attributes["data_id"];
        Response.Redirect("~/reply.aspx?Id=" + ids);
    }

}