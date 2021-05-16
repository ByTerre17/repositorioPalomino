<?php
use \Firebase\JWT\JWT;


class JuegoController {

  private $db = null;

  function __construct($conexion) {
    $this->db = $conexion;
  }

  public function listarJuegos() {
      
      $eval = "SELECT juego.id as id, juego.nombre as nombre, juego.fechaDeLanzamiento as fechaDeLanzamiento, juego.comprar as comprar, juego.edad as edad, juego.creador as creador, genero.nombre as genero, plataforma.nombre as plataforma, juego.numeroDeJugadores as numeroDeJugadores, juego.fechaDePublicacion as fechaDePublicacion, imagenes.direccion as imagen, juego.nota, juego.resumen   FROM juego,imagenes,plataforma,genero WHERE juego.plataforma = plataforma.id and juego.genero = genero.id and juego.imagen = imagenes.id";
      $peticion = $this->db->prepare($eval);
      $peticion->execute();
      $juegos = $peticion->fetchAll(PDO::FETCH_OBJ);
      $eval = "SELECT juego.id, FORMAT(AVG(comentario.nota),1)*10 as notaMedia FROM juego,comentario WHERE juego.id = comentario.idJuego GROUP BY juego.id";
      $peticion = $this->db->prepare($eval);
      $peticion->execute();
      $medias = $peticion->fetchAll(PDO::FETCH_OBJ);
      foreach ($juegos as $juego){
        $juego->nota=$juego->nota*10;
        foreach ($medias as $media){
            if($media->id==$juego->id){
                $juego->nota=$media->notaMedia;
            }
        }
      }
      exit(json_encode($juegos));
    
  }
  
  public function listarJuegosMasComentarios() {
     
      $eval = "SELECT juego.id as id, juego.nombre as nombre, juego.fechaDeLanzamiento as fechaDeLanzamiento, juego.comprar as comprar, juego.edad as edad, juego.creador as creador, genero.nombre as genero, plataforma.nombre as plataforma, juego.numeroDeJugadores as numeroDeJugadores, juego.fechaDePublicacion as fechaDePublicacion, imagenes.direccion as imagen, juego.nota, juego.resumen, COUNT(comentario.id) AS cantidadComentarios   FROM juego,imagenes,plataforma,genero,comentario WHERE juego.plataforma = plataforma.id and juego.genero = genero.id and juego.imagen = imagenes.id and juego.id = comentario.idJuego GROUP BY juego.id LIMIT 4";
      $peticion = $this->db->prepare($eval);
      $peticion->execute();
      $juegos = $peticion->fetchAll(PDO::FETCH_OBJ);
      $eval = "SELECT juego.id, FORMAT(AVG(comentario.nota),1)*10 as notaMedia FROM juego,comentario WHERE juego.id = comentario.idJuego GROUP BY juego.id";
      $peticion = $this->db->prepare($eval);
      $peticion->execute();
      $medias = $peticion->fetchAll(PDO::FETCH_OBJ);
      foreach ($juegos as $juego){
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
    
    $eval = "SELECT juego.id as id, juego.nombre as nombre, juego.fechaDeLanzamiento as fechaDeLanzamiento, juego.comprar as comprar, juego.edad as edad, juego.creador as creador, genero.nombre as genero, plataforma.nombre as plataforma, juego.numeroDeJugadores as numeroDeJugadores, juego.fechaDePublicacion as fechaDePublicacion, imagenes.direccion as imagen, juego.nota, juego.resumen   FROM juego,imagenes,plataforma,genero WHERE juego.plataforma = plataforma.id and juego.genero = genero.id and juego.imagen = imagenes.id ORDER BY fechaDePublicacion DESC LIMIT ".$cantidad;
    $peticion = $this->db->prepare($eval);
    $peticion->execute();
    $juegos = $peticion->fetchAll(PDO::FETCH_OBJ);
    $eval = "SELECT juego.id, FORMAT(AVG(comentario.nota),1)*10 as notaMedia FROM juego,comentario WHERE juego.id = comentario.idJuego GROUP BY juego.id";
    $peticion = $this->db->prepare($eval);
    $peticion->execute();
    $medias = $peticion->fetchAll(PDO::FETCH_OBJ);
    foreach ($juegos as $juego){
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
      $consulta = "SELECT juego.id as id, juego.nombre as nombre, juego.fechaDeLanzamiento as fechaDeLanzamiento, juego.comprar as comprar, juego.edad as edad, juego.creador as creador, genero.nombre as genero, plataforma.nombre as plataforma, juego.numeroDeJugadores as numeroDeJugadores, juego.fechaDePublicacion as fechaDePublicacion, imagenes.direccion as imagen, juego.nota, juego.resumen   FROM juego,imagenes,plataforma,genero WHERE juego.id=? and juego.plataforma = plataforma.id and juego.genero = genero.id and juego.imagen = imagenes.id";
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
     
     public function listarGeneros() {
        $eval = "SELECT * FROM genero";
        $peticion = $this->db->prepare($eval);
        $peticion->execute();
        $generos = $peticion->fetchAll(PDO::FETCH_OBJ);
        exit(json_encode($generos));
     }
     
     public function listarPlataformas() {
        $eval = "SELECT * FROM plataforma";
        $peticion = $this->db->prepare($eval);
        $peticion->execute();
        $plataforma = $peticion->fetchAll(PDO::FETCH_OBJ);
        exit(json_encode($plataforma));
     }
    
    public function listarVideos($idJuego) {
       $eval = "SELECT * FROM videos where idJuego=?";
       $peticion = $this->db->prepare($eval);
       $peticion->execute([$idJuego]);
       $videos = $peticion->fetchAll(PDO::FETCH_OBJ);
       exit(json_encode($videos));
    }
    
  public function juegoMejorValorado() {
    $eval = "SELECT juego.id, FORMAT(AVG(comentario.nota),1)*10 as notaMedia FROM juego,comentario WHERE juego.id = comentario.idJuego GROUP BY juego.id LIMIT 1";
    $peticion = $this->db->prepare($eval);
    $peticion->execute();
    $medias = $peticion->fetchAll(PDO::FETCH_OBJ);
    $idJuego = $medias[0]->id;
    $eval = "SELECT videos.direccion from videos where videos.idJuego = ?";
    $peticion = $this->db->prepare($eval);
    $peticion->execute([$idJuego]);
    $video = $peticion->fetchAll(PDO::FETCH_OBJ);
    exit(json_encode($video));
    
  }

  public function crearJuego() {
    //Guardamos los parametros de la petición.
    $juego = json_decode($_POST['juego']);
    $videos=$juego->videos;
    $idJuego;
    $idImagen;
    $imagenPrincipal=$_FILES['imagenPrincipal'];
    $idImagenPrincipal;
    $cantidadDeImagenes = $juego->cantidadImagenes;
    $imagenes = [];
    
    
    //Comprobamos que los datos sean consistentes.
    if(!isset($juego->nombre) || !isset($juego->fechaDeLanzamiento) || !isset($juego->comprar) || !isset($juego->edad) || !isset($juego->creador) || !isset($juego->genero) || !isset($juego->plataforma) || !isset($juego->numeroDeJugadores)    || !isset($juego->resumen) || !isset($videos) ) {
      http_response_code(400);
      exit(json_encode(["error" => "No se han enviado todos los parametros"]));

    }

    for($i=0;$i<=$cantidadDeImagenes;$i++){
        if(isset($_FILES['imagen'.$i])){
            $imagenes[]=$_FILES['imagen'.$i];
        }
    }
    
    $imagenes[]=$imagenPrincipal;
    
    
    
    $eval = "INSERT INTO juego (nombre,fechaDeLanzamiento,comprar,edad,creador,genero,plataforma,numeroDeJugadores,nota,resumen) VALUES (?,?,?,?,?,?,?,?,?,?)";
    $peticion = $this->db->prepare($eval);
    $peticion->execute([$juego->nombre,$juego->fechaDeLanzamiento,$juego->comprar,$juego->edad,$juego->creador,$juego->genero,$juego->plataforma,$juego->numeroDeJugadores,$juego->nota,$juego->resumen]);
    
    $consulta = "SELECT juego.id FROM juego WHERE juego.nombre = ? AND  juego.creador = ?";
    $peticion = $this->db->prepare($consulta);
    $peticion->execute([$juego->nombre,$juego->creador]);
    $idJuego = $peticion->fetchObject();
    
    for($i=0;$i<(count($videos));$i++){
        $eval = "INSERT INTO videos (idJuego,direccion) VALUES (?,?)";
        $peticion = $this->db->prepare($eval);
        $peticion->execute([$idJuego->id,$videos[$i]->video]);
    }
    
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
                
                $nombreJuego =str_replace(' ', '', $juego->nombre);
                $ext = strpos($mime, "jpeg") ? ".jpg":".png";
                $nombreImagen = "imagen".$nombreJuego."-".$i.$ext;
                $ruta = ROOT."images/".$nombreImagen;
                
                $direccionImagen= ROOT .'images'. '\\' . $nombreImagen;
                unlink($direccionImagen);
                
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
                $nombreJuego =str_replace(' ', '', $juego->nombre);
                $ext = strpos($mime, "jpeg") ? ".jpg":".png";
                $nombreImagen = "imagen".$nombreJuego."-".$i.$ext;
                $ruta = ROOT."images/".$nombreImagen;
                
                
                $direccionImagen= ROOT .'images'. '\\' . $nombreImagen;
                unlink($direccionImagen);
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
    $videos=$juego->videos;
    $idJuego = $_POST['idJuego'];
    $idImagenPrincipal;
    $principalVieja=$_POST['principalVieja'];
    $cantidadDeImagenes = $_POST['cantidadImagenesNuevas'];
    $cantidadImagenesMantenidas=$_POST['cantidadImagenesMantenidas'];
    $imagenes = [];
    $imagenesAntiguas = [];
    
    //Comprobamos que los datos sean consistentes.
    if(!isset($juego->nombre) || !isset($juego->fechaDeLanzamiento) || !isset($juego->comprar) || !isset($juego->edad) || !isset($juego->creador) || !isset($juego->genero) || !isset($juego->numeroDeJugadores)     || !isset($videos) ) {
      http_response_code(400);
      exit(json_encode(["error" => "No se han enviado todos los parametros"]));

    }
    
    for($i=0;$i<$cantidadDeImagenes;$i++){
        if(isset($_FILES['imagen'.$i])){
            $imagenes[]=$_FILES['imagen'.$i];
        }
    }
    
    
    for($i=0;$i<$cantidadImagenesMantenidas;$i++){
        if(isset($_POST['imagenMantenida'.$i])){
            $imagenesAntiguas[]=$_POST['imagenMantenida'.$i];
        }
    }

    if($principalVieja=="false" && $cantidadDeImagenes=!0){
        $imagenPrincipal=$_FILES['imagenPrincipal'];
        $imagenes[]=$imagenPrincipal;
    }
        
        
    if($principalVieja=="true"){
        $imagenPrincipal=$_POST['imagenPrincipal'];
        $imagenesAntiguas[]=$_POST['imagenPrincipal'];
    }
    $consulta = "delete from videos where idJuego=?";
    $peticion = $this->db->prepare($consulta);
    $peticion->execute([$idJuego]);
    
    for($i=0;$i<(count($videos));$i++){
        $eval = "INSERT INTO videos (idJuego,direccion) VALUES (?,?)";
        $peticion = $this->db->prepare($eval);
        $peticion->execute([$idJuego,$videos[$i]->video]);
    }
    
    
    $eval = "update juego set nombre=?, fechaDeLanzamiento=?, comprar=?, edad=?, creador=?, genero=?, plataforma=?, numeroDeJugadores=?, nota=?, resumen=? where id = ?";
    $peticion = $this->db->prepare($eval);
    $peticion->execute([$juego->nombre,$juego->fechaDeLanzamiento,$juego->comprar,$juego->edad,$juego->creador,$juego->genero,$juego->plataforma,$juego->numeroDeJugadores,$juego->nota,$juego->resumen,$idJuego]);   
    
        
    
        $consulta = "SELECT id, direccion FROM imagenes WHERE imagenes.idJuego = ?";
        $peticion = $this->db->prepare($consulta);
        $peticion->execute([$idJuego]);
        $imagenesExistentes = $peticion->fetchAll(PDO::FETCH_OBJ);
        $imagenesEliminar = [];
        
        for($i=0;$i<sizeof($imagenesExistentes);$i++){
            $existe="false";
            for($x=0;$x<$cantidadImagenesMantenidas;$x++){
                if($imagenesAntiguas[$x]==$imagenesExistentes[$i]->id){
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
            
            $direccionImagen= ROOT .'images'. '\\' . substr($imagenesEliminar[$i]->direccion, 40);
            unlink($direccionImagen);
            
        }
    
    
    
    
    
    for($i=0;$i<(count($imagenes)) && $cantidadDeImagenes=!0 ;$i++){
        if($i==$imagenPrincipal && $principalVieja=="false"){
            
            $imagen = $imagenes[$i];
            $mime = $imagen['type'];
            $size = $imagen['size'];
            $rutaTemp = $imagen['tmp_name'];
            
            if( !(strpos($mime, "jpeg") || strpos($mime, "png")) || ($size > 400000) ) {
                http_response_code(400);
                exit(json_encode(["error" => "La imagen tiene que ser JPG o PNG y no puede ocupar mas de 400KB"]));
            } else {
                
                $nombreJuego =str_replace(' ', '', $juego->nombre);
                $ext = strpos($mime, "jpeg") ? ".jpg":".png";
                $nombreImagen = "imagen".$nombreJuego."-".($i+$cantidadDeImagenes+$cantidadImagenesMantenidas).$ext;
                $ruta = ROOT."images/".$nombreImagen;
                
                $direccionImagen= ROOT .'images'. '\\' . $nombreImagen;
                unlink($direccionImagen);
                
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
                $peticion->execute([$idImagen,$idJuego]);
                
                }
            }    
        }
        elseif($i!=$imagenPrincipal && $principalVieja=="true"){
            $imagen = $imagenes[$i];
            $mime = $imagen['type'];
            $size = $imagen['size'];
            $rutaTemp = $imagen['tmp_name'];
            
            
            if( !(strpos($mime, "jpeg") || strpos($mime, "png")) || ($size > 400000) ) {
                http_response_code(400);
                exit(json_encode(["error" => "La imagen tiene que ser JPG o PNG y no puede ocupar mas de 400KB"]));
            } else {
                
                $nombreJuego =str_replace(' ', '', $juego->nombre);
                $ext = strpos($mime, "jpeg") ? ".jpg":".png";
                $nombreImagen = "imagen".$nombreJuego."-".($i+$cantidadDeImagenes+$cantidadImagenesMantenidas).$ext;
                $ruta = ROOT."images/".$nombreImagen;
                
                $imgFind = $ruta;
                $imgFile = glob($imgFind);
                
                $direccionImagen= ROOT .'images'. '\\' . $nombreImagen;
                unlink($direccionImagen);
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
                $peticion->execute([$idImagen->id,$idJuego]);
                }
            }
        }
    }

        
        if($principalVieja=="true"){
            $eval = "UPDATE juego SET imagen=? WHERE id=?";
            $peticion = $this->db->prepare($eval);
            $peticion->execute([$imagenPrincipal,$idJuego]);
        }
    
        
            exit(json_encode("Juego editado"));
  
      }
      
  public function eliminarJuego($id) {
    if(IDUSER) {
        
      $eval = "SELECT * FROM imagenes where idJuego = ?";
      $peticion = $this->db->prepare($eval);
      $peticion->execute([$id]);
      $imagenes = $peticion->fetchAll(PDO::FETCH_OBJ);
      if(isset($imagenes)){
        foreach ($imagenes as $imagen){
          $direccionImagen=ROOT .'images'. '\\'. substr($imagen->direccion, 40);
          unlink($direccionImagen);
        }
      }
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