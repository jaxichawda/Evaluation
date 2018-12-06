import { Injectable } from '@angular/core';
import { Http } from '@angular/http';
import { Globals } from '.././globals';
import {HttpClient} from "@angular/common/http";
import { Router } from '@angular/router';


@Injectable()
export class QuestionService {

  constructor(private http: HttpClient, private globals: Globals, private router: Router) { }

   //add user request
   add(ansEntity){ 
    debugger
    let promise = new Promise((resolve, reject) => { 
      this.http.post(this.globals.baseAPIUrl + 'Question/add', ansEntity)
      
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

         //list all users
  getAllDefaultData(){
	  
    let promise = new Promise((resolve, reject) => {
      this.http.get(this.globals.baseAPIUrl + 'Question/getAllDefaultData')
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


}
