<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ItemManagement.aspx.cs" Inherits="CakeFairy1.Management.ItemManagement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headContent" runat="server">
    <style>
        img {
            width:150px;
            height:150px;
            object-fit:contain;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <%--shows new catagory creation form--%>
    <asp:Button ID="btnNewType" runat="server" Text="Create new category" OnClick="btnNewType_Click" />
    <%--category creation form--%>
    <asp:Panel ID="pnlNewType" runat="server" BorderStyle="Solid" Visible="False">
        <p>Category Name:<asp:TextBox ID="txtTName" runat="server"></asp:TextBox></p>
        <br />
        <p>Category Image:<asp:FileUpload ID="categoryImgUpload" runat="server" /></p>
        <br />
        <p>Category Description:<asp:TextBox ID="txtTInfo" runat="server"></asp:TextBox></p>
        <p>
            <asp:Button ID="btnAddType" runat="server" Text="Add New Category" OnClick="btnAddType_Click" />
        </p>
        <br />

        <asp:GridView ID="grdType" runat="server" AutoGenerateColumns="False" DataSourceID="dbItemType">
            <Columns>
                <asp:BoundField DataField="PackageID" HeaderText="PackageID" SortExpression="PackageID" />
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                <asp:BoundField DataField="Image" HeaderText="Image" SortExpression="Image"/>
                <asp:CommandField ShowEditButton="True" />
                <asp:CommandField ShowDeleteButton="True" />
            </Columns>
        </asp:GridView>
        <br />
    </asp:Panel>
    <br />
    <%--button use to show item creation form--%>
    <asp:Button ID="btnCreateForm" runat="server" Text="Create new item" OnClick="ShowForm" /><br />
    <%--item creation form--%>
    <asp:Panel ID="pnlAddItem" runat="server" BorderStyle="Solid" Visible="False">
        <p>Item's name:<asp:TextBox ID="txtName" runat="server"></asp:TextBox></p>
        <br />
        <p>Item's type:
            <asp:DropDownList ID="drpItemType" runat="server" DataSourceID="dbItemType" DataTextField="Name" DataValueField="PackageID"></asp:DropDownList></p>
        <p>
            &nbsp;</p>
        <p>Item's Price:
            <asp:TextBox ID="txtPrice" runat="server"></asp:TextBox>Item Calories:<asp:TextBox ID="txtCalories" runat="server"></asp:TextBox></p>
        <br />
        <p>
            Item's Quantity:<asp:TextBox ID="txtQuantity" runat="server"></asp:TextBox><br />
            Item's Image:<asp:FileUpload ID="imgUpload" runat="server" />
        </p>
        <br />
        <p>
            Item's Description:</p>
        <p>
            <asp:TextBox ID="txtAbout" runat="server"></asp:TextBox>
        </p>
        <p>
            <asp:Button ID="btnAddItem" runat="server" Text="Add item" OnClick="btnAddItem_Click" />
        </p>
    </asp:Panel>
    <br />
            <asp:SqlDataSource ID="dbItemType" runat="server" ConnectionString="<%$ ConnectionStrings:CakeFairy1DB %>" SelectCommand="SELECT * FROM [Packages]" DeleteCommand="DELETE FROM [Packages] WHERE [PackageID] = @PackageID" InsertCommand="INSERT INTO [Packages] ([Name], [Description], [Image]) VALUES (@Name, @Description, @Image)" UpdateCommand="UPDATE [Packages] SET [Name] = @Name, [Description] = @Description, [Image] = @Image WHERE [PackageID] = @PackageID">
                <DeleteParameters>
                    <asp:Parameter Name="PackageID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Name" Type="String" />
                    <asp:Parameter Name="Description" Type="String" />
                    <asp:Parameter Name="Image" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Name" Type="String" />
                    <asp:Parameter Name="Description" Type="String" />
                    <asp:Parameter Name="Image" Type="String" />
                    <asp:Parameter Name="PackageID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
    <asp:Panel ID="pnlItemList" runat="server">
        <%--list of all added items--%>
        <p>Added Items</p>
        <p>
            <asp:GridView ID="grdItems" runat="server" AutoGenerateColumns="False" DataSourceID="dbItemsList" DataKeyNames="ItemID">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    <asp:BoundField DataField="ItemID" HeaderText="ItemID" SortExpression="ItemID" InsertVisible="False" ReadOnly="True" />
                    <asp:BoundField DataField="Item" HeaderText="Item" SortExpression="Item" />
                    <asp:BoundField DataField="About" HeaderText="About" SortExpression="About" />
                    <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
                    <asp:BoundField DataField="Calories" HeaderText="Calories" SortExpression="Calories" />
                    <asp:BoundField DataField="Inventory" HeaderText="Inventory" SortExpression="Inventory" />
                    <asp:ImageField DataImageUrlField="Item_Image" HeaderText="Item_Image"/>
                    <asp:BoundField DataField="PackageID" HeaderText="PackageID" SortExpression="PackageID" />
                </Columns>
            </asp:GridView>
        </p>

        <p>
            <asp:SqlDataSource ID="dbItemsList" runat="server" ConnectionString="<%$ ConnectionStrings:CakeFairy1DB %>" DeleteCommand="DELETE FROM [Items] WHERE [ItemID] = @ItemID" InsertCommand="INSERT INTO [Items] ([Item], [About], [Price], [Calories], [Inventory], [Item_Image], [PackageID]) VALUES (@Item, @About, @Price, @Calories, @Inventory, @Item_Image, @PackageID)" SelectCommand="SELECT * FROM [Items]" UpdateCommand="UPDATE [Items] SET [Item] = @Item, [About] = @About, [Price] = @Price, [Calories] = @Calories, [Inventory] = @Inventory, [Item_Image] = @Item_Image, [PackageID] = @PackageID WHERE [ItemID] = @ItemID">
                <DeleteParameters>
                    <asp:Parameter Name="ItemID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Item" Type="String" />
                    <asp:Parameter Name="About" Type="String" />
                    <asp:Parameter Name="Price" Type="Decimal" />
                    <asp:Parameter Name="Calories" Type="Int32" />
                    <asp:Parameter Name="Inventory" Type="Int32" />
                    <asp:Parameter Name="Item_Image" Type="String" />
                    <asp:Parameter Name="PackageID" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Item" Type="String" />
                    <asp:Parameter Name="About" Type="String" />
                    <asp:Parameter Name="Price" Type="Decimal" />
                    <asp:Parameter Name="Calories" Type="Int32" />
                    <asp:Parameter Name="Inventory" Type="Int32" />
                    <asp:Parameter Name="Item_Image" Type="String" />
                    <asp:Parameter Name="PackageID" Type="Int32" />
                    <asp:Parameter Name="ItemID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </p>

    </asp:Panel>
</asp:Content>
