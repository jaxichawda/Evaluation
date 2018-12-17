import { TestBed, inject } from '@angular/core/testing';

import { ForgotResetService } from './forgot-reset.service';

describe('ForgotResetService', () => {
  beforeEach(() => {
    TestBed.configureTestingModule({
      providers: [ForgotResetService]
    });
  });

  it('should be created', inject([ForgotResetService], (service: ForgotResetService) => {
    expect(service).toBeTruthy();
  }));
});
