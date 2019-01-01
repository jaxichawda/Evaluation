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
import { SelectModule } from 'ng-select';

import { GenerateEvaluationComponent } from './generate-evaluation/generate-evaluation.component';
import { GenerateEvaluationService } from './services/generate-evaluation.service';
import { EvaluationListComponent } from './evaluation-list/evaluation-list.component';

import { EvaluationReportComponent } from './evaluation-report/evaluation-report.component';
import { EvaluationReportService } from './services/evaluation-report.service';

import { AuthService } from './services/auth.service';
import { AuthGuard } from './services/auth-guard.service';

import { DashboardComponent } from './dashboard/dashboard.component';
import { DashboardService } from './services/dashboard.service';

import { DepartmentComponent } from './department/department.component';
import { DepartmentService } from './services/department.service';
import { DepartmentListComponent } from './department-list/department-list.component';

import { JobTitleComponent } from './job-title/job-title.component';
import { JobTitleService } from './services/job-title.service';
import { JobTitleListComponent } from './job-title-list/job-title-list.component';

import { EvaluationTypeComponent } from './evaluation-type/evaluation-type.component';
import { EvaluationTypeService } from './services/evaluation-type.service';
import { EvaluationTypeListComponent } from './evaluation-type-list/evaluation-type-list.component';

import { QuestionComponent } from './question/question.component';
import { QuestionService } from './services/question.service';
import { QuestionListComponent } from './question-list/question-list.component';

import { EmployeeComponent } from './employee/employee.component';
import { EmployeeService } from './services/employee.service';
import { EmployeeListComponent } from './employee-list/employee-list.component';

import { PerformanceReviewComponent } from './performance-review/performance-review.component';
import { PerformanceReviewService } from './services/performance-review.service';
import { ChangePasswordComponent } from './change-password/change-password.component';
import { ChangePasswordService } from './services/change-password.service';
import { ForgotPasswordComponent } from './forgot-password/forgot-password.component';
import { ResetPasswordComponent } from './reset-password/reset-password.component';
import { ForgotResetService } from './services/forgot-reset.service';
import { ViewEvaluationComponent } from './view-evaluation/view-evaluation.component';



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
    EvaluationListComponent,
    EmployeeComponent,
    EmployeeListComponent,
    PerformanceReviewComponent,
    ChangePasswordComponent,
    EvaluationReportComponent,
    ForgotPasswordComponent,
    ResetPasswordComponent,
    ViewEvaluationComponent

  ],
  imports: [
    BrowserModule,
    HttpModule,
    FormsModule,
    HttpClientModule,
    SelectModule,
    RouterModule.forRoot([


      { path: 'login', component: LoginComponent, canActivate: [AuthGuard] },
      { path: 'forgot-password', component: ForgotPasswordComponent, canActivate: [AuthGuard] },
      { path: 'dashboard', component: DashboardComponent, canActivate: [AuthGuard] },

      { path: 'evaluation/generate', component: GenerateEvaluationComponent, canActivate: [AuthGuard] },
      { path: 'evaluation/edit/:id', component: GenerateEvaluationComponent, canActivate: [AuthGuard] },
      { path: 'evaluation/list', component: EvaluationListComponent, canActivate: [AuthGuard] },
      { path: 'evaluation/report/:id', component: EvaluationReportComponent, canActivate: [AuthGuard] },
      { path: 'evaluation/view/:id', component: ViewEvaluationComponent, canActivate: [AuthGuard] },

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

      { path: 'employee/add', component: EmployeeComponent, canActivate: [AuthGuard] },
      { path: 'employee/edit/:id', component: EmployeeComponent, canActivate: [AuthGuard] },
      { path: 'employee/list', component: EmployeeListComponent, canActivate: [AuthGuard] },

      { path: 'performance-review/:id', component: PerformanceReviewComponent, canActivate: [AuthGuard] },
      { path: 'change-password', component: ChangePasswordComponent, canActivate: [AuthGuard] },
      { path: 'reset-password/:id', component: ResetPasswordComponent, canActivate: [AuthGuard] },

      { path: '', redirectTo: 'login', pathMatch: 'full' },
      { path: '**', redirectTo: 'login' }

    ])
  ],
  providers: [Globals, AuthGuard, AuthService, GenerateEvaluationService, DepartmentService, EvaluationTypeService, JobTitleService, QuestionService, EmployeeService, ChangePasswordService, DashboardService, PerformanceReviewService, ForgotResetService, EvaluationReportService],
  bootstrap: [AppComponent]
})
export class AppModule { }
