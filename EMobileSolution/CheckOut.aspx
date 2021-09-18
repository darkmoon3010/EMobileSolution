<%@ Page Title="Thanh toán" Language="C#" MasterPageFile="~/Home.master" AutoEventWireup="true" CodeBehind="CheckOut.aspx.cs" Inherits="EMobileSolution.CheckOut" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
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
            width: 608px;
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
            width: 273px;
        }
        .auto-style8 {
            width: 35px;
        }
        </style>
    <div class="main-header">
        <h1><%:Title %></h1>  
    </div>
    <div class="home-product-list" id="divProductList" runat="server">
        <table  class="auto-style6">
            <tr>
                <th class="auto-style4">Tên</th>
                <th class="auto-style1">Giá</th>
                <th class="auto-style2">Số lượng</th>
                <th class="auto-style7">Tổng tiền mỗi sản phẩm</th>
            </tr>
            <asp:Repeater ID="rptProductList" runat="server" >
                <ItemTemplate>
                    <tr>
                        <td class="auto-style4">
                            <asp:HyperLink ID="HyperLink2" runat="server" ToolTip='<%#Eval("ProductName") %>' NavigateUrl='<%# Eval("ProductId","~/HomeProductDetail.aspx?id={0}") %>'>
                                <%#Eval("ProductName") %>
                            </asp:HyperLink>
                            <asp:Label ID="lblProductId" runat="server" Text='<%#Eval("ProductId") %>' Visible="false"></asp:Label>
                        <td class="auto-style1"> <%#Eval("Price", "{0:###,###,###}") %> VNĐ</td>
                        <td class="auto-style2">
                            <asp:TextBox Width="50px" ID="txtQuantity" runat="server" Text='<%#Eval("Quantity") %>' ReadOnly="true"/>
                      
                        </td>
                        <td class="auto-style3">
                            <asp:Label ID="lblSubTotal" runat="server" Text='<%#Eval("Subtotal", "{0:###,###,###}") %>' ></asp:Label>
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
    </div>
        <div class="client-information" id="divClientInfo" style="margin-top: 20px" runat="server">
            <table>
                <tr>
                    <td colspan="2"><b>Thông tin khách hàng</b></td>
                </tr>
                <tr>
                    <td>Họ tên: </td>
                    <td>
                        <asp:TextBox ID="txtName" runat="server" CssClass=""></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Số điện thoại: </td>
                    <td>
                        <asp:TextBox ID="txtPhone" runat="server" CssClass=""></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Email: </td>
                    <td>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass=""></asp:TextBox>
                    </td>
                </tr>
                <tr> 
                    <td>Địa chỉ: </td>
                    <td>
                        <asp:TextBox ID="txtAddress" runat="server" CssClass=""></asp:TextBox>
                    </td>
                </tr>
               <tr>
                  <td>
                      
                  </td>
                  <td>
                   <asp:Button ID="btnCheckOut" runat="server" Text="Thanh toán" OnClick="btnCheckOut_Click" />
                   <asp:Button ID="btnCancel" runat="server" Text="Huỷ" OnClick="btnCancel_Click" />
                  </td>
               </tr>
            </table>
        </div>
    <asp:Label ID="lblText" runat="server" ForeColor="Red"></asp:Label>
</asp:Content>
