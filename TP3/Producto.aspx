<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="Producto.aspx.cs" Inherits="TP3.Producto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="min-vh-100"; style="background-color: #F3E8DE">
        <br />
        <br />
        <br />
        <div class="container text-center">
          <div class="row row-cols-2 row-g-3" >
              <div class="col">
                 <img src="<%:Elegida[0].ImagenUrl %>" class="img-thumbnail" alt="..." style="max-width: 20rem" onerror="this.onerror=null; this.src='https://i.pinimg.com/1200x/cc/da/f2/ccdaf230d29ea7728b28db992e669129.jpg'">
              </div>
              <div class="col">
                  <div class="card border-light mb-3" style="max-width: 20rem;">
                      <div class="card-header"><%:Elegida[0].Marca %></div>
                      <div class="card-body">
                          <h5 class="card-title"><%:Elegida[0].Nombre %></h5>
                          <h5 class="card-title"><%:Elegida[0].Precio %></h5>
                          <p class="card-text">Calificación del producto.</p>
                          <p class="card-text">❤️❤️❤️</p>
                          <p class="card-text">Calificación del vendedor.</p>
                          <p class="card-text">❤️❤️❤️</p>
                     <%if (Session["userI"] != null)
                            { %>
                              <asp:RadioButton ID="RaBu1" runat="server" CssClass="btn btn-outline-danger" Text="Me gusta ❤️" OnCheckedChanged ="RadioButton1" AutoPostBack="True" />
                          <%} %>
                      </div>
                  </div>
              </div>
          </div>
        </div>
        <br />
        <br />
        <br />
        <div class="container text-center">
            <div class="row row-cols-2 row-g-3" >
                <div class="col d-flex justify-content-center">
                     <div class="card border-light mb-3" style="max-width: 20rem;">
                         <div class="card-header"><%:Elegida[0].Descripcion %></div>
                         <div class="card-body">
                             <p class="card-text"><%:Elegida[0].Codigo %></p>
                         </div>
                     </div>
                </div>
                <div class="col justify-content-center">
                    <div class="row">
                          <asp:Label ID="Label1" runat="server">¿Cuantos quieres?</asp:Label> 
                          <asp:DropDownList ID="DdlCant" CssClass="form-select" runat="server"> 
                              <asp:ListItem Text="1" />
                              <asp:ListItem Text="2" />
                              <asp:ListItem Text="3" />
                          </asp:DropDownList>
                    </div>
                 <%if (Session["userI"] != null)
                     {
                         if (Session["Modificar"] != null)
                         { %>
                            <div class="row">
                                <asp:Button runat="server" ID="Button1" OnClick="btnModificar" Text="Modificar" class="btn btn-outline-dark" style="max-width: 22rem;"/>
                            </div>
                       <%}
                           else
                           {  %>
                                <div class="row">
                                    <asp:Button runat="server" ID="btnAhora" OnClick="btnAhoraClick" Text="Comprar ahora" class="btn btn-outline-dark" style="max-width: 22rem;"/>
                                </div>
                                <div class="row">
                                    <asp:Button runat="server" ID="btnCarrito" OnClick="btnCarritoClick" Text="Agregar al carrito" class="btn btn-outline-secondary" style="max-width: 22rem;"/>
                                </div>
                         <%}
                   } %>
                </div>
            </div>
        </div>
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
                                <a href="Producto.aspx?id=<%: art.Id %>"  style="text-decoration: none">
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
        <%if ((string)Session["userN"] != null)
            { %>
                <h3 style="font-family: 'Playwrite RO', cursive;">Favoritos</h3>
                <br />
                <br />
                <br />
                    <div class="container text-center">
                        <div class="row row-cols-6 row-g-3">
                            <%foreach (Objetos.Articulo art in favoritos)
                                { %>

                                    <div class="col-4">
                                      <div class="card p-3">
                                        <a href="Producto.aspx?id=<%: art.Id %>"  style="text-decoration: none">
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
          <%} %>
        <h3 style="font-family: 'Playwrite RO', cursive;">¿Quieres preguntar algo?</h3>
        <br />
        <br />
        <br />
            <div class="container text-center">
                
                    <div class ="row">
                        <div class="col-8">
                            <asp:TextBox runat="server" class="form-control" ></asp:TextBox>
                        </div>
                        <div class="col-2">
                            <asp:Button runat="server" Text="Pregunta" class="btn btn-outline-secondary" style="max-width: 5rem;"/>
                        </div>
                    </div>
                
            </div>
        <br />
        <br />
        <br />  
        <h3 style="font-family: 'Playwrite RO', cursive;">Preguntas</h3>
        <br />
        <br />
        <br />
        <asp:GridView ID="Preguntas" runat="server" CssClass="table" DataKeyNames="Id" AutoGenerateColumns="false"
            AllowPaging="true" PageSize="10">
            <Columns>
                <asp:BoundField HeaderText="Usuario" DataField="Usuario" />
                <asp:BoundField HeaderText="Pregunta" DataField="Pregunta" />
                <asp:BoundField HeaderText="Respuesta" DataField="Respuesta" />
            </Columns>
        </asp:GridView>
        <br />
        <br />
        <br />  
        <h3 style="font-family: 'Playwrite RO', cursive;">Opiniones</h3>
        <br />
        <br />
        <br />
        <asp:GridView ID="Opiniones" runat="server" CssClass="table" DataKeyNames="Id" AutoGenerateColumns="false"
            AllowPaging="true" PageSize="10">
            <Columns>
                <asp:BoundField HeaderText="Usuario" DataField="Usuario" />
                <asp:BoundField HeaderText="Pregunta" DataField="Opinión" />
                <asp:BoundField HeaderText="Respuesta" DataField="Corazones" />
            </Columns>
        </asp:GridView>
        <br />
        <br />
        <br />
    </div>
</asp:Content>
