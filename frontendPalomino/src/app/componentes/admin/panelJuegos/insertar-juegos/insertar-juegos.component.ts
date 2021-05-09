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
  generos:any;
  plataformas:any;
  usuario: any;
  form1= this.fb.group({
    nombre:['', [Validators.required]],
    fechaDeLanzamiento:[Date, [Validators.required]],
    comprar:['', [Validators.required]],
    edad:['', [Validators.required]],
    creador:['', [Validators.required]],
    genero:['', [Validators.required]],
    plataforma:['', [Validators.required]],
    numeroDeJugadores:['', [Validators.required]],
    imagenes: this.fb.array([this.fb.group({imagen: ['']})]),
    videos: this.fb.array([this.fb.group({video: ['']})]),
    nota:[ '', [Validators.required]],
    cantidadImagenes:['', [Validators.required]],
    resumen:['', [Validators.required]]

  })
  
  constructor(private fb:FormBuilder, private servicioUsuario:UsuariosService, private irHacia:Router,private serviciojuego:JuegosService,) { }

  ngOnInit(): void {
    this.cargarUsuario()
    this.obtenerGeneros()
    this.obtenerPlataformas()
  }
  cargarUsuario(): void{
    if(this.servicioUsuario.isLogged()){
    this.servicioUsuario.obtenerPerfil().subscribe(
      respuesta => {
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
  cambiaImagen(evento: any,indice:any): void{
    if(evento.target.files){
      this.imagen[indice] =evento.target.files[0]
      this.form1.get("cantidadImagenes")?.setValue(this.imagen.length)
    }
  }
  
  get getImagenes(){
    return this.form1.get('imagenes') as FormArray
  }

  get getVideos(){
    return this.form1.get('videos') as FormArray
  }

  cambiarFotoPrincipal(imagenPrincipal: any){
    this.imagenPrincipal=imagenPrincipal
  }

  obtenerGeneros(): void{
    this.serviciojuego.listarGeneros().subscribe(
      respuesta =>{
        this.generos=respuesta
      },
      error => {console.log(error)}
    )
  }

  obtenerPlataformas(): void{
    this.serviciojuego.listarPlataformas().subscribe(
      respuesta =>{
        this.plataformas=respuesta
      },
      error => {console.log(error)}
    )
  }

  addImagen(){
    const control = <FormArray>this.form1.controls['imagenes']
    control.push(this.fb.group({imagen:[]}))
  }
  eliminarImagen(){
    const control = <FormArray>this.form1.controls['imagenes']
    if(control.length>1){
      control.removeAt(control.length-1)
      this.imagen.splice(control.length)
      this.form1.get("cantidadImagenes")?.setValue(this.form1.get("cantidadImagenes")?.value-1)
      console.log(this.imagen)
    }
  }
  addVideo(){
    const control = <FormArray>this.form1.controls['videos']
    control.push(this.fb.group({video:[]}))
  }
  eliminarVideo(){
    const control = <FormArray>this.form1.controls['videos']
    if(control.length>1){
      control.removeAt(control.length-1)
    }
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
    console.log(juego)
    this.serviciojuego.crearJuego( formData ).subscribe(
      respuesta =>{
        console.log(respuesta)
      },
      error => console.log(error)
    )
  }
}
