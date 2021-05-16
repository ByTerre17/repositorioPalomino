<?php

use \Firebase\JWT\JWT;
include "PHPMailer/class.phpmailer.php";
include "PHPMailer/class.smtp.php";

class UserController {

  private $db = null;

  function __construct($conexion) {
    $this->db = $conexion;
  }

  public function listarUser() {
    //Comprueba si el usuario esta registrado.
    
      $eval = "SELECT * FROM usuario";
      $peticion = $this->db->prepare($eval);
      $peticion->execute();
      $resultado = $peticion->fetchAll(PDO::FETCH_OBJ);
      exit(json_encode($resultado));
    
  }

  public function leerPerfil() {
    if(IDUSER){
      $consulta = "SELECT id,email,foto,usuario,password,rol FROM usuario WHERE id=?";
      $peticion = $this->db->prepare($consulta);
      $peticion->execute([IDUSER]);
      $resultado = $peticion->fetchObject();
      exit(json_encode($resultado));
    }else{
      http_response_code(401);
      exit(json_encode(["error" => "Fallo de autorizacion"]));       
    }
  }

  public function hacerLogin() {
    //Se obtienen los datos recibidos en la peticion.
    $user = json_decode(file_get_contents("php://input"));

    if(!isset($user->email) || !isset($user->password)) {
      http_response_code(400);
      exit(json_encode(["error" => "No se han enviado todos los parametros"]));
    }
  
    //Primero busca si existe el usuario, si existe que obtener el id y la password.
    $peticion = $this->db->prepare("SELECT id,password FROM usuario WHERE email = ?");
    $peticion->execute([$user->email]);
    $resultado = $peticion->fetchObject();
  
    if($resultado) {
        
      if(password_verify($user->password, $resultado->password)) {
  
        //Preparamos el token.
        $iat = time();
        $exp = $iat + 3600*24*2;
        $token = array(
          "id" => $resultado->id,
          "iat" => $iat,
          "exp" => $exp
        );
  
        //Calculamos el token JWT y lo devolvemos.
        $jwt = JWT::encode($token, CJWT);
        http_response_code(200);
        exit(json_encode($jwt));
  
      } else {
        http_response_code(401);
        exit(json_encode(["error" => "Password incorrecta"]));
      }
  
    } else {
      http_response_code(404);
      exit(json_encode(["error" => "No existe el usuario"]));  
    }
  }

  public function registrarUser() {
    //Guardamos los parametros de la petición.
    $user = json_decode(file_get_contents("php://input"));

    //Comprobamos que los datos sean consistentes.
    if(!isset($user->email) || !isset($user->password) || !isset($user->usuario) ) {
      http_response_code(400);
      exit(json_encode(["error" => "No se han enviado todos los parametros"]));

    }



    //Comprueba que no exista otro usuario con el mismo email.
    $peticion = $this->db->prepare("SELECT id FROM usuario WHERE email=?");
    $peticion->execute([$user->email]);
    $resultado = $peticion->fetchObject();
    if(!$resultado) {
      $password = password_hash($user->password, PASSWORD_BCRYPT); 
      $foto="no_foto";
      $rol="user";
      $eval = "INSERT INTO usuario (email,foto,usuario,password,rol) VALUES (?,?,?,?,?)";
      $peticion = $this->db->prepare($eval);
      $peticion->execute([
        $user->email,$foto,$user->usuario,$password,$rol
      ]);
      
      //Preparamos el token.
      $id = $this->db->lastInsertId();
      $iat = time();
      $exp = $iat + 3600*24*2;
      $token = array(
        "id" => $id,
        "iat" => $iat,
        "exp" => $exp
      );

      //Calculamos el token JWT y lo devolvemos.
      $jwt = JWT::encode($token, CJWT);
      http_response_code(201);
      echo json_encode($jwt);
    } else {
      http_response_code(409);
      echo json_encode(["error" => "Ya existe este usuario"]);
    }
  }

  public function eliminarUser() {
    if(IDUSER) {
        
      //Buscamos si el usuario tenía imagenes y la eliminamos.
      $imgSrc = ROOT."images/p-".IDUSER."-*";
      $imgFile = glob($imgSrc);
      foreach($imgFile as $fichero) unlink($fichero);
      $eval = "DELETE FROM usuario WHERE id=?";
      $peticion = $this->db->prepare($eval);
      $resultado = $peticion->execute([IDUSER]);
      http_response_code(200);
      exit(json_encode("Usuario eliminado correctamente"));
    } else {
      http_response_code(401);
      exit(json_encode(["error" => "Fallo de autorizacion"]));            
    }
  }
  
  public function recuperarPassword() {
    //Se obtienen los datos recibidos en la peticion.
    $user = json_decode(file_get_contents("php://input"));

    if(!isset($user->email) || !isset($user->usuario)) {
      http_response_code(400);
      exit(json_encode(["error" => "No se han enviado todos los parametros"]));
    }
  
    //Primero busca si existe el usuario, si existe que obtener el id y la password.
    $peticion = $this->db->prepare("SELECT * FROM usuario WHERE email = ? AND usuario = ?");
    $peticion->execute([$user->email,$user->usuario]);
    $resultado = $peticion->fetchObject();
  
    if($resultado) {
        $password=$resultado->password ;
        $fechaInicio=(date("H")).":".(date("i")).":".(date("s"));
        $fechaFinal=(date("H")).":".(date("i")+15).":".(date("s"));
        $codigoRecuperacion=time()*rand(1,1000);
        $eval = "INSERT INTO codigorecuperacion (idUsuario,fechaInicio,fechaFinal,codigoRecuperacion,usado) VALUES (?,?,?,?,?)";
        $peticion = $this->db->prepare($eval);
        $peticion->execute([$resultado->id,$fechaInicio,$fechaFinal,$codigoRecuperacion,0]);
        
        $mensaje= "Hola usted ha solicitado un cambio de contraseña debido a que ha olvidado la misma, para cambiar la contraseña clicke el siguiente enlace ". 'http://localhost:4200/recuperarPassword2/'.$codigoRecuperacion;
        $email_user = "manuelproyecto484@gmail.com"; //Mi correo
        $email_password = "2FJVx7PRpy2zjXe"; //Pass de mi correo
        $the_subject = "Recuperación de contraseña";
        $address_to = $resultado->email;
        $from_name = "Prueba";
        $phpmailer = new PHPMailer();
        // ---------- datos de la cuenta de Gmail ---------------------
        $phpmailer->Username = $email_user;
        $phpmailer->Password = $email_password; 
        //-----------------------------------------------------------------------
        // $phpmailer->SMTPDebug = 1;
        $phpmailer->SMTPSecure = 'ssl';
        $phpmailer->Host = "smtp.gmail.com"; // GMail
        $phpmailer->Port = 465;
        $phpmailer->IsSMTP(); // use SMTP
        $phpmailer->SMTPAuth = true;
        $phpmailer->setFrom($phpmailer->Username,$from_name);
        $phpmailer->AddAddress($address_to); // recipients email
        $phpmailer->Subject = $the_subject; 
        $phpmailer->Body = $mensaje;
        $phpmailer->IsHTML(true);
        $phpmailer->Send();
        
        exit(json_encode(["Mensaje enviado"]));
    }
  }
  
  public function editarPassword() {
    if(IDUSER) {
      //Cogemos los valores de la peticion.
      $passwordAntigua = $_POST[('passwordAntigua')];
      $passwordNueva = $_POST[('passwordNueva')];
      
      if(!isset($passwordAntigua) || !isset($passwordNueva)) {
      http_response_code(400);
      exit(json_encode("Faltan datos"));
    }

      //Obtenemos los datos guardados en el servidor relacionados con el usuario
      $peticion = $this->db->prepare("SELECT email,foto,usuario,password,rol FROM usuario WHERE id=?");
      $peticion->execute([IDUSER]);
      $usuarioBaseDeDatos = $peticion->fetchObject();
      
      if(password_verify($passwordAntigua, $usuarioBaseDeDatos->password)){
          $nPassword = password_hash($passwordNueva, PASSWORD_BCRYPT);
          $eval = "UPDATE usuario SET password=? WHERE id=?";
          $peticion = $this->db->prepare($eval);
          $peticion->execute([$nPassword,IDUSER]);
          http_response_code(201);
          exit(json_encode("Usuario actualizado correctamente"));
      }
    } else {
      http_response_code(401);
      exit(json_encode(["error" => "Fallo de autorizacion"]));         
    }
  }

  public function editarUsuario() {
    if(IDUSER) {
      //Cogemos los valores de la peticion.
      $usuario= $_POST[('usuario')];
      
      if(!isset($usuario)) {
      http_response_code(400);
      exit(json_encode("Faltan datos"));
    }
      $eval = "UPDATE usuario SET usuario=? WHERE id=?";
      $peticion = $this->db->prepare($eval);
      $peticion->execute([$usuario,IDUSER]);
      http_response_code(201);
      exit(json_encode("Usuario actualizado correctamente"));

    } else {
      http_response_code(401);
      exit(json_encode(["error" => "Fallo de autorizacion"]));         
    }
  }

  public function editarCorreo() {
    if(IDUSER) {
      //Cogemos los valores de la peticion.
      $correo= $_POST[('correo')];
      
      if(!isset($correo)) {
      http_response_code(400);
      exit(json_encode("Faltan datos"));
    }
      $eval = "UPDATE usuario SET correo=? WHERE id=?";
      $peticion = $this->db->prepare($eval);
      $peticion->execute([$correo,IDUSER]);
      http_response_code(201);
      exit(json_encode("Usuario actualizado correctamente"));

    } else {
      http_response_code(401);
      exit(json_encode(["error" => "Fallo de autorizacion"]));         
    }
  }

  public function editarFoto() {
    if(IDUSER) {
      $imagen=$_FILES[('foto')];
      
      if(!isset($imagen)) {
      http_response_code(400);
      exit(json_encode("Faltan datos"));
    }
      $mime = $imagen['type'];
      $size = $imagen['size'];
      $rutaTemp = $imagen['tmp_name'];
      
      if( !(strpos($mime, "jpeg") || strpos($mime, "png")) || ($size > 400000) ) {
                http_response_code(400);
                exit(json_encode(["error" => "La imagen tiene que ser JPG o PNG y no puede ocupar mas de 400KB"]));
            } else {
                
                $ext = strpos($mime, "jpeg") ? ".jpg":".png";
                $nombreImagen = "imagen"."imagenUsuario"."-".IDUSER;
                $ruta = ROOT."images/".$nombreImagen;
                
                $direccionImagen= ROOT .'images'. '\\' . $nombreImagen;
                if(unlink($direccionImagen));
                
                if(move_uploaded_file($rutaTemp,$ruta)) {

                //Prepara el contenido del campo imgSrc
                $imgSRC = "http://localhost/".basename(ROOT)."/images/".$nombreImagen;
                
                $eval = "UPDATE usuario SET foto=? WHERE id=?";
                $peticion = $this->db->prepare($eval);
                $peticion->execute([$imgSRC,IDUSER]);
                http_response_code(201);
                exit(json_encode("Usuario actualizado correctamente"));
                }
            }                
    } else {
      http_response_code(401);
      exit(json_encode(["error" => "Fallo de autorizacion"]));         
    }
  }
 
  public function comprobarCodigo($idCodigo) {
      $fechaActual=(date("H")).":".(date("i")).":".(date("s"));
      $eval = "SELECT * FROM codigoRecuperacion where codigoRecuperacion = ?";
      $peticion = $this->db->prepare($eval);
      $peticion->execute([$idCodigo]);
      $codigoRecuperacion = $peticion->fetchObject();
      if(!isset($codigoRecuperacion)){
          exit(json_encode("noValido"));     
      }
      else {
        if($fechaActual<$codigoRecuperacion->fechaFinal){
          exit(json_encode("Valido"));   
        }
        else {
            exit(json_encode("NoValido"));  
        }
      }
  }
  
  
  public function editarPasswordRecuperar() {
      //Cogemos los valores de la peticion.
      $password= $_POST['password'];
      $idCodigo=$_POST['codigo'];
      
      if(!isset($password)) {
      http_response_code(400);
      exit(json_encode("Error"));
      }
      
      $eval = "SELECT * FROM codigoRecuperacion where codigoRecuperacion = ?";
      $peticion = $this->db->prepare($eval);
      $peticion->execute([$idCodigo]);
      $codigoRecuperacion = $peticion->fetchObject();

      $nPassword = password_hash($password, PASSWORD_BCRYPT);
      $eval = "UPDATE usuario SET password=? WHERE id=?";
      $peticion = $this->db->prepare($eval);
      $peticion->execute([$nPassword,$codigoRecuperacion->idUsuario]);
      http_response_code(201);
      exit(json_encode("Usuario actualizado correctamente"));
      }
  }