<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="Pagado.aspx.cs" Inherits="TP3.Pagado" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="background-color: #F3E8DE" class="min-vh-100">
        <div class="text-center">
            <br />
            <br />
            <br />

            <h2><%: Session["mensaje"]%> </h2>
            <h2><%: Session["userN"] %></h2>

            <br />
            <br />
            <br />

            <img src="https://i.pinimg.com/736x/6b/94/7c/6b947c45b22e4436f5056dbec3079a93.jpg" alt="tu foto aquí" class="img-thumbnail" style="height: 300px" onerror="this.onerror=null; this.src='https://i.pinimg.com/1200x/cc/da/f2/ccdaf230d29ea7728b28db992e669129.jpg'">
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
        </div>
    </div>


</asp:Content>
