import { Component, OnInit } from '@angular/core';
import { FormBuilder } from '@angular/forms';
import { DomSanitizer } from '@angular/platform-browser';
import { Router } from '@angular/router';
import { Juego } from 'src/app/clases/juego';
import { ComentariosService } from 'src/app/servicios/comentarios.service';
import { JuegosService } from 'src/app/servicios/juegos.service';
import { UsuariosService } from 'src/app/servicios/usuarios.service';

@Component({
  selector: 'app-inicio',
  templateUrl: './inicio.component.html',
  styleUrls: ['./inicio.component.css']
})
export class InicioComponent implements OnInit {
  juegos1: any[] = []
  logueado:any
  boton:any
  comentariosMasLikes:any
  juegosMasComentarios:any
  urlVideo:String = "https://www.youtube.com/embed/"
  opcionesVideo:String = "?autoplay=1&mute=1"
  videoJuegoMejorValorado:any
  preparadoJuegosRecuadro1:Boolean = false;
  preparadoVideosJuegoMejorValorado:Boolean = false;
  preparadoJuegosRecuadro3:Boolean = false;
  preparadoComentarMasLikes:Boolean = false;
  constructor(private fb:FormBuilder,private servicioComentarios:ComentariosService,private servicioJuegos:JuegosService,private servicioUsuarios:UsuariosService, private irHacia:Router, private sanitizer: DomSanitizer) { }

  ngOnInit(): void {
    this.logueado= this.servicioUsuarios.isLogged
    this.obtenerJuegosRecuadro1(3)
    this.obtenerVideosJuegoMejorValorado()
    this.obtenerJuegosRecuadro3()
    this.listComentarMasLikes()
  }



  obtenerJuegosRecuadro1(cantidad:number): any{
    this.servicioJuegos.listarXJuegosNuevos(cantidad).subscribe(
      respuesta =>{
        this.juegos1=respuesta
        this.preparadoJuegosRecuadro1=true
      },
      error => {console.log(error)}
    )
  }

  obtenerJuegosRecuadro3(): any{
    this.servicioJuegos.listarJuegosMasComentarios().subscribe(
      respuesta =>{
        this.juegosMasComentarios=respuesta
        this.preparadoJuegosRecuadro3=true
      },
      error => {console.log(error)}
    )
  }

  listComentarMasLikes(): any{
    this.servicioComentarios.listComentarMasLikes().subscribe(
      respuesta =>{
        this.comentariosMasLikes=respuesta
        this.preparadoComentarMasLikes=true
      },
      error => {console.log(error)}
    )
  }

  obtenerVideosJuegoMejorValorado(): any{
    this.servicioJuegos.obtenerVideosJuegoMejorValorado().subscribe(
      respuesta =>{
        this.videoJuegoMejorValorado=respuesta
        this.videoJuegoMejorValorado=this.videoJuegoMejorValorado[0].direccion.substring(32,1000)
        this.videoJuegoMejorValorado=this.urlVideo +this.videoJuegoMejorValorado + this.opcionesVideo
        this.preparadoVideosJuegoMejorValorado=true
      },
      error => {console.log(error)}
    )
  }
  video(){
    return this.sanitizer.bypassSecurityTrustResourceUrl(this.videoJuegoMejorValorado);
  }
  verJuego(id:number): void{
    this.irHacia.navigate(["/verJuego/"+id])
  }
}
