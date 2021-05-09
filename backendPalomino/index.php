<?php
//Importamos las librerias necesarias.
require_once 'config/db.php';
require_once 'config/cors.php';
require "vendor/autoload.php";
use \Firebase\JWT\JWT;

//Guardamos la url para buscar el controlador y ponemos mensaje de bienvenida.
if(!isset($_GET['url'])) {
  exit(json_encode(["Bienvenido al Backend con routes"]));
}

$url = $_GET['url'];

//Preparamos la conexion con la base de datos
$bd = new db();
$conexion = $bd->getConnection();

//Comprueba si hay algún token valido en la cabecera y obtiene el ID del USER
$idUser = null;
if(!empty($_SERVER['HTTP_AUTHORIZATION'])) {
  $jwt = $_SERVER['HTTP_AUTHORIZATION'];
  try {
    $JWTraw = JWT::decode($jwt, $bd->getClave(), array('HS256'));
    $idUser = $JWTraw->id;
  } catch (Exception $e) { }
}

//Guardamos las variables globales. IDUSER, Metodo, CJWT, DIRECTORIO ROOT.
define('IDUSER', $idUser);
define('METODO', $_SERVER["REQUEST_METHOD"]);
define('ROOT', dirname(__FILE__) . DIRECTORY_SEPARATOR);
define('CJWT', $bd->getClave());

//Procesamos la ruta y los metodos.
$control = explode('/',$url);
switch($control[0]) {

  case "usuario":
    require_once("controllers/user.controller.php");
    $controladorUsuarios = new UserController($conexion);
    switch(METODO) {
      case "GET":
        switch($control[1]) {
          case "list":
            $controladorUsuarios->listarUser();
            break;         
          case "comprobarCodigoRecuperacion":
            $controladorUsuarios->comprobarCodigo($control[2]);
            break;
          case "":
            $controladorUsuarios->leerPerfil();
            break;
        }
        break;
        case "DELETE":
        switch($control[1]) {
          case "eliminarUsuario":
            $controladorUsuarios->eliminarUser();
            break;
        }
      case "POST":
        switch($control[1]) {
          case "login":
            $controladorUsuarios->hacerLogin();
            break;
          case "editarPasswordRecuperar":
            $controladorUsuarios->editarPasswordRecuperar();
            break;
        
          case "image":
            $controladorUsuarios->subirAvatar();
            break;
        case "recuperarPassword":
            $controladorUsuarios->recuperarPassword();
            break;
          case "":
            $controladorUsuarios->registrarUser();
        }
        break;

      case "PUT":
        $controladorUsuarios->editarPassword();
        break;



      default: exit(json_encode(["Bienvenido al Backend con routes"]));  
    }  
    break;

  case "juego":
    require_once("controllers/juego.controller.php");
    $controladorJuegos = new JuegoController($conexion);
    switch(METODO) {
      case "GET":
        switch($control[1]) {
          case "list":
            $controladorJuegos->listarJuegos();
            break;
          case "listGeneros":
            $controladorJuegos->listarGeneros();
            break;
          case "listPlataformas":
            $controladorJuegos->listarPlataformas();
            break;
        case "listVideos":
            $controladorJuegos->listarVideos($control[2]);
            break;
          case "ver":
            $controladorJuegos->verJuego($control[2]);
            break;
          case "verImagenesJuego":
            $controladorJuegos->imagenesJuego($control[2]);
            break;
          case "listarXJuegosPorFechaNuevos":
            $controladorJuegos->listarXJuegosPorFechaNuevos($control[2]);
            break;
        }

      case "DELETE":
        switch($control[1]) {
          case "eliminarJuego":
            $controladorJuegos->eliminarJuego($control[2]);
            break;
        }
    case "POST":
          switch($control[1]) {
          case "crearJuego":
        $controladorJuegos->crearJuego();
        break;
        case "editarJuego":
            $controladorJuegos->editarJuego();
            break;
          }
          
      case "PUT":
       switch($control[1]) {
          case "editarJuego":
            $controladorJuegos->editarJuego();
            break;

        
        }

      

      default: exit(json_encode(["Bienvenido al Backend con routes"]));
    }
    
    case "comentario":
    require_once("controllers/comentario.controller.php");
    $controladorComentarios = new ComentarioController($conexion);
    switch(METODO) {
      case "GET":
        switch($control[1]) {
          case "list":
            $controladorComentarios->listarComentarios();
            break;
          case "listReportes":
            $controladorComentarios->listarReportes();
            break;
          case "obtenerComentarios":
            $controladorComentarios->listarComentarios($control[2]);
            break;
          case "listPorJuego":
            $controladorComentarios->listarComentariosPorJuego($control[2]);
            break;
          case "obtenerComentario":
            $controladorComentarios->obtenerComentario($control[2]);
            break;
        case "obtenerReporte":
            $controladorComentarios->obtenerReporte($control[2]);
            break;
          
        }
        case "DELETE":
        switch($control[1]) {
          case "eliminarComentario":
            $controladorComentarios->eliminarComentario($control[2],$control[3]);
            break;
        } 
    
        case "POST":
        switch($control[1]) {
          case "crearComentario":
            $controladorComentarios->crearComentario();
            break;
        case "crearReporte":
            $controladorComentarios->crearReporte();
            break;
          case "like":
            $controladorComentarios->likeComentario();
            break;
          case "dislike":
            $controladorComentarios->dislikeComentario();
            break;
          case "eliminarComentarioAdmin":
            $controladorComentarios->eliminarComentarioAdmin();
            break;
          case "eliminarReporte":
            $controladorComentarios->eliminarReporte();
            break;
        
          }
//      case "PUT":
//        $controladorJuegos->editarJuego();
//        break;

      
    }
    break;

    default:
    exit(json_encode(["Bienvenido al Backend con routes"]));
}

