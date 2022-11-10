using ApplicationCore.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ApplicationCore.Interfaces
{
    public interface IUserRepository
    {
        bool CrearUsuario(tUsers user);
        bool ExisteUsuarioConDni(int nro_doc);
        bool ActualizarUsuario(tUsers users);
        bool EliminarUserById(int cod_usuario);
        tUsers Login(string txt_user, string txt_password);
        List<tUsers> BuscarTodosLosUsuarios();
        tUsers BuscarUsuarioPorID(int cod_usuario);
    }
}
