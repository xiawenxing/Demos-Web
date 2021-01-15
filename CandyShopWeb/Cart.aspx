<%@ Page Title="Cart" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="candyshop.Cart" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ListView ID="ListView1" runat="server" DataKeyNames="id" DataSourceID="SqlDataSource1" EnablePersistedSelection="True" OnSelectedIndexChanged="ListView1_SelectedIndexChanged">
    <AlternatingItemTemplate>
         <span style="">&nbsp;<span><asp:Label ID="NameLabel" runat="server" Text='<%# Eval("itemname") %>' Visible="False"></asp:Label>
        </span>
        <asp:Image ID="Image2" runat="server" Height="220px" ImageUrl='<%# Eval("picture") %>' Width="250px" />
&nbsp;<br />
        <br />
        <span>
        <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# Eval("ItemId") %>' OnClick="LinkButton1_Click" OnCommand="LinkButton1_Command" Text='<%# Eval("itemname") %>'></asp:LinkButton>
        <br />
        </span>Price:
        <asp:Label ID="PriceLabel" runat="server" Text='<%# Eval("price") %>'></asp:Label>
        <br />
        Num:
        <asp:Label ID="NumLabel" runat="server" Text='<%# Eval("num") %>'></asp:Label>
        <br />
        <br />
        </span>
    </AlternatingItemTemplate>
    <EditItemTemplate>
        <span style="">UId:
        <asp:TextBox ID="UIdTextBox" runat="server" Text='<%# Bind("UId") %>' />
        <br />
        ItemId:
        <asp:TextBox ID="ItemIdTextBox" runat="server" Text='<%# Bind("ItemId") %>' />
        <br />
        num:
        <asp:TextBox ID="numTextBox" runat="server" Text='<%# Bind("num") %>' />
        <br />
        id:
        <asp:Label ID="idLabel1" runat="server" Text='<%# Eval("id") %>' />
        <br />
        picture:
        <asp:TextBox ID="pictureTextBox" runat="server" Text='<%# Bind("picture") %>' />
        <br />
        itemname:
        <asp:TextBox ID="itemnameTextBox" runat="server" Text='<%# Bind("itemname") %>' />
        <br />
        price:
        <asp:TextBox ID="priceTextBox" runat="server" Text='<%# Bind("price") %>' />
        <br />
        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="更新" />
        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="取消" />
        <br />
        <br />
        </span>
    </EditItemTemplate>
    <EmptyDataTemplate>
        <span>未返回数据。</span>
    </EmptyDataTemplate>
    <InsertItemTemplate>
        <span style="">UId:
        <asp:TextBox ID="UIdTextBox" runat="server" Text='<%# Bind("UId") %>' />
        <br />
        ItemId:
        <asp:TextBox ID="ItemIdTextBox" runat="server" Text='<%# Bind("ItemId") %>' />
        <br />
        num:
        <asp:TextBox ID="numTextBox" runat="server" Text='<%# Bind("num") %>' />
        <br />
        id:
        <asp:TextBox ID="idTextBox" runat="server" Text='<%# Bind("id") %>' />
        <br />
        picture:
        <asp:TextBox ID="pictureTextBox" runat="server" Text='<%# Bind("picture") %>' />
        <br />
        itemname:
        <asp:TextBox ID="itemnameTextBox" runat="server" Text='<%# Bind("itemname") %>' />
        <br />
        price:
        <asp:TextBox ID="priceTextBox" runat="server" Text='<%# Bind("price") %>' />
        <br />
        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="插入" />
        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="清除" />
        <br />
        <br />
        </span>
    </InsertItemTemplate>
    <ItemTemplate>
         <span style="">&nbsp;<span><asp:Label ID="NameLabel" runat="server" Text='<%# Eval("itemname") %>' Visible="False"></asp:Label>
        </span>
        <asp:Image ID="Image2" runat="server" Height="220px" ImageUrl='<%# Eval("picture") %>' Width="250px" />
&nbsp;<br />
        <br />
        <span>
        <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# Eval("ItemId") %>' OnClick="LinkButton1_Click" OnCommand="LinkButton1_Command" Text='<%# Eval("itemname") %>'></asp:LinkButton>
        <br />
        </span>Price:
        <asp:Label ID="PriceLabel" runat="server" Text='<%# Eval("price") %>'></asp:Label>
        <br />
        Num:
        <asp:Label ID="NumLabel" runat="server" Text='<%# Eval("num") %>'></asp:Label>
        <br />
        <br />
        </span>
    </ItemTemplate>
    <LayoutTemplate>
        <div id="itemPlaceholderContainer" runat="server" style="">
            <span runat="server" id="itemPlaceholder" />
        </div>
        <div style="">
        </div>
    </LayoutTemplate>
    <SelectedItemTemplate>
        <span style="">UId:
        <asp:Label ID="UIdLabel" runat="server" Text='<%# Eval("UId") %>' />
        <br />
        ItemId:
        <asp:Label ID="ItemIdLabel" runat="server" Text='<%# Eval("ItemId") %>' />
        <br />
        num:
        <asp:Label ID="numLabel" runat="server" Text='<%# Eval("num") %>' />
        <br />
        id:
        <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
        <br />
        picture:
        <asp:Label ID="pictureLabel" runat="server" Text='<%# Eval("picture") %>' />
        <br />
        itemname:
        <asp:Label ID="itemnameLabel" runat="server" Text='<%# Eval("itemname") %>' />
        <br />
        price:
        <asp:Label ID="priceLabel" runat="server" Text='<%# Eval("price") %>' />
        <br />
        <br />
        </span>
    </SelectedItemTemplate>
</asp:ListView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [cart] WHERE ([UId] = @UId)">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="" Name="UId" QueryStringField="uid" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:Panel ID="Panel2" runat="server" style="z-index: 1; width: 59px; height: 337px; position: absolute; top: 95px; left: 845px">
    </asp:Panel>
    <asp:Panel ID="Panel1" runat="server" style="z-index: 1; width: 889px; height: 20px; position: absolute; top: 284px; left: 15px">
    </asp:Panel>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
</asp:Content>
