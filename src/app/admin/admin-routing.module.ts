import { BrowserModule } from '@angular/platform-browser';
import { Component,NgModule } from '@angular/core';
import { Routes,RouterModule } from '@angular/router';
import { FormsModule } from '@angular/forms';
import { HttpModule } from '@angular/http';
import { Globals } from './globals';
import { HttpClientModule } from '@angular/common/http';
import { CommonModule } from "@angular/common";
import { AdminComponent  } from './admin.component.module';

import { LoginComponent } from './login/login.component';
import { AuthService } from './services/auth.service';
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
import { ManagequestionService } from './services/managequestion.service';

import { RegisterComponent } from './register/register.component';
import { RegisterService } from './services/register.service';
import { RegisterlistComponent } from './registerlist/registerlist.component';

import { UserroleComponent } from './userrole/userrole.component';
import { UserrolelistComponent } from './userrolelist/userrolelist.component';
import { UserroleService } from './services/userrole.service';

import { ChangepassComponent } from './changepass/changepass.component';
import { ChangepassService } from './services/changepass.service';

import { DashboardComponent } from './dashboard/dashboard.component';


import { SidebarComponent } from './sidebar/sidebar.component';


const routes: Routes = [	
  {
    path: '',
        component: AdminComponent,
        children: [
      
          { path : '', component : LoginComponent, canActivate : [AuthGuard] },
          // { path : '', component : CandidateuserComponent , canActivate : [AuthGuard] },
  
          // { path : 'home', component : HomeComponent, canActivate : [AuthGuard]   },
  
          // { path : 'question', component : QuestionComponent, canActivate : [AuthGuard]   },
          
          { path : 'position', component : JobpositionComponent , canActivate : [AuthGuard]  },
          { path : 'position/list', component : JobpositionlistComponent, canActivate : [AuthGuard]  },
          { path : 'position/edit/:id', component : JobpositionComponent , canActivate : [AuthGuard]  },
  
          { path : 'candidateuser', component : CandidateuserComponent, canActivate : [AuthGuard]   },
          { path : 'candidate/list', component : CandidatelistComponent, canActivate : [AuthGuard]   },
          { path : 'candidateuser/edit/:id', component : CandidateuserComponent, canActivate : [AuthGuard]   },
          { path : 'candidateuser/edits/:id', component : CandidateuserComponent, canActivate : [AuthGuard]   },
  
          // { path : 'thankyou', component : ThankyouComponent, canActivate : [AuthGuard]   },
  
          { path : 'question/add', component : ManagequestionComponent, canActivate : [AuthGuard]   },
          { path : 'question/edit/:id', component : ManagequestionComponent, canActivate : [AuthGuard]   },
          { path : 'question/list', component : ManagequestionlistComponent, canActivate : [AuthGuard]   },
  
          { path : 'userrole/add', component : UserroleComponent, canActivate : [AuthGuard]   },	
          { path : 'userrole/list', component : UserrolelistComponent , canActivate : [AuthGuard]  },
          { path : 'userrole/edit/:id', component : UserroleComponent, canActivate : [AuthGuard]  },
  
          { path : 'register/add', component : RegisterComponent, canActivate : [AuthGuard] },
          { path : 'register/list', component : RegisterlistComponent, canActivate : [AuthGuard]  },
          { path : 'register/edit/:id', component : RegisterComponent, canActivate : [AuthGuard] },
  
          { path : 'login', component : LoginComponent, canActivate : [AuthGuard] },
  
          { path: 'changepass', component: ChangepassComponent, canActivate : [AuthGuard] },
		  
		  
		  { path: 'sidebar', component: SidebarComponent, canActivate : [AuthGuard] },
  
          // { path: 'dashboard', component: DashboardComponent, canActivate : [AuthGuard] }
          
		
        ]
  }
];

@NgModule({
imports: [RouterModule.forChild(routes)],
exports: [RouterModule],
 
providers: [Globals,AuthService,AuthGuard,QuestionService,JobpositionService,CandidateuserService,ManagequestionService,RegisterService,ChangepassService,
  UserroleService

],
  bootstrap: [AdminComponent]
})
export class AdminRoutingModule  { }
