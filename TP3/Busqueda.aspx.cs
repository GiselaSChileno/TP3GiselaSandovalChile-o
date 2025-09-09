using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Datos;
using Objetos;

namespace TP3
{
    public partial class Busqueda : System.Web.UI.Page
    {
        public List<Articulo> Todo { get; set; }
        public List<Favoritos> Favs { get; set; }
        public List<Articulo> Alternativa { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            Articulo aux = new Articulo();
            List<Articulo> pop = new List<Articulo>();
            ArticuloNegocio negocio = new ArticuloNegocio();
            ArticuloNegocio neg = new ArticuloNegocio();
            Todo = negocio.Listar();
            Favs = neg.ListarFav();

            try
            {
                for (int i = 0; i < 3; i++)
                {

                    int id = (int)Favs[i].Id;
                    int x = 0;
                    while (id != Todo[x].Id)
                    {
                        x++;
                    }
                    aux = Todo[x];
                    pop.Add(aux);

                }

                Alternativa = (List<Articulo>)pop;


                string busqueda = (string)Session["Buscar"];
                List<Articulo> filtro = Todo.FindAll(X => X.Nombre.ToUpper().Contains(busqueda.ToUpper()));
                if (filtro.Count() > 0)
                {
                    Repeater1.DataSource = filtro;
                    Repeater1.DataBind();
                }
                else
                {

                    Repeater1.DataSource = Alternativa;
                    Repeater1.DataBind();

                }

                GridView1.DataSource = Alternativa;
                GridView1.DataBind();
            }
            catch (Exception ex)
            {

                throw ex;
            }


        }
        protected void dgvNovPage(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            GridView1.DataBind();
        }
        protected void dgvListNov(object sender, EventArgs e)
        {
            string Id = GridView1.SelectedDataKey.Value.ToString();
            Response.Redirect("Producto.aspx?id=" + Id);
        }

    }
}