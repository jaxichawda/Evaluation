import { Injectable } from '@angular/core';
import { Globals } from '.././globals';
import { HttpClient } from "@angular/common/http";
import { Router } from '@angular/router';
@Injectable()
export class GenerateEvaluationService {

  constructor(private http: HttpClient, private globals: Globals, private router: Router) {
  }
  getData() {
    debugger
    let promise = new Promise((resolve, reject) => {
      this.http.get(this.globals.baseAPIUrl + 'GenerateEvaluation/getData')
        .toPromise()
        .then(
          res => { // Success
            resolve(res);
          },
          msg => { // Error
            reject(msg);
            this.globals.isLoading = false;
            this.router.navigate(['/pagenotfound']);
          }
        );
    });
    return promise;
  }
  getReportingEmployee(Id) {
    debugger
    let promise = new Promise((resolve, reject) => {
      this.http.get(this.globals.baseAPIUrl + 'GenerateEvaluation/getReportingEmployee/' + Id)
        .toPromise()
        .then(
          res => { // Success
            resolve(res);
          },
          msg => { // Error
            reject(msg);
            this.globals.isLoading = false;
            this.router.navigate(['/pagenotfound']);
          }
        );
    });
    return promise;
  }
  generateEvaluation(evaluationEntity) {
    debugger
    let promise = new Promise((resolve, reject) => {
      this.http.post(this.globals.baseAPIUrl + 'GenerateEvaluation/generate_Evaluation', evaluationEntity)
        .toPromise()
        .then(
          res => { // Success
            resolve(res);
          },
          msg => { // Error
            reject(msg);
            this.globals.isLoading = false;
            this.router.navigate(['/pagenotfound']);
          }
        );
    });
    return promise;
  }
  getAllEvaluation() {
    debugger
    let promise = new Promise((resolve, reject) => {
      this.http.get(this.globals.baseAPIUrl + 'GenerateEvaluation/getAllEvaluation')
        .toPromise()
        .then(
          res => { // Success
            resolve(res);
          },
          msg => { // Error
            reject(msg);
            this.globals.isLoading = false;
            this.router.navigate(['/pagenotfound']);
          }
        );
    });
    return promise;
  }
  getEvaluationById(evaluationId) {
    debugger
    let promise = new Promise((resolve, reject) => {
      this.http.get(this.globals.baseAPIUrl + 'GenerateEvaluation/getEvaluationById/' + evaluationId)
        .toPromise()
        .then(
          res => { // Success
            resolve(res);
          },
          msg => { // Error
            reject(msg);
            // this.globals.isLoading = false;
            this.router.navigate(['/pagenotfound']);
          }
        );
    });
    return promise;
  }
  revokeEvaluation(del) {
    debugger
    let promise = new Promise((resolve, reject) => {
      this.http.post(this.globals.baseAPIUrl + 'GenerateEvaluation/revokeEvaluation', del)
        .toPromise()
        .then(
          res => { // Success
            resolve(res);
          },
          msg => { // Error
            reject(msg);
            this.globals.isLoading = false;
            this.router.navigate(['/pagenotfound']);
          }
        );
    });
    return promise;
  }
  revokeEvaluator(del) {
    debugger
    let promise = new Promise((resolve, reject) => {
      this.http.post(this.globals.baseAPIUrl + 'GenerateEvaluation/revokeEvaluator', del)
        .toPromise()
        .then(
          res => { // Success
            resolve(res);
          },
          msg => { // Error
            reject(msg);
            this.globals.isLoading = false;
            this.router.navigate(['/pagenotfound']);
          }
        );
    });
    return promise;
  }
  getEvaluators(obj) {
    debugger
    let promise = new Promise((resolve, reject) => {
      this.http.post(this.globals.baseAPIUrl + 'GenerateEvaluation/getEvaluators', obj)
        .toPromise()
        .then(
          res => { // Success
            resolve(res);
          },
          msg => { // Error
            reject(msg);
            this.globals.isLoading = false;
            this.router.navigate(['/pagenotfound']);
          }
        );
    });
    return promise;
  }
  getEvaluationReport(evaluationId) {
    let promise = new Promise((resolve, reject) => {
      this.http.get(this.globals.baseAPIUrl + 'GenerateEvaluation/getEvaluationReport/' + evaluationId)
        .toPromise()
        .then(
          res => { // Success
            resolve(res);
          },
          msg => { // Error
            reject(msg);
            // this.globals.isLoading = false;
            this.router.navigate(['/pagenotfound']);
          }
        );
    });
    return promise;
  }
}
