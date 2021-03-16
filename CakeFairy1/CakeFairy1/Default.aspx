<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CakeFairy1._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="defaultPage">
    <div class="jumbotron">
        <h1>The Cake Fairy</h1>
        <p class="lead">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>
       <%-- <p><a href="http://www.asp.net" class="btn btn-primary btn-lg">Learn more &raquo;</a></p>--%>
    </div>
    <div class="row">
        <div class="col-md-4">
            <div class="outter-col-md-4"> 
                <br />
            <h2 style="font-family: Edwardian Script ITC; color: purple;  font-size: 50px ;font-weight:bold; text-decoration:underline;" >Delivery</h2>
                <asp:Image class="ImgOutterCol" runat="server"  ImageUrl="~/Images/freeDelivery.jpg" />
            <p>
                Free delivery for any order in Thunder Bay&nbsp;
            </p>
           
        </div>
            </div>
        <div class="col-md-4">
              <div class="mid-col-md-4"> 
                  <br />
                <h2 style="font-family: Edwardian Script ITC; color: purple; font-size: 50px ;font-weight:bold; text-decoration:underline; " >Shop Hours</h2>
                <div>
                      <h4>Monday: </h4>    
                        <p>Closed</p>       
                    <h4>Tuesday-Friday: </h4>
                    <p>8 am - 5 pm</p> 
                      <h4>Saturday & Sunday</h4> 
                    <p>9 am - 3 pm</p>  
                 </div> 
             </div>
        </div>
        <div class="col-md-4">
              <div class="outter-col-md-4"> 
                  <br />
            <h2 style="font-family: Edwardian Script ITC; color: purple; font-size: 50px ;font-weight:bold; text-decoration:underline; ">Gift Wrapping</h2>
            
            <asp:Image class="ImgOutterCol" runat="server"  ImageUrl="~/Images/giftbox.jpg" />
            <p>
               Free wrapping for any purchase of $50 or more&nbsp; 
            </p>
            
        </div>
    </div>

</div>
        </div>
</asp:Content>
