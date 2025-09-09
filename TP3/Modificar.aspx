<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="Modificar.aspx.cs" Inherits="TP3.Modificar" %>
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

        <div class="text-start">
            <br />
            <br />
            <br />
            <h5 style="font-family: 'Playwrite RO', cursive;">Administrar producto:</h5>
            <br />
            <br />
            <br />
        </div>
        <div class="col-6 text-start">
            <div class="mb-3">
                <label for="txtCodigo" class="form-label">Código:</label>
                <asp:TextBox ID="txtCodigo" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RegularExpressionValidator ErrorMessage="Por favor usa una letra mayuscula y dos números." ValidationExpression="^[A-Z]\d{2}$" CssClass="validacion" ControlToValidate="txtCodigo" runat="server" />
            </div>
            <div class="mb-3">
                <label for="txtNombre" class="form-label">Nombre:</label>
                <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ErrorMessage="No olvides el nombre de tu artículo." CssClass="validacion" ControlToValidate="txtNombre" runat="server" />
            </div>
            <div class="mb-3">
                <label for="txtDescripcion" class="form-label">Descripción:</label>
                <asp:TextBox ID="txtDescripcion" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ErrorMessage="Describe tu producto" CssClass="validacion" ControlToValidate="txtDescripcion" runat="server" />
            </div>
            <div class="col justify-content-center">
                <div class="row">
                      <asp:Label ID="Label1" runat="server">Marca:</asp:Label> 
                      <asp:DropDownList ID="DdlMarca" CssClass="form-select" runat="server"> 
                      </asp:DropDownList>
                    <asp:RequiredFieldValidator ErrorMessage="Por favor elige una Marca" CssClass="validacion" ControlToValidate="DdlMarca" runat="server" />
                </div>
                <div class="row">
                      <asp:Label ID="Label2" runat="server">Categoria:</asp:Label> 
                      <asp:DropDownList ID="DdlCate" CssClass="form-select" runat="server"> 
                      </asp:DropDownList>
                    <asp:RequiredFieldValidator ErrorMessage="Por favor selecciona una categoría" CssClass="validacion" ControlToValidate="DdlCate" runat="server" />
                </div>
            </div>
            <div class="mb-3">
                <label for="txtUrl" class="form-label">Imagen:</label>
                <asp:TextBox ID="TxtImagen" runat="server" CssClass="form-control" AutoPostBack="true" OnTextChanged="CambioImagen" ></asp:TextBox>
                 <asp:RequiredFieldValidator ControlToValidate="TxtImagen" runat="server" CssClass="validacion" ErrorMessage="Agrega aquí el enlace a tu imagen"></asp:RequiredFieldValidator>
            </div>
            <asp:Image ImageUrl="https://i.pinimg.com/1200x/cc/da/f2/ccdaf230d29ea7728b28db992e669129.jpg" ID="Image1" runat="server" style="max-width: 20rem" class="img-thumbnail" onerror="this.onerror=null; this.src='https://i.pinimg.com/1200x/cc/da/f2/ccdaf230d29ea7728b28db992e669129.jpg'" />
            </div>
            <div class="mb-3">
                <label for="txtPrecio" class="form-label">Precio:</label>
                <asp:TextBox ID="TxtPrecio" runat="server" CssClass="form-control" ></asp:TextBox>
                <asp:RegularExpressionValidator ErrorMessage="Por favor ingresa una cantidad" CssClass="validacion" ControlToValidate="TxtPrecio" ValidationExpression="^\d+(\.\d+)?$" runat="server" />
            </div>
        <br />
        <br />
        <br />
        <br />
        <asp:Button ID="Aceptar" runat="server" Text="Aceptar" OnClick="BtnAcptClick" CssClass="btn btn-outline-secondary" />

        <asp:Button ID="Eliminar" runat="server" Text="Eliminar" OnClick="BtnElim" CssClass="btn btn-outline-warning" />

        <%if (ConfirmaEliminacion)
            { %>
                <div class="mb-3">
                    <asp:CheckBox Text="Confirmar Eliminación" ID="CheckBox1" runat="server" />
                    <br />
                    <asp:Button Text="Eliminar" ID="BtnConfirmar" runat="server" CssClass="btn btn-outline-danger" OnClick="Confirmar"/>
                </div>
          <%} %>
         <br />
         <br />
         <br />
         <br />
         <br />
        </div>
    </div>
</asp:Content>
