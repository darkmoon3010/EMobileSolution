<%@ Page Title="Đăng ký" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="EMobileSolution.SignUp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class=" card card-body" id="txtText">
        <h3><%:Title %></h3>
        <div class="form-group">
            <label for="exampleInputEmail1">Điền Tên đăng nhập</label>
            <asp:TextBox CssClass="form-control" ID="usernameTxt" runat="server"></asp:TextBox>
        </div>
          <div class="form-group">
            <label for="exampleInputPassword1">Điền Mật khẩu</label>
            <asp:TextBox CssClass="form-control" ID="passwordTxt" runat="server" TextMode="Password" ></asp:TextBox>
          </div>
    <asp:Button CssClass="btn btn-primary" ID="btnSignUp" runat="server" Text="Đăng ký" OnClick="Button1_Click" />
        <asp:Label ID="lblText" runat="server"></asp:Label>
    </div>
    </div>
</asp:Content>
