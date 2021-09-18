<%@ Page Title="Category" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Category.aspx.cs" Inherits="EMobileSolution.Category" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
         table, th, td {
            border: 1px solid black;
            padding-left: 5px
         }
        .auto-style1 {
            height: 23px;
            width: 289px;
        }
        .auto-style2 {
            width: 289px;
        }
    </style>
    <div class="main-header">
        <%: Title %> 
    </div>
    <div style="margin: 10px 0 10px 0"">

     <asp:Button class="button" ID="btnAddNew" runat="server" Text="Thêm mới" OnClick="btnAddNew_Click" />
    </div>
    <div class="main-data" id="divGridView" runat="server">
        <asp:GridView ID="grvListCategory" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" Height="183px" AutoGenerateColumns="False" Width="295px" OnRowCommand="grvListCategory_RowCommand" >
            <Columns>
                <asp:TemplateField HeaderText="STT">
                    <ItemTemplate>
                        <%# Container.DataItemIndex +1 %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:HyperLinkField DataNavigateUrlFields="CategoryId" DataTextField="Name" HeaderText="Tên Mục" DataNavigateUrlFormatString="~/Category.aspx?id={0}" NavigateUrl="~/Category.aspx" />
                <asp:TemplateField HeaderText="Sửa">
                    <ItemTemplate>
                        <asp:ImageButton ID="btnEdit" runat="server" CommandArgument='<%# Eval("CategoryId") %>' CommandName="_edit" Height="25px" ImageUrl="~/images/icon/PinClipart.com_microsoft-clipart-online_1646319.png" Width="20px" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Xoá">
                    <ItemTemplate>
                        <asp:ImageButton ID="btnDelete" runat="server" CommandArgument='<%# Eval("CategoryId") %>' CommandName="_delete" Height="23px" ImageUrl="~/images/icon/PinClipart.com_trash-clipart_5787306.png" Width="20px" />
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
                <td class="text-center" colspan="2" style="height: 21px"><strong>Thêm danh mục</strong></td>
            </tr>
            <tr>
                <td style="width: 211px; height: 23px;">Tên danh mục</td>
                <td class="auto-style1">
                    <asp:TextBox ID="txtCategoryName" runat="server" Width="191px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 211px">&nbsp;</td>
                <td class="auto-style2">
                    <asp:Button ID="btnAdd" runat="server" Text="Thêm" Width="50px" OnClick="btnAdd_Click" style="height: 26px" />
                    <asp:Button ID="btnCancel" runat="server" Text="Huỷ" Width="50px" OnClick="btnCancel_Click" />
                </td>
            </tr>
        </table>
        <div id="divContentDetail" runat="server">
             <table style="width: 60%; border-collapse: collapse; border-style: solid; border-width: 1px">
                 <tr>
                     <td colspan="2" class="text-center"><strong>Chi tiết nội dung</strong></td>
                 </tr>
                    <tr>
                        <td style="width: 172px">Tên danh mục:</td>
                        <td style="width: 462px">
                            <asp:Label ID="lblName" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                    <td style="width: 172px">&nbsp;</td>
                        <td style="width: 462px">      
                            <asp:Button ID="btnGoBack" runat="server" Text="Trở về" OnClick="btnGoBack_Click"/>
                        </td>
                    </tr>
            </table>
        </div>
        <asp:HiddenField ID="hiddenFieldValue" runat="server"  />
        <asp:Label ID="lblDisplay" runat="server" ForeColor="#CC0000" Visible="False"></asp:Label>
        <br />
    </div>
</asp:Content>
