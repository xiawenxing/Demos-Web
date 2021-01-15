<%@ Page Title="Signin" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Signin.aspx.cs" Inherits="candyshop.Signin" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="row" aria-expanded="true">
            <asp:Login ID="Login1" runat="server" BackColor="#F7F7DE" BorderColor="#CCCC99" BorderStyle="Solid" BorderWidth="1px" FailureText="Failed, please retry." Font-Names="Verdana" Font-Size="10pt" Height="390px" LoginButtonText="Login" OnAuthenticate="Login1_Authenticate" PasswordLabelText="Password:" PasswordRequiredErrorMessage="&quot;Password&quot; cannot be default" RememberMeText="Remember me" TitleText="Login" UserNameLabelText="Username:" UserNameRequiredErrorMessage="&quot;Username&quot; cannot be default" Width="416px">
                <TitleTextStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
            </asp:Login>
            <asp:Button ID="Button1" runat="server" Text="Register" OnClick="Button1_Click" />
        </div>
</asp:Content>
