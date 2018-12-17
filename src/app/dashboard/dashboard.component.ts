import { Component, OnInit } from '@angular/core';
import { Http } from '@angular/http';
import { Globals } from '.././globals';
import { Router } from '@angular/router';
import { ActivatedRoute } from '@angular/router';
import { DashboardService } from '../services/dashboard.service';
declare var $, swal: any;
declare function myInput(): any;
declare var $, Bloodhound: any;

@Component({
  selector: 'app-dashboard',
  templateUrl: './dashboard.component.html',
  styleUrls: ['./dashboard.component.css']
})
export class DashboardComponent implements OnInit {
  evaluationList;
  constructor(private http: Http, public globals: Globals, private router: Router, private route: ActivatedRoute,
    private DashboardService: DashboardService) { }

  ngOnInit() {
    this.globals.isLoading = true;
    this.globals.isLoading = false;
    setTimeout(function () {
      if ($(".bg_white_block").hasClass("ps--active-y")) {
        $('footer').removeClass('footer_fixed');
      }
      else {
        $('footer').addClass('footer_fixed');
      }
    }, 1000);
    this.globals.isLoading = true;
    this.DashboardService.getEvaluationsById(this.globals.authData.UserId)
      .then((data) => {
        this.evaluationList = data;
        this.globals.isLoading = false;
      },
        (error) => {
          this.globals.isLoading = false;
          this.router.navigate(['/pagenotfound']);
        });
  }
  startEvaluation(Id) {
    debugger
    this.globals.isLoading = true;
    this.DashboardService.insertQuestions(Id)
      .then((data) => {
        this.globals.isLoading = false;
        this.router.navigate(['/performance-review/' + Id]);
      },
        (error) => {
          this.globals.isLoading = false;
          this.router.navigate(['/pagenotfound']);
        });

  }
  reviewById(EmployeeEvaluatorId){
    debugger
    this.DashboardService.reviewById(EmployeeEvaluatorId)
      .then((data) => {
        this.router.navigate(['/performance-review/'+EmployeeEvaluatorId]);
      },
      (error) => {
        // this.globals.isLoading = false;
        this.router.navigate(['/pagenotfound']);
      });
  }
}
