import { TestBed, inject } from '@angular/core/testing';

import { CandidateuserService } from './candidateuser.service';

describe('CandidateuserService', () => {
  beforeEach(() => {
    TestBed.configureTestingModule({
      providers: [CandidateuserService]
    });
  });

  it('should be created', inject([CandidateuserService], (service: CandidateuserService) => {
    expect(service).toBeTruthy();
  }));
});
