import { Component, OnInit } from '@angular/core';
import { FormArray, FormBuilder, Validators } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { JuegosService } from 'src/app/servicios/juegos.service';
import { UsuariosService } from 'src/app/servicios/usuarios.service';

@Component({
  selector: 'app-editar-juego',
  templateUrl: './editar-juego.component.html',
  styleUrls: ['./editar-juego.component.css']
})
export class EditarJuegoComponent implements OnInit {
  imagen: File []=[];
  condicion: Boolean = false
  imagenPrincipalAntigua: Boolean = false
  idJuego: any
  imagenPrincipal: any;
  indiceArrayImagenes: any;
  juego: any;
  imagenesJuegoAntiguas:any;
  imagenesMantenidas: string []=[];

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

  meteImagen(evento: any,indice:any): void{
    if(evento.target.files){
      this.imagen[indice] =evento.target.files[0]
      this.form1.get("cantidadImagenes")?.setValue(this.form1.get("cantidadImagenes")?.value+1)
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
    this.form1.get("fechaDeLanzamiento")?.setValue(juego.fechaDeLanzamiento)
    this.form1.get("comprar")?.setValue(juego.comprar)
    this.form1.get("edad")?.setValue(juego.edad)
    this.form1.get("creador")?.setValue(juego.creador)
    this.form1.get("genero")?.setValue(juego.genero)
    this.form1.get("numeroDeJugadores")?.setValue(juego.numeroDeJugadores)
    this.form1.get("resumen")?.setValue(juego.resumen)
    this.form1.get("nota")?.setValue(juego.nota/10)
    
  }

  obtenerJuego(): void{
    this.serviciojuego.verJuego(this.idJuego).subscribe(
      respuesta =>{
        this.juego=respuesta
        this.meterdatosFormulario(respuesta)
      },
      error => {console.log(error)}
    )
  }
  obtenerImagenesJuego(): void{
    this.serviciojuego.imagenesJuego(this.idJuego).subscribe(
      respuesta =>{
        this.imagenesJuegoAntiguas=respuesta
        console.log(this.imagenesJuegoAntiguas)
        this.form1.get("cantidadImagenes")?.setValue(this.imagenesJuegoAntiguas.length)
      },
      error => {console.log(error)}
    )
  }
  mantenerImagen(evento:any,idImagenAntigua:any): void{
    let existe = false
    if(evento.target.checked==true){
      for(let i=0;i<=this.imagenesMantenidas.length;i++){
        if(this.imagenesMantenidas[i]==idImagenAntigua){
          existe=true
        }
      }
      if(existe==false){
        this.imagenesMantenidas[this.imagenesMantenidas.length]=idImagenAntigua
      }
      
    }
    else if(evento.target.checked==false){
      for(let i=0;i<=this.imagenesMantenidas.length;i++){
        if(this.imagenesMantenidas[i]==idImagenAntigua){
          delete this.imagenesMantenidas[i]
        }
      }
    }
    this.imagenesMantenidas = this.imagenesMantenidas.filter(function () { return true })
    console.log(this.imagenesMantenidas.length)
  }


  get getImagenes(){
    return this.form1.get('imagenes') as FormArray
  }

  cambiarFotoPrincipal(imagenPrincipal: any){
    this.imagenPrincipalAntigua=false
    this.imagenPrincipal=imagenPrincipal
    console.log(this.imagenPrincipal)
  }

  cambiarFotoPrincipalAntigua(imagenPrincipal: any){
    this.imagenPrincipalAntigua=true
    this.imagenPrincipal=imagenPrincipal
    console.log(this.imagenPrincipal)
  }

  addImagen(){
    const control = <FormArray>this.form1.controls['imagenes']
    control.push(this.fb.group({imagen:[]}))
  }

  submit(): void{
    var formData = new FormData()
    var juego = JSON.stringify(this.form1.getRawValue())
    console.log(juego)
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
          console.log(this.imagenesMantenidas[indice]+"dsfsf")
          formData.append(nombre, this.imagenesMantenidas[indice])
          console.log(nombre)
        }
      }
    }

    if(this.imagenPrincipalAntigua==true){
      formData.append("imagenPrincipal", this.imagenPrincipal)
    }
    console.log(this.imagen.length+"")
    formData.append('cantidadImagenesNuevas',this.imagen.length+"" )
    formData.append('idJuego', this.juego.id)
    formData.append('principalVieja', this.imagenPrincipalAntigua+"")
    console.log(this.imagenesMantenidas.length)
    formData.append('cantidadImagenesMantenidas', this.imagenesMantenidas.length+"")
    formData.append('juego', juego)
    this.serviciojuego.editarJuego( formData ).subscribe(
      respuesta =>{
        console.log(respuesta)
      },
      error => console.log(error)
    )
  }
}
