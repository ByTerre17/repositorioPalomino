import { Component, OnInit } from '@angular/core';
import { FormBuilder, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { Usuario } from 'src/app/clases/usuario';
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
form1= this.fb.group({
  passwordAntigua:['', [Validators.required]],
  passwordNueva:['', [Validators.required]],
  passwordNueva2:['', [Validators.required]]

})
  constructor(private servicioUsuario:UsuariosService, private fb:FormBuilder, private irHacia:Router) { }

  ngOnInit(): void {
    this.cargarPerfil()
  }
cargarPerfil(): void{
  this.servicioUsuario.obtenerPerfil().subscribe(
    respuesta => {
      console.log(respuesta)
      this.perfil = respuesta
    },
    error => console.log(error)
  )
}
eliminarPerfil(): void{
  this.servicioUsuario.eliminarUsuario().subscribe(
    respuesta => {
      console.log(respuesta)
      this.servicioUsuario.logOut()
      this.irHacia.navigate([''])
    },
    error => console.log(error)
  )
}

submit(): void{
  this.servicioUsuario.editarPassword(this.form1.value).subscribe(
    respuesta =>{
      console.log(this.form1.value)
      console.log(respuesta)
      window.location.reload();
    },
    error => console.log(error)
  )
}
}

