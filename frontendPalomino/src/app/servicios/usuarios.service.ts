import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { accesoUsuario, Usuario } from '../clases/usuario';
import { Observable } from 'rxjs';
const url = 'http://localhost/backendPalomino/usuario/'
//const url = 'http://localhost/backendphp/juego/'
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

  comprobarCodigo(codigo: any): Observable<any>{
    return this.http.get(url+'comprobarCodigoRecuperacion/'+codigo)
  }

  acceso (usuario: accesoUsuario): Observable<any>{
    return this.http.post(url+'login/', usuario)
  }
  cambiarPasswordRecuperacion (datos: any): Observable<any>{
    return this.http.post(url+'editarPasswordRecuperar', datos)
  }
  obtenerPerfil(): Observable<any>{
    return this.http.get(url)
  }

  editarPerfil(usuario:Usuario): Observable<any>{
    return this.http.put(url, usuario)
  }

  eliminarUsuario(): Observable<any>{
    return this.http.delete(url+"eliminarUsuario")
  }
  editarPassword(datos:any): Observable<any>{
    return this.http.post(url+"editarPassword",datos)
  }
  editarUsuario(datos:any): Observable<any>{
    return this.http.post(url+"editarUsuario",datos)
  }
  editarCorreo(datos:any): Observable<any>{
    return this.http.post(url+"editarCorreo",datos)
  }
  editarFoto(datos:any): Observable<any>{
    return this.http.post(url+"editarFoto",datos)
  }
  comprobarPassword(datos:any): Observable<any>{
    return this.http.post(url+"comprobarPassword",datos)
  }
  comprobarCorreo(datos:any): Observable<any>{
    return this.http.post(url+"comprobarCorreo",datos)
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

