import { TestBed, inject } from '@angular/core/testing';

import { EvaluationTypeService } from './evaluation-type.service';

describe('EvaluationTypeService', () => {
  beforeEach(() => {
    TestBed.configureTestingModule({
      providers: [EvaluationTypeService]
    });
  });

  it('should be created', inject([EvaluationTypeService], (service: EvaluationTypeService) => {
    expect(service).toBeTruthy();
  }));
});
