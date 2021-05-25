import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { PanelUsuariosComponent } from './componentes/admin/panel-usuarios/panel-usuarios.component';
import { PanelComponent } from './componentes/admin/panel/panel.component';
import { EditarJuegoComponent } from './componentes/admin/panelJuegos/editar-juego/editar-juego.component';
import { InsertarJuegosComponent } from './componentes/admin/panelJuegos/insertar-juegos/insertar-juegos.component';
import { ListarJuegosComponent } from './componentes/admin/panelJuegos/listar-juegos/listar-juegos.component';
import { InicioComponent } from './componentes/inicio/inicio.component';
import { VerJuegoComponent } from './componentes/juego/ver-juego/ver-juego.component';
import { LoginComponent } from './componentes/usuario/login/login.component';
import { PerfilComponent } from './componentes/usuario/perfil/perfil.component';
import { RecuperarPasswordComponent } from './componentes/usuario/recuperar-password/recuperar-password.component';
import { RegisterComponent } from './componentes/usuario/register/register.component';
import { ReportarComentarioComponent } from './componentes/comentario/reportar-comentario/reportar-comentario.component';
import { ListarReportesComponent } from './componentes/admin/panelReportes/listar-reportes/listar-reportes.component';
import { VerReporteComponent } from './componentes/admin/panelReportes/ver-reporte/ver-reporte.component';
import { RecuperarPassword2Component } from './componentes/usuario/recuperar-password2/recuperar-password2.component';
import { ListarjuegosComponent } from './componentes/juego/listarjuegos/listarjuegos.component';
import { InicioPlataformasComponent } from './componentes/inicio-plataformas/inicio-plataformas.component';

const routes: Routes = [
  { path: '', component: InicioComponent },
  { path: 'recuperarPassword', component: RecuperarPasswordComponent},
  { path: 'recuperarPassword/:id', component: RecuperarPassword2Component},
  { path: 'login', component: LoginComponent },
  { path: 'register', component: RegisterComponent },
  { path: 'perfil', component: PerfilComponent },
  { path: 'listaJuegos', component: ListarjuegosComponent },
  { path: 'verJuego/:id', component: VerJuegoComponent },
  { path: 'administracion', component: PanelComponent },
  { path: 'administracion/usuarios', component: PanelUsuariosComponent },
  { path: 'administracion/juegos/listar', component: ListarJuegosComponent },
  { path: 'administracion/juegos/insertar', component: InsertarJuegosComponent },
  { path: 'administracion/reportes/verReporte/:id', component: VerReporteComponent },
  { path: 'administracion/reportes/listarReportes', component: ListarReportesComponent },
  { path: 'administracion/juegos/editar/:id', component: EditarJuegoComponent },
  { path: 'reportarComentario/:id', component: ReportarComentarioComponent  },
  { path: 'inicioPlataforma/:id', component: InicioPlataformasComponent  },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
