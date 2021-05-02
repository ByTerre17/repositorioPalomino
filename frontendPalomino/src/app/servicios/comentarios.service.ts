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

  eliminarComentario(idJuego: any,idUsuario: any): Observable<any>{
    return this.http.delete(url+"eliminarComentario/"+idJuego+"/"+idUsuario+"/")
  }

  likeComentario(datos: any): Observable<any>{
    return this.http.post(url+"/like",datos)
  }

  dislikeComentario(datos: any): Observable<any>{
    return this.http.post(url+"/dislike",datos)
  }
  

  listarComentarios(): Observable<any>{
    return this.http.get(url+'list/')
  }

  listarComentariosPorJuego(idJuego: any): Observable<any>{
    return this.http.get(url+'listPorJuego/'+idJuego)
  }
}
