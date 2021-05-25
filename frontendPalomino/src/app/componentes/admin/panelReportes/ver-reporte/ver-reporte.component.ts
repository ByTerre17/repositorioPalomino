import { Component, OnInit } from '@angular/core';
import { FormBuilder } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { ComentariosService } from 'src/app/servicios/comentarios.service';
import { JuegosService } from 'src/app/servicios/juegos.service';
import { UsuariosService } from 'src/app/servicios/usuarios.service';

@Component({
  selector: 'app-ver-reporte',
  templateUrl: './ver-reporte.component.html',
  styleUrls: ['./ver-reporte.component.css']
})
export class VerReporteComponent implements OnInit {

  constructor(private ruta: ActivatedRoute,private fb:FormBuilder, private servicioUsuario:UsuariosService, private irHacia:Router,private serviciojuego:JuegosService, private servicioComentarios:ComentariosService) { }
  idComentario : any;
  comentario: any;
  reporte:any;
  idReporte:any
  comentarioListo=false
  ngOnInit(): void {
    this.idReporte = this.ruta.snapshot.paramMap.get("id")
    this.obtenerReporte()
  }


  obtenerComentario(): void{
    this.servicioComentarios.obtenerComentario(this.idComentario).subscribe(
      respuesta =>{
        this.comentario=respuesta
        
        this.comentarioListo=true
      },
      error => {console.log(error)}
    )
  }
  obtenerReporte(): void{
    this.servicioComentarios.obtenerReporte(this.idReporte).subscribe(
      respuesta =>{
        this.reporte=respuesta
        console.log(this.reporte)
        this.idComentario=this.reporte.idComentario
        this.obtenerComentario()
      },
      error => {console.log(error)}
    )
  }
  eliminarComentario(): void{
    if(this.servicioUsuario.isLogged()){
      var formData = new FormData()
      formData.append("idComentario",this.idComentario)
      this.servicioComentarios.eliminarComentarioAdmin(formData).subscribe(
        respuesta => {
          this.irHacia.navigate(['/administracion/reportes/listarReportes'])
        },
        error => console.log(error)
      )
    }
  }

eliminarReporte(): void{
  if(this.servicioUsuario.isLogged()){
    var formData = new FormData()
    formData.append("idReporte",this.idReporte)
    this.servicioComentarios.eliminarReporte(formData).subscribe(
      respuesta => {
        this.irHacia.navigate(['/administracion/reportes/listarReportes'])
      },
      error => console.log(error)
    )
  }
}
}
