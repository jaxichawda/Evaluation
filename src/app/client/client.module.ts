import { BrowserModule } from '@angular/platform-browser';
import { Globals } from './globals';
import { Component,NgModule } from '@angular/core';
import { RouterModule } from '@angular/router';
import { FormsModule } from '@angular/forms';
import { HttpModule } from '@angular/http';
import { CommonModule } from "@angular/common";

import { ClientRoutingModule } from './client-routing.module';
import { ClientComponent } from './client.component.module';

import { HttpClientModule } from '@angular/common/http';

import { HomeComponent } from './home/home.component';


import { CandidateuserComponent } from './candidateuser/candidateuser.component';

import { CandidateuserService } from './services/candidateuser.service';

import { ThankyouComponent } from './thankyou/thankyou.component';

import { HeaderComponent } from './header/header.component';
import { FooterComponent } from './footer/footer.component';






//import { AuthGuard } from './services/auth-guard.service';
import { AuthService } from './services/auth.service'


import { DashboardComponent } from './dashboard/dashboard.component';

@NgModule({
  declarations: [
    ClientComponent,
    HomeComponent,
    CandidateuserComponent,
    ThankyouComponent,
    HeaderComponent,
    FooterComponent,  
    DashboardComponent
    
  ],
  imports: [
    CommonModule,
	HttpModule,
	FormsModule,
	HttpClientModule,
	ClientRoutingModule	
  ]
})
export class ClientModule { }
