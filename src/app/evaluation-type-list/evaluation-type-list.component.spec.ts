import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { EvaluationTypeListComponent } from './evaluation-type-list.component';

describe('EvaluationTypeListComponent', () => {
  let component: EvaluationTypeListComponent;
  let fixture: ComponentFixture<EvaluationTypeListComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ EvaluationTypeListComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(EvaluationTypeListComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
