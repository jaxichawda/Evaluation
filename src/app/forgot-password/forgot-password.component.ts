import { Component, OnInit } from '@angular/core';
import { Http } from '@angular/http';
import { Globals } from '.././globals';
import { Router } from '@angular/router';
import { ActivatedRoute } from '@angular/router';
import { ForgotResetService } from '../services/forgot-reset.service';
declare var $,swal: any;

@Component({
  selector: 'app-forgot-password',
  templateUrl: './forgot-password.component.html',
  styleUrls: ['./forgot-password.component.css']
})
export class ForgotPasswordComponent implements OnInit {

  forgotEntity;
	submitted;
	type;
  btn_disable;
  
  constructor( private http: Http,public globals: Globals, private router: Router,private route:ActivatedRoute,private ForgotResetService:ForgotResetService) { }

  ngOnInit() {
    const body = document.querySelector('body');
    var count = $(window).height();
    body.style.setProperty('--screen-height', count + "px");
    this.forgotEntity={};
  }
  forgotPassword(fgpassForm)
    {		
      debugger
   
    // var msg=this.fgpassEntity.EmailAddress;
      
        this.submitted = true;
      
      if(fgpassForm.valid){
         this.forgotEntity.EmailAddress;
         this.submitted = false;
        this.btn_disable = true;
        this.globals.isLoading = true;
        this.ForgotResetService.forgotPassword(this.forgotEntity)
        .then((data) => 
        {
          this.submitted = false;
          this.globals.isLoading = false;
          if(data=='Code duplicate')
          {
            swal({
              type: 'warning',
              title: 'Oops...',
              text: 'Could not find your Email Address!',
              })
              this.globals.isLoading = false;
            this.router.navigate(['/forgot-password']);
          }
          else
          {
            this.btn_disable = false;
            this.submitted = false;
            localStorage.setItem('EmailAddress',this.forgotEntity.EmailAddress);
            this.forgotEntity = {};
            fgpassForm.form.markAsPristine();
               
            swal({
        	    position: 'top-end',
							type: 'success',
							title: 'Please check your Email!',
							showConfirmButton: false,
							timer: 1500
            }) 
          }
          this.globals.isLoading = false;
          this.router.navigate(['/login']);
        }, 
        (error) => 
        {
          this.btn_disable = false;
          this.submitted = false;
          this.globals.isLoading = false;
          this.router.navigate(['/pagenotfound']);
        });
      } 		
    }
    

}
