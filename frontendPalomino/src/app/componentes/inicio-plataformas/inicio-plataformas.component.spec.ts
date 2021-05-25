import { ComponentFixture, TestBed } from '@angular/core/testing';

import { InicioPlataformasComponent } from './inicio-plataformas.component';

describe('InicioPlataformasComponent', () => {
  let component: InicioPlataformasComponent;
  let fixture: ComponentFixture<InicioPlataformasComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ InicioPlataformasComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(InicioPlataformasComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
