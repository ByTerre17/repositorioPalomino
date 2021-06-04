import { Component, OnInit } from '@angular/core';
import { FormBuilder, Validators } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { delay } from 'src/app/lib/common';
import { ComentariosService } from 'src/app/servicios/comentarios.service';
import { JuegosService } from 'src/app/servicios/juegos.service';
import { UsuariosService } from 'src/app/servicios/usuarios.service';

@Component({
  selector: 'app-recuperar-password2',
  templateUrl: './recuperar-password2.component.html',
  styleUrls: ['./recuperar-password2.component.css']
})
export class RecuperarPassword2Component implements OnInit {
  codigoRecuperacion: any
  constructor(private ruta: ActivatedRoute,private fb:FormBuilder, private servicioUsuario:UsuariosService, private irHacia:Router,private serviciojuego:JuegosService, private servicioComentarios:ComentariosService) { }
  
  form1= this.fb.group({
    password:['', [Validators.required]],
    password2:['', [Validators.required]]
  })
  ngOnInit(): void {
    this.codigoRecuperacion = this.ruta.snapshot.paramMap.get("id")
    this.comprobarCodigoRecuperacion()
  }
  comprobarCodigoRecuperacion(): void{
    this.servicioUsuario.comprobarCodigo(this.codigoRecuperacion).subscribe(
      respuesta =>{
        if(respuesta!="Valido"){
          this.irHacia.navigate([""])
        }
      },
      error => {console.log(error)}
    )
  }

  submit() : void{
    if(this.form1.get('password')?.value==this.form1.get('password2')?.value){
      var formData = new FormData()
      var password = this.form1.get("password")?.value
      formData.append("codigo",this.codigoRecuperacion)
      formData.append("password", password)
      this.servicioUsuario.cambiarPasswordRecuperacion(formData).subscribe(
        async respuesta =>{
          if(respuesta=="Password actualizado correctamente"){
            const element: HTMLElement = document.getElementById('estado') as HTMLElement
            element.innerHTML= "Las contraseña ha sido actualizada correctamente"
            await delay(1000);
            this.irHacia.navigate([''])
          }
        },
      )
    }
    else
    {
      const element: HTMLElement = document.getElementById('errores') as HTMLElement
      element.innerHTML= element.innerHTML + "<br>" + "Las contraseñas no coinciden"
    }
  }

}

