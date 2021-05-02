import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { Usuario } from 'src/app/clases/usuario';
import { UsuariosService } from 'src/app/servicios/usuarios.service';

@Component({
  selector: 'app-barra-navegacion',
  templateUrl: './barra-navegacion.component.html',
  styleUrls: ['./barra-navegacion.component.css']
})

export class BarraNavegacionComponent implements OnInit {
  logueado= this.servicioUsuarios.isLogged 
  usuario: Usuario = new Usuario;
  constructor(private servicioUsuarios:UsuariosService, private irHacia:Router) { }

  ngOnInit(): void {
    this.cargarUsuario()
  }
  doLogout(): void{
    this.irHacia.navigate([''])
    this.servicioUsuarios.logOut()
  }
  cargarUsuario(): void{
    if(this.servicioUsuarios.isLogged()){
    this.servicioUsuarios.obtenerPerfil().subscribe(
      respuesta => {
        console.log(respuesta)
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
