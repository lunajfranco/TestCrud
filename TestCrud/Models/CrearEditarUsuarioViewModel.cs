using System.ComponentModel.DataAnnotations;
using System.Xml.Linq;

namespace TestCrud.Models
{
    public class CrearEditarUsuarioViewModel
    {
        public int cod_usuario { get; set; }
        [Required(ErrorMessage = "Campo Requerido")]
        [StringLength(12)]
        [Display(Name = "Usuario")]
        public string txt_user { get; set; }

        [Required(ErrorMessage = "Campo Requerido")]
        [StringLength(12)]
        [Display(Name = "Password")]
        [DataType(DataType.Password)]
        public string txt_password { get; set; }

        [Required(ErrorMessage = "Campo Requerido")]
        [StringLength(12)]
        [RegularExpression("[A-Za-z]*", ErrorMessage ="Solo Letras")]
        [Display(Name = "Nombre")]
        public string txt_nombre { get; set; }

        [Required(ErrorMessage = "Campo Requerido")]
        [StringLength(12)]
        [RegularExpression("[A-Za-z]*", ErrorMessage = "Solo Letras")]
        [Display(Name = "Apellido")]
        public string txt_apellido { get; set; }

        [Required(ErrorMessage = "Campo Requerido")]
        [RegularExpression("[0-9]*", ErrorMessage = "Solo números")]
        [Display(Name = "Documento")]
        public int nro_doc { get; set; }

        [Required(ErrorMessage = "Campo Requerido")]
        [RegularExpression("[0-9]*", ErrorMessage = "Solo números")]
        [Display(Name = "Codigo del Rol")]
        public int cod_rol { get; set; }

        [Required(ErrorMessage = "Campo Requerido")]
        [RegularExpression("[0-9]*", ErrorMessage = "Solo números")]
        [Display(Name = "Activo")]
        public int sn_activo { get; set; }
    }
}
