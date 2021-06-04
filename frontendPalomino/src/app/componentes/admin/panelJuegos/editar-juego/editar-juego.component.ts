import { Component, OnInit } from '@angular/core';
import { FormArray, FormBuilder, Validators } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { delay } from 'src/app/lib/common';
import { JuegosService } from 'src/app/servicios/juegos.service';
import { UsuariosService } from 'src/app/servicios/usuarios.service';

@Component({
  selector: 'app-editar-juego',
  templateUrl: './editar-juego.component.html',
  styleUrls: ['./editar-juego.component.css']
})
export class EditarJuegoComponent implements OnInit {
  imagen: File []=[];
  controlesVideos:any
  isJuego: Boolean=false;
  isGeneros: Boolean=false;
  isPlataformas: Boolean=false;
  condicion: Boolean = false
  indicesFotosAntiguas:string []=[];
  imagenPrincipalAntigua: Boolean = false
  imagenesSubidas:number=0
  idJuego: any
  imagenPrincipal: any;
  indiceArrayImagenes: any;
  juego: any;
  imagenesJuegoAntiguas:any;
  generos:any
  videos:any
  plataformas:any
  imagenesMantenidas: string []=[];
  generoViejo:any;
  plataformaViejo:any;
  errores:Boolean = false

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
  usuario: any;
  
  constructor(private ruta: ActivatedRoute,private fb:FormBuilder, private servicioUsuario:UsuariosService, private irHacia:Router,private serviciojuego:JuegosService,) {
   }

  ngOnInit(): void {
    this.cargarUsuario()
    this.idJuego = this.ruta.snapshot.paramMap.get("id")
    this.obtenerJuego()
    this.obtenerImagenesJuego()
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

  meteImagen(evento: any,indice:any): void{
    if(evento.target.files){
      this.imagen[indice] =evento.target.files[0]
      this.form1.get("cantidadImagenes")?.setValue(this.form1.get("cantidadImagenes")?.value+1)
      this.imagenesSubidas++
    }
  }
  campoNull(indice:any): Boolean{
    let resultado = false
    if(this.imagen[indice] == null){
      resultado = true
    }
    return resultado
  }

  meterdatosFormulario(juego:any):void{
    this.form1.get("nombre")?.setValue(juego.nombre)
    const year = juego.fechaDeLanzamiento.substr(6, 4);
    const month = juego.fechaDeLanzamiento.substr(3, 2);
    const day = juego.fechaDeLanzamiento.substr(0, 2);
    const date = new Date(year, month, day);
    this.form1.get("fechaDeLanzamiento")?.setValue(year+'-'+month+'-'+day)
    this.form1.get("comprar")?.setValue(juego.comprar)
    this.form1.get("edad")?.setValue(juego.edad)
    this.form1.get("creador")?.setValue(juego.creador)
    this.form1.get("numeroDeJugadores")?.setValue(juego.numeroDeJugadores)
    this.form1.get("resumen")?.setValue(juego.resumen)
    this.form1.get("nota")?.setValue(juego.nota/10)
  }

  obtenerJuego(): void{
    this.serviciojuego.verJuego(this.idJuego).subscribe(
      respuesta =>{
        this.juego=respuesta
        this.plataformaViejo = this.juego.plataforma 
        this.generoViejo = this.juego.genero
        this.meterdatosFormulario(respuesta)
        this.isJuego=true
        this.obtenerGeneros()
        this.obtenerPlataformas()
        this.obtenervideos(this.juego.id)
      },
      error => {console.log(error)}
    )
  }
  obtenerImagenesJuego(): void{
    this.serviciojuego.imagenesJuego(this.idJuego).subscribe(
      respuesta =>{
        this.imagenesJuegoAntiguas=respuesta
        this.form1.get("cantidadImagenes")?.setValue(this.imagenesJuegoAntiguas.length)
      },
      error => {console.log(error)}
    )
  }
  mantenerImagen(id:any,idImagenAntigua:any): void{
    const inp = document.getElementById("mantenerImagen"+id)
    if(this.indicesFotosAntiguas[id]==undefined){
      this.indicesFotosAntiguas[id]="0"
    }
    let existe = false
    if(this.indicesFotosAntiguas[id]=="0"){
      this.indicesFotosAntiguas[id]="1"
      for(let i=0;i<=this.imagenesMantenidas.length;i++){
        if(this.imagenesMantenidas[i]==idImagenAntigua){
          existe=true
        }
      }
      if(existe==false){
        this.imagenesMantenidas[this.imagenesMantenidas.length]=idImagenAntigua
      }
      
    }
    else{
      this.indicesFotosAntiguas[id]="0"
      for(let i=0;i<=this.imagenesMantenidas.length;i++){
        if(this.imagenesMantenidas[i]==idImagenAntigua){
          delete this.imagenesMantenidas[i]
        }
      }
    }
    this.imagenesMantenidas = this.imagenesMantenidas.filter(function () { return true })
    inp?.setAttribute("checked","checked")
  }


  get getImagenes(){
    return this.form1.get('imagenes') as FormArray
  }

  get getVideos(){
    return this.form1.get('videos') as FormArray
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
  eliminarImagen(){
    const control = <FormArray>this.form1.controls['imagenes']
    if(control.length>1){
      control.removeAt(control.length-1)
      this.imagen.splice(control.length)
      this.form1.get("cantidadImagenes")?.setValue(this.form1.get("cantidadImagenes")?.value-1)
    }
  }

  cambiarFotoPrincipal(imagenPrincipal: any){
    this.imagenPrincipalAntigua=false
    this.imagenPrincipal=imagenPrincipal
  }

  cambiarFotoPrincipalAntigua(imagenPrincipal: any,id:any){
    if(this.indicesFotosAntiguas[id]==undefined){
      this.indicesFotosAntiguas[id]="0"
    }
    this.imagenPrincipalAntigua=true
    this.imagenPrincipal=imagenPrincipal
    const inp = document.getElementById("mantenerImagen"+id)
    if(this.indicesFotosAntiguas[id]=="0"){
      this.mantenerImagen(id,imagenPrincipal)
    }
  }

  obtenerGeneros(): void{
    this.serviciojuego.listarGeneros().subscribe(
      respuesta =>{
        this.generos=respuesta
        for(var i=0;i<this.generos.length;i++){
          if(this.juego.genero==this.generos[i].nombre){
            this.form1.get("genero")?.patchValue(this.generos[i].id)
          }
        }
        this.isGeneros=true
      },
      error => {console.log(error)}
    )
  }
  obtenervideos(idJuego:number): void{
    this.serviciojuego.listarVideos(idJuego).subscribe(
      respuesta =>{
        this.videos=respuesta
        const control = <FormArray>this.form1.controls['videos']
        control.removeAt(0)
        for(let indice = 0;indice<this.videos.length;indice++){
          control.push(this.fb.group({video:this.videos[indice].direccion}))
        }
      },
      error => {console.log(error)}
    )
  }

  obtenerPlataformas(): void{
    this.serviciojuego.listarPlataformas().subscribe(
      respuesta =>{
        this.plataformas=respuesta
        for(var i=0;i<this.plataformas.length;i++){
          if(this.juego.plataforma==this.plataformas[i].nombre){
            this.form1.get("plataforma")?.patchValue(this.plataformas[i].id)
          }
        }
        this.isPlataformas=true
      },
      error => {console.log(error)}
    )
  }
  addImagen(){
    const control = <FormArray>this.form1.controls['imagenes']
    control.push(this.fb.group({imagen:[]}))
  }

  submit(): void{
    let valido=true
    this.errores=true
    const element: HTMLElement = document.getElementById('errores') as HTMLElement
    element.innerHTML=""
    if(this.form1.get("nombre")?.value == ""){
      this.errores=true
      element.innerHTML= "<br>" + "El nombre no puede estar en blanco"
      valido=false
    }
    if(this.form1.get("fechaDeLanzamiento")?.value == ""){
      this.errores=true
      element.innerHTML= element.innerHTML + "<br>" + "La fecha de lanzamiento no puede estar en blanco"
      valido=false
    }
    if(this.form1.get("comprar")?.value == ""){
      this.errores=true
      element.innerHTML= element.innerHTML +"<br>" + "El campo comprar no puede estar en blanco"
      valido=false
    }
    if(this.form1.get("edad")?.value == ""){
      this.errores=true
      element.innerHTML= element.innerHTML +"<br>" + "La edad mínima no puede estar en blanco"
      valido=false
    }
    if(this.form1.get("creador")?.value == ""){
      this.errores=true
      element.innerHTML= element.innerHTML +"<br>" + "El creador no puede estar en blanco"
      valido=false
    }
    if(this.form1.get("genero")?.value == ""){
      this.errores=true
      element.innerHTML= element.innerHTML +"<br>" + "El genero no puede estar en blanco"
      valido=false
    }
    if(this.form1.get("plataforma")?.value == ""){
      this.errores=true
      element.innerHTML= element.innerHTML +"<br>" + "La plataforma no puede estar en blanco"
      valido=false
    }
    if(this.form1.get("numeroDeJugadores")?.value == ""){
      this.errores=true
      element.innerHTML= element.innerHTML +"<br>" + "El numero de jugadores no puede estar en blanco"
      valido=false
    }
    if(this.imagenesSubidas == 0 && this.imagenesMantenidas.length == 0){
      this.errores=true
      element.innerHTML= element.innerHTML +"<br>" + "Suba una imagen o mantenga una imagen antigua"
      valido=false
    }
    if(this.form1.get("videos")?.value == ""){
      this.errores=true
      element.innerHTML= element.innerHTML +"<br>" + "Suba como mínimo un video"
      valido=false
    }
    if(this.form1.get("nota")?.value == "" && this.form1.get("nota")?.value >10 && this.form1.get("nota")?.value <1){
      this.errores=true
      element.innerHTML= element.innerHTML +"<br>" + "La nota no puede estar en blanco ni ser mayor de 10 ni menor de 1"
      valido=false
    }
    if(this.form1.get("resumen")?.value == ""){
      this.errores=true
      element.innerHTML= element.innerHTML +"<br>" + "El resumen no puede estar en blanco"
      valido=false
    }
    if(this.imagenPrincipal == undefined){
      this.errores=true
      element.innerHTML= element.innerHTML + "<br>" + "Seleccione una imagen como principal"
      valido=false
    }
    if(valido==true){
      var formData = new FormData()
      var juego = JSON.stringify(this.form1.getRawValue())
      for(let indice = 0;indice<=this.imagen.length;indice++){
        let nombre
        nombre="imagen"+indice
        if(indice==this.imagenPrincipal && this.imagenPrincipalAntigua==false){
          nombre="imagenPrincipal"
          formData.append(nombre, this.imagen[indice])
        }
        else{
          formData.append(nombre, this.imagen[indice])
        }
      }

      if(this.imagenesMantenidas.length!=0){
        for(let indice = 0;indice<this.imagenesMantenidas.length;indice++){
          let nombre
          nombre="imagenMantenida"+indice
          if(this.imagenesMantenidas[indice]==this.imagenPrincipal && this.imagenPrincipalAntigua==true){
            nombre="imagenPrincipal"

            formData.append(nombre, this.imagenesMantenidas[indice])

          }
          else{
            formData.append(nombre, this.imagenesMantenidas[indice])
          }
        }
      }

      if(this.imagenPrincipalAntigua==true){
        formData.append("imagenPrincipal", this.imagenPrincipal)
      }
      formData.append('cantidadImagenesNuevas',this.imagen.length+"" )
      formData.append('idJuego', this.juego.id)
      formData.append('principalVieja', this.imagenPrincipalAntigua+"")
      formData.append('cantidadImagenesMantenidas', this.imagenesMantenidas.length+"")
      formData.append('juego', juego)
      this.serviciojuego.editarJuego( formData ).subscribe(
        async respuesta =>{
          if(respuesta="Juego editado"){
            const element2: HTMLElement = document.getElementById('estado') as HTMLElement
            element2.innerHTML = 'El juego se ha editado con éxito'
            await delay(1500);
            this.irHacia.navigate(['/administracion/juegos/listar'])
          }
        },
        error => console.log(error)
      )
    }
  }
}
