import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { UsuariosService } from 'src/app/servicios/usuarios.service';

@Component({
  selector: 'app-panel-juegos',
  templateUrl: './panel-juegos.component.html',
  styleUrls: ['./panel-juegos.component.css']
})
export class PanelJuegosComponent implements OnInit {
  usuario: any;

  constructor(private servicioUsuarios:UsuariosService, private irHacia:Router) { }

  ngOnInit(): void {
    this.cargarUsuario()
  }

  cargarUsuario(): void{
    if(this.servicioUsuarios.isLogged()){
    this.servicioUsuarios.obtenerPerfil().subscribe(
      respuesta => {
        console.log(respuesta)
        this.usuario = respuesta
        if(this.usuario.rol!="admin"){
          this.irHacia.navigate([''])
        }
      },
      error => console.log(error)
    )
    }
    else{
      this.irHacia.navigate([''])
    }
  }
}