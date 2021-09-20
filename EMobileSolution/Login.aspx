<%@ Page Title="Đăng nhập" Language="C#" MasterPageFile="~/Home.master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="EMobileSolution.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <div class="card card-body" id="txtText">
        <h3><%:Title %></h3>
        <div class="form-group">
            <label for="exampleInputEmail1"> Tên đăng nhập</label>
            <asp:TextBox CssClass="form-control" ID="usernameTxt" runat="server"></asp:TextBox>
        </div>
          <div class="form-group">
            <label for="exampleInputPassword1"> Mật khẩu</label>
            <asp:TextBox CssClass="form-control" ID="passwordTxt" runat="server" TextMode="Password" ></asp:TextBox>
          </div>
    <asp:Button CssClass="btn btn-primary" ID="btnSignUp" runat="server" Text="Đăng nhập" OnClick="Button1_Click" />
        <asp:Label ID="lblText" runat="server"></asp:Label>
    </div>
</asp:Content>
    