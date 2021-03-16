using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
namespace CakeFairy1
{
    public partial class Contact : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                MailMessage mailMessage = new MailMessage();
                mailMessage.From = new MailAddress("thecakefairyclone@gmail.com");
                mailMessage.To.Add("thecakefairyclone@gmail.com");
                mailMessage.Subject = txtSubject.Text;
                mailMessage.Body = "This is email comes from contact us page! <br/>" + "<b>Sender name: </b>" + txtName.Text + "<br/>"
                       + "<b>Sender email: </b>" + txtEmail.Text + "<br/>" + "<b>Messages </b>" + txtMessages.Text;
                mailMessage.IsBodyHtml = true;


                SmtpClient smtpClient = new SmtpClient();

                smtpClient.EnableSsl = true;
                smtpClient.Send(mailMessage);
                Label1.ForeColor = System.Drawing.Color.Blue;
                Label1.Text = "Thank you for contacting us! Your message was sent successfully! We will response to your messages soon!";
                Label1.Visible = true;


                txtName.Enabled = false;
                txtEmail.Enabled = false;
                txtSubject.Enabled = false;
                txtMessages.Enabled = false;
            }
            catch (Exception ex)
            {
                // log - event Viewer or table
                Label1.ForeColor = System.Drawing.Color.Red;
                Label1.Text = "There is an unknown problem. Please try later";
                Label1.Visible = true;
            }
        }
    }
}