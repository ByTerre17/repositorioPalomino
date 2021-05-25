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
  imagenesSubidas:number=0
  usuario: any;
  isJuego: Boolean=false;
  isGeneros: Boolean=false;
  isPlataformas: Boolean=false;
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
        this.isGeneros=true
      },
      error => {console.log(error)}
    )
  }

  obtenerPlataformas(): void{
    this.serviciojuego.listarPlataformas().subscribe(
      respuesta =>{
        this.plataformas=respuesta
        this.isPlataformas=true
      },
      error => {console.log(error)}
    )
  }

  addImagen(){
    const control = <FormArray>this.form1.controls['imagenes']
    control.push(this.fb.group({imagen:[]}))
  }
  campoNull(indice:any): Boolean{
    let resultado = false
    if(this.imagen[indice] == null){
      resultado = true
    }
    return resultado
  }
  meteImagen(evento: any,indice:any): void{
    if(evento.target.files){
      this.imagen[indice] =evento.target.files[0]
      this.form1.get("cantidadImagenes")?.setValue(this.form1.get("cantidadImagenes")?.value+1)
      this.imagenesSubidas++
    }
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
    let valido=true
    const element: HTMLElement = document.getElementById('errores') as HTMLElement
    element.innerHTML=""
    if(this.form1.get("nombre")?.value == ""){
      element.innerHTML= "<br>" + "El nombre no puede estar en blanco"
      valido=false
    }
    if(this.form1.get("fechaDeLanzamiento")?.value == ""){
      element.innerHTML= element.innerHTML + "<br>" + "La fecha de lanzamiento no puede estar en blanco"
      valido=false
    }
    if(this.form1.get("comprar")?.value == ""){
      element.innerHTML= element.innerHTML +"<br>" + "El campo comprar no puede estar en blanco"
      valido=false
    }
    if(this.form1.get("edad")?.value == ""){
      element.innerHTML= element.innerHTML +"<br>" + "La edad minima no puede estar en blanco"
      valido=false
    }
    if(this.form1.get("creador")?.value == ""){
      element.innerHTML= element.innerHTML +"<br>" + "El creador no puede estar en blanco"
      valido=false
    }
    if(this.form1.get("genero")?.value == ""){
      element.innerHTML= element.innerHTML +"<br>" + "El genero no puede estar en blanco"
      valido=false
    }
    if(this.form1.get("plataforma")?.value == ""){
      element.innerHTML= element.innerHTML +"<br>" + "La plataforma no puede estar en blanco"
      valido=false
    }
    if(this.form1.get("numeroDeJugadores")?.value == ""){
      element.innerHTML= element.innerHTML +"<br>" + "El numero de jugadores no puede estar en blanco"
      valido=false
    }
    if(this.imagenesSubidas == 0 ){
      element.innerHTML= element.innerHTML +"<br>" + "Suba una imagen como minimo"
      valido=false
    }
    if(this.form1.get("videos")?.value == ""){
      element.innerHTML= element.innerHTML +"<br>" + "Suba como minimo un video"
      valido=false
    }
    if(this.form1.get("nota")?.value == "" && this.form1.get("nota")?.value >10 && this.form1.get("nota")?.value <1){
      element.innerHTML= element.innerHTML +"<br>" + "La nota no puede estar en blanco ni ser mayor de 10 ni menor de 1"
      valido=false
    }
    if(this.form1.get("resumen")?.value == ""){
      element.innerHTML= element.innerHTML +"<br>" + "El resumen no puede estar en blanco"
      valido=false
    }
    if(this.imagenPrincipal == undefined){
      element.innerHTML= element.innerHTML + "<br>" + "Seleccione una imagen como principal"
      valido=false
    }
    if(valido==true){
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
        this.irHacia.navigate(['/administracion/juegos/listar'])
      },
      error => console.log(error)
    )
    }
  }
}
