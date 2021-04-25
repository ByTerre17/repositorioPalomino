import { Component, OnInit } from '@angular/core';
import { FormBuilder } from '@angular/forms';
import { Router } from '@angular/router';
import { JuegosService } from 'src/app/servicios/juegos.service';
import { UsuariosService } from 'src/app/servicios/usuarios.service';

@Component({
  selector: 'app-listar-juegos',
  templateUrl: './listar-juegos.component.html',
  styleUrls: ['./listar-juegos.component.css']
})
export class ListarJuegosComponent implements OnInit {
  juegos: any[] = []
  logueado:any
  constructor(private fb:FormBuilder,private servicioJuegos:JuegosService,private servicioUsuarios:UsuariosService, private irHacia:Router) { }

  ngOnInit(): void {
    this.logueado= this.servicioUsuarios.isLogged
    this.obtenerJuegos()
  }


  eliminarJuego(idJuego:number): void{
    if(this.servicioUsuarios.isLogged()){
      this.servicioJuegos.eliminarJuego(idJuego).subscribe(
        respuesta => {
          console.log(respuesta)
          window.location.reload();
        },
        error => console.log(error)
      )
    }
  }

  editarJuego(idJuego:number): void{
    this.irHacia.navigate(["/administracion/juegos/editar/"+idJuego])
  }

  verJuego(idJuego:number): void{
    this.irHacia.navigate(["/verJuego/"+idJuego])
  }


  obtenerJuegos(): void{
    this.servicioJuegos.listarJuegos().subscribe(
      respuesta =>{
        this.juegos=respuesta
        console.log(this.juegos)
      },
      error => {console.log(error)}
    )
  }

}
