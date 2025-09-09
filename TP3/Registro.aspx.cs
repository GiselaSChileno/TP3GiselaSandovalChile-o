using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Objetos;
using Datos;


namespace TP3
{
    public partial class Registro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if ((string)Session["mensaje"] == "Ups, Error de dedo. Prueba de nuevo")
                {
                    string Ingreso = "Progreso";
                    Session.Add("Usuario", Ingreso);
                    Session.Add("userN", null);
                    Session.Add("userI", null);
                    Session.Add("userT", null);
                }
                else
                {

                    if (Request.QueryString["id"] == "reg" || Request.QueryString["id"] == "close")
                    {
                        string Ingreso = "Progreso";
                        Session.Add("Usuario", Ingreso);
                        Session.Add("userM", null);
                        Session.Add("userN", null);
                        Session.Add("userI", null);
                        Session.Add("userT", null);
                    }
                }
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        protected void BtnAcptClick(object sender, EventArgs e)
        {

            Page.Validate();
            if (!Page.IsValid)
            {
                return;
            }
            Usuarios usuario = new Usuarios();

            usuarioNegocio negocio = new usuarioNegocio();
            string Login;
            usuario.email = txtCorreo.Text;
            usuario.pass = txtContrasena.Text;
            usuario.nombre = txtNombre.Text;
            usuario.apellido = txtApellido.Text;

            try
            {
                if (Request.QueryString["id"] == "reg")
                {
                    if (negocio.Nuevo(usuario))
                    {
                        Login = "Tu Usuario o Contraseña ya están en uso, por favor elige otro";
                    }
                    else
                    {
                        negocio.AgregarUs(usuario);
                        Login = "Te registraste exitosamente. Bienvenid@ :)";

                    }
                }
                else
                {
                    if (negocio.Loguear(usuario))
                    {
                        Login = "¡Bienvenid@!";

                        Session.Add("user", usuario);
                        Session.Add("userN", usuario.nombre);
                        Session.Add("userM", usuario.email);
                        Session.Add("userI", usuario.Id);
                        Session.Add("userT", usuario.admin);
                        Session.Add("userImg", usuario.urlImagenPerfil);

                    }
                    else
                    {
                        Login = "Ups, Error de dedo. Prueba de nuevo";
                       
                    }
                }

                Session.Add("mensaje", Login);

                Response.Redirect("SesionIniciada.aspx", false);

            }
            catch (Exception)
            {

                throw;
            }
        }   
    }
}