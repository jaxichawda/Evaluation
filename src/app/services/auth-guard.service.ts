import { Injectable } from '@angular/core';
import { CanActivate,RouterStateSnapshot } from '@angular/router';
import { AuthService } from '../services/auth.service';
import { Router } from '@angular/router';
import { Globals } from '.././globals';
declare var $: any;

@Injectable()
export class AuthGuard implements CanActivate {

  constructor(private authService : AuthService,private router: Router, public globals: Globals) { }

  canActivate(route,state:RouterStateSnapshot) { 

	this.globals.isLoading = false;	
	$('footer').removeClass('footer_fixed');
	if(state.url=='/login'){					   
		$("body").addClass("height_100");
	} else {
		$("body").removeClass("height_100");
	}
	if(state.url.split('/')[3] != undefined){
		this.globals.currentLink = '/'+state.url.split('/')[1]+'/'+state.url.split('/')[2]+'/'+state.url.split('/')[3];
	} else if(state.url.split('/')[2] != undefined) {
		this.globals.currentLink = '/'+state.url.split('/')[1]+'/'+state.url.split('/')[2];
	} else {
		this.globals.currentLink = '/'+state.url.split('/')[1];
	}
	  if(this.authService.isLoggedIn()==true){	

		if(state.url=='/login'){			
			this.globals.IsLoggedIn = true;
			
			this.router.navigate(['/generate-evaluation']);
			return false;
		} else {
			
			this.globals.IsLoggedIn = true;
			return true;		  
		}		
			// if(this.globals.authData.RoleId==4){
			// 	if((state.url=='/user/dashboard'||state.url.split('/')[1]=='user-feedback'|| state.url.split('/')[1]=='user-result' || state.url=='/editprofile' || state.url=='/contactus')){
			// 			return true;
			// 	} else {
			// 		this.router.navigate(['/user/dashboard']);
			// 		return false;
			// 	}
			// }

			// if(state.url=='/dashboard' && this.globals.authData.RoleId!=4){
			// 	if(this.globals.authData.RoleId==3){
			// 		this.router.navigate(['/client-dashboard']);
			//   	return false;
			// 	}
			// } else if(state.url=='/client-dashboard' && this.globals.authData.RoleId!=4){
			// 	if(this.globals.authData.RoleId!=3){
			// 		this.router.navigate(['/dashboard']);
			//   	return false;
			// 	}
			// }

		//   if(state.url=='/login'||state.url=='/register'||state.url=='/'||state.url=='/forgotpassword'||state.url=='/forgotusername'||state.url.split('/')[1]=='resetpassword'||state.url.split('/')[1]=='client-registration'||state.url=='/client-sign-up'||state.url.split('/')[1]=='user-registration'||state.url.split('/')[2]=='login'||state.url.split('/')[2]=='forgotpassword'||state.url.split('/')[2]=='forgotusername'||state.url.split('/')[2]=='resetpassword'||state.url.split('/')[2]=='user-registration'||state.url.split('/')[2]=='client-registration'||state.url=='/start-workspace'||state.url=='/find-workspace'||state.url=='/create-workspace'||state.url.split('/')[1]=='activate-account'||state.url=='/privacy-policy'||state.url.split('/')[2]=='decline-feedback'){			
		// 	  this.globals.IsLoggedIn = true;
		// 	  this.router.navigate(['/dashboard']);
		// 	  return false;
		//   } else {
		// 		if((state.url=='/user/dashboard' || state.url.split('/')[1]=='user-feedback' || state.url.split('/')[1]=='user-result') && this.globals.authData.RoleId!=4){
		// 			this.router.navigate(['/dashboard']);
		// 	  	return false;
		// 		} 
		// 	  this.globals.IsLoggedIn = true;
		// 	  return true;		  
		//   }		  
	  } else {
		if(state.url=='/login'){					   
			   this.globals.IsLoggedIn = false;
			   return true;
		   } else {
			   this.globals.IsLoggedIn = false;
			   this.router.navigate(['/login']);
			   //window.location.href = '/login';
			   return false;
		   }		  
	  }
  }
  
}
