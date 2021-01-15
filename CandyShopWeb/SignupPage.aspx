<%@ Page Title="SignupPage" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SignupPage.aspx.cs" Inherits="candyshop.SignupPage" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="row" aria-expanded="true">
            <asp:CreateUserWizard ID="CreateUserWizard1" runat="server" BackColor="#F7F7DE" BorderColor="#CCCC99" BorderStyle="Solid" BorderWidth="1px" CancelButtonText="Cancel" CompleteSuccessText="Success!" ContinueButtonText="Continue"  FinishCompleteButtonText="Finished" FinishPreviousButtonText="Back" Font-Names="Verdana" Font-Size="10pt" Height="38px" StepNextButtonText="Next" StepPreviousButtonText="Back" UnknownErrorMessage="Failed. Retry please." Width="196px" RequireEmail="False" OnContinueButtonClick="CreateUserWizard1_ContinueButtonClick" EnableTheming="False" CreateUserButtonType="Image" CreateUserButtonText="..." CreateUserButtonImageUrl="~/images/lollipop.png">
                <ContinueButtonStyle BackColor="#FFFBFF" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" ForeColor="#284775" />
                <CreateUserButtonStyle BackColor="#FFFBFF" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" ForeColor="#284775" Height="25px" Width="25px"/>
                <TitleTextStyle BackColor="#6B696B" Font-Bold="True" ForeColor="#FFFFFF" />
                <WizardSteps>
                    <asp:CreateUserWizardStep runat="server" Title="Register">
                        <ContentTemplate>
                            <table style="font-family:Verdana;font-size:100%;height:319px; width:397px;">
                                <tr>
                                    <td align="center" colspan="2" style="color:White;background-color:#6B696B;font-weight:bold; height: 42px;">Register</td>
                                </tr>
                                <tr>
                                    <td align="right" style="width: 160px">
                                        <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">Username:</asp:Label>
                                    </td>
                                    <td style="width: 285px">
                                        <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="Username can't be default." ToolTip="Username can't be default." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" style="width: 160px">
                                        <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label>
                                    </td>
                                    <td style="width: 285px">
                                        <asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="Password can,t be default." ToolTip="Password can,t be default." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" style="width: 160px">
                                        <asp:Label ID="ConfirmPasswordLabel" runat="server" AssociatedControlID="ConfirmPassword">Confirm password:</asp:Label>
                                    </td>
                                    <td style="width: 285px">
                                        <asp:TextBox ID="ConfirmPassword" runat="server" TextMode="Password"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server" ControlToValidate="ConfirmPassword" ErrorMessage="Confirm password cannot skip." ToolTip="Confirm password cannot skip." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <div style="display:none;">
                                <tr>
                                    <td align="right" style="width: 160px">
                                        <asp:Label ID="QuestionLabel" runat="server" AssociatedControlID="Question" Visible="False">安全提示问题:</asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="Question" runat="server" Visible="False"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="QuestionRequired" runat="server" ControlToValidate="Question" ErrorMessage="必须填写“安全提示问题”。" ToolTip="必须填写“安全提示问题”。" ValidationGroup="CreateUserWizard2">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" style="width: 160px">
                                        <asp:Label ID="AnswerLabel" runat="server" AssociatedControlID="Answer" Visible="False">安全答案:</asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="Answer" runat="server" Visible="False"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="AnswerRequired" runat="server" ControlToValidate="Answer" ErrorMessage="必须填写“安全答案”。" ToolTip="必须填写“安全答案”。" ValidationGroup="CreateUserWizard2">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                </style>
                                <tr>
                                    <td align="right" style="height: 26px; width: 160px;"></td>
                                    <td style="height: 26px; width: 285px;"></td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="2" style="height: 25px">
                                        <asp:CompareValidator ID="PasswordCompare" runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword" Display="Dynamic" ErrorMessage="“密码”和“确认密码”必须匹配。" ValidationGroup="CreateUserWizard1"></asp:CompareValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="2" style="color:Red; height: 30px;">
                                        <asp:Literal ID="ErrorMessage" runat="server" EnableViewState="False"></asp:Literal>
                                    </td>
                                </tr>
                        
                                 <tr>
                                     <td style="height: 30px"></td>
                                    <td align="right" style="width: 160px; height: 30px;">
               
                                        <asp:Button ID="ContinueButton" runat="server" BackColor="#FFFBFF" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" CausesValidation="False" CommandName="Continue" Font-Names="Verdana" ForeColor="#284775" Text="Create" ValidationGroup="CreateUserWizard1" Width="92px" OnClick="CreateUserWizard1_ContinueButtonClick" />
                                    </td>
                                </tr>
                                
                            </table>
                        </ContentTemplate>
                    </asp:CreateUserWizardStep>
                    <asp:CompleteWizardStep runat="server" Title="Finish">
                        <ContentTemplate>
                            <table style="font-family:Verdana;font-size:100%;height:24px;width:227px;">
                                <tr>
                                    <td align="center" style="color:White;background-color:#6B696B;font-weight:bold;">Finish</td>
                                </tr>
                                <tr>
                                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Success!</td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <asp:Button ID="Button1" runat="server" BorderStyle="None" Text="Confirm" OnClick="Button1_Click" />
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                    </asp:CompleteWizardStep>
                </WizardSteps>
                <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="#FFFFFF" HorizontalAlign="Center" />
                <NavigationButtonStyle BackColor="#FFFBFF" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" ForeColor="#284775" />
                <SideBarButtonStyle BorderWidth="0px" Font-Names="Verdana" ForeColor="#FFFFFF" />
                <SideBarStyle BackColor="#7C6F57" BorderWidth="0px" Font-Size="0.9em" VerticalAlign="Top" />
                <StartNavigationTemplate>
                    <asp:Button ID="StartNextButton" runat="server" BackColor="#FFFBFF" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" CommandName="MoveNext" Font-Names="Verdana" ForeColor="#284775" Text="下一步" />
                </StartNavigationTemplate>
                <StepStyle BorderWidth="0px" />
            </asp:CreateUserWizard>
            <br />
        </div>
</asp:Content>
