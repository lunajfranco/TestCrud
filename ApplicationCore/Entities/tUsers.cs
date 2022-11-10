﻿using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ApplicationCore.Entities
{
    public class tUsers
    {
        public int cod_usuario { get; set; }
        public string txt_user { get; set; }
        public string txt_password { get; set; }
        public string txt_nombre { get; set; }
        public string txt_apellido { get; set; }
        public int nro_doc { get; set; }
        public int cod_rol { get; set; }
        public tRol Rol { get; set; }
        public int sn_activo { get; set; }
    }
}
