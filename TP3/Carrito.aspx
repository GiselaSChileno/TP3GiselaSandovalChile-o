<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="Carrito.aspx.cs" Inherits="TP3.Carrito" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="min-vh-100"; style="background-color: #F3E8DE">
    <br />
    <br />
    <br />
    <h3 style="font-family: 'Playwrite RO', cursive;">Carrito de compras</h3>
    <br />
    <br />
    <br />
    <div class="container text-center">
        <%if (Session["vacio"] != null)
            { %>
        <img src="https://i.pinimg.com/1200x/3a/2d/bc/3a2dbc765e5dd3dcc7caab782a8238ba.jpg" class="card-img-top" alt="..." style="height: 15rem; width: auto" onerror="this.onerror=null; this.src='https://i.pinimg.com/1200x/cc/da/f2/ccdaf230d29ea7728b28db992e669129.jpg'">

        <%}
            else
            { %>
        <asp:Repeater ID="Repeater1" runat="server">
            <ItemTemplate>
                <div class="d-flex justify-content-center align-items-center">
                    <div class="col-4">
                        <div class="row">
                            <div class="card">
                                <a href="Producto.aspx?id=<%#Eval("Id") %>" style="text-decoration: none">
                                    <img src="<%#Eval("ImagenUrl") %>" class="img-fluid rounded-start" alt="..." style="height: 15rem; width: auto" onerror="this.onerror=null; this.src='https://i.pinimg.com/1200x/cc/da/f2/ccdaf230d29ea7728b28db992e669129.jpg'">
                                </a>
                                <div class="col">
                                    <div class="card-body">
                                        <h5 class="card-title"><%#Eval("Nombre") %></h5>
                                        <p class="card-text"><%#Eval("Descripcion") %></p>
                                        <p class="card-text"><small class="text-body-secondary">Cantidad: <%#Eval("Cantidad") %></small></p>
                                        <p class="card-text"><small class="text-body-secondary">Total: <%#Eval("Costo") %></small></p>
                                        <asp:Button ID="Btn" Text="Modificar" runat="server" CssClass="btn btn-outline-info" OnClick="BtnMod" CommandArgument='<%#Eval("Id") %>' CommandName="ArtId" />
                                        <asp:Button ID="Button1" Text="Eliminar" runat="server" CssClass="btn btn-outline-danger" OnClick="BtnEliminar" CommandArgument='<%#Eval("Id") %>' CommandName="ArtIdEl" />
                                        <asp:Button ID="Button2" Text="Eliminar" runat="server" CssClass="btn btn-outline-success" OnClick="BtnPagar" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <br />
                <br />
                <br />
            </ItemTemplate>
        </asp:Repeater>
        <br />
        <br />
        <br />
        <div class="text-right">
            <h5 style="font-family: 'Playwrite RO', cursive;">Total: <%: (decimal)Session["total"] %></h5>
        </div>
        <%} %>
        <br />
        <br />
        <br />
        <h3 style="font-family: 'Playwrite RO', cursive;">Relacionados</h3>
        <br />
        <br />
        <br />
        <div class="container text-center">
            <div class="row row-cols-6 row-g-3">
                <%foreach (Objetos.Articulo art in Relacionados)
                    { %>

                <div class="col-4">
                    <div class="card p-3">
                        <a href="Producto.aspx?id=<%: art.Id %>" style="text-decoration: none">
                            <img src="<%:art.ImagenUrl %>" class="card-img-top" alt="..." style="height: 5rem; width: auto" onerror="this.onerror=null; this.src='https://i.pinimg.com/1200x/cc/da/f2/ccdaf230d29ea7728b28db992e669129.jpg'">
                        </a>
                        <div class="card-body">
                            <h5 class="card-title"><%:art.Nombre%></h5>
                            <p class="card-text"><%:art.Precio %></p>
                            <p class="card-text"><%:art.Descripcion %></p>
                        </div>
                    </div>
                </div>

                <%} %>
            </div>
        </div>
        <br />
        <br />
        <br />
    </div>
</div>

</asp:Content>
