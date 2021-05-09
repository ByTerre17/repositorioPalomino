import { Component, OnInit } from '@angular/core';
import { FormBuilder, Validators } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { ComentariosService } from 'src/app/servicios/comentarios.service';
import { JuegosService } from 'src/app/servicios/juegos.service';
import { UsuariosService } from 'src/app/servicios/usuarios.service';

@Component({
  selector: 'app-reportar-comentario',
  templateUrl: './reportar-comentario.component.html',
  styleUrls: ['./reportar-comentario.component.css']
})
export class ReportarComentarioComponent implements OnInit {

  constructor(private ruta: ActivatedRoute,private fb:FormBuilder, private servicioUsuario:UsuariosService, private irHacia:Router,private serviciojuego:JuegosService, private servicioComentarios:ComentariosService) { }
  idComentario : any;
  comentario: any;
  form1= this.fb.group({
    titulo:['', [Validators.required]],
    descripcion:['', [Validators.required]]
  })
  ngOnInit(): void {
    this.idComentario = this.ruta.snapshot.paramMap.get("id")
    this.obtenerComentario()
  }

  obtenerComentario(): void{
    this.servicioComentarios.obtenerComentario(this.idComentario).subscribe(
      respuesta =>{
        this.comentario=respuesta
        console.log(this.comentario)
      },
      error => {console.log(error)}
    )
  }

  submit(): void{
    var formData = new FormData()
    var reporte = JSON.stringify(this.form1.getRawValue())
    formData.append("reporte", reporte)
    formData.append("idComentario", this.idComentario)

    this.servicioComentarios.crearReporte( formData ).subscribe(
      respuesta =>{
        console.log(respuesta)
      },
      error => console.log(error)
    )
  }
}
