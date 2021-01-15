<%@ Page Title="CandyInfo" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CandyInfo.aspx.cs" Inherits="candyshop.CandyInfo" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Image ID="Image2" runat="server" Height="255px" Width="337px" />
    <asp:Panel ID="Panel3" runat="server" style="z-index: 1; width: 97px; height: 122px; position: absolute; top: 92px; left: 677px">
        <asp:Menu ID="Menu2" runat="server" OnDataBinding="Menu2_DataBinding" OnMenuItemClick="Menu2_MenuItemClick" style="z-index: 1; width: 28px; height: 100px; position: absolute; top: 0px; left: 0px">
            <DataBindings>
                <asp:MenuItemBinding />
            </DataBindings>
            <Items>
                <asp:MenuItem Text="tourist" Value="user">
                    <asp:MenuItem Text="SignIn" Value="SignIn"></asp:MenuItem>
                    <asp:MenuItem Text="SignUp" Value="SignUp"></asp:MenuItem>
                    <asp:MenuItem Text="SignOut" Value="SignOut"></asp:MenuItem>
                    <asp:MenuItem Text="My Cart" Value="My Cart"></asp:MenuItem>
                </asp:MenuItem>
            </Items>
        </asp:Menu>
    </asp:Panel>
    <br />
    Name:<asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    <br />
    Price:<asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
    <br />
    Num:<asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
    <br />
    Description:<asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
    <br />
    <asp:Panel ID="Panel4" runat="server" style="z-index: 1; width: 754px; height: 22px; position: absolute; top: 541px; left: 15px">
        <asp:ImageButton ID="buy" runat="server" style="z-index: 1; position: absolute; top: -270px; left: 725px; width: 28px; height: 25px;" ImageUrl="~/images/pay.png" ToolTip="Buy" />
        <asp:ImageButton ID="cart" runat="server" ImageUrl="~/images/cart.png" OnClick="cart_Click" style="z-index: 1; position: absolute; top: -271px; left: 668px; width: 31px; height: 28px; right: 55px" ToolTip="Add to Cart" />
    </asp:Panel>
</asp:Content>
