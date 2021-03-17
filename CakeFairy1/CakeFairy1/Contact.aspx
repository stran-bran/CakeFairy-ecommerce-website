<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="CakeFairy1.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
  
   <%-- <h3>Your contact page.</h3>
    <address>
        One Microsoft Way<br />
        Redmond, WA 98052-6399<br />
        <abbr title="Phone">P:</abbr>
        425.555.0100
    </address>

    <address>
        <strong>Support:</strong>   <a href="mailto:Support@example.com">Support@example.com</a><br />
        <strong>Marketing:</strong> <a href="mailto:Marketing@example.com">Marketing@example.com</a>
    </address>--%>
     <div class="ContactDiv" >
                 
                     <div class="ContactForm"> <table>
                         <tr >
                             <td colspan ="3">
                                
                                  <h2 style="text-align: center; color: deeppink; font-family:'Cooper Black' ; font-size:40px; border-bottom:inset 3px pink">CONTACT US</h2>
                             </td>
                         </tr>
                    
                            <tr>
                                <td style="color:hotpink " class="contactRow"><b >Name: </b></td>
                                <td class="txtContact"><asp:TextBox class="txtContact" ID="txtName" width="500px" runat="server" Font-Size="20px"></asp:TextBox></td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Name is required" Text="*" ForeColor="Red" ControlToValidate="txtName"></asp:RequiredFieldValidator></td>
                            </tr>
                              <br />
                            <tr>
                                <td  style="color:hotpink "  class="contactRow"><b>Email: </b></td>
                                <td class="txtContact"><asp:TextBox class="txtContact"  ID="txtEmail" width="500px" runat="server" Font-Size="20px"></asp:TextBox></td>
                                <td><asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Email is required" Text="*"   Display="Dynamic" ForeColor="Red" ControlToValidate="txtEmail"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Please enter a valid email" ValidationExpression="^[a-zA-Z][\w\.-]*[a-zA-Z0-9]@[a-zA-Z0-9][\w\.-]*[a-zA-Z0-9]\.[a-zA-Z][a-zA-Z\.]*[a-zA-Z]$" Text="*" ForeColor="Red" ControlToValidate="txtEmail" Display="Dynamic" ></asp:RegularExpressionValidator>
                                   </td>
                            </tr>
                            <tr>
                                <td style="color:hotpink "  class="contactRow"><b>Subject: </b></td>
                                <td class="txtContact"><asp:TextBox  class="txtContact" ID="txtSubject" width="500px" runat="server" Font-Size="20px"></asp:TextBox></td>
                                <td ><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Subject is required" Text="*" ForeColor="Red" ControlToValidate="txtSubject"></asp:RequiredFieldValidator></td>
                            </tr>
                            <tr>
                                <td style="vertical-align: top; color:hotpink"  class="contactRow"><b>Messages: </b> </td>
                                <td style="vertical-align: top"  class="txtContact">
                                    <asp:TextBox ID="txtMessages" class="txtContact" runat="server" Columns="26" rows="5" TextMode="MultiLine" Font-Size="20px"></asp:TextBox> </td>
                                <td style="vertical-align: top"><asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Messages is required" Text="*" ForeColor="Red" ControlToValidate="txtMessages" ></asp:RequiredFieldValidator></td>
                            </tr>
                            <tr>
                                <td colspan ="3">
                                    <asp:ValidationSummary ID="ValidationSummary1" ForeColor="red" HeaderText="Please fix the following errors: " runat="server" DisplayMode="List" />
                                </td>
                                
                            </tr>
                            <tr>
                                <td colspan="3">
                                    <asp:Label ID="Label1" runat="server" Text="Label" Font-Bold="True" Visible="False"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3" style="text-align: center">
                                    <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click"  ForeColor="#FF0066" Width="100px" Height="40px"  Font-Bold="True" Font-Size="20px" />
                                </td>
                            </tr>
                        </table></div>
                <%-- <div class="BusinessInfo">
                     <h2> Connect with us: </h2>

                 </div>--%>
         </div>
</asp:Content>
