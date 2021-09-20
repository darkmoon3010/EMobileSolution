<%@ Page Title="User" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="User.aspx.cs" Inherits="EMobileSolution.User" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
      <style>
         table, th, td {
            border: 1px solid black;
            padding-left: 5px
         }
    </style>
    <div class="main-header">
        <%: Title %> 
    </div>
    <div style="margin: 10px 0 10px 0"">

     <asp:Button CssClass="btn btn-primary" class="button" ID="btnAddNew" runat="server" Text="Thêm mới" OnClick="btnAddNew_Click" />
    </div>
    <div class="main-data" id="divGridView" runat="server">
        <asp:GridView ID="grvListUser" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" Height="183px" AutoGenerateColumns="False" Width="389px" OnRowCommand="grvListUser_RowCommand" >
            <Columns>
                <asp:TemplateField HeaderText="STT">
                    <ItemTemplate>
                        <%# Container.DataItemIndex +1 %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:HyperLinkField DataNavigateUrlFields="UserId" DataTextField="Username" HeaderText="Tên tài khoản" DataNavigateUrlFormatString="~/User.aspx?id={0}" NavigateUrl="~/User.aspx" />
                <asp:HyperLinkField DataNavigateUrlFields="UserId" DataTextField="Password" HeaderText="Mật khẩu" />
                <asp:TemplateField HeaderText="Sửa">
                    <ItemTemplate>
                        <asp:ImageButton ID="btnEdit" runat="server" CommandArgument='<%# Eval("UserId") %>' CommandName="_edit" Height="25px" ImageUrl="~/images/icon/user.png" Width="25px" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Xoá">
                    <ItemTemplate>
                        <asp:ImageButton ID="btnDelete" runat="server" CommandArgument='<%# Eval("UserId") %>' CommandName="_delete" Height="23px" ImageUrl="~/images/icon/trash.png" Width="25px" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
            <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
            <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F7F7F7" />
            <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
            <SortedDescendingCellStyle BackColor="#E5E5E5" />
            <SortedDescendingHeaderStyle BackColor="#242121" />
            </asp:GridView>
        <br />
       </div>
    <div id="divAdd_Edit" runat="server">
        <table style="width: 35%; border:1px solid black">
            <tr>
                <td class="text-center" colspan="2" style="height: 21px"><strong>Thêm tài khoản</strong></td>
            </tr>
            <tr>
                <td style="width: 211px; height: 23px;">Tên tài khoản</td>
                <td style="height: 23px; width: 288px;">
                    <asp:TextBox ID="txtUser" runat="server" Width="191px"></asp:TextBox>
                </td>
            </tr>
             <tr>
                <td style="width: 211px; height: 23px;">Mật khẩu</td>
                <td style="height: 23px; width: 288px;">
                    <asp:TextBox ID="txtPassword" runat="server" Width="191px" TextMode="Password"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 211px">&nbsp;</td>
                <td style="width: 288px">
                    <asp:Button CssClass="btn-primary" ID="btnAdd" runat="server" Text="Thêm" OnClick="btnAdd_Click"  />
                    <asp:Button CssClass="btn-danger" ID="btnCancel" runat="server" Text="Huỷ"  OnClick="btnCancel_Click" />
                </td>
            </tr>
        </table>
        <div id="divContentDetail" runat="server">
             <table style="width: 60%; border-collapse: collapse; border-style: solid; border-width: 1px">
                 <tr>
                     <td colspan="2" class="text-center"><strong>Chi tiết tài khoản</strong></td>
                 </tr>
                    <tr>
                        <td style="width: 172px">Tên tài khoản:</td>
                        <td style="width: 462px">
                            <asp:Label ID="lblName" runat="server"></asp:Label>
                        </td>
                    </tr>
                  <tr>
                        <td style="width: 172px">Mật khẩu:</td>
                        <td style="width: 462px">
                            <asp:Label ID="lblPassword" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                    <td style="width: 172px">&nbsp;</td>
                        <td style="width: 462px">      
                            <asp:Button CssClass="btn-danger" ID="btnGoBack" runat="server" Text="Trở về" OnClick="btnGoBack_Click"/>
                        </td>
                    </tr>
            </table>
        </div>
        <asp:HiddenField ID="hiddenFieldValue" runat="server" OnValueChanged="hiddenFieldValue_ValueChanged"  />
        <asp:Label ID="lblDisplay" runat="server" ForeColor="#CC0000" Visible="False"></asp:Label>
        <br />
    </div>

</asp:Content>
