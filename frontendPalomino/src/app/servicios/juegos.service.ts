import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';


const url = 'http://localhost/backendPalomino/juego/'
//const url = 'http://localhost/backendphp/juego/'
@Injectable({
  providedIn: 'root'
})
export class JuegosService {

  constructor(private http:HttpClient) { }

  verJuego(id: any): Observable<any>{
    return this.http.get(url+"ver/"+id)
  }

  imagenesJuego(id: any): Observable<any>{
    return this.http.get(url+"verImagenesJuego/"+id)
  }

  crearJuego(datos: any): Observable<any>{
    return this.http.post(url+"crearJuego",datos)
  }

  editarJuego(datos: any): Observable<any>{
    return this.http.post(url+"editarJuego",datos)
  }
  
  eliminarJuego(id: any): Observable<any>{
    return this.http.delete(url+"eliminarJuego/"+id)
  }

  listarJuegos(): Observable<any>{
    return this.http.get(url+'list/')
  }

  listarXJuegosNuevos(cantidad:number): Observable<any>{
    return this.http.get(url+'listarXJuegosPorFechaNuevos/'+cantidad)
  }
}
