using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace DesarrolloWebMVC_Pelicula.Web.Models
{
    public class RegistroPelicula
    {
        private SqlConnection con;
        
        /* Conectarse a la DB*/

        private void Conectar()
        {
            string constr = ConfigurationManager.ConnectionStrings["ConexionDB"].ToString();
            con = new SqlConnection(constr);
        }

        /* Grabar un Registro en la DB */
        public int GrabarPelicula( Pelicula peli)
        {
            Conectar();
            SqlCommand comando = new SqlCommand("Insert Into TBL_PELICULA (Codigo, Titulo, Director, ActorPrincipal, No_Actores, Duracion, Estreno) " +
                                                "Values (@Codigo, @Titulo, @Director, @ActorPrincipal, @No_Actores, @Duracion, @Estreno)", con);
            /* types */
            comando.Parameters.Add("@Titulo",SqlDbType.VarChar);
            comando.Parameters.Add("@Director", SqlDbType.VarChar);
            comando.Parameters.Add("@ActorPrincipal", SqlDbType.VarChar);
            comando.Parameters.Add("@No_Actores", SqlDbType.Int);
            comando.Parameters.Add("@Duracion", SqlDbType.Float);
            comando.Parameters.Add("@Estreno", SqlDbType.Int);
            comando.Parameters.Add("@Codigo", SqlDbType.Int);
            /* data */
            comando.Parameters["@Titulo"].Value = peli.Titulo;
            comando.Parameters["@Director"].Value = peli.Director;
            comando.Parameters["@ActorPrincipal"].Value = peli.ActorPrincipal;
            comando.Parameters["@No_Actores"].Value = peli.numActores;
            comando.Parameters["@Duracion"].Value = peli.Duracion;
            comando.Parameters["@Estreno"].Value = peli.Estreno;
            comando.Parameters["@Codigo"].Value = peli.Codigo;

            con.Open();
            int i = comando.ExecuteNonQuery();
            con.Close();
            return i;
        }


        /* Mostrar todos los Registros de la DB */
        public List<Pelicula> RecuperarTodos()
        {
            Conectar();
            List<Pelicula> peliculas = new List<Pelicula>(); 

            SqlCommand com = new SqlCommand("Select Codigo, Titulo, Director, ActorPrincipal, No_Actores, Duracion, Estreno From TBL_PELICULA", con);
            con.Open();
            SqlDataReader registros = com.ExecuteReader(); 
            while (registros.Read())
            {
                Models.Pelicula peli = new Models.Pelicula()
                {
                    Codigo = int.Parse(registros["Codigo"].ToString()),
                    Titulo = registros["Titulo"].ToString(),
                    Director = registros["Director"].ToString(),
                    ActorPrincipal = registros["ActorPrincipal"].ToString(),
                    numActores = int.Parse(registros["No_Actores"].ToString()),
                    Duracion = double.Parse(registros["Duracion"].ToString()),
                    Estreno = int.Parse(registros["Estreno"].ToString()),
                };
                peliculas.Add(peli);
            }
            con.Close();
            return peliculas;
        }

        /* Mostrar un Registro especifico de la DB */
        public Models.Pelicula Recuperar(int codigo)
        {
            Conectar();
            SqlCommand comando = new SqlCommand("Select Codigo, Titulo, Director, ActorPrincipal, No_Actores, Duracion, Estreno " +
                                               "From TBL_PELICULA where Codigo = @Codigo", con);
            comando.Parameters.Add("@Codigo", SqlDbType.Int);
            comando.Parameters["@Codigo"].Value = codigo;
            con.Open();
            SqlDataReader registros = comando.ExecuteReader();
            Pelicula pelicula = new Pelicula();
            if (registros.Read())
            {
                pelicula.Codigo = int.Parse(registros["Codigo"].ToString());
                pelicula.Titulo = registros["Titulo"].ToString();
                pelicula.Director = registros["Director"].ToString();
                pelicula.ActorPrincipal = registros["ActorPrincipal"].ToString();
                pelicula.numActores = int.Parse(registros["No_Actores"].ToString());
                pelicula.Duracion = double.Parse(registros["Duracion"].ToString());
                pelicula.Estreno = int.Parse(registros["Estreno"].ToString());
            }
            con.Close();
            return pelicula;
        }

        /* Modificar un Registro especifico de la DB */
        public int Modificar(Pelicula peli)
        {
            Conectar();
            SqlCommand comando = new SqlCommand("Update TBL_PELICULA set Titulo=@Titulo, Director=@Director, ActorPrincipal=@ActorPrincipal, No_Actores=@No_Actores, Duracion=@Duracion, " +
                                                "Estreno=@Estreno where Codigo = @Codigo ", con);
        /* types */
            comando.Parameters.Add("@Codigo", SqlDbType.Int);
            comando.Parameters.Add("@Titulo", SqlDbType.VarChar);
            comando.Parameters.Add("@Director", SqlDbType.VarChar);
            comando.Parameters.Add("@ActorPrincipal", SqlDbType.VarChar);
            comando.Parameters.Add("@No_Actores", SqlDbType.Int);
            comando.Parameters.Add("@Duracion", SqlDbType.Float);
            comando.Parameters.Add("@Estreno", SqlDbType.Int);
        /* data */
            comando.Parameters["@Codigo"].Value = peli.Titulo;
            comando.Parameters["@Titulo"].Value = peli.Titulo;
            comando.Parameters["@Director"].Value = peli.Director;
            comando.Parameters["@ActorPrincipal"].Value = peli.ActorPrincipal;
            comando.Parameters["@No_Actores"].Value = peli.numActores;
            comando.Parameters["@Duracion"].Value = peli.Duracion;
            comando.Parameters["@Estreno"].Value = peli.Estreno;

            con.Open();
            int i = comando.ExecuteNonQuery();
            con.Close();
            return i;
        }

        // Borrar un Registro especifico de la DB
        public int Borrar( int codigo)
        {
            Conectar();
            SqlCommand comando = new SqlCommand("Delete from TBL_PELICULA where Codigo=@Codigo", con);
            comando.Parameters.Add("@Codigo", SqlDbType.Int);
            comando.Parameters["@Codigo"].Value = codigo;
            con.Open();
            int i = comando.ExecuteNonQuery();
            con.Close();
            return i;
        }
    }
}