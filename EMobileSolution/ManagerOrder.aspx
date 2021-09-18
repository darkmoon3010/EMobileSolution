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
                <asp:BoundField DataField="OrderId" HeaderText="OrderId" InsertVisible="False" ReadOnly="True" SortExpression="OrderId" />
                <asp:BoundField DataField="OrderName" HeaderText="OrderName" SortExpression="OrderName" />
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
    <div id="divAdd_Edit" runat="server">
        </div>

        <div id="divContentDetail" runat="server">
        </div>
        <asp:HiddenField ID="hiddenFieldValue" runat="server" />
        <asp:Label ID="lblDisplay" runat="server" ForeColor="#CC0000" Visible="False"></asp:Label>
        <br />
</asp:Content>
