import { ComponentFixture, TestBed } from '@angular/core/testing';

import { RecuperarPassword2Component } from './recuperar-password2.component';

describe('RecuperarPassword2Component', () => {
  let component: RecuperarPassword2Component;
  let fixture: ComponentFixture<RecuperarPassword2Component>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ RecuperarPassword2Component ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(RecuperarPassword2Component);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
