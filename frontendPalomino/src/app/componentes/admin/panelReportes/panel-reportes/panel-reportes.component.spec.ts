import { ComponentFixture, TestBed } from '@angular/core/testing';

import { PanelReportesComponent } from './panel-reportes.component';

describe('PanelReportesComponent', () => {
  let component: PanelReportesComponent;
  let fixture: ComponentFixture<PanelReportesComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ PanelReportesComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(PanelReportesComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
