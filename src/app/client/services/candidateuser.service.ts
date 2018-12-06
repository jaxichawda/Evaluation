import { Injectable } from '@angular/core';
import { Http } from '@angular/http';
import { Globals } from '.././globals';
import {HttpClient} from "@angular/common/http";
import { Router } from '@angular/router';


@Injectable()
export class CandidateuserService {

  constructor(private http: HttpClient, private globals: Globals, private router: Router) { }

  //add user
  add(candidateEntity){ 
    debugger
    let promise = new Promise((resolve, reject) => { 
      this.http.post(this.globals.baseAPIUrl + 'Candidateuser/addUser', candidateEntity)
      
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
    this.http.get(this.globals.baseAPIUrl + 'Candidateuser/getAllCandidate')
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


    getById(CandidateId){
      debugger
    
      let promise = new Promise((resolve, reject) => {
        this.http.get(this.globals.baseAPIUrl + 'Candidateuser/getById/' + CandidateId)
          .toPromise()
          .then(
            res => { // Success
              resolve(res);
            },
            msg => { // Error
          reject(msg);
       //   this.globals.isLoading = false;
         // this.router.navigate(['/pagenotfound']);
            }
          );
      });		
      return promise;
      }  




      getAllDefaultData(){
        debugger
        let promise = new Promise((resolve, reject) => {
          this.http.get(this.globals.baseAPIUrl + 'Candidateuser/getAllDefaultData')
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


        delete(del){  
          let promise = new Promise((resolve, reject) => {
            this.http.post(this.globals.baseAPIUrl + 'Candidateuser/delete' , del)
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

}
