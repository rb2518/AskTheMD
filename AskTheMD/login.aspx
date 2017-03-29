<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login1" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>Login</title>
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
         #Label1{
             padding-left:550px;
         }
    
    </style>

    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet"/>

  </head>
  <body>
   <form id="form1" runat="server">
       <img src="image/logo.png" style="margin-left:475px" />
  <div class="input-group change" style="width:30%">
    <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
    <asp:TextBox id="username" runat="server" type="text" class="form-control" name="email" placeholder="Username"></asp:TextBox>
  </div>
  <div class="input-group change" style="width:30%">
    <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
    <asp:TextBox id="password" runat="server" type="password" class="form-control" name="password" placeholder="Password"></asp:TextBox>
  </div>
     <div class="input-group change" id="change1">
      <asp:Button ID="Button1" runat="server" Text="Login" class="btn btn-primary btn-lg" OnClick="Button1_Click"/>      
     </div>
       <asp:Label ID="Label1" runat="server" style="color: #FF0000" Text="*"></asp:Label>
</form>

    <script src="js/bootstrap.min.js"></script>
  </body>
</html>

