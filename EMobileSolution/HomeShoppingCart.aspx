<%@ Page Title="Giỏ hàng" Language="C#" MasterPageFile="~/Home.master" AutoEventWireup="true" CodeBehind="HomeShoppingCart.aspx.cs" Inherits="EMobileSolution.HomeShoppingCart" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
    table, th, td {
        border: 1px solid black;
        padding-left: 5px;
    }
        .auto-style1 {
            width: 125px;
        }
        .auto-style2 {
            width: 87px;
        }
        .auto-style3 {
            width: 185px;
        }
        .auto-style4 {
            width: 163px;
        }
        .auto-style6 {
            width: 880px;
        }
        .continue-shopping-button{
            color: white;
            float: left;
            text-align: left;
            padding: 10px;
            font-weight: bold;
            background-color:#0664f9; 
            margin: 10px 0 10px 0;
        }
        .continue-shopping-button a {
            color: white;
            text-decoration: none;
        }
        .shopping-cart-actions-button .update-button {
            float: left;
        }
        .shopping-cart-actions-button .update-button input{
            background-color: #cb1c22;
            color: white;
            border: none;
            font-weight: bold;
            margin: 10px 0 10px 10px;
            padding: 10px 22px 10px 22px;
        }
        .auto-style7 {
            width: 303px;
        }
        .auto-style9 {
            width: 201px;
        }
        .auto-style10 {
            width: 204px;
        }
        </style>
    <div class="main-header">
        <h1><%:Title %></h1>  
    </div>
    <div  class="home-product-list" id="divProductList" runat="server">
        <table  class="auto-style6">
            <tr>
                <th class="auto-style3">Tên</th>
                <th class="auto-style9">Giá</th>
                <th class="auto-style10">Số lượng</th>
                <th class="auto-style7">Tổng tiền mỗi sản phẩm</th>
            </tr>
            <asp:Repeater ID="rptProductList" runat="server" OnItemCreated="rptProductList_ItemCreated" OnItemDataBound="rptProductList_ItemDataBound">
                <ItemTemplate>
                    <tr>
                        <td class="auto-style4">
                             <asp:HyperLink ID="HyperLink2" runat="server" ToolTip='<%#Eval("ProductName") %>' NavigateUrl='<%# Eval("ProductId","~/HomeProductDetail.aspx?id={0}") %>'>
                                <%#Eval("ProductName") %>
                             </asp:HyperLink>
                            <asp:Label ID="lblProductId" runat="server" Text='<%#Eval("ProductId") %>' Visible="false"></asp:Label>
                        <td class="auto-style1"> <%#Eval("Price", "{0:###,###,###}") %> VNĐ</td>
                        <td class="auto-style2">
                            <asp:TextBox Width="100px" ID="txtQuantity" runat="server" Text='<%#Eval("Quantity") %>'/>
                            <br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Nhập số lượng" ControlToValidate="txtQuantity"></asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Phải là số" Operator="DataTypeCheck" Type="Integer" ControlToValidate="txtQuantity"></asp:CompareValidator>
                        </td>
                        <td class="auto-style3">
                            <asp:Label ID="lblSubTotal" runat="server" Text='<%#Eval("Subtotal", "{0:###,###,###}") %>' ></asp:Label>
                        </td>
                        <td>
                            <asp:LinkButton ID="linkDelete" runat="server" OnClick="linkDelete_Click"> Xoá </asp:LinkButton>
                        </td>
                    </tr>
                </ItemTemplate>    
                
            </asp:Repeater>       
            <tr>
                <td colspan="3" class="total-price-text">Tổng tiền</td>
                <td class="auto-style7">
                    <asp:Label ID="lblTotalPrices" runat="server" ></asp:Label>
                </td>
            </tr>

        </table>    
        <div class="shopping-cart-actions-button">
            <div class="continue-shopping-button">
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Home">Tiếp tục mua</asp:HyperLink>
            </div>
            <div class="update-button">
                <asp:Button ID="btnUpdate" runat="server" Text="Cập nhật" OnClick="btnUpdate_Click" />
            </div>
            <div class="continue-shopping-button" style="margin-left: 5px; background-color:#0664f9 ">
                <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/CheckOut">Thanh toán</asp:HyperLink>
            </div>
        </div>
    </div>
      &nbsp;<asp:Label ID="lblText" runat="server" ForeColor="Red"></asp:Label>
</asp:Content>
