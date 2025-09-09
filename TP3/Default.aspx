<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TP3.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="min-vh-100"; style="background-color: #F3E8DE">

    <div id="carouselExampleFade" class="carousel carousel-dark slide carousel-fade" data-bs-ride="carousel">
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="Utilidades\Anun.jpg" class="d-block w-100" style="height: 400px" alt="...">
            </div>
            <div class="carousel-item">
                <img src="Utilidades\Moda.jpg" class="d-block w-100" style="height: 400px" alt="...">
            </div>
            <div class="carousel-item">
                <img src="Utilidades\Tec.jpg" class="d-block w-100" style="height: 400px" alt="...">
            </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>
    <br />
    <br />
    <br />
    <h1 style="font-family: 'Playwrite RO', cursive;">Populares</h1>
    <br />
    <br />
    <br />

         <div class="container text-center">
            <div class="row row-cols-3 row-g-3" >

                <% for (int x = 0; x < 3; x++)
                    { %>
                      <div class="col-4">
                        <div class="card p-3">
                          <a href="Producto.aspx?id=<%:populares[x].Id %>" style="text-decoration: none">
                            <img src="<%: populares[x].ImagenUrl %>" class="card-img-top" alt="..." style="height: 15rem; width: auto" onerror="this.onerror=null; this.src='https://i.pinimg.com/1200x/cc/da/f2/ccdaf230d29ea7728b28db992e669129.jpg'">
                          </a>
                          <div class="card-body">
                            <h5 class="card-title"><%:populares[x].Nombre%></h5>
                            <p class="card-text"><%:populares[x].Precio %></p>
                            <p class="card-text"><%:populares[x].Descripcion %></p>
                          </div>
                        </div>
                      </div>
                 <% } %>
            </div>
        </div>
    <br />
    <br />
    <br />
    <%if ((string)Session["userM"] != null)
      { %>
            <h1 style="font-family: 'Playwrite RO', cursive;">Favoritos</h1>
            <br />
            <br />
            <br />
                <div class="container text-center">
                    <div class="row row-cols-3 row-g-3">

                        <% foreach (Objetos.Articulo fav in favoritos)
                            { %>
                            <div class="col-4">
                                <div class="card p-3">
                                    <a href="Producto.aspx?id=<%:fav.Id %>" style="text-decoration: none">
                                        <img src="<%:fav.ImagenUrl %>" class="card-img-top" alt="..." style="height: 15rem; width: auto" onerror="this.onerror=null; this.src='https://i.pinimg.com/1200x/cc/da/f2/ccdaf230d29ea7728b28db992e669129.jpg'">
                                    </a>
                                    <div class="card-body">
                                        <h5 class="card-title"><%:fav.Nombre%></h5>
                                        <p class="card-text"><%:fav.Precio %></p>
                                        <p class="card-text"><%:fav.Descripcion %></p>
                                    </div>
                                </div>
                            </div>
                        <% } %>
                    </div>
                </div>
             <br />
             <br />
             <br />
    <%} %>
   
 </div>           
</asp:Content>
