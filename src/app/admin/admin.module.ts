import { BrowserModule } from '@angular/platform-browser';
import { Component,NgModule } from '@angular/core';
import { Routes,RouterModule } from '@angular/router';
import { FormsModule } from '@angular/forms';
import { HttpModule } from '@angular/http';
import { CommonModule } from "@angular/common";
import { AdminRoutingModule } from './admin-routing.module';
import { AdminComponent } from './admin.component.module';

import { LoginComponent } from './login/login.component';
import { AuthService } from './services/auth.service'
import { AuthGuard } from './services/auth-guard.service';

import { HomeComponent } from './home/home.component';

// import { QuestionComponent } from './question/question.component';
import { QuestionService } from './services/question.service';

import { JobpositionComponent } from './jobposition/jobposition.component';
import { JobpositionService } from './services/jobposition.service';
import { JobpositionlistComponent } from './jobpositionlist/jobpositionlist.component';

import { CandidateuserComponent } from './candidateuser/candidateuser.component';
import { CandidatelistComponent } from './candidatelist/candidatelist.component';
import { CandidateuserService } from './services/candidateuser.service';

import { ThankyouComponent } from './thankyou/thankyou.component';

import { HeaderComponent } from './header/header.component';
import { FooterComponent } from './footer/footer.component';

import { ManagequestionComponent } from './managequestion/managequestion.component';
import { ManagequestionlistComponent } from './managequestionlist/managequestionlist.component';

import { UserroleComponent } from './userrole/userrole.component';
import { UserrolelistComponent } from './userrolelist/userrolelist.component';
import { UserroleService } from './services/userrole.service';

import { RegisterComponent } from './register/register.component';
import { RegisterService } from './services/register.service';
import { RegisterlistComponent } from './registerlist/registerlist.component';

import { ChangepassComponent } from './changepass/changepass.component';
import { ChangepassService } from './services/changepass.service';

import { DashboardComponent } from './dashboard/dashboard.component';


import { SidebarComponent } from './sidebar/sidebar.component';



@NgModule({
  declarations: [
    AdminComponent,
    LoginComponent,
    HomeComponent,
    // QuestionComponent,
    JobpositionComponent,
    JobpositionlistComponent,
    CandidateuserComponent,
    CandidatelistComponent,
    ThankyouComponent,
    HeaderComponent,
    FooterComponent,
    ManagequestionComponent,
    ManagequestionlistComponent,
    RegisterComponent,
    RegisterlistComponent,
    ChangepassComponent,
    UserroleComponent,
    UserrolelistComponent,
    DashboardComponent,
    SidebarComponent
    
  ],
  imports: [
	//BrowserModule,
	CommonModule,
	HttpModule,
	FormsModule,
	AdminRoutingModule
  ]  
})
export class AdminModule { }
