<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="MisFav.aspx.cs" Inherits="TP3.MisFav" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

   <div style="background-color: #F3E8DE" class="min-vh-100">
     <div class="text-center">
         <br />
         <br />
         <br />

         <h1>Mis favoritos:</h1>
         <h2><%: Session["userN"] %></h2>

         <br />
         <br />
         <br />

         <img src="<%: Session["userImg"] %>"  alt="tu foto aquí" class="img-thumbnail" style="height: 300px" onerror="this.onerror=null; this.src='https://i.pinimg.com/1200x/cc/da/f2/ccdaf230d29ea7728b28db992e669129.jpg'"/>
         <br />
         <br />
         <br />
          <div class="row justify-content-center">
               <div class="col-8">
                 <asp:GridView ID="ArtFav" runat="server" DataKeyNames="Id" CssClass="table" 
                     AutoGenerateColumns="false" OnSelectedIndexChanged="Artis" OnPageIndexChanging="PagsArt"
                     AllowPaging="True" PageSize="10">
                     <Columns>

                         <asp:BoundField HeaderText="Nombre" DataField="Nombre"/>
                         <asp:BoundField HeaderText="Categoría" DataField="Categoria"/>
                         <asp:BoundField HeaderText="Precio" DataField="Precio"/>
                         <asp:CommandField HeaderText="Seleccionar" ShowSelectButton="true" SelectText="✔️" />

                     </Columns>
                 </asp:GridView>
               </div>
              <br />
              <br />
              <br />
              <div class="row justify-content-center">
                  <asp:Button runat="server" ID="btnEliminar" OnClick="btnElimClick" Text="Eliminar" class="btn btn-outline-dark" style="max-width: 22rem;"/>

                  <asp:Button runat="server" ID="btnVer" OnClick="btnVerClick" Text="Ver" class="btn btn-outline-secondary" style="max-width: 22rem;"/>
              </div>
           </div>
         <br />
         <br />
         <br />
    </div>
    </div>

</asp:Content>
