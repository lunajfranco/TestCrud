using System.ComponentModel.DataAnnotations;

namespace TestCrud.Models
{
    public class LoginViewModels
    {
        [Required(ErrorMessage = "Este campo es requerido.")]
        [MaxLength(12, ErrorMessage = "El usuario no puede contener más de 12 caracteres.")]
        [Display(Name = "Usuario")]
        public string txtUser{ get; set; }
        [Required(ErrorMessage = "Este campo es requerido.")]
        [MaxLength(15, ErrorMessage = "La Contraseña no puede contener más de 15 caracteres.")]
        [Display(Name = "Contraseña")]
        [DataType(DataType.Password)]
        public string txtPassword{ get; set; }
    }
}
