<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="Perfil.aspx.cs" Inherits="TP3.Perfil" %>
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
        <div class="text-center">
        <br />
        <br />
        <br />
        <h1>¡Bienvenid@ <%:Session["userN"] %>!</h1>
        <p class="fst-italic">Aquí puedes cambiar tus datos de acceso.</p>
        <br />
        <br />
        <br />
        <div class="container px-5 text-center">
        <div class="row">
            <div class="col-6">
                
                <div class="mb-3">
                    <label for="txtNombre" class="form-label">Nombre:</label>
                    <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ErrorMessage="Necesitamos tu nombre de usuario" CssClass="validacion" ControlToValidate="txtNombre" runat="server" />
                </div>
                <div class="mb-3">
                    <label for="txtApellido" class="form-label">Apellido:</label>
                    <asp:TextBox ID="txtApellido" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ErrorMessage="Necesitamos tu apellido" CssClass="validacion" ControlToValidate="txtApellido" runat="server" />
                </div>
                <div class="mb-3">
                    <label for="txtContrasena" class="form-label">Contraseña:</label>
                    <asp:TextBox ID="txtContrasena" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ErrorMessage="Ingresa una contraseña" CssClass="validacion" ControlToValidate="txtContrasena" runat="server" />
                </div>
                <div class="mb-3">
                    <label for="txtCorreo" class="form-label">Correo:</label>
                    <asp:TextBox ID="txtCorreo" runat="server" CssClass="form-control" type="email"></asp:TextBox>
                    <asp:RequiredFieldValidator ErrorMessage="Ingresa por favor un email en el que podamos contactarte" CssClass="validacion" ControlToValidate="txtCorreo" runat="server" />
                    <p class="fst-italic">Por favor ten en cuenta que no usamos correo de verificación o publicidad. Sólo te notificaremos en caso de adquirir/cancelar suscripción o de requerir contraseña extraviada.</p>
                </div>
            </div>
            <div class="col-6">
                <div class="mb-3">
                    <label for="txtImagen" class="form-label">Imagen de perfil</label>
                    <asp:TextBox ID="txtImagen" runat="server" CssClass="form-control" AutoPostBack="true" OnTextChanged="txtImgChang"></asp:TextBox>
                    <asp:RequiredFieldValidator ErrorMessage="Usa una imagen que te represente" CssClass="validacion" ControlToValidate="txtImagen" runat="server" />
                </div>
                <div class="mb-3">
                    <img src="<% = img %>"  alt="tu foto aquí" class="img-thumbnail" style="height: 300px" onerror="this.onerror=null; this.src='https://i.pinimg.com/1200x/cc/da/f2/ccdaf230d29ea7728b28db992e669129.jpg'"/>
                </div>

                <br />
                <br />
                <br />
                <asp:Button ID="Aceptar" runat="server" Text="Aceptar" OnClick="BtnAcptClick" CssClass="btn btn-outline-secondary" />
            </div>
        </div>
        </div>
        <br />
        <br />
        <br />
        <br />
        <br />
        </div>
    </div>


</asp:Content>
