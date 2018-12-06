import { Injectable } from '@angular/core';
import { Http } from '@angular/http';
import { Globals } from '.././globals';
import {HttpClient} from "@angular/common/http";
import { Router } from '@angular/router';

@Injectable()
export class JobpositionService {

  constructor(private http: HttpClient, private globals: Globals, private router: Router) {  }

  add(positionEntity){ 
    debugger
	let promise = new Promise((resolve, reject) => {
    this.http.post(this.globals.baseAPIUrl + 'Jobposition/addPosition', positionEntity)
      .toPromise()
      .then(
        res => { // Success
          resolve(res);
        },
        msg => { // Error
      reject(msg);
      //this.globals.isLoading = false;
     // this.router.navigate(['/pagenotfound']);
        }
      );
	});		
	return promise;
  }
  
  getAll(){ 
	let promise = new Promise((resolve, reject) => {
    this.http.get(this.globals.baseAPIUrl + 'Jobposition/getAll')
      .toPromise()
      .then(
        res => { // Success
          resolve(res);
        },
        msg => { // Error
      reject(msg);
      //this.globals.isLoading = false;
      this.router.navigate(['/pagenotfound']);
        }
      );
	});		
	return promise;
  }
  
  
  // delete(del){  
	// let promise = new Promise((resolve, reject) => {
  //   this.http.post(this.globals.baseAPIUrl + 'Jobposition/Jobposition' , del)
  //     .toPromise()
  //     .then(
  //       res => { // Success
  //         resolve(res);
  //       },
  //       msg => { // Error
  //     reject(msg);
  //  //   this.globals.isLoading = false;
  //     this.router.navigate(['/pagenotfound']);
  //       }
  //     );
	// });		
	// return promise;
  // }
  
  deletePosition(position_id){  
    debugger
    let promise = new Promise((resolve, reject) => {
      this.http.get(this.globals.baseAPIUrl + 'Jobposition/delete/' + position_id)
        .toPromise()
        .then(
          res => { // Success
            resolve(res);
          },
          msg => { // Error
        reject(msg);
     //   this.globals.isLoading = false;
        this.router.navigate(['/pagenotfound']);
          }
        );
    });		
    return promise;
    }

  getById(position_id){
	let promise = new Promise((resolve, reject) => {
    this.http.get(this.globals.baseAPIUrl + 'Jobposition/getById/' + position_id)
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
