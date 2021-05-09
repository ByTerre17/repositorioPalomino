import { Pipe, PipeTransform } from '@angular/core';

@Pipe({
  name: 'filtroGenero'
})
export class FiltroGeneroPipe implements PipeTransform {

  transform(juegos: any, arg: any): any {
    const resultado = [];
    for(const juego of juegos){
      if(juego.genero.toLowerCase().indexOf(arg.toLowerCase()) >-1){
        resultado.push(juego)
      }
    }
    return resultado
  }

}
