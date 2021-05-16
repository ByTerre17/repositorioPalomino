import { DOCUMENT } from '@angular/common';
import { Component, Inject, OnInit } from '@angular/core';
import { FormBuilder, Validators } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { ComentariosService } from 'src/app/servicios/comentarios.service';
import { JuegosService } from 'src/app/servicios/juegos.service';
import { UsuariosService } from 'src/app/servicios/usuarios.service';

@Component({
  selector: 'app-ver-juego',
  templateUrl: './ver-juego.component.html',
  styleUrls: ['./ver-juego.component.css']
})
export class VerJuegoComponent implements OnInit {
  idJuego: any
  juegos: any[] = []
  juego: any
  votado: Boolean = false
  logueado: any = this.servicioUsuarios.isLogged
  comentarios:any
  urlActiva: any
  usuario: any
  cargado:Boolean = false
  formComentario = this.fb.group({
    idJuego: [''],
    idUsuario: [''],
    texto: ['', Validators.required],
    titulo: ['', Validators.required],
    nota: ['', Validators.required]
  })
  constructor(private ruta: ActivatedRoute,private fb:FormBuilder,private servicioJuegos:JuegosService,private servicioUsuarios:UsuariosService, private irHacia:Router,private servicioComentarios:ComentariosService,@Inject(DOCUMENT) document: any) { }

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
      },
      error => {console.log(error)}
    )
  }

  escribirComentario(): void{
    console.log(this.formComentario.value)
    this.servicioComentarios.crearComentario(this.formComentario.value).subscribe(
      respuesta =>{
        window.location.reload();
      },
      error => console.log(error)
    )
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

  eliminarComentario(idComentario:any): void{
    if(this.servicioUsuarios.isLogged()){
    this.servicioComentarios.eliminarComentario(idComentario,this.usuario.id).subscribe(
      respuesta => {
        console.log(respuesta)
        window.location.reload();
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
    respuesta => {
      console.log(respuesta)
      if(respuesta=="true"){
        this.comentarios[indice].likes++
      }
      else if(respuesta=="mod"){
        this.comentarios[indice].likes++
        this.comentarios[indice].dislikes--
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
    respuesta => {
      console.log(respuesta)
      if(respuesta=="true"){
        this.comentarios[indice].dislikes++
      }
      else if(respuesta=="mod"){
        this.comentarios[indice].likes--
        this.comentarios[indice].dislikes++
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
