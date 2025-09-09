using Datos;
using Objetos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.ConstrainedExecution;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TP3
{
    public partial class MisFav : System.Web.UI.Page
    {
        public List<Articulo> listaArticulos { get; set; }
        public List<Favoritos> listMF { get; set; }
        public List<Articulo> favoritos { get; set; }
        public int id { get; set; } 
        protected void Page_Load(object sender, EventArgs e)
        {
            ArticuloNegocio negocio = new ArticuloNegocio();
            listaArticulos = negocio.ListarConSp();
            List<Articulo> fav = new List<Articulo>();
            ArticuloNegocio negocio2 = new ArticuloNegocio();
            Articulo aux2 = new Articulo();

            try
            {
                listMF = negocio2.ListMF((int)Session["userI"]);
                foreach (Objetos.Favoritos art in listMF)
                {

                    int y = 0;
                    while (art.Id != listaArticulos[y].Id)
                    {
                        y++;
                    }
                    aux2 = listaArticulos[y];
                    fav.Add(aux2);
                }
                favoritos = fav.Take(3).ToList();

                ArtFav.DataSource = favoritos;
                ArtFav.DataBind();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        protected void PagsArt(object sender, GridViewPageEventArgs e)
        {
            ArtFav.PageIndex = e.NewPageIndex;
            ArtFav.DataBind();
        }
        protected void Artis(object sender, EventArgs e)
        {
            id = int.Parse(ArtFav.SelectedDataKey.Value.ToString());
            Session.Add("Id", id);

        }
        protected void btnElimClick(object sender, EventArgs e)
        {
            usuarioNegocio like = new usuarioNegocio();
            like.BorrarLike((int)Session["Id"], (int)Session["userI"]);
            Response.Redirect("MisFav.aspx", false);

        }
        protected void btnVerClick(object sender, EventArgs e)
        {
            Response.Redirect("Producto.aspx?id="+(int)Session["Id"], false);
        }
    }
}