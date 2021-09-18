<%@ Page Title="Trang chủ" Language="C#" MasterPageFile="~/Home.master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="EMobileSolution.Home1" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">  
    <asp:Repeater ID="rptLastestProducts" runat="server">
        <ItemTemplate>
            <div class="col mb-5">
                <div class="card h-100">
                    <div style="width: 18rem;">
                <asp:HyperLink ID="HyperLink1" runat="server" ToolTip='<%#Eval("ProductName") %>' NavigateUrl="#">
                    <img style="width:250px; height:250px" src="<%# ResolveUrl(Convert.ToString(Eval("Image"))) %>" alt="<%# Eval("ProductName") %>"/>
                </asp:HyperLink>
                <div class="card-body">
                    <div class="text-center">
                            <!-- Product name-->
                            <h5 class="fw-bolder">
                                <asp:HyperLink style="text-decoration: none" ID="HyperLink2" runat="server" ToolTip='<%#Eval("ProductName") %>' NavigateUrl='<%# Eval("ProductId","~/HomeProductDetail.aspx?id={0}") %>'>
                                    <%#Eval("ProductName") %>
                                </asp:HyperLink>
                            </h5>
                   
                            <!-- Product price-->
                        <span style="color:red">Giá: <%#Eval("Price", "{0:###,###,###}") %> VNĐ</span>
                        <div class="card-footer p-3 pt-0 border-top-0 bg-transparent">
                            <div class="text-center card-footer p-3 pt-0 border-top-0 bg-transparent mt-1">
                                <asp:HyperLink CssClass="btn btn-outline-dark mt-auto" ID="hplAddToCart" runat="server" ToolTip='<%#Eval("ProductName") %>' NavigateUrl='<%# Eval("ProductId","~/HomeShoppingCart.aspx?proId={0}") %>'>
                                    <i class="fas fa-shopping-cart"></i>
                                    Thêm vào giỏ hàng
                                </asp:HyperLink>
                            </div>
                        </div>
                        </div>
                    </div>
                </div>
                </div>
            </div>
        </ItemTemplate>   
    </asp:Repeater>
    </div>
</asp:Content>


