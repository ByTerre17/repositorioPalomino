import { Component, OnInit } from '@angular/core';
import { FormArray, FormBuilder, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { JuegosService } from 'src/app/servicios/juegos.service';
import { UsuariosService } from 'src/app/servicios/usuarios.service';

@Component({
  selector: 'app-insertar-juegos',
  templateUrl: './insertar-juegos.component.html',
  styleUrls: ['./insertar-juegos.component.css']
})

export class InsertarJuegosComponent implements OnInit {
  imagen: File []=[];
  imagenPrincipal: any;
  indiceArrayImagenes: any; 
  form1= this.fb.group({
    nombre:['', [Validators.required]],
    fechaDeLanzamiento:[Date, [Validators.required]],
    comprar:['', [Validators.required]],
    edad:['', [Validators.required]],
    creador:['', [Validators.required]],
    genero:['', [Validators.required]],
    numeroDeJugadores:['', [Validators.required]],
    imagenes: this.fb.array([this.fb.group({imagen: ['']})]),
    nota:[ '', [Validators.required]],
    cantidadImagenes:['', [Validators.required]],
    resumen:['', [Validators.required]]

  })
  constructor(private fb:FormBuilder, private servicioUsuario:UsuariosService, private irHacia:Router,private serviciojuego:JuegosService,) { }

  ngOnInit(): void {
    
  }
  cambiaImagen(evento: any,indice:any): void{
    if(evento.target.files){
      this.imagen[indice] =evento.target.files[0]
      this.form1.get("cantidadImagenes")?.setValue(this.imagen.length)
      console.log(this.imagen)
    }
  }
  
  get getImagenes(){
    return this.form1.get('imagenes') as FormArray
  }

  cambiarFotoPrincipal(imagenPrincipal: any){
    this.imagenPrincipal=imagenPrincipal
  }

  addImagen(){
    const control = <FormArray>this.form1.controls['imagenes']
    control.push(this.fb.group({imagen:[]}))
  }

  submit(): void{
    var formData = new FormData()
    var juego = JSON.stringify(this.form1.getRawValue())
    console.log(this.imagen.length)
    for(let indice = 0;indice<this.imagen.length;indice++){
      let nombre
      nombre="imagen"+indice
      if(indice==this.imagenPrincipal){
        nombre="imagenPrincipal"
        formData.append(nombre, this.imagen[indice])
        console.log(this.imagen[indice])
      }
      else{
        formData.append(nombre, this.imagen[indice])
        console.log(this.imagen[indice])
        console.log(nombre)
      }
    }
    formData.append('juego', juego)
    this.serviciojuego.crearJuego( formData ).subscribe(
      respuesta =>{
        console.log(respuesta)
      },
      error => console.log(error)
    )
  }
}
