import { Component, OnInit } from '@angular/core';
import { FormBuilder } from '@angular/forms';
import { Router } from '@angular/router';
import { ComentariosService } from 'src/app/servicios/comentarios.service';
import { JuegosService } from 'src/app/servicios/juegos.service';
import { UsuariosService } from 'src/app/servicios/usuarios.service';

@Component({
  selector: 'app-listar-reportes',
  templateUrl: './listar-reportes.component.html',
  styleUrls: ['./listar-reportes.component.css']
})
export class ListarReportesComponent implements OnInit {

  constructor(private fb:FormBuilder,private servicioJuegos:JuegosService,private servicioComentarios:ComentariosService, private servicioUsuarios:UsuariosService, private irHacia:Router) { }
  reportes : any
  logueado:any
  usuario: any;

  ngOnInit(): void {
    this.cargarUsuario()
    this.logueado= this.servicioUsuarios.isLogged
    this.obtenerReportes()
  }

  obtenerReportes(): void{
    this.servicioComentarios.listarReportes().subscribe(
      respuesta =>{
        this.reportes=respuesta
        console.log(this.reportes)
      },
      error => {console.log(error)}
    )
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
  verReporte(idReporte:number): void{
    this.irHacia.navigate(["administracion/reportes/verReporte/"+idReporte])
  }
}
