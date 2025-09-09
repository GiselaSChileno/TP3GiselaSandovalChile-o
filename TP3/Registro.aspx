<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="Registro.aspx.cs" Inherits="TP3.Registro" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .validacion{
            color:red;
            font-size: 12px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div class="min-vh-100"; style="background-color: #F3E8DE">
    <br />
    <br />
    <br />
    <div class="container text-center">
        <%if (Request.QueryString["id"] == "reg")
            { %>
        <div class="text-start">
            <h3 style="font-family: 'Playwrite RO', cursive;">Regístrate</h3>
            <br />
            <br />
            <br />
            <h5 style="font-family: 'Playwrite RO', cursive;">Por favor ingresa los siguientes datos:</h5>
            <br />
            <br />
            <br />
            </div>
            <div class="col-6 text-start">
            <div class="mb-3">
                <label for="txtNombre" class="form-label">Nombre:</label>
                <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="mb-3">
                <label for="txtApellido" class="form-label">Apellido:</label>
                <asp:TextBox ID="txtApellido" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <%}
                else
                { %>
            <div class="text-start">
                <h3 style="font-family: 'Playwrite RO', cursive;">Ingresa a tu cuenta:</h3>
                <br />
                <br />
                <br />
                <%} %>

                <div class="mb-3">
                    <label for="txtCorreo" class="form-label">Correo:</label>
                    <asp:TextBox ID="txtCorreo" runat="server" CssClass="form-control" type="email"></asp:TextBox>
                    <asp:RequiredFieldValidator ErrorMessage="Ingresa tu correo" CssClass="validacion" ControlToValidate="txtCorreo" runat="server" />
                    <p class="fst-italic">Por favor ten en cuenta que no usamos correo de verificación o publicidad. Sólo te notificaremos en caso de adquirir/cancelar suscripción o de requerir contraseña extraviada.</p>
                    <p class="fst-italic">Si olvidaste tu contraseña por favor escribe desde tu correo registrado a ...</p>
                </div>
                <div class="mb-3">
                    <label for="txtContrasena" class="form-label">Contraseña:</label>
                    <asp:TextBox ID="txtContrasena" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ErrorMessage="Ingresa una contraseña" CssClass="validacion" ControlToValidate="txtContrasena" runat="server" />
                </div>
            </div>
        <br />
        <br />
        <br />
        <br />
        <asp:Button ID="Aceptar" runat="server" Text="Aceptar" OnClick="BtnAcptClick" CssClass="btn btn-outline-secondary" />
            <br />
            <br />
            <br />
        </div>
    </div>
   
 </div>

</asp:Content>
