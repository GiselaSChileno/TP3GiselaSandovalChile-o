using Datos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Objetos;
using System.EnterpriseServices;

namespace TP3
{
    public partial class Default : System.Web.UI.Page
    {
        public List<Articulo> listaArticulos {  get; set; }
        public List<Favoritos> listaF { get; set; }
        public List<Articulo> populares { get; set; }
        public List<Favoritos> listMF { get; set; }
        public List<Articulo> favoritos { get; set; }


        protected void Page_Load(object sender, EventArgs e)
        {
           
            ArticuloNegocio negocio = new ArticuloNegocio();
            listaArticulos = negocio.ListarConSp();
            ArticuloNegocio negocio1 = new ArticuloNegocio();
            listaF = negocio1.ListarFav();
            Articulo aux = new Articulo();
            List<Articulo> pop = new List<Articulo>();
            List<Articulo> fav = new List<Articulo>();
            ArticuloNegocio negocio2 = new ArticuloNegocio();
            Articulo aux2 = new Articulo();

            try
            {
                if ((string)Session["userM"] != null)
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
                }

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

                populares = (List<Articulo>)pop;

            }
            catch (Exception ex)
            {

                throw ex;
            }

            
            

        }

    }
}