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

  listarJuegosMasComentarios(): Observable<any>{
    return this.http.get(url+'listarJuegosMasComentarios/')
  }

  listarJuegos(): Observable<any>{
    return this.http.get(url+'list/')
  }

  listarGeneros(): Observable<any>{
    return this.http.get(url+'listGeneros/')
  }
  listarVideos(idJuego:number): Observable<any>{
    return this.http.get(url+'listVideos/'+idJuego)
  }
  listarPlataformas(): Observable<any>{
    return this.http.get(url+'listPlataformas/')
  }

  obtenerVideosJuegoMejorValorado(): Observable<any>{
    return this.http.get(url+'obtenerVideosJuegoMejorValorado/')
  }

  listarXJuegosNuevos(cantidad:number): Observable<any>{
    return this.http.get(url+'listarXJuegosPorFechaNuevos/'+cantidad)
  }
}
