using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CakeFairy1.Store
{
    public partial class Menu : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["addProduct"] = "false";
        }

        protected void dl_ItemCommand(object source, DataListCommandEventArgs e)
        {
            Session["addProduct"] = "true";
            if (e.CommandName == "addToCart")
            {
                DropDownList list = (DropDownList)(e.Item.FindControl("drpQuantity"));
                Response.Redirect("Cart.aspx?ID=" + e.CommandArgument.ToString() + "&Quantity=" + list.SelectedItem.ToString());
            }
        }

        protected void dbSavoury_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }
    }
}