<%@ Page Title="CandyList" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CandyList.aspx.cs" Inherits="candyshop.CandyList" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ListView ID="ListView1" runat="server" DataKeyNames="Id" DataSourceID="SqlDataSource1" EnablePersistedSelection="True" OnSelectedIndexChanged="ListView1_SelectedIndexChanged">
    <AlternatingItemTemplate>
        <span style="">&nbsp;<asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' Visible="False" />
&nbsp;<asp:Image ID="Image3" runat="server" Height="196px" ImageUrl='<%# Eval("PicturePath") %>' Width="243px" />
        <br />
        <br />
        <asp:LinkButton ID="LinkButton2" runat="server" CommandArgument='<%# Eval("Id") %>' OnCommand="LinkButton2_Command" Text='<%# Eval("Name") %>'></asp:LinkButton>
        <br />
        Price:
        <asp:Label ID="PriceLabel" runat="server" Text='<%# Eval("Price") %>' />
        <br />
        Num:
        <asp:Label ID="NumLabel" runat="server" Text='<%# Eval("Num") %>'></asp:Label>
        <br />
        <br />
        </span>
    </AlternatingItemTemplate>
    <EditItemTemplate>
        <span style="">Id:
        <asp:Label ID="IdLabel1" runat="server" Text='<%# Eval("Id") %>' />
        <br />
        Name:
        <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
        <br />
        PicturePath:
        <asp:TextBox ID="PicturePathTextBox" runat="server" Text='<%# Bind("PicturePath") %>' />
        <br />
        Price:
        <asp:TextBox ID="PriceTextBox" runat="server" Text='<%# Bind("Price") %>' />
        <br />
        Num:
        <asp:TextBox ID="NumTextBox" runat="server" Text='<%# Bind("Num") %>' />
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
        <span style="">Id:
        <asp:TextBox ID="IdTextBox" runat="server" Text='<%# Bind("Id") %>' />
        <br />
        Name:
        <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
        <br />
        PicturePath:
        <asp:TextBox ID="PicturePathTextBox" runat="server" Text='<%# Bind("PicturePath") %>' />
        <br />
        Price:
        <asp:TextBox ID="PriceTextBox" runat="server" Text='<%# Bind("Price") %>' />
        <br />
        Num:
        <asp:TextBox ID="NumTextBox" runat="server" Text='<%# Bind("Num") %>' />
        <br />
        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="插入" />
        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="清除" />
        <br />
        <br />
        </span>
    </InsertItemTemplate>
    <ItemTemplate>
        <span style="">&nbsp;<span><asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' Visible="False"></asp:Label>
        </span>
        <asp:Image ID="Image2" runat="server" Height="220px" ImageUrl='<%# Eval("PicturePath") %>' Width="250px" />
&nbsp;<br />
        <br />
        <span>
        <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# Eval("Id") %>' OnClick="LinkButton1_Click" OnCommand="LinkButton1_Command" Text='<%# Eval("Name") %>'></asp:LinkButton>
        <br />
        </span>Price:
        <asp:Label ID="PriceLabel" runat="server" Text='<%# Eval("Price") %>'></asp:Label>
        <br />
        Num:
        <asp:Label ID="NumLabel" runat="server" Text='<%# Eval("Num") %>'></asp:Label>
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
        <span style="">Id:
        <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' />
        <br />
        Name:
        <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
        <br />
        PicturePath:
        <asp:Label ID="PicturePathLabel" runat="server" Text='<%# Eval("PicturePath") %>' />
        <br />
        Price:
        <asp:Label ID="PriceLabel" runat="server" Text='<%# Eval("Price") %>' />
        <br />
        Num:
        <asp:Label ID="NumLabel" runat="server" Text='<%# Eval("Num") %>' />
        <br />
        <br />
        </span>
    </SelectedItemTemplate>
</asp:ListView>
    <asp:Panel ID="Panel3" runat="server" style="z-index: 1; width: 97px; height: 122px; position: absolute; top: 92px; left: 677px">
        <asp:Menu ID="Menu1" runat="server" OnDataBinding="Menu1_DataBinding" OnMenuItemClick="Menu1_MenuItemClick" style="z-index: 1; width: 28px; height: 100px; position: absolute; top: 0px; left: 0px">
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
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [candyinfo]"></asp:SqlDataSource>
    <asp:Panel ID="Panel2" runat="server" style="z-index: 1; width: 59px; height: 337px; position: absolute; top: 95px; left: 845px">
    </asp:Panel>
    <asp:Panel ID="Panel1" runat="server" style="z-index: 1; width: 889px; height: 20px; position: absolute; top: 284px; left: 15px">
    </asp:Panel>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
</asp:Content>
