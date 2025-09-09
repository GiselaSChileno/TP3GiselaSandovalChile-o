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
    public partial class Principal : System.Web.UI.MasterPage
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        protected void btn2_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtBuscar.Text == "")
                {

                }
                else
                {
                    string busqueda = txtBuscar.Text;
                    Session.Add("Buscar", busqueda);
                    Response.Redirect("Busqueda.aspx");
                }
            }
            catch (Exception)
            {

                throw;
            }
        }
    }
}