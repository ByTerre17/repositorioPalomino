import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ListarJuegosComponent } from './listar-juegos.component';

describe('ListarJuegosComponent', () => {
  let component: ListarJuegosComponent;
  let fixture: ComponentFixture<ListarJuegosComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ListarJuegosComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(ListarJuegosComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
