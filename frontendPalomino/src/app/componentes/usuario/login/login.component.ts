
import { Component, OnInit } from '@angular/core';
import { FormBuilder, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { UsuariosService } from 'src/app/servicios/usuarios.service';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {
  formLogin= this.fb.group({
    password:['', [Validators.required],[]],
    email:['', [Validators.required, Validators.email]]
  })
  mensaje: string=''
  constructor(private fb:FormBuilder, private servicioUsuario:UsuariosService, private irHacia:Router) { }

  ngOnInit(): void {
    if (this.servicioUsuario.isLogged()){
      this.irHacia.navigate([''])
    }
}
submit(): void{
  this.servicioUsuario.acceso(this.formLogin.value).subscribe(
    respuesta => {
      this.servicioUsuario.guardarToken(respuesta)
      this.irHacia.navigate([''])
      window.location.reload();
    },
    error => {
      this.mensaje=error.error.error
    }
  )
}

}
