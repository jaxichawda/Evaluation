import { Injectable } from '@angular/core';
import { Http } from '@angular/http';
import { Globals } from '.././globals';
import { HttpClient } from "@angular/common/http";
import { Router } from '@angular/router';

@Injectable()
export class PerformanceReviewService {

  constructor(private http: HttpClient, private globals: Globals, private router: Router) { }
  getAllQuestionData(obj) {
    debugger
    let promise = new Promise((resolve, reject) => {
      this.http.post(this.globals.baseAPIUrl + 'PerformanceReview/getAllQuestionData' , obj)
        .toPromise()
        .then(
          res => { // Success
            resolve(res);
          },
          msg => { // Error
            reject(msg);
            //  this.globals.isLoading = false;
            //this.router.navigate(['/pagenotfound']);
          }
        );
    });
    return promise;
  }
  insertPerformance(PerformanceData){ 
    debugger
    let promise = new Promise((resolve, reject) => { 
      this.http.post(this.globals.baseAPIUrl + 'PerformanceReview/insertPerformance', PerformanceData)
        .toPromise()
        .then(
          res => { // Success
            resolve(res); 
          },
          msg => { // Error
        reject(msg);
          }
        );
    });		
    return promise;
    }
    saveAsDraft(PerformanceData){ 
      debugger
      let promise = new Promise((resolve, reject) => { 
        this.http.post(this.globals.baseAPIUrl + 'PerformanceReview/saveAsDraft', PerformanceData)
          .toPromise()
          .then(
            res => { // Success
              resolve(res); 
            },
            msg => { // Error
          reject(msg);
            }
          );
      });		
      return promise;
      }
}
