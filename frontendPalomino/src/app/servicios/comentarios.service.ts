import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';

const url = 'http://localhost/backendphp/comentario/'
@Injectable({
  providedIn: 'root'
})
export class ComentariosService {

  constructor(private http:HttpClient) { }

  crearComentario(comentario: any): Observable<any>{
    return this.http.post(url, comentario)
  }

  eliminarComentario(idJuego: any,idUsuario: any): Observable<any>{
    return this.http.delete(url+idJuego+"/"+idUsuario+"/")
  }

  listarComentarios(): Observable<any>{
    return this.http.get(url+'list/')
  }

  listarComentariosPorJuego(idJuego: any): Observable<any>{
    return this.http.get(url+'listPorJuego/'+idJuego)
  }
}
