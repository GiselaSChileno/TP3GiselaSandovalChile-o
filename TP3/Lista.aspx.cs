using Datos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TP3
{
    public partial class Lista : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if ((bool)Session["userT"] == true)
                {
                    ArticuloNegocio negocio = new ArticuloNegocio();
                    ArtVent.DataSource = negocio.ListarConSp();
                    ArtVent.DataBind();

                }
                else
                {
                    Response.Redirect("Default.aspx", false);
                }
            }
            catch (Exception)
            {

                throw;
            }
        }

        protected void PagsArt(object sender , GridViewPageEventArgs e)
        {
            ArtVent.PageIndex = e.NewPageIndex;
            ArtVent.DataBind();
        }

        protected void Artis(object sender, EventArgs e)
        {
            string id = ArtVent.SelectedDataKey.Value.ToString();
            Response.Redirect("Modificar.aspx?produ=" + id);

        }
    }
}