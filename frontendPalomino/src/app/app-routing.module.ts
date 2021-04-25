import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { PanelReportesComponent } from './componentes/admin/panel-reportes/panel-reportes.component';
import { PanelUsuariosComponent } from './componentes/admin/panel-usuarios/panel-usuarios.component';
import { PanelComponent } from './componentes/admin/panel/panel.component';
import { EditarJuegoComponent } from './componentes/admin/panelJuegos/editar-juego/editar-juego.component';
import { InsertarJuegosComponent } from './componentes/admin/panelJuegos/insertar-juegos/insertar-juegos.component';
import { ListarJuegosComponent } from './componentes/admin/panelJuegos/listar-juegos/listar-juegos.component';
import { PanelJuegosComponent } from './componentes/admin/panelJuegos/panel-juegos/panel-juegos.component';
import { InicioComponent } from './componentes/inicio/inicio.component';
import { VerJuegoComponent } from './componentes/juego/ver-juego/ver-juego.component';
import { LoginComponent } from './componentes/usuario/login/login.component';
import { PerfilComponent } from './componentes/usuario/perfil/perfil.component';
import { RecuperarPasswordComponent } from './componentes/usuario/recuperar-password/recuperar-password.component';
import { RegisterComponent } from './componentes/usuario/register/register.component';

const routes: Routes = [
  { path: '', component: InicioComponent },
  { path: 'login', component: LoginComponent },
  { path: 'register', component: RegisterComponent },
  { path: 'perfil', component: PerfilComponent },
  { path: 'verJuego/:id', component: VerJuegoComponent },
  { path: 'administracion', component: PanelComponent },
  { path: 'administracion/usuarios', component: PanelUsuariosComponent },
  { path: 'administracion/juegos', component: PanelJuegosComponent },
  { path: 'administracion/juegos/listar', component: ListarJuegosComponent },
  { path: 'administracion/juegos/insertar', component: InsertarJuegosComponent },
  { path: 'administracion/reportes', component: PanelReportesComponent },
  { path: 'administracion/juegos/editar/:id', component: EditarJuegoComponent },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
