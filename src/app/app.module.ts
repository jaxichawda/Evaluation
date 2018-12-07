import { BrowserModule } from '@angular/platform-browser';
import { Component, NgModule } from '@angular/core';
import { RouterModule } from '@angular/router';
import { FormsModule } from '@angular/forms';
import { HttpModule } from '@angular/http';
import { AppComponent } from './app.component';
import { HttpClientModule } from '@angular/common/http';
import { LoginComponent } from './login/login.component';
import { FooterComponent } from './footer/footer.component';
import { HeaderComponent } from './header/header.component';
import { SidebarComponent } from './sidebar/sidebar.component';

import { Globals } from './globals';
import { GenerateEvaluationComponent } from './generate-evaluation/generate-evaluation.component';
import {SelectModule} from 'ng-select';

import { AuthService } from './services/auth.service';
import { AuthGuard } from './services/auth-guard.service';
import { GenerateEvaluationService } from './services/generate-evaluation.service';
import { DashboardComponent } from './dashboard/dashboard.component';
import { DepartmentComponent } from './department/department.component';
import { DepartmentListComponent } from './department-list/department-list.component';
import { JobTitleComponent } from './job-title/job-title.component';
import { JobTitleListComponent } from './job-title-list/job-title-list.component';
import { EvaluationTypeComponent } from './evaluation-type/evaluation-type.component';
import { EvaluationTypeListComponent } from './evaluation-type-list/evaluation-type-list.component';
import { QuestionComponent } from './question/question.component';
import { QuestionListComponent } from './question-list/question-list.component';
import { UserComponent } from './user/user.component';
import { UserListComponent } from './user-list/user-list.component';
import { EvaluationListComponent } from './evaluation-list/evaluation-list.component';
//import { AuthGuard } from './services/auth-guard.service';

@NgModule({
  declarations: [
    AppComponent,
    LoginComponent,
    FooterComponent,
    HeaderComponent,
    SidebarComponent,
    GenerateEvaluationComponent,
    DashboardComponent,
    DepartmentComponent,
    DepartmentListComponent,
    JobTitleComponent,
    JobTitleListComponent,
    EvaluationTypeComponent,
    EvaluationTypeListComponent,
    QuestionComponent,
    QuestionListComponent,
    UserComponent,
    UserListComponent,
    EvaluationListComponent,
    SelectModule

  ],
  imports: [
    BrowserModule,
    HttpModule,
    FormsModule,
    HttpClientModule,

    RouterModule.forRoot([
      

      { path: 'login', component: LoginComponent, canActivate: [AuthGuard] },
      { path: 'dashboard', component: DashboardComponent, canActivate: [AuthGuard] },

      { path: 'evaluation/create', component: GenerateEvaluationComponent, canActivate: [AuthGuard] },
      { path: 'evaluation/edit/:id', component: GenerateEvaluationComponent, canActivate: [AuthGuard] },
      { path: 'evaluation/list', component: EvaluationListComponent, canActivate: [AuthGuard] },

      { path: 'department/add', component: DepartmentComponent, canActivate: [AuthGuard] },
      { path: 'department/edit/:id', component: DepartmentComponent, canActivate: [AuthGuard] },
      { path: 'department/list', component: DepartmentListComponent, canActivate: [AuthGuard] },

      { path: 'job-title/add', component: JobTitleComponent, canActivate: [AuthGuard] },
      { path: 'job-title/edit/:id', component: JobTitleComponent, canActivate: [AuthGuard] },
      { path: 'job-title/list', component: JobTitleListComponent, canActivate: [AuthGuard] },

      { path: 'evaluation-type/add', component: EvaluationTypeComponent, canActivate: [AuthGuard] },
      { path: 'evaluation-type/edit/:id', component: EvaluationTypeComponent, canActivate: [AuthGuard] },
      { path: 'evaluation-type/list', component: EvaluationTypeListComponent, canActivate: [AuthGuard] },

      { path: 'question/add', component: QuestionComponent, canActivate: [AuthGuard] },
      { path: 'question/edit/:id', component: QuestionComponent, canActivate: [AuthGuard] },
      { path: 'question/list', component: QuestionListComponent, canActivate: [AuthGuard] },

      { path: 'employee/add', component: UserComponent, canActivate: [AuthGuard] },
      { path: 'employee/edit/:id', component: UserComponent, canActivate: [AuthGuard] },
      { path: 'employee/list', component: UserListComponent, canActivate: [AuthGuard] },

      { path: '', redirectTo: 'login', pathMatch: 'full' },
      { path: '**', redirectTo: 'login' }

    ])
  ],
  providers: [Globals, AuthGuard, AuthService, GenerateEvaluationService],
  bootstrap: [AppComponent]
})
export class AppModule { }
