<%@ Page Title="" Language="C#" MasterPageFile="~/Layout2.master" AutoEventWireup="true" CodeFile="adminregistration.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
		<link rel="stylesheet" type="text/css" href="css/bootstrap.css"/>

		<!-- Website CSS style -->
		<link rel="stylesheet" type="text/css" href="css/main.css"/>

		<!-- Website Font style -->
	    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css"/>
		
		<!-- Google Fonts -->
		<link href='https://fonts.googleapis.com/css?family=Passion+One' rel='stylesheet' type='text/css'/>
		<link href='https://fonts.googleapis.com/css?family=Oxygen' rel='stylesheet' type='text/css'/>
       <div class="container">
			<div class="row main">
				<div class="panel-heading">
	               <div class="panel-title text-center">
	               		<h1 class="title" style="margin-top:-100px;">Admin Signup</h1>
	               		<hr />
	               	</div>
	            </div> 
                <div class="main-login main-center" style="margin-top:-20px;">
     <form id="form1" runat="server"  class="form-horizontal">            
                    <asp:ScriptManager ID="ScriptManager1" runat="server">
                    </asp:ScriptManager>
         <!--FirstName & LastName-->
         <div class="form-group">
							<div class="cols-lg-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
                                    <asp:TextBox ID="firstname" runat="server" class="form-control" placeholder="First Name" ></asp:TextBox>
                                    <asp:TextBox ID="lastname" runat="server" class="form-control" placeholder="Last Name"></asp:TextBox>
								</div>
							</div>
						</div>
              
                <!--username-->
                     <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <div class="form-group">
							<div class="cols-lg-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-users fa" aria-hidden="true"></i></span>
                                    <asp:TextBox ID="TextBox1" runat="server" class="form-control" AutoPostBack="True" 
                                    ondatabinding="TextBox1_TextChanged" ontextchanged="TextBox1_TextChanged" placeholder="Username"></asp:TextBox>
								</div>
                                <asp:Label ID="Label1" runat="server" Text="."></asp:Label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                    ControlToValidate="TextBox1" ErrorMessage="UserName can not be Blank" 
                                    Font-Bold="True" ForeColor="Red">*</asp:RequiredFieldValidator>
							</div>
						</div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                       <div class="form-group">
							<div class="cols-lg-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
                    <asp:TextBox ID="password" runat="server" class="form-control" TextMode="Password" placeholder="Password"></asp:TextBox>                               
								</div>
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="password" ErrorMessage="password should not be Blank" 
                        Font-Bold="True" Font-Size="Smaller" ForeColor="#FF3300">*</asp:RequiredFieldValidator> 
							</div>
						</div>

                       <!--Confirm Password-->
                      <div class="form-group">
							<div class="cols-lg-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
                                    <asp:TextBox ID="cmfpassword" runat="server" class="form-control" placeholder="RePassword"></asp:TextBox>                              
								</div>
                                <asp:CompareValidator ID="CompareValidator2" runat="server" 
                                     ControlToCompare="password" ControlToValidate="cmfpassword" 
                                      ErrorMessage="Enter correct password" Font-Bold="True" Font-Size="Smaller" 
                                         ForeColor="#FF3300">*</asp:CompareValidator>   
							</div>
						</div>
                  
          <!--Email Id-->
                   <div class="form-group">
							<div class="cols-lg-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-envelope fa" aria-hidden="true"></i></span>
								<asp:TextBox ID="email" runat="server" class="form-control" placeholder="Email"></asp:TextBox>
                                </div>
                                 <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                        ControlToValidate="email" ErrorMessage="Enter valid Email Id" 
                        Font-Bold="True" Font-Size="Smaller" ForeColor="Red" 
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic">*</asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                        ControlToValidate="email" ErrorMessage="Email Field can not be Blank" 
                        Font-Bold="True" Display="Dynamic">*</asp:RequiredFieldValidator>
							</div>
						</div>
             <div class="form-group ">
                 <asp:Button ID="Button1" runat="server" Text="Register" onclick="Button1_Click" class="btn btn-primary btn-lg btn-block login-button" />
			  </div>   
              <div class="form-group">
                    <asp:ValidationSummary ID="ValidationSummary1" HeaderText="Validation_Error" ForeColor="Red" runat="server" DisplayMode="SingleParagraph" />
              </div>
    </form>
                   </div>
                </div>
           </div>
</asp:Content>

