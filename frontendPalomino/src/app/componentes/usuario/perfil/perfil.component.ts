import { Component, OnInit } from '@angular/core';
import { FormBuilder, Validators } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { delay } from 'src/app/lib/common';
import { Usuario } from 'src/app/clases/usuario';
import { ComentariosService } from 'src/app/servicios/comentarios.service';
import { JuegosService } from 'src/app/servicios/juegos.service';
import { UsuariosService } from 'src/app/servicios/usuarios.service';

@Component({
  selector: 'app-perfil',
  templateUrl: './perfil.component.html',
  styleUrls: ['./perfil.component.css']
})
export class PerfilComponent implements OnInit {
perfil: Usuario ={}
mostrarEditar: boolean = false
mostrarEliminar: boolean = false
comentarios: boolean = true
comentariosUsuario: any
editarPerfil: boolean = false
nuevaFoto:Boolean = false
nuevaUsuario:Boolean = false
nuevaUsuarioNoValido:Boolean = false
nuevoCorreo:Boolean = false
nuevoCorreoNoValido:Boolean = false
nuevaPassword:Boolean = false
nuevoPasswordNoValido:Boolean = false
fotoNueva:any
passwordIguales:Boolean = false
passwordAntigua:Boolean = false
password:any

form1= this.fb.group({
  nombreUsuario:['', [Validators.required]],
  correo:['', [Validators.required]],
  imagen:['', [Validators.required]],
  passwordAntigua:['', [Validators.required]],
  passwordNueva:['', [Validators.required]],
  passwordNueva2:['', [Validators.required]]

})
  constructor(private ruta: ActivatedRoute,private fb:FormBuilder,private servicioJuegos:JuegosService,private servicioUsuarios:UsuariosService, private irHacia:Router,private servicioComentarios:ComentariosService) { }

  ngOnInit(): void {
    this.cargarPerfil()
    this.obtenerComentarios()
  }
cargarPerfil(): void{
  this.servicioUsuarios.obtenerPerfil().subscribe(
    respuesta => {
      this.perfil = respuesta
      console.log(this.perfil)
      if(this.perfil.foto=="no_foto"){
        this.perfil.foto ="./assets/no_foto.jpg"
      }
      this.form1.get("nombreUsuario")?.setValue(this.perfil.usuario)
      this.form1.get("correo")?.setValue(this.perfil.email)
    },
    error => console.log(error)
  )
}

obtenerComentarios(): void{
  this.servicioComentarios.listarComentariosPorUsuario().subscribe(
    respuesta =>{
      this.comentariosUsuario=respuesta
      for(let i=0;i<this.comentariosUsuario.length;i++){
        if(this.comentariosUsuario[i].likes==null){
          this.comentariosUsuario[i].likes=0
        }
        if(this.comentariosUsuario[i].dislikes==null){
          this.comentariosUsuario[i].dislikes=0
        }
      }
    },
    error => {console.log(error)}
  )
}

eliminarComentario(idComentario:any): void{
  if(this.servicioUsuarios.isLogged()){
  this.servicioComentarios.eliminarComentario(idComentario,this.perfil.id).subscribe(
    respuesta => {
      window.location.reload();
    },
    error => console.log(error)
  )
}
}

eliminarPerfil(): void{
  this.servicioUsuarios.eliminarUsuario().subscribe(
    respuesta => {
      this.servicioUsuarios.logOut()
      this.irHacia.navigate([''])
    },
    error => console.log(error)
  )
}
mostrarComentarios(): void{
   this.comentarios=true
   this.editarPerfil=false
}
mostrarEditarPerfil(): void{
  this.comentarios=false
  this.editarPerfil=true
}

nuevoCorreoFuntion(){
  if(this.form1.get("correo")?.value.length>10){
    this.nuevoCorreo=true
    this.nuevoCorreoNoValido=false
  }
  else{
    this.nuevoCorreoNoValido=true
    this.nuevoCorreo=false
  }
}
nuevoUsuarioFuntion(){
  if(this.form1.get("nombreUsuario")?.value.length>3){
    this.nuevaUsuario=true
    this.nuevaUsuarioNoValido=false
  }
  else{
    this.nuevaUsuarioNoValido=true
    this.nuevaUsuario=false
  }  
}

async comprobarPassword(){
  await delay(2000);
  var formData = new FormData()
  formData.append("password", this.form1.get("passwordAntigua")?.value)
  this.servicioUsuarios.comprobarPassword(formData).subscribe(
    respuesta =>{
      if(respuesta!="iguales"){
        this.passwordAntigua=true
      }
      else{
        this.passwordAntigua=false
      }
    },
    error => console.log(error)
  )
}
  async passwordIgualesFuntion(){
  await delay(3000);
  if(this.form1.get("passwordNueva")?.value != this.form1.get("passwordNueva2")?.value && this.form1.get("passwordNueva")?.value.length>3){
    this.nuevaPassword=false
    this.passwordIguales=true
    this.nuevoPasswordNoValido=false
  }
  else{
    this.nuevaPassword=true
    this.passwordIguales=false
    this.nuevoPasswordNoValido=true
  }
}
nuevaFotoFuntion(evento: any){
  this.nuevaFoto=true
  if(evento.target.files){
    this.fotoNueva=evento.target.files[0]
  }
}
  async submit(): Promise<void>{
  var formData = new FormData()
  if(this.nuevoCorreo==true){
    formData.append("correo",this.form1.get("correo")?.value)
    this.servicioUsuarios.editarCorreo(formData).subscribe(
      respuesta =>{
      },
    )
  }
  if(this.nuevaUsuario==true){
    formData.append("usuario",this.form1.get("nombreUsuario")?.value)
    this.servicioUsuarios.editarUsuario(formData).subscribe(
      respuesta =>{
      },

    )
  }
  if(this.nuevaPassword==true){
    formData.append("passwordAntigua",this.form1.get("passwordAntigua")?.value)
    formData.append("passwordNueva",this.form1.get("passwordNueva")?.value)
    this.servicioUsuarios.editarPassword(formData).subscribe(
      respuesta =>{
      },
      error => console.log(error)
    )
  }
  if(this.nuevaFoto==true){
    formData.append("foto", this.fotoNueva)
    this.servicioUsuarios.editarFoto(formData).subscribe(
      respuesta =>{
      },
      error => console.log(error)
    )
  }
  await delay(200);
  window.location.reload();
  }
}
