import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';

const url = 'http://localhost/backendPalomino/comentario/'
//const url = 'http://localhost/backendphp/juego/'
@Injectable({
  providedIn: 'root'
})
export class ComentariosService {

  constructor(private http:HttpClient) { }

  crearComentario(comentario: any): Observable<any>{
    return this.http.post(url+"/crearComentario", comentario)
  }

  eliminarComentario(idComentario: any,idUsuario: any): Observable<any>{
    return this.http.delete(url+"eliminarComentario/"+idComentario+"/"+idUsuario+"/")
  }

  eliminarComentarioAdmin(idComentario: any): Observable<any>{
    return this.http.post(url+"eliminarComentarioAdmin/",idComentario)
  }

  eliminarReporte(idReporte: any): Observable<any>{
    return this.http.post(url+"eliminarReporte/",idReporte)
  }

  likeComentario(datos: any): Observable<any>{
    return this.http.post(url+"/like",datos)
  }

  dislikeComentario(datos: any): Observable<any>{
    return this.http.post(url+"/dislike",datos)
  }
  
  obtenerComentario(idComentario: number): Observable<any>{
    return this.http.get(url+'obtenerComentario/'+idComentario)
  }

  obtenerReporte(idReporte: number): Observable<any>{
    return this.http.get(url+'obtenerReporte/'+idReporte)
  }
  
  crearReporte(reporte: any): Observable<any>{
    return this.http.post(url+"/crearReporte", reporte)
  }

  listComentarMasLikes(): Observable<any>{
    return this.http.get(url+'listComentarMasLikes/')
  }

  listarComentarios(): Observable<any>{
    return this.http.get(url+'list/')
  }

  listarReportes(): Observable<any>{
    return this.http.get(url+'listReportes/')
  }
  
  listarComentariosPorJuego(idJuego: any): Observable<any>{
    return this.http.get(url+'listPorJuego/'+idJuego)
  }

  listarComentariosPorUsuario(): Observable<any>{
    return this.http.get(url+'listarComentariosPorUsuario/')
  }
}
