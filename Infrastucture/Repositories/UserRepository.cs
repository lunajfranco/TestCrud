using ApplicationCore.Entities;
using ApplicationCore.Interfaces;
using Infrastucture.Data.DataAccess;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Infrastucture.Repositories
{
    public class UserRepository : IUserRepository
    {
        public bool ActualizarUsuario(tUsers user)
        {
            bool actualizado = false;
            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.MiCadenaConexion();
            try
            {
                if (user != null)
                {
                    cn.Open();
                    SqlCommand cmd = new SqlCommand("sp_ActualizarUser", cn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@cod_usuario", user.cod_usuario);
                    cmd.Parameters.AddWithValue("@txt_user", user.txt_user);
                    cmd.Parameters.AddWithValue("@txt_password", user.txt_password);
                    cmd.Parameters.AddWithValue("@txt_nombre", user.txt_nombre);
                    cmd.Parameters.AddWithValue("@txt_apellido", user.txt_apellido);
                    cmd.Parameters.AddWithValue("@nro_doc", user.nro_doc.ToString());
                    cmd.Parameters.AddWithValue("@cod_rol", user.cod_rol);
                    cmd.Parameters.AddWithValue("@sn_activo", user.sn_activo);


                    cmd.ExecuteNonQuery();
                    actualizado = true;
                }
            }
            catch (SqlException ex)
            {
                // Guardar en un registro de errores para posterior depuracion
                throw new ApplicationException("Error: " + ex.Message);
            }
            finally
            {
                //Verifico si la conexión fue abierta
                if (cn.State == ConnectionState.Open)
                    cn.Close();
            }
            return actualizado;
        }

        public List<tUsers> BuscarTodosLosUsuarios()
        {
            var usersList = new List<tUsers>();
            SqlConnection cn = new SqlConnection();
            try
            {
                cn.ConnectionString = ConnectionString.MiCadenaConexion();
                cn.Open();
                SqlCommand cmd = new SqlCommand("sp_BuscarTodosLosUsuarios", cn);
                cmd.CommandType = CommandType.StoredProcedure;

                SqlDataReader dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    var user = new tUsers();
                    user.Rol = new tRol();
                    user.cod_usuario = dr.GetInt32(0);
                    user.txt_user = dr.GetString(1);
                    user.txt_password = dr.GetString(2);
                    user.txt_nombre = dr.GetString(3);
                    user.txt_apellido = dr.GetString(4);
                    user.nro_doc = int.Parse(dr.GetString(5));
                    user.cod_rol = dr.GetInt32(6);
                    user.sn_activo = dr.GetInt32(7);
                    user.Rol.cod_rol = dr.GetInt32(8);
                    user.Rol.txt_desc = dr.GetString(9);
                    user.Rol.sn_activo = dr.GetInt32(10);
                    usersList.Add(user);
                }
                dr.Close();
            }

            catch (SqlException ex)
            {
                throw new ApplicationException("Error al buscar usuario logeado " + ex.Message);
            }
            finally
            {

                if (cn.State == ConnectionState.Open)
                    cn.Close();
            }
            return usersList;
        }

        public tUsers BuscarUsuarioPorID(int cod_usuario)
        {
            var user = new tUsers();
            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.MiCadenaConexion();
            try
            {
                cn.Open();
                SqlCommand cmd = new SqlCommand("sp_BuscarUsuariosPorId", cn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@cod_usuario", cod_usuario);

                SqlDataReader dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    user.cod_usuario = dr.GetInt32(0);
                    user.txt_user = dr.GetString(1);
                    user.txt_password = dr.GetString(2);
                    user.txt_nombre = dr.GetString(3);
                    user.txt_apellido = dr.GetString(4);
                    user.nro_doc = int.Parse(dr.GetString(5));
                    user.cod_rol = dr.GetInt32(6);
                    user.sn_activo = dr.GetInt32(7);
                }
            }
            catch (SqlException ex)
            {
                // Guardar en un registro de errores para posterior depuracion
                throw new ApplicationException("Error: " + ex.Message);
            }
            finally
            {
                //Verifico si la conexión fue abierta
                if (cn.State == ConnectionState.Open)
                    cn.Close();
            }
            return user;
        }

        public bool CrearUsuario(tUsers user)
        {
            bool creado = false;
            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.MiCadenaConexion();
            try
            {
                if (user != null)
                {
                    cn.Open();
                    SqlCommand cmd = new SqlCommand("sp_insertUsers", cn);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@txt_user", user.txt_user);
                    cmd.Parameters.AddWithValue("@txt_password", user.txt_password);
                    cmd.Parameters.AddWithValue("@txt_nombre", user.txt_nombre);
                    cmd.Parameters.AddWithValue("@txt_apellido", user.txt_apellido);
                    cmd.Parameters.AddWithValue("@nro_doc", user.nro_doc.ToString());
                    cmd.Parameters.AddWithValue("@cod_rol", user.cod_rol);
                    cmd.Parameters.AddWithValue("@sn_activo", user.sn_activo);

                    cmd.ExecuteNonQuery();
                    creado = true;
                }

            }
            catch (SqlException ex)
            {
                // Guardar en un registro de errores para posterior depuracion
                throw new ApplicationException("Error al insertar el Usuario " + ex.Message);

            }

            finally
            {
                //Verifico si la conexión fue abierta
                if (cn.State == ConnectionState.Open)
                    cn.Close();
            }

            return creado;
        }

        public bool EliminarUserById(int cod_usuario)
        {
            bool borrado = false;
            SqlConnection cn = new SqlConnection();
            try
            {
                cn.ConnectionString = ConnectionString.MiCadenaConexion();
                cn.Open();
                SqlCommand cmd = new SqlCommand("sp_EliminarUsuarioPorId", cn);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@cod_usuario", cod_usuario);

                cmd.ExecuteNonQuery();
                borrado = true;
            }

            catch (SqlException ex)
            {
                // Guardar en un registro de errores para posterior depuracion
                throw new ApplicationException("Error al eliminar usuario " + ex.Message);

            }
            finally
            {

                if (cn.State == ConnectionState.Open)
                    cn.Close();
            }
            return borrado;
        }

        public bool ExisteUsuarioConDni(int nro_doc)
        {
            bool existe = false;
            SqlConnection cn = new SqlConnection();
            try
            {
                cn.ConnectionString = ConnectionString.MiCadenaConexion();
                cn.Open();
                SqlCommand cmd = new SqlCommand("sp_ExisteUsuarioConDni", cn);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@nro_doc", nro_doc);

                int count = Convert.ToInt32(cmd.ExecuteScalar());
                if (count > 0)
                {
                    existe = true;
                }
            }

            catch (SqlException ex)
            {
                // Guardar en un registro de errores para posterior depuracion
                throw new ApplicationException("Error al buscar usuario " + ex.Message);

            }
            finally
            {

                if (cn.State == ConnectionState.Open)
                    cn.Close();
            }
            return existe;
        }

        public tUsers Login(string txt_user, string txt_password)
        {
            var user = new tUsers();
            user.Rol = new tRol();
            SqlConnection cn = new SqlConnection();
            try
            {
                cn.ConnectionString = ConnectionString.MiCadenaConexion();
                cn.Open();
                SqlCommand cmd = new SqlCommand("sp_LoginUsuario", cn);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@txt_user", txt_user);
                cmd.Parameters.AddWithValue("@txt_password", txt_password);

                SqlDataReader dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    user.cod_usuario = dr.GetInt32(0);
                    user.txt_user = dr.GetString(1);
                    user.txt_password = dr.GetString(2);
                    user.txt_nombre = dr.GetString(3);
                    user.txt_apellido = dr.GetString(4);
                    user.nro_doc = int.Parse(dr.GetString(5));
                    user.cod_rol = dr.GetInt32(6);
                    user.sn_activo = dr.GetInt32(7);
                    user.Rol.cod_rol = dr.GetInt32(8);
                    user.Rol.txt_desc = dr.GetString(9);
                    user.Rol.sn_activo = dr.GetInt32(10);
                }
                dr.Close();
            }

            catch (SqlException ex)
            {
                throw new ApplicationException("Error al buscar usuario logeado " + ex.Message);

            }
            finally
            {

                if (cn.State == ConnectionState.Open)
                    cn.Close();
            }
            return user;
        }
    }
}
