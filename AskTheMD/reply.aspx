<%@ Page Title="" Language="C#" MasterPageFile="~/Layout1.master" AutoEventWireup="true" CodeFile="reply.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
     <link href="css/bootstrap.min.css" rel="stylesheet"/>
     <link href="css/main1.css" rel="stylesheet" />
     <style type="text/css">
        .auto-style1 {
            width: 86px;
            font-size:20px;
        }

        .auto-style2 {
            width: 201px;
        }
        .design{
            margin-left:30px;
            padding-top:20px;
        }
        #subjectBox{
               margin-left: 600px;
               margin-top: -535px;
        }
       
    </style>
    <link href="StyleSheet.css" rel="stylesheet" />
      <div class="design">
    <form id="form1" runat="server" >
        <div>
            <div class="formDesign">
                <div class="design1">
                <table style="width: 90%; height: 275px;">                       
                      <div class="form-group">
                          <asp:TextBox ID="txtComment" class="form-control" runat="server" Height="212px" TextMode="MultiLine" Width="408px" style="margin-bottom: 1px"></asp:TextBox>
                               </div>
                       <tr>    
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtComment" ErrorMessage="Please Provide Comment" ForeColor="#CC0000">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>          
                       <asp:Button ID="btn_Submit" runat="server" class="btn btn-primary btn-md" Text="Post Comment" OnClick="btn_Submit_Click" Width="183px" />
                </table>
                    </div>
            </div><br />
             <asp:Repeater ID="Repeater3" runat="server">
                <ItemTemplate>
                    <div id="subjectBox">  
                         <div class="well well-sm" style="width:90%" >
                         <label class="control-label col-lg" for="date">Creation Date:</label>
                        <asp:Label  class="form-control-static" runat="server" Text='<%#Eval("Date") %>'></asp:Label>
                             </div>
                         <div class="well well-sm" style="width:90%" >
                         <label class="control-label col-sm-2" for="email">Subject:</label>
                        <asp:Label  class="form-control-static" runat="server" Text='<%#Eval("Subject") %>'></asp:Label>
                             </div>
                         <div class="well well-sm" style="width:90%">
                         <label class="control-label col-sm-2" for="message">Message:</label>
                        <asp:Label class="form-control-static" runat="server" Text='<%#Eval("Message") %>'></asp:Label><br />
                             </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
            <asp:Repeater ID="Repeater1" runat="server">
                <ItemTemplate>
                    <div class="commentbox">
                          <div class="container">
    <div class="row" style="margin-top:80px">
        <div class="col-sm-8">
            <div class="panel panel-white post panel-shadow">
                <div class="post-heading">
                    <div class="pull-left image">
                        <img src="image/user.jpg" class="img-circle avatar" alt="user profile image">
                    </div>
                    <div class="pull-left meta">
                        <div class="title h5">
                              <a href="#"><b>Anonymous</b></a>
                            <a href="#"><b></b></a>
                            made a post.
                        </div>
                        <h6 class="text-muted time">
                            <asp:Label runat="server" Text='<%#Eval("Date") %>'></asp:Label>
                        </h6>
                    </div>
                </div> 
                <div class="post-description"> 
                     <asp:Label ID="Label3" runat="server" Text='<%#Eval("Comment") %>'></asp:Label><br />
                             </div>
                          </div>
                       </div>
                      </div>
                    </div>
                       
                    </div>
                </ItemTemplate>
            </asp:Repeater>
            <div style="overflow: hidden;">
                <asp:Repeater ID="rptPaging" runat="server" OnItemCommand="rptPaging_ItemCommand">
                    <ItemTemplate>
                        <asp:LinkButton ID="btnPage"
                            Style="padding: 8px; margin: 2px; background: #007acc; border: solid 1px blue; font: 8px;"
                            CommandName="Page" CommandArgument="<%# Container.DataItem %>"
                            runat="server" ForeColor="White" Font-Bold="True" CausesValidation="false"><%# Container.DataItem %>
                        </asp:LinkButton>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
    </form>
          </div>
    <script src="js/bootstrap.min.js"></script>
</asp:Content>

