import { TestBed, inject } from '@angular/core/testing';

import { JobpositionService } from './jobposition.service';

describe('JobpositionService', () => {
  beforeEach(() => {
    TestBed.configureTestingModule({
      providers: [JobpositionService]
    });
  });

  it('should be created', inject([JobpositionService], (service: JobpositionService) => {
    expect(service).toBeTruthy();
  }));
});
