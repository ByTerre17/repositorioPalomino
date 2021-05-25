import { Component, OnInit } from '@angular/core';
import { FormBuilder } from '@angular/forms';
import { Router } from '@angular/router';
import { JuegosService } from 'src/app/servicios/juegos.service';
import { UsuariosService } from 'src/app/servicios/usuarios.service';

@Component({
  selector: 'app-listarjuegos',
  templateUrl: './listarjuegos.component.html',
  styleUrls: ['./listarjuegos.component.css']
})
export class ListarjuegosComponent implements OnInit {
  juegos: any[] = []
  plataformas:any[] = []
  generos:any[] = []
  buscador=''
  generoSeleccionado=''
  plataformaSeleccionada=''
  listoJuegos:Boolean=false
  listoGeneros:Boolean=false
  listoPlataformas:Boolean=false
  constructor(private fb:FormBuilder,private servicioJuegos:JuegosService,private servicioUsuarios:UsuariosService, private irHacia:Router) { }

  ngOnInit(): void {
    this.obtenerJuegos()
    this.obtenerGeneros()
    this.obtenerPlataformas()
  }
  verJuego(idJuego:number): void{
    this.irHacia.navigate(["/verJuego/"+idJuego])
  }


  obtenerJuegos(): void{
    this.servicioJuegos.listarJuegos().subscribe(
      respuesta =>{
        this.juegos=respuesta
        console.log(this.juegos)
        this.listoJuegos=true
      },
      error => {console.log(error)}
    )
  }
  obtenerGeneros(): void{
    this.servicioJuegos.listarGeneros().subscribe(
      respuesta =>{
        this.generos=respuesta
        this.listoGeneros=true
      },
      error => {console.log(error)}
    )
  }
  obtenerPlataformas(): void{
    this.servicioJuegos.listarPlataformas().subscribe(
      respuesta =>{
        this.plataformas=respuesta
        this.listoPlataformas=true
      },
      error => {console.log(error)}
    )
  }
}
