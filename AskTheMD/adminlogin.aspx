<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.master" AutoEventWireup="true" CodeFile="adminlogin.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <style>
        #Button1{
            padding-left:50px;
            padding-right:50px;
        }
        .change{
            margin-left:auto;
            margin-right:auto;
            padding-top:10px;
            margin-bottom:auto;
        }
        #form1{
            margin-top:80px;
        }
        #change1{
            left:10px;
        }
        
    </style>
    <link href="css/bootstrap.min.css" rel="stylesheet"/>
     <form id="form1" runat="server">
       <img src="image/logo.png" style="margin-left:475px" />
  <div class="input-group change" style="width:30%">
    <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
    <asp:TextBox id="username" runat="server" type="text" class="form-control" name="email" placeholder="Email"></asp:TextBox>
  </div>
  <div class="input-group change" style="width:30%">
    <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
    <asp:TextBox id="password" runat="server" type="password" class="form-control" name="password" placeholder="Password"></asp:TextBox>
  </div>
     <div class="input-group change" id="change1">
      <asp:Button ID="Button1" runat="server" Text="Login" class="btn btn-primary btn-lg" Width="213px" OnClick="Button1_Click1"/>      
     </div>
          <asp:Label ID="Label1" runat="server" style="color: #FF0000 ; padding-left:550px" Text="*"></asp:Label>
                
</form>

    <script src="js/bootstrap.min.js"></script>
</asp:Content>

