using Datos;
using Objetos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Schema;

namespace TP3
{
    public partial class Carrito : System.Web.UI.Page
    {
        public List<Compra> Carro { get; set; }
        public List<Compra> CarroN { get; set; }
        public List<Articulo> Relacionados { get; set; }
        public List<Favoritos> listaF { get; set; }
        public List<Articulo> listaArticulos { get; set; }

        protected void Page_Load(object sender, EventArgs e)
		{
            List<Articulo> pop = new List<Articulo>();
            Articulo aux = new Articulo();
            ArticuloNegocio negocio = new ArticuloNegocio();
            listaArticulos = negocio.ListarConSp();
            ArticuloNegocio negocio1 = new ArticuloNegocio();
            listaF = negocio1.ListarFav();
            listaArticulos = negocio.ListarConSp();

            try
            {
                if ((List<Compra>)Session["carro"] != null)
                {

                    Carro = (List<Compra>)Session["carro"];
                    Relacionados = (List<Articulo>)Session["Rela"];
                    if (!IsPostBack)
                    {

                        Repeater1.DataSource = Carro;
                        Repeater1.DataBind();
                    }

                }
                else
                {
                    string vacio = "nada";
                    Session.Add("vacio", vacio);

                    for (int i = 0; i < 3; i++)
                    {

                        int id = (int)listaF[i].Id;
                        int x = 0;
                        while (id != listaArticulos[x].Id)
                        {
                            x++;
                        }
                        aux = listaArticulos[x];
                        pop.Add(aux);

                    }

                    Relacionados = (List<Articulo>)pop;

                }
            }
            catch (Exception ex)
            {

                throw ex;
            }
            
        }  

        protected void BtnMod(object sender, EventArgs e)
        {
            try
            {
                string Art = ((Button)sender).CommandArgument;
                int Id = int.Parse(Art);
                Session.Add("Id", Id);
                int mod;
                foreach (Compra item in Carro)
                {
                    if (item.Id == Id)
                    {
                        mod = item.Cantidad;
                        Session.Add("Modificar", mod);
                    }

                }
                CarroN = Carro.Where(x => x.Id != Id).ToList();
                Carro = CarroN;

                decimal total = 0;
                foreach (Compra item in Carro)
                {
                    total += item.Costo;
                }
                Session.Add("total", total);

                Session.Add("carro", Carro);

                Response.Redirect("Producto.aspx", false);
            }
            catch (Exception ex)
            {

                throw ex;
            } 
        }
        protected void BtnEliminar(object sender, EventArgs e)
        {
            try
            {
                string Art = ((Button)sender).CommandArgument;
                int Id = int.Parse(Art);
                CarroN = Carro.Where(x => x.Id != Id).ToList();
                Carro = CarroN;

                decimal total = 0;
                foreach (Compra item in Carro)
                {
                    total += item.Costo;
                }
                Session.Add("total", total);

                Session.Add("carro", Carro);

                Response.Redirect("Carrito.aspx", false);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        protected void BtnPagar(object sender, EventArgs e)
        {
            try
            {
                Carro = null;
                Session.Add("carro", Carro);
                string pagado = "Tu pago ha sido procesado.";
                Session.Add("mensaje", pagado);
                Response.Redirect("Pagado.aspx", false);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

    }
}