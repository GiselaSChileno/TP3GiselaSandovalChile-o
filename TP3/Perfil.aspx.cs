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
    public partial class Perfil : System.Web.UI.Page
    {
        public string img {  get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {

                    Usuarios usuario = new Usuarios();
                    usuario = (Usuarios)Session["user"];

                    txtNombre.Text = usuario.nombre;
                    txtApellido.Text = usuario.apellido;
                    txtContrasena.Text = usuario.pass;
                    txtCorreo.Text = usuario.email;
                    txtImagen.Text = usuario.urlImagenPerfil;
                    img = usuario.urlImagenPerfil;

                }
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        protected void txtImgChang (object sender, EventArgs e)
        {
            img = txtImagen.Text;
        }
        public void BtnAcptClick(object sender, EventArgs e)
        {
            try
            {
                Page.Validate();
                if (!Page.IsValid)
                {
                    return;
                }

                Usuarios nuevo = new Usuarios();
                usuarioNegocio negocio = new usuarioNegocio();

                nuevo.nombre = txtNombre.Text;
                nuevo.apellido = txtApellido.Text;
                nuevo.email = txtCorreo.Text;
                nuevo.pass = txtContrasena.Text;
                nuevo.urlImagenPerfil = txtImagen.Text;
                nuevo.Id = (int)Session["userI"];

                negocio.modificar(nuevo);
                Session.Add("user", nuevo);
                Session.Add("userN", nuevo.nombre);
                Session.Add("userI", nuevo.Id);
                Session.Add("userT", nuevo.admin);

                Response.Redirect("SesionIniciada.aspx", false);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}