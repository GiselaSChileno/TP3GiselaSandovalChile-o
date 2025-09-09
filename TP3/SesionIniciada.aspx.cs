using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TP3
{
    public partial class SesionIniciada : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public void BLog(object sender, EventArgs e)
        {
            try
            {
                if ((string)Session["mensaje"] == "Te registraste exitosamente. Bienvenid@ :)")
                {
                    Response.Redirect("Registro.aspx", false);
                }
                else if ((string)Session["mensaje"] == "¡Bienvenid@!")
                {

                    Response.Redirect("Default.aspx", false);
                }
                else
                {

                    Response.Redirect("Registro.aspx", false);
                }
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public void ModClik(object sender, EventArgs e)
        {
            Response.Redirect("Perfil.aspx", false);
        }

    }
}