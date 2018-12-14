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
    setTimeout(function () {
      if ($(".bg_white_block").hasClass("ps--active-y")) {
        $('footer').removeClass('footer_fixed');
      }
      else {
        $('footer').addClass('footer_fixed');
      }
    }, 1000);
    this.DashboardService.getEvaluationsById(this.globals.authData.UserId)
      .then((data) => {
        this.evaluationList = data;
      },
      (error) => {
        // this.globals.isLoading = false;
        this.router.navigate(['/pagenotfound']);
      });
  }
  startEvaluation(){
    this.router.navigate(['/performance-review']);
  }
}
