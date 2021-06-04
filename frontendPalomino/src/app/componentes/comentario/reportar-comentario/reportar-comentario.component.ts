import { Component, OnInit } from '@angular/core';
import { FormBuilder, Validators } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { delay } from 'src/app/lib/common';
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
  comentarioListo=false
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
        this.comentarioListo=true
      },
      error => {console.log(error)}
    )
  }

  submit(): void{
    let valido= true
    const element: HTMLElement = document.getElementById('errores') as HTMLElement

    if(this.form1.get("titulo")?.value == ""){
      valido=false
      element.innerHTML= element.innerHTML + "<br>" + "El titulo del reporte no puede estar en blanco"
    }

    if(this.form1.get("descripcion")?.value == ""){
      valido=false
      element.innerHTML= element.innerHTML + "<br>" + "La descripcion del reporte no puede estar en blanco"
    }

    if(valido==true){
      var formData = new FormData()
      var reporte = JSON.stringify(this.form1.getRawValue())
      formData.append("reporte", reporte)
      formData.append("idComentario", this.idComentario)
      this.servicioComentarios.crearReporte( formData ).subscribe(
        async respuesta =>{
          if(respuesta="Reporte creado"){
            const element2: HTMLElement = document.getElementById('estado') as HTMLElement
            element2.innerHTML = 'El reporte se ha creado con éxito'
            await delay(1500);
            this.irHacia.navigate([''])
          }
        },
      )
    }
  }
}
