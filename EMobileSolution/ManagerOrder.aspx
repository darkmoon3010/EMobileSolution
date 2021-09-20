<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ManagerOrder.aspx.cs" Inherits="EMobileSolution.ManagerOrder" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
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
    </div>
    <div class="main-data" id="divGridView" runat="server">
        <asp:GridView ID="grvListProduct" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" Height="183px" AutoGenerateColumns="False" Width="295px" DataKeyNames="OrderId" DataSourceID="SqlDataSource1" >
            <Columns>
                <asp:HyperLinkField DataNavigateUrlFields="OrderId" DataTextField="OrderId" HeaderText="OrderId" DataNavigateUrlFormatString="~/ManagerOrder.aspx?id={0}" NavigateUrl="~/ManagerOrder.aspx" />
                <asp:BoundField DataField="OrderDate" HeaderText="OrderDate" SortExpression="OrderDate" />
                <asp:BoundField DataField="PaymentType" HeaderText="PaymentType" SortExpression="PaymentType" />
                <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
                <asp:BoundField DataField="CustomerName" HeaderText="CustomerName" SortExpression="CustomerName" />
                <asp:BoundField DataField="CustomerPhone" HeaderText="CustomerPhone" SortExpression="CustomerPhone" />
                <asp:BoundField DataField="CustomerEmail" HeaderText="CustomerEmail" SortExpression="CustomerEmail" />
                <asp:BoundField DataField="CustomerAddress" HeaderText="CustomerAddress" SortExpression="CustomerAddress" />   
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:EMobileDBConnectionString %>" SelectCommand="SELECT * FROM [Order]"></asp:SqlDataSource>
        <br />
       </div>

           <div class="home-product-list" id="divProductList" runat="server">
                 <h4>Chi tiết hoá đơn</h4>
        <table class="auto-style6">
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
                            <asp:HyperLink ID="HyperLink2" runat="server" ToolTip='<%#Eval("Product.ProductName") %>' NavigateUrl='<%# Eval("ProductId","~/HomeProductDetail.aspx?id={0}") %>'>
                                <%#Eval("Product.ProductName") %>
                            </asp:HyperLink>
                        <td class="auto-style1"> <%#Eval("Price", "{0:###,###,###}") %> VNĐ</td>
                        <td class="auto-style2">
                            <asp:TextBox Width="50px" ID="txtQuantity" runat="server" Text='<%#Eval("Quantity") %>' ReadOnly="true"/>
                      
                        </td>
                        <td class="auto-style3">
                         <%# string.Format("{0:###,###,###}", Convert.ToInt32(Eval("Quantity")) * Convert.ToInt32(Eval("Price"))) %>
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
            <tr>
                <asp:Button CssClass="btn btn-danger" ID="btnGoBack" runat="server" Text="Trở về" OnClick="btnGoBack_Click"/>
            </tr>
        </table>    
    </div>
        <asp:HiddenField ID="hiddenFieldValue" runat="server" />
        <asp:Label ID="lblDisplay" runat="server" ForeColor="#CC0000" Visible="False"></asp:Label>
        <br />
</asp:Content>
