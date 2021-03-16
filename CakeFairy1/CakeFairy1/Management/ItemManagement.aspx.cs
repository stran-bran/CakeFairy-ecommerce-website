using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.IO;
using System.Configuration;

namespace CakeFairy1.Management
{
    public partial class ItemManagement : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        //database connection string
        SqlConnection con = new SqlConnection("Data Source=tcp:cakefairyserver.database.windows.net,1433;Initial Catalog=CakeFairyDB;Persist Security Info=False;User ID=cakefairy;Password=Admin@123;MultipleActiveResultSets=False;Connect Timeout=30;Encrypt=True;TrustServerCertificate=False");
        protected void btnAddType_Click(object sender, EventArgs e)
        {
            try
            {
                //get image file name
                string fileName = Path.GetFileName(categoryImgUpload.PostedFile.FileName);
                //save upload image to "Image" folder
                imgUpload.SaveAs(Server.MapPath("~/Images/" + fileName));
                fileName = "~/Images/" + fileName;
                //open connection to database
                con.Open();
                SqlCommand cmd = con.CreateCommand();
                cmd.CommandType = System.Data.CommandType.Text;
                //get image's url
                //sql inset query
                cmd.CommandText = "INSERT INTO Packages (Name,Description,Image) VALUES('" + txtTName.Text.ToString() + "','" + txtTInfo.Text.ToString() + "','" + fileName + "')";
                cmd.ExecuteNonQuery();
                //reload items dride view
                grdType.DataBind();
                //close connection to database
                con.Close();
                //clear all text boxes
                foreach (Control b in pnlNewType.Controls)
                {
                    TextBox c;
                    if (b is TextBox)
                    {
                        c = b as TextBox;
                        if (c != null)
                        {
                            c.Text = string.Empty;
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Failed to upload data");
            }
        }
        //show Type creation form
        protected void btnNewType_Click(object sender, EventArgs e)
        {
            if (pnlNewType.Visible == true)
            {
                pnlNewType.Visible = false;
            }
            else
            {
                pnlNewType.Visible = true;
            }
        }

        protected void btnAddItem_Click(object sender, EventArgs e)
        {
            try
            {
                //get image file name
                string fileName = Path.GetFileName(imgUpload.PostedFile.FileName);
                //save upload image to "Image" folder
                imgUpload.SaveAs(Server.MapPath("~/Images/" + fileName));
                fileName = "~/Images/" + fileName;
                //open connection to database
                con.Open();
                SqlCommand cmd = con.CreateCommand();
                cmd.CommandType = System.Data.CommandType.Text;
                //sql inset query
                cmd.CommandText = "INSERT INTO Items (Item,About,Price,Calories,Inventory,Item_Image,PackageID) values('" + txtName.Text + "','" + txtAbout.Text + "','" + Convert.ToDecimal(txtPrice.Text) + "','" + Convert.ToInt32(txtCalories.Text) + "','" + Convert.ToInt32(txtQuantity.Text) + "','" + fileName + "','" + Convert.ToInt32(drpItemType.SelectedValue) + "')";
                cmd.ExecuteNonQuery();
                //reload items dride view
                grdItems.DataBind();
                //close connection to database
                con.Close();
                //clear all text boxes
                foreach (Control b in pnlAddItem.Controls)
                {
                    TextBox c;
                    if (b is TextBox)
                    {
                        c = b as TextBox;
                        if (c != null)
                        {
                            c.Text = string.Empty;
                        }
                    }
                }
            }
            catch (Exception ex)
            {

            }
        }
        //show item creationform
        protected void ShowForm(object sender, EventArgs e)
        {
            if (pnlAddItem.Visible == true)
            {
                pnlAddItem.Visible = false;
            }
            else
            {
                pnlAddItem.Visible = true;
            }
        }
    }
}