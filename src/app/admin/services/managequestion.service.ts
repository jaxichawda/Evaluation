import { Injectable } from '@angular/core';
import { Http } from '@angular/http';
import { Globals } from '.././globals';
import {HttpClient} from "@angular/common/http";
import { Router } from '@angular/router';

@Injectable()
export class ManagequestionService {

  constructor(private http: HttpClient, private globals: Globals, private router: Router) { }


   //add user request
   add(questionEntity){ 
    debugger
    let promise = new Promise((resolve, reject) => { 
      this.http.post(this.globals.baseAPIUrl + 'Question/add', questionEntity)
      
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


    getAll()
    {
      debugger
    let promise = new Promise((resolve, reject) => {
      this.http.get(this.globals.baseAPIUrl + 'Question/getAllQuestion')
        .toPromise()
        .then(
          res => { // Success
            resolve(res);
          },
          msg => { // Error
        reject(msg);
        //this.globals.isLoading = false;
      
          }
        );
    });		
    return promise;
    }


    deleteQuestion(question_id){  
      debugger
      let promise = new Promise((resolve, reject) => {
        this.http.get(this.globals.baseAPIUrl + 'Question/delete/' + question_id)
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


      getById(question_id){
        let promise = new Promise((resolve, reject) => {
          this.http.get(this.globals.baseAPIUrl + 'Question/getById/' + question_id)
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


  getAllDefaultData(){
    debugger
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
       // this.router.navigate(['/pagenotfound']);
          }
        );
    });		
    return promise;
    }


}
