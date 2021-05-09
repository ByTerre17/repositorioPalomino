import { Pipe, PipeTransform } from '@angular/core';

@Pipe({
  name: 'filtroPlataforma'
})
export class FiltroPlataformaPipe implements PipeTransform {

  transform(juegos: any, arg: any): any {
    const resultado = [];
    for(const juego of juegos){
      if(juego.plataforma.toLowerCase().indexOf(arg.toLowerCase()) >-1){
        resultado.push(juego)
      }
    }
    return resultado
  }

}
