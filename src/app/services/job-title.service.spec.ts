import { TestBed, inject } from '@angular/core/testing';

import { JobTitleService } from './job-title.service';

describe('JobTitleService', () => {
  beforeEach(() => {
    TestBed.configureTestingModule({
      providers: [JobTitleService]
    });
  });

  it('should be created', inject([JobTitleService], (service: JobTitleService) => {
    expect(service).toBeTruthy();
  }));
});
