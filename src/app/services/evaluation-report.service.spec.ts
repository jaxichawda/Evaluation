import { TestBed, inject } from '@angular/core/testing';

import { EvaluationReportService } from './evaluation-report.service';

describe('EvaluationReportService', () => {
  beforeEach(() => {
    TestBed.configureTestingModule({
      providers: [EvaluationReportService]
    });
  });

  it('should be created', inject([EvaluationReportService], (service: EvaluationReportService) => {
    expect(service).toBeTruthy();
  }));
});
