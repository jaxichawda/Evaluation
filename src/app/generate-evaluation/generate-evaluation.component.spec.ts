import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { GenerateEvaluationComponent } from './generate-evaluation.component';

describe('GenerateEvaluationComponent', () => {
  let component: GenerateEvaluationComponent;
  let fixture: ComponentFixture<GenerateEvaluationComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ GenerateEvaluationComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(GenerateEvaluationComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
