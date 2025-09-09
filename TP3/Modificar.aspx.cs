using Datos;
using Objetos;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TP3
{
    public partial class Modificar : System.Web.UI.Page
    {
        public int Id { get; set; }
        public bool ConfirmaEliminacion { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((bool)Session["userT"] == false)
            {
                Response.Redirect("Default.aspx", false);
            }

            marcasNegocio negocio = new marcasNegocio();
            categoriasNegocio negocio1 = new categoriasNegocio();

            try
            {
                if (!IsPostBack)
                {

                    List<Marcas> marcas = negocio.Listar();

                    DdlMarca.DataSource = marcas;
                    DdlMarca.DataTextField = "Descripcion";
                    DdlMarca.DataValueField = "IdM";
                    DdlMarca.DataBind();

                    List<Categorias> catego = negocio1.Listar();

                    DdlCate.DataSource = catego;
                    DdlCate.DataTextField = "Descripcion";
                    DdlCate.DataValueField = "IdC";
                    DdlCate.DataBind();

                }

                if (Request.QueryString["produ"] != null && !IsPostBack)
                {
                    Id = int.Parse(Request.QueryString["produ"]);
                    ArticuloNegocio Neg = new ArticuloNegocio();
                    Articulo selec = new Articulo();
                    selec = (Neg.listAu(Id))[0];

                    txtCodigo.Text = selec.Codigo;
                    txtNombre.Text = selec.Nombre;
                    txtDescripcion.Text = selec.Descripcion;
                    TxtImagen.Text = selec.ImagenUrl;
                    TxtPrecio.Text = selec.Precio.ToString();
                    DdlMarca.SelectedValue = selec.Marca.IdM.ToString();
                    DdlCate.SelectedValue = selec.Categoria.IdC.ToString();
                    CambioImagen(sender, e);

                }
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        protected void CambioImagen(object sender, EventArgs e)
        {
            Image1.ImageUrl = TxtImagen.Text;
        }
        protected void BtnAcptClick(object sender, EventArgs e)
        {
            try
            {
                Page.Validate();
                if (!Page.IsValid)
                {
                    return;
                }
                Articulo aux = new Articulo();
                ArticuloNegocio negocio = new ArticuloNegocio();



                aux.Codigo = txtCodigo.Text;
                aux.Nombre = txtNombre.Text;
                aux.Descripcion = txtDescripcion.Text;
                aux.ImagenUrl = TxtImagen.Text;
                aux.Marca = new Marcas();
                aux.Marca.IdM = int.Parse(DdlMarca.SelectedValue);
                aux.Categoria = new Categorias();
                aux.Categoria.IdC = int.Parse(DdlCate.SelectedValue);
                aux.Precio = decimal.Parse(TxtPrecio.Text);

                if (Request.QueryString["produ"] != null)
                {
                    aux.Id = int.Parse(Request.QueryString["produ"]);
                    negocio.modificar(aux);
                    Response.Redirect("Lista.aspx", false);
                }
                else
                {
                    negocio.Agregar(aux);
                    Response.Redirect("Lista.aspx", false);
                }
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        protected void BtnElim(object sender, EventArgs e)
        {
            ConfirmaEliminacion = true;
        }
        protected void Confirmar(object sender, EventArgs e)
        {
            try
            {
                if (CheckBox1.Checked)
                {
                    ArticuloNegocio negocio = new ArticuloNegocio();
                    Id = int.Parse(Request.QueryString["produ"]);
                    negocio.eliminar(Id);
                    Response.Redirect("Lista.aspx", false);

                }
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}