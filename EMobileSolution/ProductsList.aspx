<%@ Page Title="Sản phẩm" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProductsList.aspx.cs" Inherits="EMobileSolution.ProductsList" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
     <div class="container">
        <div class="main-header">
            <%: Title %>
        </div>
        <div class="home-product-list">
             <asp:Repeater ID="rptLastestProducts" runat="server">
                 <ItemTemplate>
                <div class="product-content">
                 
                <div class="product-image">
                
                    <asp:HyperLink ID="HyperLink1" runat="server" ToolTip='<%#Eval("ProductName") %>' NavigateUrl="#">
                        <img style="width:250px; height:250px" src="<%# ResolveUrl(Convert.ToString(Eval("Image"))) %>" alt="<%# Eval("ProductName") %>"/>
                    </asp:HyperLink>
                </div>
                <div class="product-title" >
                   <!-- <a >Iphone 12 ProMax 128gb</a> -->
                    <asp:HyperLink ID="HyperLink2" runat="server" ToolTip='<%#Eval("ProductName") %>' NavigateUrl='<%# Eval("ProductId","~/ProductDetail.aspx?id={0}") %>'>
                        <%#Eval("ProductName") %>
                    </asp:HyperLink>
                </div>
                <div class="product-price">
                    Giá: <%#Eval("Price", "{0:###,###,###}") %> VNĐ
                </div>
                <div class="product-add-to-cart">
                    <asp:HyperLink ID="hplAddToCart" runat="server" ToolTip='<%#Eval("ProductName") %>' NavigateUrl='<%# Eval("ProductId","~/ShoppingCart.aspx?proId={0}") %>'>
                         <p><i class="fas fa-shopping-cart"></i> <span>Thêm vào giỏ hàng</span></p>
                    </asp:HyperLink>
                </div>
            </div>
             </ItemTemplate>   
                </asp:Repeater>
        </div>
               
        </div>
</asp:Content>
