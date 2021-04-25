import { ComponentFixture, TestBed } from '@angular/core/testing';

import { VerJuegoComponent } from './ver-juego.component';

describe('VerJuegoComponent', () => {
  let component: VerJuegoComponent;
  let fixture: ComponentFixture<VerJuegoComponent>;

  
  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ VerJuegoComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(VerJuegoComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
