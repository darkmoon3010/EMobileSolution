<%@ Page Title="Chi tiết sản phẩm" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProductDetail.aspx.cs" Inherits="EMobileSolution.ProductDetail" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        
        .product-add-to-cart p {
            background-color: #cb1c22;
            color: white;
            margin: 10px 2px 10px 10px;
            text-align: center;
            width: 200px;
            margin: 20px;
            float: left;
            font-size: 20px;
            
        }
         .product-add-to-cart p span{
             padding-left: 5px
         }
    </style>
    <div class="main-header">
        <%: Title %>
    </div>
    <div style=" float: left; width: 100%; " class="product-detail-list">
        <asp:DataList ID="dlProductDetail" runat="server">
            <ItemTemplate>
                <div style=" float: left; padding-top: 10px; padding-right: 20px;" class="product-image">
                    <img style="width:300px; height:300px" src="<%# ResolveUrl(Convert.ToString(Eval("Image"))) %>"" />
                </div>
                <div class="product-content" >
                    <div style="font-weight: bold; font-size: 30px; text-transform:uppercase" class="product-title">
                        <%#Eval("ProductName") %>
                    </div>
                <div style="color: red; font-size:20px" class="product-price"> Giá: <%#Eval("Price", "{0:###,###,###}") %> VNĐ</div>
                </div>
                <div style="padding: 20px; margin-left: 20px">
                    <h4>Khuyến mãi:</h4>
                    <ol>
                        <li>Tặng Phiếu mua hàng 100,000đ áp dụng mua thẻ cào, thẻ game</li>
                        <li>Giảm 50% giá mua gói bảo hiểm rơi vỡ 6 tháng (trị giá đến 1,000,000đ</li>
                        <li>Giảm 50% giá gói cước 1 năm (Vina350/Vina500) cho Sim VinaPhone trả sau</li>  
                    </ol>
                    <div class="product-add-to-cart">
                     <asp:HyperLink ID="hplAddToCart" runat="server" ToolTip='<%#Eval("ProductName") %>' NavigateUrl='<%# Eval("ProductId","~/ShoppingCart.aspx?proId={0}") %>'>
                      <p> <i class="fas fa-shopping-cart"></i><span>Mua hàng</span></p>  
                     </asp:HyperLink>
                </div>
                </div>
            </ItemTemplate>    
        </asp:DataList>
     </div>    
    
</asp:Content>
