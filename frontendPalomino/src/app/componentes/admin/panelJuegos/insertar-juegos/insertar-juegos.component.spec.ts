import { ComponentFixture, TestBed } from '@angular/core/testing';

import { InsertarJuegosComponent } from './insertar-juegos.component';

describe('InsertarJuegosComponent', () => {
  let component: InsertarJuegosComponent;
  let fixture: ComponentFixture<InsertarJuegosComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ InsertarJuegosComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(InsertarJuegosComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
