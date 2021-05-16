import { Component, OnInit } from '@angular/core';
import { FormBuilder, Validators } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
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
nuevoCorreo:Boolean = false
nuevaPassword:Boolean = false
fotoNueva:any

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
      console.log(respuesta)
      this.perfil = respuesta
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
      console.log(this.comentariosUsuario)
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
      console.log(respuesta)
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
  this.nuevoCorreo=true
}
nuevoUsuarioFuntion(){
  this.nuevaUsuario=true
}
nuevaPasswordFuntion(){
  this.nuevaPassword=true
}
nuevaFotoFuntion(evento: any){
  this.nuevaFoto=true
  if(evento.target.files){
    this.fotoNueva=evento.target.files[0]
  }
}
submit(): void{
  var formData = new FormData()
  if(this.nuevoCorreo==true){
    formData.append("correo",this.form1.get("correo")?.value)
    this.servicioUsuarios.editarCorreo(formData).subscribe(
      respuesta =>{
      },
      error => console.log(error)
    )
  }
  if(this.nuevaUsuario==true){
    formData.append("usuario",this.form1.get("nombreUsuario")?.value)
    this.servicioUsuarios.editarUsuario(formData).subscribe(
      respuesta =>{
      },
      error => console.log(error)
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
  window.location.reload();
  }
}
