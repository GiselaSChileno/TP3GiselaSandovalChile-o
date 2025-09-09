<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="Lista.aspx.cs" Inherits="TP3.Lista" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="min-vh-100"; style="background-color: #F3E8DE">

    <br />
    <br />
    <br />
    <h1>Administración de artículos a la venta:</h1>
    <br />
    <br />
    <br />
    <br />
    <br />
    <div class="row justify-content-center">
      <div class="col-8">
        <asp:GridView ID="ArtVent" runat="server" DataKeyNames="Id" CssClass="table" 
            AutoGenerateColumns="false" OnSelectedIndexChanged="Artis" OnPageIndexChanging="PagsArt"
            AllowPaging="True" PageSize="10">
            <Columns>

                <asp:BoundField HeaderText="Código" DataField="Codigo"/>
                <asp:BoundField HeaderText="Nombre" DataField="Nombre"/>
                <asp:BoundField HeaderText="Categoría" DataField="Categoria"/>
                <asp:BoundField HeaderText="Precio" DataField="Precio"/>
                <asp:CommandField HeaderText="Modificar" ShowSelectButton="true" SelectText="✏️" />

            </Columns>
        </asp:GridView>
          <br />
          <br />
          <br />
        <a href="Modificar.aspx" class="btn btn-outline-success">Agregar nuevo producto</a>
          <br />
          <br />
          <br />
     </div>
   </div>
</div>
</asp:Content>
