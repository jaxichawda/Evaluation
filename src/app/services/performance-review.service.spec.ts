import { TestBed, inject } from '@angular/core/testing';

import { PerformanceReviewService } from './performance-review.service';

describe('PerformanceReviewService', () => {
  beforeEach(() => {
    TestBed.configureTestingModule({
      providers: [PerformanceReviewService]
    });
  });

  it('should be created', inject([PerformanceReviewService], (service: PerformanceReviewService) => {
    expect(service).toBeTruthy();
  }));
});
