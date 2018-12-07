import { TestBed, inject } from '@angular/core/testing';

import { GenerateEvaluationService } from './generate-evaluation.service';

describe('GenerateEvaluationService', () => {
  beforeEach(() => {
    TestBed.configureTestingModule({
      providers: [GenerateEvaluationService]
    });
  });

  it('should be created', inject([GenerateEvaluationService], (service: GenerateEvaluationService) => {
    expect(service).toBeTruthy();
  }));
});
