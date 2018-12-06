import { TestBed, inject } from '@angular/core/testing';

import { ManagequestionService } from './managequestion.service';

describe('ManagequestionService', () => {
  beforeEach(() => {
    TestBed.configureTestingModule({
      providers: [ManagequestionService]
    });
  });

  it('should be created', inject([ManagequestionService], (service: ManagequestionService) => {
    expect(service).toBeTruthy();
  }));
});
