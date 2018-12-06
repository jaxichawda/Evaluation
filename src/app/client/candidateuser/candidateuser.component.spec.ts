import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { CandidateuserComponent } from './candidateuser.component';

describe('CandidateuserComponent', () => {
  let component: CandidateuserComponent;
  let fixture: ComponentFixture<CandidateuserComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ CandidateuserComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(CandidateuserComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
