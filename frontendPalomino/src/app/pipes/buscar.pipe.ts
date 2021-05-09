import { Pipe, PipeTransform } from '@angular/core';

@Pipe({
  name: 'buscar'
})
export class BuscarPipe implements PipeTransform {

  transform(juegos: any, arg: any): any {
    const resultado = [];
    for(const juego of juegos){
      if(juego.nombre.toLowerCase().indexOf(arg.toLowerCase()) >-1){
        resultado.push(juego)
      }
    }
    return resultado
  }
  
}
