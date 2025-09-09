<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="SesionIniciada.aspx.cs" Inherits="TP3.SesionIniciada" %>
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
            
            <% if ((string)Session["mensaje"] == "¡Bienvenid@!")
                {%>
            <img src="<%: Session["userImg"] %>"  alt="tu foto aquí" class="img-thumbnail" style="height: 300px" onerror="this.onerror=null; this.src='https://i.pinimg.com/1200x/cc/da/f2/ccdaf230d29ea7728b28db992e669129.jpg'"/>
                <br />
                <br />
                <br />
            <div class="mb-3">
                <label for="Lblsubs" class="form-label">Ahora puedes comprar en la tienda. </label>
            </div>
            <br />
            <br />
            <asp:Button ID="ButMod" runat="server" Text="Modificar" OnClick="ModClik" CssClass="btn btn-outline-secondary" />

            <%} %>

            <asp:Button ID="ButLog" runat="server" Text="Aceptar" OnClick="BLog" CssClass="btn btn-outline-secondary" />
            <br />
            <br />
            <br />
        </div>
    </div>
</asp:Content>
