<%@ Page Title="" Language="C#" MasterPageFile="~/Layout1.master" AutoEventWireup="true" CodeFile="message.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
     <link href="css/bootstrap.min.css" rel="stylesheet"/>
    <style type="text/css">
        .design{
            margin-left:150px;
            padding-top:30px;
        }
        #TextArea1 {
            height: 299px;
            width: 651px;
        }
        .msgdesign{
            font-size:20px;
        }
       
    </style>
       <div class="design">
     <form id="form1" runat="server">
    <div>
                 <asp:ScriptManager ID="ScriptManager1" runat="server">
                    </asp:ScriptManager>
  
                               <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <div class="form-group">
							<div class="cols-lg-10">
								<div class="input-group">
                                    <div class="form-group">								
                                    <asp:TextBox ID="TextBox1" runat="server" style="width: 720px" class="form-control" AutoPostBack="True" 
                                    ondatabinding="TextBox1_TextChanged" ontextchanged="TextBox1_TextChanged" placeholder="Subject"></asp:TextBox>
								</div>
                                <asp:Label ID="Label1" runat="server" Text="."></asp:Label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                    ControlToValidate="TextBox1" ErrorMessage="Subject can not be Blank" 
                                    Font-Bold="True" ForeColor="Red">*</asp:RequiredFieldValidator>
							</div>
						</div>
                                 <div class="form-group">
                              <label for="comment">Message:</label>
                            <asp:TextBox ID="txtComment" class="form-control" runat="server" Height="261px" TextMode="MultiLine" Width="715px" placehoolder="Message"></asp:TextBox>
                               </div>
           
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtComment" ErrorMessage="Please Provide Comment" ForeColor="#CC0000">*</asp:RequiredFieldValidator>
                                <br />
                                <br />
        <asp:Button ID="Button1" runat="server" class="btn btn-primary btn-md" style="margin-left: 518px; margin-top:-20px; font-size:20px;" Text="Submit" Width="203px" OnClick="Button1_Click"/>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                 
                          
            
          <div class="form-group">
                    <asp:ValidationSummary ID="ValidationSummary1" HeaderText="Validation_Error" ForeColor="Red" runat="server" DisplayMode="SingleParagraph" />
              </div>
    </div>
    </form>
           </div>
    <script src="js/bootstrap.min.js"></script>
</asp:Content>

