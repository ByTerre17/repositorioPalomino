import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { accesoUsuario, Usuario } from '../clases/usuario';
import { Observable } from 'rxjs';
const url = 'http://localhost/backendphp/user/';
@Injectable({
  providedIn: 'root'
})
export class UsuariosService {

  constructor(private http:HttpClient) { }


  registrar(usuario: Usuario): Observable<any>{
    return this.http.post(url, usuario)
  }

  recuperarPassword(usuario: Usuario): Observable<any>{
    return this.http.post(url+'recuperarPassword', usuario)
  }

  acceso (usuario: accesoUsuario): Observable<any>{
    return this.http.post(url+'login/', usuario)
  }

  obtenerPerfil(): Observable<any>{
    return this.http.get(url)
  }

  editarPerfil(usuario:Usuario): Observable<any>{
    return this.http.put(url, usuario)
  }

  eliminarUsuario(): Observable<any>{
    return this.http.delete(url)
  }
  editarPassword(usuario:Usuario): Observable<any>{
    return this.http.put(url, usuario)
  }

  listarUsuarios(): Observable<any>{
    return this.http.get(url+'list/')
  }

  guardarToken(token:string): void{
    localStorage.setItem('userToken', token)
  }

  isLogged(): boolean{
    return !!localStorage.getItem('userToken')
  }
  isAdmin(): Observable<any>{
    return this.http.get(url+'admin/'+'isAdmin')
  }

  logOut(): void{
    localStorage.removeItem('userToken')
  }

  leerToken(): string | null{
    return localStorage.getItem('userToken')
  }
  

}

