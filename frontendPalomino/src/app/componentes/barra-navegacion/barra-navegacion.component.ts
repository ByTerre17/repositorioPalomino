import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { Usuario } from 'src/app/clases/usuario';
import { ComentariosService } from 'src/app/servicios/comentarios.service';
import { JuegosService } from 'src/app/servicios/juegos.service';
import { UsuariosService } from 'src/app/servicios/usuarios.service';

@Component({
  selector: 'app-barra-navegacion',
  templateUrl: './barra-navegacion.component.html',
  styleUrls: ['./barra-navegacion.component.css']
})

export class BarraNavegacionComponent implements OnInit {
  logueado= this.servicioUsuarios.isLogged 
  usuario: Usuario = new Usuario;
  plataformas:any[] = []
  listoGeneros:any
  constructor(private servicioUsuarios:UsuariosService, private irHacia:Router,private ruta: ActivatedRoute,private servicioComentarios:ComentariosService,private servicioJuegos:JuegosService) { }

  ngOnInit(): void {
    this.cargarUsuario()
    this.obtenerPlataformas()
  }
  doLogout(): void{
    this.irHacia.navigate([''])
    this.servicioUsuarios.logOut()
  }
  obtenerPlataformas(): void{
    this.servicioJuegos.listarPlataformas().subscribe(
      respuesta =>{
        this.plataformas=respuesta
        this.listoGeneros=true
      },
      error => {console.log(error)}
    )
  }
  cargarUsuario(): void{
    if(this.servicioUsuarios.isLogged()){
    this.servicioUsuarios.obtenerPerfil().subscribe(
      respuesta => {
        this.usuario = respuesta
      },
      error => console.log(error)
    )
    }
  }
  isAdmin(): Boolean{
    var resultado = false
    if(this.servicioUsuarios.isLogged()){
      if(this.usuario.rol=="admin"){
          resultado = true;
      }
      else{
        resultado = false;
      }
    }
    return resultado
  }
}
