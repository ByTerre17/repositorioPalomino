import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ReportarComentarioComponent } from './reportar-comentario.component';

describe('ReportarComentarioComponent', () => {
  let component: ReportarComentarioComponent;
  let fixture: ComponentFixture<ReportarComentarioComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ReportarComentarioComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(ReportarComentarioComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
