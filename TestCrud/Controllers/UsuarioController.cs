using ApplicationCore.Interfaces;
using Microsoft.AspNetCore.Mvc;
using TestCrud.Models;

namespace TestCrud.Controllers
{
    public class UsuarioController : Controller
    {
        private readonly IUserRepository _userRepository;

        public UsuarioController(IUserRepository userRepository)
        {
            _userRepository = userRepository;
        }
        public IActionResult Login()
        {
            return View();
        }
        [HttpPost]
        public IActionResult Login(LoginViewModels loginView)
        {
            if (ModelState.IsValid)
            {
                var usuario = _userRepository.Login(loginView.txtUser, loginView.txtPassword);
                if (usuario.cod_usuario != 0)
                {
                    if (usuario.Rol.txt_desc == "Administrador")
                    {
                        return RedirectToAction("Index", "Admin");
                    }
                    else if (usuario.Rol.txt_desc == "Cliente")
                    {
                        return RedirectToAction("Index", "Home");
                    }
                }
                ViewBag.UserNull = "no se encontro usuario, ingrese nuevamente los datos";
            }
            
            return View();
        }
    }
}
