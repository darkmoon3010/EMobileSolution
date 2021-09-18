<%@ Page Title="" Language="C#" MasterPageFile="~/Home.master" AutoEventWireup="true" CodeBehind="HomeProductDetail.aspx.cs" Inherits="EMobileSolution.HomeProductDetail" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row gx-4 gx-lg-5 align-items-center"  >
        <asp:DataList  ID="dlProductDetail" runat="server">
       <ItemTemplate >
                <img style="width:300px; height:300px" src="<%# ResolveUrl(Convert.ToString(Eval("Image"))) %>"" />
            <div class="col-md-6" style="float: right">
                <h1 class="display-5 fw-bolder">
                     <%#Eval("ProductName") %>
                </h1>
                <div class="fs-5 mb-5">
                    <span style="color: red">Giá: <%#Eval("Price", "{0:###,###,###}") %> VNĐ</span>
                </div>
                <p class="lead">
                    <h4>Khuyến mãi:</h4>
                    <ol>
                        <li>Tặng Phiếu mua hàng 100,000đ áp dụng mua thẻ cào, thẻ game</li>
                        <li>Giảm 50% giá mua gói bảo hiểm rơi vỡ 6 tháng (trị giá đến 1,000,000đ</li>
                        <li>Giảm 50% giá gói cước 1 năm (Vina350/Vina500) cho Sim VinaPhone trả sau</li>  
                    </ol>
                </p>
                <div class="d-flex">
                    <button class="btn btn-outline-dark flex-shrink-0" type="button">
                        <i class="fas fa-shopping-cart"></i>
                        <asp:HyperLink style="text-decoration:none" ID="hplAddToCart" runat="server" ToolTip='<%#Eval("ProductName") %>' NavigateUrl='<%# Eval("ProductId","~/HomeShoppingCart.aspx?proId={0}") %>'>
                            <span>Mua hàng</span>
                        </asp:HyperLink>
                    </button>
                </div>
            </div>
         </ItemTemplate>
    </asp:DataList>
    </div>
</asp:Content>


