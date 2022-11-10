using ApplicationCore.Entities;
using ApplicationCore.Interfaces;
using Microsoft.AspNetCore.Mvc;
using TestCrud.Models;

namespace TestCrud.Controllers
{
    public class AdminController : Controller
    {
        private readonly IUserRepository _userRepository;

        public AdminController(IUserRepository userRepository)
        {
            _userRepository = userRepository;
        }
        public IActionResult Index()
        {
            var users = _userRepository.BuscarTodosLosUsuarios();
            return View(users);
        }

        public IActionResult Crear()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Crear(CrearEditarUsuarioViewModel users)
        {
            if (ModelState.IsValid)
            {
                var user = new tUsers();
                user.txt_user = users.txt_user;
                user.txt_password = users.txt_password;
                user.txt_nombre = users.txt_nombre;
                user.txt_apellido = users.txt_apellido;
                user.nro_doc = users.nro_doc;
                user.cod_rol = users.cod_rol;
                user.sn_activo = users.sn_activo;
                if(_userRepository.CrearUsuario(user)) return RedirectToAction("Index", "Admin");

            }
            ViewBag.Creacion = "Algo salio mal al crear intente nuevamente";
            return View();
        }
        public IActionResult Editar(int id)
        {
            var user = _userRepository.BuscarUsuarioPorID(id);
            if (user.cod_usuario == 0) return View();
            var model = new CrearEditarUsuarioViewModel();
            model.txt_user = user.txt_user;
            model.txt_password = user.txt_password;
            model.txt_nombre = user.txt_nombre;
            model.txt_apellido = user.txt_apellido;
            model.nro_doc = user.nro_doc;
            model.cod_rol = user.cod_rol;
            model.sn_activo = user.sn_activo;
            return View(model);
        }

        [HttpPost]
        public IActionResult Editar(CrearEditarUsuarioViewModel model)
        {
            if(ModelState.IsValid)
            {
                var user = new tUsers();
                user.txt_user = model.txt_user;
                user.txt_password = model.txt_password;
                user.txt_nombre = model.txt_nombre;
                user.txt_apellido = model.txt_apellido;
                user.nro_doc = model.nro_doc;
                user.cod_rol = model.cod_rol;
                user.sn_activo = model.sn_activo;
                if (_userRepository.ActualizarUsuario(user)) return RedirectToAction("Index", "Admin");
            }
            ViewBag.Editar = "Algo salio mal al crear intente nuevamente";
            return View();
        }
        [HttpGet]
        public IActionResult Eliminar(int id)
        {
            if (_userRepository.EliminarUserById(id)) return RedirectToAction("Index", "Admin");
            ViewBag.ErrorElimnar = "Error al eliminar objeto";
            return View();
        }
    }
}
