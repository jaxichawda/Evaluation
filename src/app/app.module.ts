import { BrowserModule } from '@angular/platform-browser';
import { Component,NgModule } from '@angular/core';
import { RouterModule } from '@angular/router';
import { FormsModule } from '@angular/forms';
import { HttpModule } from '@angular/http';
import { AppComponent } from './app.component';
import { HttpClientModule } from '@angular/common/http';
import { LoginComponent } from './login/login.component';
import { FooterComponent } from './footer/footer.component';
import { HeaderComponent } from './header/header.component';
import { Globals } from './globals';
import { GenerateEvaluationComponent } from './generate-evaluation/generate-evaluation.component';
import {SelectModule} from 'ng-select';

import { AuthService } from './services/auth.service';
import { AuthGuard } from './services/auth-guard.service';
import { GenerateEvaluationService } from './services/generate-evaluation.service';
//import { AuthGuard } from './services/auth-guard.service';

@NgModule({
  declarations: [
    AppComponent,
    LoginComponent,
    FooterComponent,
    HeaderComponent,
    GenerateEvaluationComponent
   
  ],
  imports: [
  BrowserModule,
	HttpModule,
	FormsModule,
  HttpClientModule,
  SelectModule,
	RouterModule.forRoot([	
	
      { path: 'login', component: LoginComponent,canActivate : [AuthGuard]},
      { path: 'generate-evaluation', component: GenerateEvaluationComponent,canActivate : [AuthGuard]},
      { path: '', redirectTo: 'login', pathMatch:'full'},
				{ path: '**', redirectTo : 'login' }
		
	])
  ],
  providers: [Globals,AuthGuard,AuthService,GenerateEvaluationService],
  bootstrap: [AppComponent]
})
export class AppModule { }
