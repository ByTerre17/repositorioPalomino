import { LOCALE_ID, NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { MDBBootstrapModule } from 'angular-bootstrap-md';
import { CommonModule } from "@angular/common";
import { HttpClientModule, HTTP_INTERCEPTORS } from '@angular/common/http';
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { BarraNavegacionComponent } from './componentes/barra-navegacion/barra-navegacion.component';
import { InicioComponent } from './componentes/inicio/inicio.component';
import { FooterComponent } from './componentes/footer/footer.component';
import { LoginComponent } from './componentes/usuario/login/login.component';
import { RegisterComponent } from './componentes/usuario/register/register.component';
import { FormsModule,ReactiveFormsModule } from '@angular/forms';
import { EnviarTokenInterceptor } from './auth/enviar-token.interceptor';
import { PerfilComponent } from './componentes/usuario/perfil/perfil.component';
import { RecuperarPasswordComponent } from './componentes/usuario/recuperar-password/recuperar-password.component';
import { VerJuegoComponent } from './componentes/juego/ver-juego/ver-juego.component';
import { CrearJuegoComponent } from './componentes/juego/crear-juego/crear-juego.component';
import { PanelComponent } from './componentes/admin/panel/panel.component';
import { PanelUsuariosComponent } from './componentes/admin/panel-usuarios/panel-usuarios.component';
import { PanelReportesComponent } from './componentes/admin/panelReportes/panel-reportes/panel-reportes.component';
import { ListarJuegosComponent } from './componentes/admin/panelJuegos/listar-juegos/listar-juegos.component';
import { InsertarJuegosComponent } from './componentes/admin/panelJuegos/insertar-juegos/insertar-juegos.component';
import { PanelJuegosComponent } from './componentes/admin/panelJuegos/panel-juegos/panel-juegos.component';
import { EditarJuegoComponent } from './componentes/admin/panelJuegos/editar-juego/editar-juego.component';
import { ListarReportesComponent } from './componentes/admin/panelReportes/listar-reportes/listar-reportes.component';
import { ReportarComentarioComponent } from './componentes/comentario/reportar-comentario/reportar-comentario.component';
import { VerReporteComponent } from './componentes/admin/panelReportes/ver-reporte/ver-reporte.component';
import { RecuperarPassword2Component } from './componentes/usuario/recuperar-password2/recuperar-password2.component';
import { ListarjuegosComponent } from './componentes/juego/listarjuegos/listarjuegos.component';
import { BuscarPipe } from './pipes/buscar.pipe';
import { FiltroGeneroPipe } from './pipes/filtro-genero.pipe';
import { FiltroPlataformaPipe } from './pipes/filtro-plataforma.pipe';

@NgModule({
  declarations: [
    AppComponent,
    BarraNavegacionComponent,
    InicioComponent,
    FooterComponent,
    LoginComponent,
    RegisterComponent,
    PerfilComponent,
    RecuperarPasswordComponent,
    VerJuegoComponent,
    CrearJuegoComponent,
    PanelComponent,
    PanelJuegosComponent,
    PanelUsuariosComponent,
    PanelReportesComponent,
    ListarJuegosComponent,
    InsertarJuegosComponent,
    EditarJuegoComponent,
    ListarReportesComponent,
    ReportarComentarioComponent,
    VerReporteComponent,
    RecuperarPassword2Component,
    ListarjuegosComponent,
    BuscarPipe,
    FiltroGeneroPipe,
    FiltroPlataformaPipe
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    MDBBootstrapModule.forRoot(),
    ReactiveFormsModule,
    FormsModule,
    HttpClientModule,
    CommonModule,
  ],
  providers: [{provide:LOCALE_ID, useValue:"es"},
  {provide: HTTP_INTERCEPTORS, useClass:EnviarTokenInterceptor, multi:true}
],
  bootstrap: [AppComponent]
})
export class AppModule { }
