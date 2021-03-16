<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="CakeFairy1.Store.Cart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headContent" runat="server">
    <style>
        .imgItems {
            width: 100px;
            height: 100px;
            object-fit: contain;
        }
        h1 {
            text-align:center;
        }
        
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<h1>Cart</h1>
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical" ShowFooter="True" OnRowDeleting="GridView1_RowDeleting">
        <AlternatingRowStyle BackColor="White" BorderColor="Black" BorderStyle="Solid" />
        <Columns>
            <asp:BoundField DataField="productID" HeaderText="Item ID">
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="productName" HeaderText="Product name">
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:ImageField DataImageUrlField="productImg" HeaderText="Product Image" ReadOnly="True">
                <ControlStyle CssClass="imgItems" />
                <ItemStyle HorizontalAlign="Center" />
            </asp:ImageField>
            <asp:BoundField DataField="productQuantity" HeaderText="Quantity" />
            <asp:BoundField DataField="productPrice" HeaderText="Product Price" />
            <asp:BoundField DataField="productTotal" HeaderText="Product Total Price" />
            <asp:CommandField DeleteText="Remove Item" ShowDeleteButton="True" />
        </Columns>
        <FooterStyle BackColor="#CCCC99" BorderColor="Black" BorderStyle="Solid" />
        <HeaderStyle BackColor="#6B696B" BorderColor="Black" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
        <RowStyle BackColor="#F7F7DE" BorderColor="Black" BorderStyle="Solid" />
        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#FBFBF2" />
        <SortedAscendingHeaderStyle BackColor="#848384" />
        <SortedDescendingCellStyle BackColor="#EAEAD3" />
        <SortedDescendingHeaderStyle BackColor="#575357" />

    </asp:GridView>
    <br />
    <p>
        <asp:Button ID="btnBuy" runat="server" Text="Go to checkout" CssClass="btnBuy" OnClick="btnBuy_Click" Height="20%" Width="30%" /></p>
</asp:Content>
