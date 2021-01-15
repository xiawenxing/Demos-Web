<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="candyshop._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron" aria-expanded="true" aria-orientation="horizontal">
        <h1 aria-expanded="true" aria-orientation="horizontal">Candy Shop</h1>
        <p class="lead" aria-expanded="true" aria-hidden="False" aria-orientation="horizontal">This is a online shop of candies.</p>
    </div>
    <div class =" row" aria-expanded="true">
     <asp:ImageButton ID="ImageButton1" runat="server" Height="44px" ImageUrl="~/images/left-arrow.png" OnClick="ImageButton1_Click" Width="44px" CssClass="icon-prev" />
            <asp:ImageMap ID="ImageMap1" runat="server" Height="418px" ImageUrl="~/images/assortment-bright-candy-1043519.jpg" OnClick="ImageMap1_Click" Width="860px" CssClass="img-rounded" ImageAlign="Middle">
            </asp:ImageMap>
            <asp:ImageButton ID="ImageButton2" runat="server" Height="44px" ImageUrl="~/images/right-arrow.png" OnClick="ImageButton2_Click" Width="44px" CssClass="icon-next" />    
    
    </div>
    <div class="row" aria-expanded="true">
        <div class="col-md-4">
            <h2>Getting started</h2>
            <p>
                ASP.NET Web Forms lets you build dynamic websites using a familiar drag-and-drop, event-driven model.
            A design surface and hundreds of controls and components let you rapidly build sophisticated, powerful UI-driven sites with data access.
            </p>
            <p>
               
            </p>
        </div>
        <div class="col-md-4">
            <h2>Get more libraries</h2>
            <p>
                NuGet is a free Visual Studio extension that makes it easy to add, remove, and update libraries and tools in Visual Studio projects.
            </p>
            <p>
                
            </p>
        </div>
        <div class="col-md-4">
            <h2 style="margin-bottom: 10px">Web Hosting</h2>
            <p>
                You can easily find a web hosting company that offers the right mix of features and price for your applications.
            </p>
            <p>
                &nbsp;</p>
        </div>
    </div>

</asp:Content>
