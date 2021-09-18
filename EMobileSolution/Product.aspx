<%@ Page Title="Product" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="EMobileSolution.Product" %>
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

     <asp:Button class="button" ID="btnAddNew" runat="server" Text="Thêm mới" OnClick="btnAddNew_Click" />
    </div>
    <div class="main-data" id="divGridView" runat="server">
        <asp:GridView ID="grvListProduct" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" Height="183px" AutoGenerateColumns="False" Width="295px" OnRowCommand="grvListProduct_RowCommand" >
            <Columns>
                <asp:TemplateField HeaderText="STT">
                    <ItemTemplate>
                        <%# Container.DataItemIndex +1 %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:HyperLinkField DataNavigateUrlFields="ProductId" DataTextField="ProductName" HeaderText="Tên Sản Phẩm" DataNavigateUrlFormatString="~/Product.aspx?id={0}" NavigateUrl="~/Product.aspx" />
                <asp:TemplateField HeaderText="Sửa">
                    <ItemTemplate>
                        <asp:ImageButton ID="btnEdit" runat="server" CommandArgument='<%# Eval("ProductId") %>' CommandName="_edit" Height="25px" ImageUrl="~/images/icon/PinClipart.com_microsoft-clipart-online_1646319.png" Width="20px" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Xoá">
                    <ItemTemplate>
                        <asp:ImageButton ID="btnDelete" runat="server" CommandArgument='<%# Eval("ProductId") %>' CommandName="_delete" Height="23px" ImageUrl="~/images/icon/PinClipart.com_trash-clipart_5787306.png" Width="20px"/>
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
        <table style="width: 60%; border:1px solid black">
            <tr>
                <td class="text-center" colspan="2" style="height: 21px" aria-autocomplete="inline"><strong>Thêm Sản phẩm</strong></td>
            </tr>
            <tr>
                <td style="width: 211px; height: 23px;" aria-autocomplete="inline">Tên sản phẩm</td>
                <td style="height: 23px; width: 332px;" aria-autocomplete="inline">
                    <asp:TextBox ID="txtProductName" runat="server" Width="191px" ></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 211px; height: 23px;" aria-autocomplete="inline">Hình ảnh</td>
                <td style="height: 23px; width: 332px;" aria-autocomplete="inline">
                    <asp:FileUpload ID="FileUpload1" runat="server" />
                </td>
            </tr>
            <tr>
                <td style="width: 211px; height: 23px;" aria-autocomplete="inline">Giá:</td>
                <td style="height: 23px; width: 332px;" aria-autocomplete="inline">
                    <asp:TextBox ID="txtPrice" runat="server" Width="191px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 211px; height: 23px;" aria-autocomplete="inline">Danh mục:</td>
                <td style="height: 23px; width: 332px;" aria-autocomplete="inline">
                    <asp:DropDownList ID="drdlCategory" runat="server">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td style="width: 211px" aria-autocomplete="inline">&nbsp;</td>
                <td style="width: 332px" aria-autocomplete="inline" class="modal-sm">
                    <asp:Button ID="btnAdd" runat="server" Text="Thêm" Width="50px" OnClick="btnAdd_Click" style="height: 26px" />
                    <asp:Button ID="btnCancel" runat="server" Text="Huỷ" Width="50px" OnClick="btnCancel_Click" />
                </td>
            </tr>
        </table>
        </div>

        <div id="divContentDetail" runat="server">
             <table style="width: 60%; border-collapse: collapse; border-style: solid; border-width: 1px">
                 <tr>
                     <td colspan="2" class="text-center"><strong>Chi tiết nội dung</strong></td>
                 </tr>
                 <tr>
                    <td style="width: 172px; height: 20px;">Tên sản phẩm:</td>
                        <td style="width: 462px; height: 20px;">
                        <asp:Label ID="lblName" runat="server"></asp:Label>
                    </td>    
                 </tr>
                 <tr>
                     <td style="width: 172px; height: 20px;">Hình ảnh:</td>
                     <td style="width: 462px; height: 20px;">
                         <asp:Image ID="Image1" runat="server" />
                     </td>
                 </tr>
                 <tr>
                      <td style="width: 172px">Giá:</td>
                      <td style="width: 462px">
                      <asp:Label ID="lblPrice" runat="server"></asp:Label>
                      </td>
                  </tr>
                   <tr>
                      <td style="width: 172px">Danh mục:</td>
                      <td style="width: 462px">
                      <asp:Label ID="lblCategory" runat="server"></asp:Label>
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
        <asp:HiddenField ID="hiddenFieldValue" runat="server" />
        <asp:Label ID="lblDisplay" runat="server" ForeColor="#CC0000" Visible="False"></asp:Label>
        <br />
   
</asp:Content>
