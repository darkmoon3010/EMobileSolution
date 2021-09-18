<%@ Page Title="Giỏ hàng" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ShoppingCart.aspx.cs" Inherits="EMobileSolution.ShoppingCart" %>

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
        .auto-style5 {
            width: 55px;
        }
        .auto-style6 {
            width: 701px;
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
        </style>
    <div class="main-header">
        <%:Title %>
    </div>
    <div  class="home-product-list" id="divProductList" runat="server">
        <table  class="auto-style6">
            <tr>
                <th class="auto-style4">Tên</th>
                <th class="auto-style1">Giá</th>
                <th class="auto-style2">Số lượng</th>
                <th class="auto-style3">Tổng tiền mỗi sản phẩm</th>
            </tr>
            <asp:Repeater ID="rptProductList" runat="server" OnItemCreated="rptProductList_ItemCreated" OnItemDataBound="rptProductList_ItemDataBound">
                <ItemTemplate>
                    <tr>
                        <td class="auto-style4">
                             <asp:HyperLink ID="HyperLink2" runat="server" ToolTip='<%#Eval("ProductName") %>' NavigateUrl='<%# Eval("ProductId","~/ProductDetail.aspx?id={0}") %>'>
                                <%#Eval("ProductName") %>
                             </asp:HyperLink>
                            <asp:Label ID="lblProductId" runat="server" Text='<%#Eval("ProductId") %>' Visible="false"></asp:Label>
                        <td class="auto-style1"> <%#Eval("Price", "{0:###,###,###}") %> VNĐ</td>
                        <td class="auto-style2">
                             <%--<input type="text" name="quantity" id="quantity" value="<%#Eval("Quantity") %>" />--%>
                            <asp:TextBox ID="txtQuantity" runat="server" Text='<%#Eval("Quantity") %>'/>
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
                <td class="auto-style3">
                    <asp:Label ID="lblTotalPrices" runat="server" ></asp:Label>
                </td>
            </tr>

        </table>    
        <div class="shopping-cart-actions-button">
            <div class="continue-shopping-button">
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/">Tiếp tục mua</asp:HyperLink>
            </div>
            <div class="update-button">
                <asp:Button ID="btnUpdate" runat="server" Text="Cập nhật" OnClick="btnUpdate_Click" />
            </div>
        </div>
    </div>
      &nbsp;<asp:Label ID="lblText" runat="server" ForeColor="Red"></asp:Label>
</asp:Content>
