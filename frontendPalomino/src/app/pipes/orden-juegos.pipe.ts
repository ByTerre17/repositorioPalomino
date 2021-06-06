import { Pipe, PipeTransform } from '@angular/core';

@Pipe({
  name: 'ordenJuegos'
})
export class OrdenJuegosPipe implements PipeTransform {

  transform(juegos: any, arg: string): any[] {
    
    if( arg=="mayor"){
      return juegos.sort(function(a:any,b:any){return parseFloat(b.nota) - parseFloat(a.nota)});
    }
    else if( arg=="menor"){
      return juegos.sort(function(a:any,b:any){return parseFloat(a.nota) - parseFloat(b.nota)});
    }
    else{
      return juegos;
    }
  }

}
