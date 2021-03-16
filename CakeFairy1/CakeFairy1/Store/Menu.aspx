<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Menu.aspx.cs" Inherits="CakeFairy1.Store.Menu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headContent" runat="server">
    <style>
        .imgItems {
            width: 140px;
            height: 140px;
            object-fit: contain;
            margin-left:10%;
        }

        .tblItems {
            background-color:lightgrey;
            table-layout:fixed;
            width: 30%;
            padding:2%;
        }

        .tblItems tbody tr td {
                padding: 0;
                margin:0;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <%--bread section--%>
    <h2>Bread</h2>
    <asp:DataList ID="dlBread" runat="server" DataKeyField="ItemID" DataSourceID="dbBreadItem" BackColor="White" RepeatColumns="2" RepeatDirection="Horizontal" CellPadding="0" OnItemCommand="dl_ItemCommand">
        <ItemTemplate>
            <table class="tblItems">
                <tr>
                    <td>
                        <asp:Label ID="ItemLabel" runat="server" Text='<%# Eval("Item") %>' /></td>
                    <td rowspan="4">
                        <asp:ImageButton ID="imgBtnItem" ImageUrl='<%# Eval("Item_Image") %>' runat="server" CssClass="imgItems" />
                    </td>
                </tr>
                <tr>
                    <td>
                        Calories: <asp:Label ID="CaloriesLabel" runat="server" Text='<%# Eval("Calories") %>' /></td>
                </tr>
                <tr>
                    <td>
                        CAD$<asp:Label ID="PriceLabel" runat="server" Text='<%# Eval("Price") %>' /></td>
                </tr>
                <tr>
                    <td><asp:Label ID="AboutLabel" runat="server" Text='<%# Eval("About") %>' /></td>
                </tr>
                <tr>
                    <td>
                        Quantity:<asp:DropDownList ID="drpQuantity" runat="server">
                            <asp:ListItem>1</asp:ListItem>
                            <asp:ListItem>2</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem>
                            <asp:ListItem>4</asp:ListItem>
                            <asp:ListItem>5</asp:ListItem>
                            <asp:ListItem>6</asp:ListItem>
                        </asp:DropDownList></td>
                    <td>
                        <asp:Button ID="btnAddtocart" runat="server" Text="Add To Cart" CommandArgument='<%# Eval("ItemID") %>' CommandName="addToCart" /></td>
                </tr>
            </table>
        </ItemTemplate>
    </asp:DataList>
    <asp:SqlDataSource ID="dbBreadItem" runat="server" ConnectionString="<%$ ConnectionStrings:CakeFairy1DB %>" SelectCommand="SELECT * FROM [Items] WHERE PackageID = 1"></asp:SqlDataSource>
    <%--savoury section--%>
    <h2>Savoury</h2>
    <asp:DataList ID="dlSavoury" runat="server" DataKeyField="ItemID" DataSourceID="dbSavoury" RepeatColumns="2" OnItemCommand="dl_ItemCommand">
        <ItemTemplate>
            <table class="tblItems">
                <tr>
                    <td>
                        <asp:Label ID="ItemLabel" runat="server" Text='<%# Eval("Item") %>' /></td>
                    <td rowspan="4">
                        <asp:ImageButton ID="imgBtnItem" ImageUrl='<%# Eval("Item_Image") %>' runat="server" CssClass="imgItems" />
                    </td>
                </tr>
                <tr>
                    <td>
                        Calories: <asp:Label ID="CaloriesLabel" runat="server" Text='<%# Eval("Calories") %>' /></td>
                </tr>
                <tr>
                    <td>
                        CAD$<asp:Label ID="PriceLabel" runat="server" Text='<%# Eval("Price") %>' /></td>
                </tr>
                <tr>
                    <td><asp:Label ID="AboutLabel" runat="server" Text='<%# Eval("About") %>' /></td>
                </tr>
                <tr>
                    <td>
                        Quantity:<asp:DropDownList ID="drpQuantity" runat="server">
                            <asp:ListItem>1</asp:ListItem>
                            <asp:ListItem>2</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem>
                            <asp:ListItem>4</asp:ListItem>
                            <asp:ListItem>5</asp:ListItem>
                            <asp:ListItem>6</asp:ListItem>
                        </asp:DropDownList></td>
                    <td>
                        <asp:Button ID="btnAddtocart" runat="server" Text="Add To Cart" CommandArgument='<%# Eval("ItemID") %>' CommandName="addToCart"/></td>
                </tr>
            </table>
        </ItemTemplate>
    </asp:DataList>
    <asp:SqlDataSource ID="dbSavoury" runat="server" ConnectionString="<%$ ConnectionStrings:CakeFairy1DB %>" SelectCommand="SELECT * FROM [Items] WHERE PackageID=2" OnSelecting="dbSavoury_Selecting"></asp:SqlDataSource>
    <%--sweet section--%>
    <h2>Sweet</h2>
    <asp:DataList ID="dlSweet" runat="server" DataKeyField="ItemID" DataSourceID="dbSweet" RepeatColumns="2" OnItemCommand="dl_ItemCommand">
        <ItemTemplate>
            <table class="tblItems">
                <tr>
                    <td>
                        <asp:Label ID="ItemLabel" runat="server" Text='<%# Eval("Item") %>' /></td>
                    <td rowspan="4">
                        <asp:ImageButton ID="imgBtnItem" ImageUrl='<%# Eval("Item_Image") %>' runat="server" CssClass="imgItems" />
                    </td>
                </tr>
                <tr>
                    <td>
                        Calories: <asp:Label ID="CaloriesLabel" runat="server" Text='<%# Eval("Calories") %>' /></td>
                </tr>
                <tr>
                    <td>
                        CAD$<asp:Label ID="PriceLabel" runat="server" Text='<%# Eval("Price") %>' /></td>
                </tr>
                <tr>
                    <td><asp:Label ID="AboutLabel" runat="server" Text='<%# Eval("About") %>' /></td>
                </tr>
                <tr>
                    <td>
                        Quantity:<asp:DropDownList ID="drpQuantity" runat="server">
                            <asp:ListItem>1</asp:ListItem>
                            <asp:ListItem>2</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem>
                            <asp:ListItem>4</asp:ListItem>
                            <asp:ListItem>5</asp:ListItem>
                            <asp:ListItem>6</asp:ListItem>
                            </asp:DropDownList></td>
                    <td>
                        <asp:Button ID="btnAddtocart" runat="server" Text="Add To Cart" CommandArgument='<%# Eval("ItemID") %>' CommandName="addToCart"/></td>
                </tr>
            </table>
        </ItemTemplate>
    </asp:DataList>
    <asp:SqlDataSource ID="dbSweet" runat="server" ConnectionString="<%$ ConnectionStrings:CakeFairy1DB %>" SelectCommand="SELECT * FROM [Items] WHERE PackageID=3"></asp:SqlDataSource>
    <%--Drink section--%>
    <h2>Drink</h2>
    <asp:DataList ID="dlDrink" runat="server" DataKeyField="ItemID" DataSourceID="dbDrinks" RepeatColumns="2" OnItemCommand="dl_ItemCommand">
        <ItemTemplate>
            <table class="tblItems">
                <tr>
                    <td>
                        <asp:Label ID="ItemLabel" runat="server" Text='<%# Eval("Item") %>' /></td>
                    <td rowspan="4">
                        <asp:ImageButton ID="imgBtnItem" ImageUrl='<%# Eval("Item_Image") %>' runat="server" CssClass="imgItems" />
                    </td>
                </tr>
                <tr>
                    <td>
                        Calories: <asp:Label ID="CaloriesLabel" runat="server" Text='<%# Eval("Calories") %>' /></td>
                </tr>
                <tr>
                    <td>
                        CAD$<asp:Label ID="PriceLabel" runat="server" Text='<%# Eval("Price") %>' /></td>
                </tr>
                <tr>
                    <td><asp:Label ID="AboutLabel" runat="server" Text='<%# Eval("About") %>' /></td>
                </tr>
                <tr>
                    <td>
                        Quantity:<asp:DropDownList ID="drpQuantity" runat="server">
                            <asp:ListItem>1</asp:ListItem>
                            <asp:ListItem>2</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem>
                            <asp:ListItem>4</asp:ListItem>
                            <asp:ListItem>5</asp:ListItem>
                            <asp:ListItem>6</asp:ListItem>
                        </asp:DropDownList></td>
                    <td>
                        <asp:Button ID="btnAddtocart" runat="server" Text="Add To Cart" CommandArgument='<%# Eval("ItemID") %>' CommandName="addToCart"/></td>
                </tr>
            </table>
        </ItemTemplate>
    </asp:DataList>
    <asp:SqlDataSource ID="dbDrinks" runat="server" ConnectionString="<%$ ConnectionStrings:CakeFairy1DB %>" SelectCommand="SELECT * FROM [Items] WHERE PackageID=4"></asp:SqlDataSource>
</asp:Content>
