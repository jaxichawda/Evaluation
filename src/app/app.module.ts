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
//import { AuthGuard } from './services/auth-guard.service';

@NgModule({
  declarations: [
    AppComponent,
    LoginComponent,
    FooterComponent,
    HeaderComponent
   
  ],
  imports: [
    BrowserModule,
	HttpModule,
	FormsModule,
	HttpClientModule,
	RouterModule.forRoot([	
	
      { path: '', component: LoginComponent},
		
	])
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
