<?php
use \Firebase\JWT\JWT;


class JuegoController {

  private $db = null;

  function __construct($conexion) {
    $this->db = $conexion;
  }

  public function listarJuegos() {
    $imagen;
      
      $eval = "SELECT * FROM juego";
      $peticion = $this->db->prepare($eval);
      $peticion->execute();
      $juegos = $peticion->fetchAll(PDO::FETCH_OBJ);
      $eval = "SELECT juego.id, FORMAT(AVG(comentario.nota),1)*10 as notaMedia FROM juego,comentario WHERE juego.id = comentario.idJuego GROUP BY juego.id";
      $peticion = $this->db->prepare($eval);
      $peticion->execute();
      $medias = $peticion->fetchAll(PDO::FETCH_OBJ);
      foreach ($juegos as $juego){
        $eval = "SELECT direccion FROM imagenes where id = ?";
        $peticion = $this->db->prepare($eval);
        $peticion->execute([$juego->imagen]);
        $imagen = $peticion->fetchObject();
        $juego->imagen = $imagen->direccion;
        $juego->nota=$juego->nota*10;
        foreach ($medias as $media){
            if($media->id==$juego->id){
                $juego->nota=$media->notaMedia;
            }
        }
      }
      exit(json_encode($juegos));
    
  }
  
  public function listarXJuegosPorFechaNuevos($cantidad) {
    
    $eval = "select * from juego order by juego.fechaDePublicacion desc limit ".$cantidad;
    $peticion = $this->db->prepare($eval);
    $peticion->execute();
    $juegos = $peticion->fetchAll(PDO::FETCH_OBJ);
    $eval = "SELECT juego.id, FORMAT(AVG(comentario.nota),1)*10 as notaMedia FROM juego,comentario WHERE juego.id = comentario.idJuego GROUP BY juego.id";
    $peticion = $this->db->prepare($eval);
    $peticion->execute();
    $medias = $peticion->fetchAll(PDO::FETCH_OBJ);
    foreach ($juegos as $juego){
          
        $eval = "SELECT direccion FROM imagenes where id = ?";
        $peticion = $this->db->prepare($eval);
        $peticion->execute([$juego->imagen]);
        $imagen = $peticion->fetchObject();
        $juego->imagen = $imagen->direccion;
        $juego->nota=$juego->nota*10;
        foreach ($medias as $media){
            if($media->id==$juego->id){
                $juego->nota=$media->notaMedia;
            }
        }
    }
      exit(json_encode($juegos));
    
  }

  public function verJuego($id) {
      $consulta = "SELECT * FROM juego WHERE id=?";
      $peticion = $this->db->prepare($consulta);
      $peticion->execute([$id]);
      $juego = $peticion->fetchObject();
      if(empty($juego)){
          exit(json_encode(["error" => "No se encuentra el juego"]));
      }else{
        $eval = "SELECT juego.id, FORMAT(AVG(comentario.nota),1)*10 as notaMedia FROM juego,comentario WHERE juego.id = comentario.idJuego GROUP BY juego.id";
        $peticion = $this->db->prepare($eval);
        $peticion->execute();
        $medias = $peticion->fetchAll(PDO::FETCH_OBJ);
        
        $eval = "SELECT direccion FROM imagenes where id = ?";
        $peticion = $this->db->prepare($eval);
        $peticion->execute([$juego->imagen]);
        $imagen = $peticion->fetchObject();
        $juego->imagen = $imagen->direccion;
        
        
        
        
        $juego->nota=$juego->nota*10;
        foreach ($medias as $media){
            if($media->id==$juego->id){
                  $juego->nota=$media->notaMedia;
              }
        }
        
        
        
        exit(json_encode($juego));
      }
    }
    
     public function imagenesJuego($idJuego) {
        $eval = "SELECT * FROM imagenes where idJuego = ?";
        $peticion = $this->db->prepare($eval);
        $peticion->execute([$idJuego]);
        $imagenes = $peticion->fetchAll(PDO::FETCH_OBJ);
        exit(json_encode($imagenes));
     }
    
    

  public function crearJuego() {
    //Guardamos los parametros de la petición.
    $juego = json_decode($_POST['juego']);
    $idJuego;
    $idImagen;
    $imagenPrincipal=$_FILES['imagenPrincipal'];
    $idImagenPrincipal;
    $cantidadDeImagenes = $juego->cantidadImagenes;
    $imagenes = [];
    
    
    //Comprobamos que los datos sean consistentes.
    if(!isset($juego->nombre) || !isset($juego->fechaDeLanzamiento) || !isset($juego->comprar) || !isset($juego->edad) || !isset($juego->creador) || !isset($juego->genero) || !isset($juego->numeroDeJugadores)    || !isset($juego->resumen) ) {
      http_response_code(400);
      exit(json_encode(["error" => "No se han enviado todos los parametros"]));

    }

    for($i=0;$i<=$cantidadDeImagenes;$i++){
        if(isset($_FILES['imagen'.$i])){
            $imagenes[]=$_FILES['imagen'.$i];
        }
    }
    
    $imagenes[]=$imagenPrincipal;
    
    $eval = "INSERT INTO juego (nombre,fechaDeLanzamiento,comprar,edad,creador,genero,numeroDeJugadores,nota,resumen) VALUES (?,?,?,?,?,?,?,?,?)";
    $peticion = $this->db->prepare($eval);
    $peticion->execute([$juego->nombre,$juego->fechaDeLanzamiento,$juego->comprar,$juego->edad,$juego->creador,$juego->genero,$juego->numeroDeJugadores,$juego->nota,$juego->resumen]);
    
    $consulta = "SELECT juego.id FROM juego WHERE juego.nombre = ? AND  juego.creador = ?";
    $peticion = $this->db->prepare($consulta);
    $peticion->execute([$juego->nombre,$juego->creador]);
    $idJuego = $peticion->fetchObject();
    
    
    for($i=0;$i<(count($imagenes));$i++){
        if($imagenes[$i]['name']==$imagenPrincipal['name'] && $imagenes[$i]['size']==$imagenPrincipal['size']){
            
            $imagen = $imagenes[$i];
            $mime = $imagen['type'];
            $size = $imagen['size'];
            $rutaTemp = $imagen['tmp_name'];
            
            if( !(strpos($mime, "jpeg") || strpos($mime, "png")) || ($size > 400000) ) {
                http_response_code(400);
                exit(json_encode(["error" => "La imagen tiene que ser JPG o PNG y no puede ocupar mas de 400KB"]));
            } else {
                $ext = strpos($mime, "jpeg") ? ".jpg":".png";
                $nombreImagen = "p-".$juego->nombre."-".$i.$ext;
                $ruta = ROOT."images/".$nombreImagen;
                
                $imgFind = $ruta;
                $imgFile = glob($imgFind);
                foreach($imgFile as $fichero) unlink($fichero);
                
                if(move_uploaded_file($rutaTemp,$ruta)) {

                //Prepara el contenido del campo imgSrc
                $imgSRC = "http://localhost/".basename(ROOT)."/images/".$nombreImagen;
                
                $eval = "INSERT INTO imagenes (direccion,idJuego,principal) VALUES (?,?,?)";
                $peticion = $this->db->prepare($eval);
                $peticion->execute([$imgSRC,$idJuego->id,1]);
                
                $consulta = "SELECT imagenes.id FROM imagenes WHERE imagenes.direccion = ?";
                $peticion = $this->db->prepare($consulta);
                $peticion->execute([$imgSRC]);
                $idImagen = $peticion->fetchObject();
                
                $eval = "UPDATE juego SET imagen=? WHERE id=?";
                $peticion = $this->db->prepare($eval);
                $peticion->execute([$idImagen->id,$idJuego->id]);
                
                }
            }    
        }
        else{
            $imagen = $imagenes[$i];
            $mime = $imagen['type'];
            $size = $imagen['size'];
            $rutaTemp = $imagen['tmp_name'];
            
            
            if( !(strpos($mime, "jpeg") || strpos($mime, "png")) || ($size > 400000) ) {
                http_response_code(400);
                exit(json_encode(["error" => "La imagen tiene que ser JPG o PNG y no puede ocupar mas de 400KB"]));
            } else {
                $ext = strpos($mime, "jpeg") ? ".jpg":".png";
                $nombreImagen = "p-".$juego->nombre."-".$i.$ext;
                $ruta = ROOT."images/".$nombreImagen;
                
                $imgFind = $ruta;
                $imgFile = glob($imgFind);
                
            foreach($imgFile as $fichero) unlink($fichero);
                if(move_uploaded_file($rutaTemp,$ruta)) {

                //Prepara el contenido del campo imgSrc
                $imgSRC = "http://localhost/".basename(ROOT)."/images/".$nombreImagen;
                
                $eval = "INSERT INTO imagenes (direccion,idJuego) VALUES (?,?)";
                $peticion = $this->db->prepare($eval);
                $peticion->execute([$imgSRC,$idJuego->id]);
                
                $consulta = "SELECT imagenes.id FROM imagenes WHERE imagenes.direccion = ?";
                $peticion = $this->db->prepare($consulta);
                $peticion->execute([$imgSRC]);
                $idImagen = $peticion->fetchObject();
                
                $eval = "UPDATE juego SET imagen=? WHERE id=?";
                $peticion = $this->db->prepare($eval);
                $peticion->execute([$idImagen->id,$idJuego->id]);
                }
            }
        }
    }
    
        
            exit(json_encode("Juego creado"));
  
      }
      
  public function editarJuego() {
    //Guardamos los parametros de la petición.
    $juego = json_decode($_POST['juego']);
    
    $idJuego = $_POST['idJuego'];
    $imagenPrincipal=$_POST['imagenPrincipal'];
    $idImagenPrincipal;
    $principalVieja=$_POST['principalVieja'];
    $cantidadDeImagenes = $juego->cantidadImagenes-1;
    $cantidadImagenesMantenidas=$_POST['cantidadImagenesMantenidas'];
    $imagenes = [];
    $imagenesAntiguas = [];
    
    //Comprobamos que los datos sean consistentes.
    if(!isset($juego->nombre) || !isset($juego->fechaDeLanzamiento) || !isset($juego->comprar) || !isset($juego->edad) || !isset($juego->creador) || !isset($juego->genero) || !isset($juego->numeroDeJugadores)    || !isset($juego->resumen) ) {
      http_response_code(400);
      exit(json_encode(["error" => "No se han enviado todos los parametros"]));

    }
    
    for($i=0;$i<$cantidadDeImagenes;$i++){
        if(isset($_FILES['imagen'.$i])){
            $imagenes[$i]=$_FILES['imagen'.$i];
        }
    }
    for($i=0;$i<$cantidadImagenesMantenidas;$i++){
        if(isset($_FILES['imagenMantenida'.$i])){
            $imagenesAntiguas[$i]=$_FILES['imagen'.$i];
        }
    }
    if($principalVieja=="false"){
        $imagenes[]=$imagenPrincipal;
    }
    
    $eval = "update juego set nombre=?, fechaDeLanzamiento=?, comprar=?, edad=?, creador=?, genero=?, numeroDeJugadores=?, nota=?, resumen=? where id = ?";
    $peticion = $this->db->prepare($eval);
    $peticion->execute([$juego->nombre,$juego->fechaDeLanzamiento,$juego->comprar,$juego->edad,$juego->creador,$juego->genero,$juego->numeroDeJugadores,$juego->nota,$juego->resumen,$idJuego]);   
    
    for($i=0;$i<=(count($imagenes));$i++){
        if($i=$imagenPrincipal && $principalVieja=="false"){
            
            $imagen = $imagenes[$i];
            $mime = $imagen['type'];
            $size = $imagen['size'];
            $rutaTemp = $imagen['tmp_name'];
            
            if( !(strpos($mime, "jpeg") || strpos($mime, "png")) || ($size > 400000) ) {
                http_response_code(400);
                exit(json_encode(["error" => "La imagen tiene que ser JPG o PNG y no puede ocupar mas de 400KB"]));
            } else {
                $ext = strpos($mime, "jpeg") ? ".jpg":".png";
                $nombreImagen = "p-".$juego->nombre."-".$i.$ext;
                $ruta = ROOT."images/".$nombreImagen;
                
                $imgFind = $ruta;
                $imgFile = glob($imgFind);
                foreach($imgFile as $fichero) unlink($fichero);
                
                if(move_uploaded_file($rutaTemp,$ruta)) {

                //Prepara el contenido del campo imgSrc
                $imgSRC = "http://localhost/".basename(ROOT)."/images/".$nombreImagen;
                
                $eval = "INSERT INTO imagenes (direccion,idJuego,principal) VALUES (?,?,?)";
                $peticion = $this->db->prepare($eval);
                $peticion->execute([$imgSRC,$idJuego->id,1]);
                
                $consulta = "SELECT imagenes.id FROM imagenes WHERE imagenes.direccion = ?";
                $peticion = $this->db->prepare($consulta);
                $peticion->execute([$imgSRC]);
                $idImagen = $peticion->fetchObject();
                
                $eval = "UPDATE juego SET imagen=? WHERE id=?";
                $peticion = $this->db->prepare($eval);
                $peticion->execute([$idImagen->id,$idJuego]);
                
                }
            }    
        }
        else{
            $imagen = $imagenes[$i];
            $mime = $imagen['type'];
            $size = $imagen['size'];
            $rutaTemp = $imagen['tmp_name'];
            
            
            if( !(strpos($mime, "jpeg") || strpos($mime, "png")) || ($size > 400000) ) {
                http_response_code(400);
                exit(json_encode(["error" => "La imagen tiene que ser JPG o PNG y no puede ocupar mas de 400KB"]));
            } else {
                $ext = strpos($mime, "jpeg") ? ".jpg":".png";
                $nombreImagen = "p-".$juego->nombre."-".$i.$ext;
                $ruta = ROOT."images/".$nombreImagen;
                
                $imgFind = $ruta;
                $imgFile = glob($imgFind);
                
            foreach($imgFile as $fichero) unlink($fichero);
                if(move_uploaded_file($rutaTemp,$ruta)) {

                //Prepara el contenido del campo imgSrc
                $imgSRC = "http://localhost/".basename(ROOT)."/images/".$nombreImagen;
                
                $eval = "INSERT INTO imagenes (direccion,idJuego) VALUES (?,?)";
                $peticion = $this->db->prepare($eval);
                $peticion->execute([$imgSRC,$idJuego]);
                
                $consulta = "SELECT imagenes.id FROM imagenes WHERE imagenes.direccion = ?";
                $peticion = $this->db->prepare($consulta);
                $peticion->execute([$imgSRC]);
                $idImagen = $peticion->fetchObject();
                
                $eval = "UPDATE juego SET imagen=? WHERE id=?";
                $peticion = $this->db->prepare($eval);
                $peticion->execute([$idImagen->id,$idJuego->id]);
                }
            }
        }
    }
        $consulta = "SELECT id, direccion FROM imagenes WHERE imagenes.idJuego = ?";
        $peticion = $this->db->prepare($consulta);
        $peticion->execute([$idJuego]);
        $imagenesExistentes = $peticion->fetchAll(PDO::FETCH_OBJ);
        $imagenesEliminar = [];
        
        for($i=0;$i<sizeof($imagenesExistentes);$i++){
            $existe="false";
            for($x=0;$x<$cantidadDeImagenesMantenidas;$x++){
                if($imagenesAntiguas[$x]==$imagenesExistentes[$i]){
                    $existe="true";
                }
            }
            if($existe=="false"){
                $imagenesEliminar[]=$imagenesExistentes[$i];
            }
        }
        

        
        for($i=0;$i<sizeof($imagenesEliminar);$i++){
            $consulta = "delete FROM imagenes WHERE imagenes.id = ?";
            $peticion = $this->db->prepare($consulta);
            $peticion->execute([$imagenesEliminar[$i]->id]);
            
            $imgFile = glob($imagenesEliminar[$i]->direccion);
            foreach($imgFile as $fichero) unlink($fichero);
            
        }
        
        if($principalVieja="true"){
            $eval = "UPDATE juego SET imagen=? WHERE id=?";
            $peticion = $this->db->prepare($eval);
            $peticion->execute([$imagenPrincipal,$idJuego]);
        }
    
        
            exit(json_encode("Juego creado"));
  
      }
      
  public function eliminarJuego($id) {
    if(IDUSER) {
      $eval = "DELETE FROM juego WHERE id=?";
      $peticion = $this->db->prepare($eval);
      $resultado = $peticion->execute([$id]);
      http_response_code(200);
      exit(json_encode("juego eliminado correctamente"));
    } else {
      http_response_code(401);
      exit(json_encode(["error" => "Fallo de autorizacion"]));            
    }
  }
}