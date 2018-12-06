import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ManagequestionlistComponent } from './managequestionlist.component';

describe('ManagequestionlistComponent', () => {
  let component: ManagequestionlistComponent;
  let fixture: ComponentFixture<ManagequestionlistComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ManagequestionlistComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ManagequestionlistComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
