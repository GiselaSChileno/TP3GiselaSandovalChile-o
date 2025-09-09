<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="Busqueda.aspx.cs" Inherits="TP3.Busqueda" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="min-vh-100"; style="background-color: #F3E8DE">
        <div class="container text-center">
            <br />
            <br />
            <br />
            <br />
            <br />
            <h1><%:(string)Session["Buscar"] %></h1>
            <br />
            <br />
        </div>
        <div style="background-color: #F3E8DE">
            <br />
            <br />
            <br />
            <div class="container text-center">
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
                                                <p class="card-text"><small class="text-body-secondary">Precio: <%#Eval("Precio") %></small></p>
                                                <p class="card-text"><small class="text-body-secondary">Marca: <%#Eval("Marca") %></small></p>
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
                <div>
                    <div class="row justify-content-center">
                        <div class="col-8">
                            <asp:GridView ID="GridView1" runat="server" DataKeyNames="Id" CssClass="table table-secondary"
                                AutoGenerateColumns="false" OnSelectedIndexChanged="dgvListNov" OnPageIndexChanging="dgvNovPage" AllowPaging="true" PageSize="10">
                                <Columns>
                                    <asp:BoundField HeaderText="Producto" DataField="Nombre" />
                                    <asp:BoundField HeaderText="Descripción" DataField="Descripcion" />
                                    <asp:BoundField HeaderText="Precio" DataField="Precio" />
                                    <asp:BoundField HeaderText="Marca" DataField="Marca" />
                                    <asp:CommandField HeaderText="Ver" ShowSelectButton="true" SelectText="🔍" />
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
                <br />
                <br />
                <br />
            </div>
        </div>

    </div>
</asp:Content>
