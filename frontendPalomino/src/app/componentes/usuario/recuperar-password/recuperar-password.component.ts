import { Component, OnInit } from '@angular/core';
import { FormBuilder, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { UsuariosService } from 'src/app/servicios/usuarios.service';

@Component({
  selector: 'app-recuperar-password',
  templateUrl: './recuperar-password.component.html',
  styleUrls: ['./recuperar-password.component.css']
})
export class RecuperarPasswordComponent implements OnInit {
  formLogin= this.fb.group({
    usuario:['', [Validators.required]],
    email:['', [Validators.required, Validators.email]]
  })
  constructor(private fb:FormBuilder, private servicioUsuario:UsuariosService, private irHacia:Router) { }

  ngOnInit(): void {
  }
  submit(): void{
    this.servicioUsuario.recuperarPassword(this.formLogin.value).subscribe(
      respuesta => {
        console.log(respuesta)
        this.irHacia.navigate([''])
      },
      error => {
        console.log(error)
      }
    )
  }
}
