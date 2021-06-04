import { Component, OnInit } from '@angular/core';
import { FormBuilder, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { delay } from 'src/app/lib/common';
import { UsuariosService } from 'src/app/servicios/usuarios.service';

@Component({
  selector: 'app-recuperar-password',
  templateUrl: './recuperar-password.component.html',
  styleUrls: ['./recuperar-password.component.css']
})
export class RecuperarPasswordComponent implements OnInit {
  form1= this.fb.group({
    usuario:['', [Validators.required]],
    email:['', [Validators.required, Validators.email]]
  })
  constructor(private fb:FormBuilder, private servicioUsuario:UsuariosService, private irHacia:Router) { }

  ngOnInit(): void {
  }
  async submit(): Promise<void>{
    this.servicioUsuario.recuperarPassword(this.form1.value).subscribe(
      respuesta => {
      }
    )
    const element2: HTMLElement = document.getElementById('estado') as HTMLElement
    element2.innerHTML = 'Se ha enviado el correo'
    await delay(1000);
    this.irHacia.navigate([''])
  }
}
