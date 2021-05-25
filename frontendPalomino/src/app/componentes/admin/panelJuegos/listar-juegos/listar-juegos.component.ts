import { Component, OnInit } from '@angular/core';
import { FormBuilder } from '@angular/forms';
import { Router } from '@angular/router';
import { JuegosService } from 'src/app/servicios/juegos.service';
import { UsuariosService } from 'src/app/servicios/usuarios.service';

@Component({
  selector: 'app-listar-juegos',
  templateUrl: './listar-juegos.component.html',
  styleUrls: ['./listar-juegos.component.css']
})
export class ListarJuegosComponent implements OnInit {
  juegos: any[] = []
  logueado:any
  usuario: any;
  juegosListo: Boolean = false
  constructor(private fb:FormBuilder,private servicioJuegos:JuegosService,private servicioUsuarios:UsuariosService, private irHacia:Router) { }

  ngOnInit(): void {
    this.cargarUsuario()
    this.logueado= this.servicioUsuarios.isLogged
    this.obtenerJuegos()
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

  eliminarJuego(idJuego:number): void{
    if(this.servicioUsuarios.isLogged()){
      this.servicioJuegos.eliminarJuego(idJuego).subscribe(
        respuesta => {
          console.log(respuesta)
        },
        error => console.log(error)
      )
    }
  }

  editarJuego(idJuego:number): void{
    this.irHacia.navigate(["/administracion/juegos/editar/"+idJuego])
  }

  verJuego(idJuego:number): void{
    this.irHacia.navigate(["/verJuego/"+idJuego])
  }


  obtenerJuegos(): void{
    this.servicioJuegos.listarJuegos().subscribe(
      respuesta =>{
        this.juegos=respuesta
        this.juegosListo=true
      },
      error => {console.log(error)}
    )
  }

}
