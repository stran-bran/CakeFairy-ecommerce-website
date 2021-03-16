using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace CakeFairy1.Store
{
    public partial class Cart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //disable check out button if there's no item in cart
            System.Diagnostics.Debug.WriteLine(Session["buyItems"]);
            System.Diagnostics.Debug.WriteLine(Session["addProduct"]);
            //add item to cart
            Session["addProduct"] = "false";
            //crete new datatable for columns
            DataTable dt = new DataTable();
            DataRow dr;
            dt.Columns.Add("productID");
            dt.Columns.Add("productName");
            dt.Columns.Add("productImg");
            dt.Columns.Add("productQuantity");
            dt.Columns.Add("productPrice");
            dt.Columns.Add("productTotal");
            //database connection
            SqlConnection conn = new SqlConnection("Data Source=tcp:cakefairyserver.database.windows.net,1433;Initial Catalog=CakeFairyDB;Persist Security Info=False;User ID=cakefairy;Password=Admin@123;MultipleActiveResultSets=False;Connect Timeout=30;Encrypt=True;TrustServerCertificate=False");

            //add data to data table
            if (Request.QueryString["ID"] != null)
            {
                //this part start if there're no item in the cart
                if (Session["buyItems"] == null)
                {
                    //create new data table
                    dr = dt.NewRow();
                    DataSet ds = new DataSet();
                    SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Items WHERE ItemID=" + Request.QueryString["ID"], conn);
                    da.Fill(ds);
                    //put database data into data set
                    dr["productID"] = ds.Tables[0].Rows[0]["ItemID"].ToString();
                    dr["productName"] = ds.Tables[0].Rows[0]["Item"].ToString();
                    dr["productImg"] = ds.Tables[0].Rows[0]["Item_Image"].ToString();
                    dr["productPrice"] = ds.Tables[0].Rows[0]["Price"].ToString();
                    dr["productQuantity"] = Request.QueryString["Quantity"];
                    //calculate product total
                    decimal price = Convert.ToDecimal(ds.Tables[0].Rows[0]["Price"].ToString());
                    int amount = Convert.ToInt16(Request.QueryString["Quantity"].ToString());
                    decimal totalPrice = price * amount;
                    dr["productTotal"] = totalPrice;
                    //add datarow to data table
                    dt.Rows.Add(dr);
                    //bind gridview datasource to data table
                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                    Session["buyItems"] = dt;
                    //enable checkout button
                    btnBuy.Enabled = true;
                    //add grand total to gridview's footer
                    GridView1.FooterRow.Cells[4].Text = "Total Amount: ";
                    GridView1.FooterRow.Cells[5].Text = grandtotal().ToString();
                    Response.Redirect("Cart.aspx");
                }
                //this part start if there're already item in the cart
                else
                {
                    dt = (DataTable)Session["buyItems"];
                    //create new row in datatable
                    dr = dt.NewRow();
                    DataSet ds = new DataSet();
                    SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Items WHERE ItemID=" + Request.QueryString["ID"], conn);
                    da.Fill(ds);
                    //put database data into data set
                    dr["productID"] = ds.Tables[0].Rows[0]["ItemID"].ToString();
                    dr["productName"] = ds.Tables[0].Rows[0]["Item"].ToString();
                    dr["productImg"] = ds.Tables[0].Rows[0]["Item_Image"].ToString();
                    dr["productPrice"] = ds.Tables[0].Rows[0]["Price"].ToString();
                    dr["productQuantity"] = Request.QueryString["Quantity"];
                    //calculate product total
                    //int sr = dt.Rows.Count;//count number of row in table
                    decimal price = Convert.ToDecimal(ds.Tables[0].Rows[0]["Price"].ToString());
                    int amount = Convert.ToInt16(Request.QueryString["Quantity"].ToString());
                    decimal totalPrice = price * amount;
                    dr["productTotal"] = totalPrice;
                    //add datarow to data table
                    dt.Rows.Add(dr);
                    //bind gridview datasource to data table
                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                    Session["buyItems"] = dt;
                    //enable checkout button
                    btnBuy.Enabled = true;
                    //add grand total to gridview's footer
                    GridView1.FooterRow.Cells[4].Text = "Total Amount: ";
                    GridView1.FooterRow.Cells[5].Text = grandtotal().ToString();
                    Response.Redirect("Cart.aspx");
                }
            }
            else
            {
                //if no new item, then load datatable into the gridview
                dt = (DataTable)Session["buyItems"];
                GridView1.DataSource = dt;
                GridView1.DataBind();
                if (GridView1.Rows.Count > 0)
                {
                    GridView1.FooterRow.Cells[4].Text = "Total Amount: ";
                    GridView1.FooterRow.Cells[5].Text = grandtotal().ToString();
                }
            }
            string orderDate = DateTime.Now.ToShortDateString();
            Session["orderDay"] = orderDate;
        }
        //calculate bill total
        public decimal grandtotal()
        {
            DataTable dt = new DataTable();
            dt = (DataTable)Session["buyitems"];
            int nrow = dt.Rows.Count;
            int i = 0;
            decimal billtotal = 0;
            while (i < nrow)
            {
                billtotal += Convert.ToDecimal(dt.Rows[i]["productTotal"].ToString());
                i += 1;
            }
            //passbil total into session
            Session["billTotal"] = billtotal;
            return billtotal;
        }
        //delete row funtction
        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            DataTable dt = new DataTable();
            dt = (DataTable)Session["buyItems"];
            dt.Rows.RemoveAt(e.RowIndex);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
        //check out button
        protected void btnBuy_Click(object sender, EventArgs e)
        {
            //redirect user to login page if not loggedin
            if (HttpContext.Current.User.Identity.IsAuthenticated == false)
            {
                Response.Redirect("~/Account/Login.aspx");
                Session["warning"] = "Please login to continue purchases";
            }
            //block further advancement if cart is empty
            if (GridView1.Rows.Count.ToString() == "0")
            {
                Response.Write("<script>alert('Your Cart is Empty. You cannot place an Order');</script>");
            }
            else
            {
                orderid();
                Response.Redirect("~/Store/Checkout.aspx");
            }
        }
        //generate orderID
        public void orderid()
        {
            String alpha = "123456789";
            Random r = new Random();
            char[] myArray = new char[3];
            for (int i = 0; i < 5; i++)
            {
                myArray[i] = alpha[(int)(35 * r.NextDouble())];

            }
            String orderid;
            orderid = "Order_Id: " + DateTime.Now.Hour.ToString() + DateTime.Now.Second.ToString() + DateTime.Now.Day.ToString()
                + DateTime.Now.Month.ToString() + DateTime.Now.Year.ToString() + new string(myArray) + DateTime.Now.Minute.ToString() + DateTime.Now.Second.ToString();
            Session["Orderid"] = orderid;
        }
    }
}