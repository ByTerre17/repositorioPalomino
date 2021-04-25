import { Component, OnInit } from '@angular/core';
import { FormBuilder, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { UsuariosService } from 'src/app/servicios/usuarios.service';

@Component({
  selector: 'app-register',
  templateUrl: './register.component.html',
  styleUrls: ['./register.component.css']
})
export class RegisterComponent implements OnInit {
  mensaje:String=""
  form1= this.fb.group({
    password:['', [Validators.required]],
    password2:['', [Validators.required]],
    email:['', [Validators.required, Validators.email]],
    usuario:['', [Validators.required]],

  })

  constructor(private fb:FormBuilder, private servicioUsuario:UsuariosService, private irHacia:Router) { }

  ngOnInit(): void {
  }

  submit(): void{
      this.servicioUsuario.registrar(this.form1.value).subscribe(
        respuesta =>{
          console.log(respuesta)
          this.servicioUsuario.guardarToken(respuesta)
          this.irHacia.navigate([''])
        },
        error => console.log(error)
      )
    }
  }
  
  
