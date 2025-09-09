using Datos;
using Objetos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TP3
{
    public partial class Producto : System.Web.UI.Page
    {
        public List<Articulo> Todo { get; set; }
        public List<Articulo> Elegida { get; set; }
        public List<Articulo> Relacionados { get; set; }
        public List<Compra> Carro { get; set; }
        public List<Favoritos> listMF { get; set; }
        public List<Articulo> favoritos { get; set; }
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["id"] != null)
            {
                int id = int.Parse(Request.QueryString["id"]);
                Session.Add("Id", id);
            }
            else
            {
                int id = (int)Session["Id"];
            }
            
            


            ArticuloNegocio negocio = new ArticuloNegocio();
            ArticuloNegocio neg = new ArticuloNegocio();
            ArticuloNegocio negocito = new ArticuloNegocio();
            ArticuloNegocio negocio2 = new ArticuloNegocio();
            Articulo aux2 = new Articulo();
            List<Articulo> fav = new List<Articulo>();
            Todo = negocio.Listar();
            Elegida = neg.listAu((int)Session["Id"]);
            int cat = (int)Elegida[0].Categoria.IdC;
            Relacionados = negocito.listRela(cat);
            Session.Add("Rela", Relacionados);

            try
            {
                if ((string)Session["userN"] != null)
                {
                    listMF = negocio2.ListMF((int)Session["userI"]);
                    foreach (Objetos.Favoritos art in listMF)
                    {

                        int y = 0;
                        while (art.Id != Todo[y].Id)
                        {
                            y++;
                        }
                        aux2 = Todo[y];
                        fav.Add(aux2);
                    }
                    favoritos = fav;
                }
                if (Session["userI"] != null & !IsPostBack)
                {
                    foreach (Objetos.Articulo art in favoritos)
                    {
                        if (art.Id == (int)Session["Id"])
                        {
                            RaBu1.Checked = true;

                        }
                    }

                }
                if (Session["Modificar"] != null)
                {
                    DdlCant.DataSource = Session["Modificar"].ToString();
                    Session["Modificar"] = null;

                }
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        protected void btnAhoraClick(object sender, EventArgs e)
        {

            Articulo aux = new Articulo();
            Compra Car = new Compra();

            try
            {
                aux = Elegida[0];

                string cantidad = DdlCant.Text;
                decimal costo;
                int cant;
                cant = int.Parse(cantidad);


                if (cant == 2)
                {
                    costo = (decimal)Elegida[0].Precio * 2;
                }
                else if (cant == 3)
                {
                    costo = (decimal)Elegida[0].Precio * 3;
                }
                else
                {
                    costo = (decimal)Elegida[0].Precio;
                }


                Car.Id = aux.Id;
                Car.Codigo = aux.Codigo;
                Car.Nombre = aux.Nombre;
                Car.Descripcion = aux.Descripcion;
                Car.Marca = aux.Marca;
                Car.IdM = aux.IdM;
                Car.Categoria = aux.Categoria;
                Car.IdC = aux.IdC;
                Car.ImagenUrl = aux.ImagenUrl;
                Car.Cantidad = cant;
                Car.Costo = costo;

                Session.Add("compra", Car);
                Response.Redirect("Compra.aspx", false);
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
        protected void btnCarritoClick(object sender, EventArgs e)
        {
            List<Compra> carrito = new List<Compra>();
            Articulo aux = new Articulo();
            Compra Car = new Compra();

            try
            {
                if ((List<Compra>)Session["carro"] != null)
                {
                    carrito = (List<Compra>)Session["carro"];
                }
                aux = Elegida[0];

                string cantidad = DdlCant.Text;
                decimal costo;
                int cant;
                cant = int.Parse(cantidad);


                if (cant == 2)
                {
                    costo = (decimal)Elegida[0].Precio * 2;
                }
                else if (cant == 3)
                {
                    costo = (decimal)Elegida[0].Precio * 3;
                }
                else
                {
                    costo = (decimal)Elegida[0].Precio;
                }


                Car.Id = aux.Id;
                Car.Codigo = aux.Codigo;
                Car.Nombre = aux.Nombre;
                Car.Descripcion = aux.Descripcion;
                Car.Marca = aux.Marca;
                Car.IdM = aux.IdM;
                Car.Categoria = aux.Categoria;
                Car.IdC = aux.IdC;
                Car.ImagenUrl = aux.ImagenUrl;
                Car.Cantidad = cant;
                Car.Costo = costo;

                carrito.Add(Car);
                Session.Add("carro", carrito);


                decimal total = 0;
                foreach (Compra item in carrito)
                {
                    total += item.Costo;
                }
                Session.Add("total", total);

                Response.Redirect("Carrito.aspx", false);
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
        protected void btnModificar(object sender, EventArgs e)
        {
            List<Compra> carrito = new List<Compra>();
            Articulo aux = new Articulo();
            Compra Car = new Compra();

            try
            {
                if ((List<Compra>)Session["carro"] != null)
                {
                    carrito = (List<Compra>)Session["carro"];
                }
                aux = Elegida[0];

                string cantidad = DdlCant.Text;
                decimal costo;
                int cant;
                cant = int.Parse(cantidad);


                if (cant == 2)
                {
                    costo = (decimal)Elegida[0].Precio * 2;
                }
                else if (cant == 3)
                {
                    costo = (decimal)Elegida[0].Precio * 3;
                }
                else
                {
                    costo = (decimal)Elegida[0].Precio;
                }


                Car.Id = aux.Id;
                Car.Codigo = aux.Codigo;
                Car.Nombre = aux.Nombre;
                Car.Descripcion = aux.Descripcion;
                Car.Marca = aux.Marca;
                Car.IdM = aux.IdM;
                Car.Categoria = aux.Categoria;
                Car.IdC = aux.IdC;
                Car.ImagenUrl = aux.ImagenUrl;
                Car.Cantidad = cant;
                Car.Costo = costo;

                carrito.Add(Car);
                Session.Add("carro", carrito);


                decimal total = 0;
                foreach (Compra item in carrito)
                {
                    total += item.Costo;
                }
                Session.Add("total", total);

                Response.Redirect("Carrito.aspx", false);
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }

        protected void RadioButton1(object sender, EventArgs e)
        {
            try
            {
                if (RaBu1.Checked == true)
                {
                    usuarioNegocio nuevo = new usuarioNegocio();

                    int User = (int)Session["userI"];
                    int art = (int)Session["Id"];

                    nuevo.NewLike(art, User);
                }
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}