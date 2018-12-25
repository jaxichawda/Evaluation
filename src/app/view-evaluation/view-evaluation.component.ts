import { Component, OnInit } from '@angular/core';
import { Http } from '@angular/http';
import { Globals } from '.././globals';
import { Router } from '@angular/router';
import { ActivatedRoute } from '@angular/router';
import { PerformanceReviewService } from '../services/performance-review.service';
declare var $, swal: any;
declare function myInput(): any;
declare var $, Bloodhound: any;

@Component({
  selector: 'app-view-evaluation',
  templateUrl: './view-evaluation.component.html',
  styleUrls: ['./view-evaluation.component.css']
})
export class ViewEvaluationComponent implements OnInit {

  QuestionList;
  Status;
  disabled;
  Name;
  UserId;
  //PerformanceData;
  constructor(private http: Http, public globals: Globals, private router: Router, private route: ActivatedRoute,
    private PerformanceReviewService: PerformanceReviewService) { }

  ngOnInit() {
    this.QuestionList = [];
    this.disabled = true;

    $('.right_content_block').addClass('performance_block');

    // setTimeout(function () {
    //   if ($(".bg_white_block").hasClass("ps--active-y")) {
    //     $('footer').removeClass('footer_fixed');
    //   }
    //   else {
    //     $('footer').addClass('footer_fixed');
    //   }
    // }, 1000);
    this.globals.isLoading = true;
    let id = this.route.snapshot.paramMap.get('id');
    var obj = { 'Id': id, 'UserId': this.globals.authData.UserId };
    if (id) {
      this.PerformanceReviewService.getAllQuestionData(obj)
        .then((data) => {
          debugger
          this.QuestionList = data['QuestionData'];
          this.Status = data['EvaluationStatus']['StatusId'];
          this.Name = data['EvaluationStatus']['Name'];
          this.UserId = data['EvaluationStatus']['UserId'];
          this.globals.isLoading = false;
        },
          (error) => {
            // this.globals.isLoading = false;
            this.router.navigate(['/pagenotfound']);
          });
    }
  }

}
