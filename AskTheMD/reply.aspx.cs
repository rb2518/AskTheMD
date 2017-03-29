using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Collections;

public partial class _Default : System.Web.UI.Page
{

    string SubId = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        Response.BufferOutput = true;
        if (Session["login"] == null)
        {
            Response.Redirect("~/login.aspx");
        }
        SubId = Request.QueryString["Id"];

        if (!IsPostBack)
        {
            fillData();
        }

    }
    //FillData method for filling Repeater Control with Data
    private void fillData()
    {
        SubId = Request.QueryString["Id"];
        string cs = ConfigurationManager.ConnectionStrings["DBMI"].ConnectionString;
        SqlConnection con = new SqlConnection(cs);
        con.Open();
        DataTable dt = new DataTable();
        SqlDataAdapter adapt = new SqlDataAdapter("Select * from tblComments WHERE Sid='" + SubId + "' order by Date desc", con);
        adapt.Fill(dt);
        con.Close();
        PagedDataSource pds = new PagedDataSource();
        DataView dv = new DataView(dt);
        pds.DataSource = dv;
        pds.AllowPaging = true;
        pds.PageSize = 10000;
       pds.CurrentPageIndex = PageNumber;
        if (pds.PageCount > 1)
        {
            rptPaging.Visible = true;
            ArrayList arraylist = new ArrayList();
            for (int i = 0; i < pds.PageCount; i++)
                arraylist.Add((i + 1).ToString());
            rptPaging.DataSource = arraylist;
            rptPaging.DataBind();
        }
        else
        {
            rptPaging.Visible = false;
        }
        Repeater1.DataSource = pds;
        Repeater1.DataBind();
        cs = ConfigurationManager.ConnectionStrings["DBMI"].ConnectionString;
        con = new SqlConnection(cs);
        con.Open();
        DataTable dt1 = new DataTable();
        SqlDataAdapter adapt1 = new SqlDataAdapter("Select Date,Subject,Message from tblMessage Where Id = '" + SubId + "'", con);
        adapt1.Fill(dt1);
        con.Close();
        PagedDataSource pds1 = new PagedDataSource();
        DataView dv1 = new DataView(dt1);
        pds1.DataSource = dv1;
        pds1.AllowPaging = false;
        Repeater3.DataSource = pds1;
        Repeater3.DataBind();
        
    }

    protected void btn_Submit_Click(object sender, EventArgs e)
    {
        SubId = Request.QueryString["Id"];
        string cs = ConfigurationManager.ConnectionStrings["DBMI"].ConnectionString;
        SqlConnection con = new SqlConnection(cs);
        con.Open();
        SqlCommand cmd = new SqlCommand("spCommentInsert1", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@CommentMessage", txtComment.Text);
        cmd.Parameters.AddWithValue("@Id", SubId);
        cmd.ExecuteNonQuery();
        con.Close();
        Response.Redirect("~/inbox.aspx?");
      //  Response.Redirect("~/reply.aspx?Id=" + SubId);
        //ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "alert('Comment Posted Successfully.');window.location='reply.aspx?Id="+SubId+"&PostBack=1');", true);
        fillData();
        txtComment.Text = "";

      
    }
    public int PageNumber
    {
        get
        {
            if (ViewState["PageNumber"] != null)
                return Convert.ToInt32(ViewState["PageNumber"]);
            else
                return 0;
        }
        set
        {
            ViewState["PageNumber"] = value;
        }
    }
   protected void rptPaging_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        PageNumber = Convert.ToInt32(e.CommandArgument) - 1;
        fillData();
    }
}