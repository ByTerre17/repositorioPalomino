import { DOCUMENT } from '@angular/common';
import { Component, Inject, OnInit } from '@angular/core';
import { FormBuilder, Validators } from '@angular/forms';
import { DomSanitizer } from '@angular/platform-browser';
import { ActivatedRoute, Router } from '@angular/router';
import { delay } from 'src/app/lib/common';
import { ComentariosService } from 'src/app/servicios/comentarios.service';
import { JuegosService } from 'src/app/servicios/juegos.service';
import { UsuariosService } from 'src/app/servicios/usuarios.service';

@Component({
  selector: 'app-ver-juego',
  templateUrl: './ver-juego.component.html',
  styleUrls: ['./ver-juego.component.css']
})
export class VerJuegoComponent implements OnInit {
  [x: string]: any;
  idJuego: any
  juegos: any[] = []
  juego: any
  votado: Boolean = false
  logueado: any = this.servicioUsuarios.isLogged
  comentarios:any
  urlActiva: any
  usuario: any
  imagenes:any
  urlVideo:String = "https://www.youtube.com/embed/"
  videos:any
  cajaDeComentarios:Boolean = true
  cajaDeDetalles:Boolean = false
  cajaDeMultimedia:Boolean = false
  cargado:Boolean = false
  tituloError:any
  textoError:any
  notaError:any
  plataformas:any
  plataforma:any
  prueba:any
  indiceVideos:number =0
  indiceImagenes:number =0
  videosListo:Boolean = false
  imagenesListo:Boolean = false
  formComentario = this.fb.group({
    idJuego: [''],
    idUsuario: [''],
    texto: ['', Validators.required],
    titulo: ['', Validators.required],
    nota: ['', Validators.required]
  })
  constructor(private ruta: ActivatedRoute,private fb:FormBuilder,private servicioJuegos:JuegosService,private servicioUsuarios:UsuariosService, private irHacia:Router,private servicioComentarios:ComentariosService,private sanitizer: DomSanitizer) { }

  ngOnInit(): void {
    this.idJuego = this.ruta.snapshot.paramMap.get("id")
    this.obtenerJuego()
    this.urlActiva = document.location.href
    this.cargarPerfil()
  }
  obtenerJuego(): void{
    this.servicioJuegos.verJuego(this.idJuego).subscribe(
      respuesta =>{
        this.juego=respuesta
        this.obtenerComentariosPorJuego(this.idJuego)
        this.obtenerVideos(this.juego.id)
        this.obtenerImagenesJuego(this.juego.id)
        this.obtenerPlataformas()
      },
      error => {console.log(error)}
    )
  }
  get videoUrl(){
    return this.sanitizer.bypassSecurityTrustResourceUrl(this.videos[0].direccion);
  }
  
  indiceVideoUrlCarrusel(){
    this.indiceVideos++
    if(this.indiceVideos==this.videos.length){
      this.indiceVideos=0
    }  
  }
  indiceImagenUrlCarrusel(){
    this.indiceImagenes++
    if(this.indiceImagenes==this.imagenes.length){
      this.indiceImagenes=0
    }
  }
  get videoUrlCarrusel(){
    return this.sanitizer.bypassSecurityTrustResourceUrl(this.videos[this.indiceVideos].direccion);
  }
  get imagenUrlCarrusel(){
    return this.imagenes[this.indiceImagenes].direccion;
  }
  obtenerPlataformas(): void{
    this.servicioJuegos.listarPlataformas().subscribe(
      respuesta =>{
        this.plataformas=respuesta
        for(var i=0;i<this.plataformas.length;i++){
          if(this.juego.plataforma==this.plataformas[i].nombre){
            this.plataforma=this.plataformas[i].id
          }
        }
      },
      error => {console.log(error)}
    )
  }
  obtenerImagenesJuego(idJuego:number): void{
    this.servicioJuegos.imagenesJuego(idJuego).subscribe(
      respuesta =>{
        this.imagenes=respuesta
        this.imagenesListo=true
      },
      error => {console.log(error)}
    )
  }
  obtenerVideos(idJuego:number): void{
    this.servicioJuegos.listarVideos(idJuego).subscribe(
      respuesta =>{
        this.videos=respuesta
        for(let i =0;i<this.videos.length;i++){
          let direccion = this.videos[i].direccion.substring(32,1000)
          this.videos[i].direccion = this.urlVideo + direccion
        }
        this.prueba=this.sanitizer.bypassSecurityTrustResourceUrl(this.videos[0].direccion)
        this.videosListo=true
      },
      error => {console.log(error)}
    )
  }
  mostrarCajaComentarios(): void{
    this.cajaDeComentarios=true
    this.cajaDeMultimedia=false
    this.cajaDeDetalles=false
  }
  mostrarCajaDetalles(): void{
    this.cajaDeComentarios=false
    this.cajaDeMultimedia=false
    this.cajaDeDetalles=true
  }
  mostrarCajaMultimedia(): void{
    this.cajaDeComentarios=false
    this.cajaDeMultimedia=true
    this.cajaDeDetalles=false
  }
  escribirComentario(): void{
    if(this.servicioUsuarios.isLogged()){
      let valido = true
      if(this.formComentario.get("titulo")?.value == ""){
        valido=false
        const element: HTMLElement = document.getElementById('titulo') as HTMLElement
        element.innerHTML = 'El titulo del comentario no puede estar vacío'
      }
      if(this.formComentario.get("nota")?.value == "" || this.formComentario.get("nota")?.value > 10 || this.formComentario.get("nota")?.value < 1){
        valido=false
        const element: HTMLElement = document.getElementById('nota') as HTMLElement
        element.innerHTML = 'La nota del comentario no puede estar vacía ni superar el 10 ni ser menor de 1'
      }
      if(this.formComentario.get("texto")?.value == "" ){
        valido=false
        const element: HTMLElement = document.getElementById('texto') as HTMLElement
        element.innerHTML = 'La explicacion del comentario no puede estar vacío'
      }
      if(valido==true){
        this.servicioComentarios.crearComentario(this.formComentario.value).subscribe(
          async respuesta =>{
            if(respuesta=="Comentario creado"){
              const element2: HTMLElement = document.getElementById('estado1') as HTMLElement
              element2.innerHTML = 'El comentario ha sido creado con éxito'
              await delay(1500);
              window.location.reload();
            }
          },
          error => console.log(error)
        )
      }
    }  
  }
  obtenerComentariosPorJuego(idJuego: any): void{
    this.servicioComentarios.listarComentariosPorJuego(idJuego).subscribe(
      respuesta =>{
        this.comentarios=respuesta
        for(let i=0;i<this.comentarios.length;i++){
          if(this.comentarios[i].likes==null){
            this.comentarios[i].likes=0
          }
          if(this.comentarios[i].dislikes==null){
            this.comentarios[i].dislikes=0
          }
        }
        this.cargado=true
      },
      error => {console.log(error)}
    )
  }
  cargarPerfil(): void{
    if(this.servicioUsuarios.isLogged()){
    this.servicioUsuarios.obtenerPerfil().subscribe(
      respuesta => {
        this.usuario = respuesta
      },
      error => console.log(error)
    )
    }
  }

likeComentario(idComentario:any,cantidadLikes:number,cantidadDislikes:number,indice:number): void{
  if(this.servicioUsuarios.isLogged()){
    var formData = new FormData()
    formData.append("idComentario",idComentario)
    formData.append("idUsuario",this.usuario.id)
  this.servicioComentarios.likeComentario(formData).subscribe(
    async respuesta => {
      if(respuesta=="true"){
        const element2: HTMLElement = document.getElementById('estadoComentario'+idComentario) as HTMLElement
        element2.innerHTML = 'El like ha sido introducido con éxito'
        this.comentarios[indice].likes++
        await delay(1500);
        element2.innerHTML = ''
      }
      else if(respuesta=="mod"){
        const element2: HTMLElement = document.getElementById('estadoComentario'+idComentario) as HTMLElement
        element2.innerHTML = 'El like ha sido introducido con éxito'
        this.comentarios[indice].likes++
        this.comentarios[indice].dislikes--
        await delay(1500);
        element2.innerHTML = ''
      }
    },
    error => console.log(error)
  )
}
}
dislikeComentario(idComentario:any,cantidadLikes:number,cantidadDislikes:number,indice:number): void{
  if(this.servicioUsuarios.isLogged()){
    var formData = new FormData()
    formData.append("idComentario",idComentario)
    formData.append("idUsuario",this.usuario.id)
  this.servicioComentarios.dislikeComentario(formData).subscribe(
    async respuesta => {
      console.log(respuesta)
      if(respuesta=="true"){
        const element2: HTMLElement = document.getElementById('estadoComentario'+idComentario) as HTMLElement
        element2.innerHTML = 'El dislike ha sido introducido con éxito'
        this.comentarios[indice].dislikes++
        await delay(1500);
        element2.innerHTML = ''
      }
      else if(respuesta=="mod"){
        const element2: HTMLElement = document.getElementById('estadoComentario'+idComentario) as HTMLElement
        element2.innerHTML = 'El dislike ha sido introducido con éxito'
        this.comentarios[indice].likes--
        this.comentarios[indice].dislikes++
        await delay(1500);
        element2.innerHTML = ''
      }
    },
    error => console.log(error)
  )
}
}
  comprobarUsuario(idRespuestaUsuario:any): boolean{
    let igual = false
    if(this.servicioUsuarios.isLogged()){
    if(this.usuario.id == idRespuestaUsuario){
      igual = true
    }
    }
  return igual
  }
  reportarComentario(idComentario:number): void{
    this.irHacia.navigate(["/reportarComentario/"+idComentario])
  }
}
