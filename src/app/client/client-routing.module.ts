import { BrowserModule } from '@angular/platform-browser';
import { Globals } from './globals';
import { Component,NgModule } from '@angular/core';
import { Routes,RouterModule } from '@angular/router';
import { FormsModule } from '@angular/forms';
import { HttpModule } from '@angular/http';
import { CommonModule } from "@angular/common";
import { ClientComponent  } from './client.component.module';

import { HomeComponent } from './home/home.component';
import { HttpClientModule } from '@angular/common/http';



import { CandidateuserComponent } from './candidateuser/candidateuser.component';

import { CandidateuserService } from './services/candidateuser.service';

import { ThankyouComponent } from './thankyou/thankyou.component';

import { HeaderComponent } from './header/header.component';
import { FooterComponent } from './footer/footer.component';

import { ManagequestionService } from './services/managequestion.service';


//import { AuthGuard } from './services/auth-guard.service';
import { AuthService } from './services/auth.service'


import { DashboardComponent } from './dashboard/dashboard.component';

const routes: Routes = [	
	{
		path: '',
			component: ClientComponent,
			children: [
				
			
				{ path : '', component : CandidateuserComponent  },

				// { path : 'home', component : HomeComponent  },

			
				
			
				{ path : 'candidateuser', component : CandidateuserComponent  },
			
			

				{ path : 'thankyou', component : ThankyouComponent  },

			
	
				// { path: 'dashboard', component: DashboardComponent}
				
			]
	}
];
  
 @NgModule({
	imports: [RouterModule.forChild(routes)],
	exports: [RouterModule],
	providers: [Globals,CandidateuserService,ManagequestionService,
		AuthService,AuthService,
	
	],

	bootstrap: [ClientComponent]
})
export class ClientRoutingModule { }
