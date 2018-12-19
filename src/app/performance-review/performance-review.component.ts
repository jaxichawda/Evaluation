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
  selector: 'app-performance-review',
  templateUrl: './performance-review.component.html',
  styleUrls: ['./performance-review.component.css']
})
export class PerformanceReviewComponent implements OnInit {
  QuestionList;
  ans;
  Status;
  disabled;
  Name;
  UserId;
  //PerformanceData;
  constructor(private http: Http, public globals: Globals, private router: Router, private route: ActivatedRoute,
    private PerformanceReviewService: PerformanceReviewService) { }

  ngOnInit() {
    var item = { 'OptionValue': '' };
    this.QuestionList = [];
    this.ans = [];
    this.ans.push(item);
    this.disabled = true;
    this.globals.isLoading = true;


	$('.right_content_block').addClass('performance_block');

    // setTimeout(function () {
    //   if ($(".bg_white_block").hasClass("ps--active-y")) {
    //     $('footer').removeClass('footer_fixed');
    //   }
    //   else {
    //     $('footer').addClass('footer_fixed');
    //   }
    // }, 1000);
    setTimeout(function () {
      $('.owl-carousel-review').owlCarousel({
        loop:false,
        autoPlay: false,
        nav:true,
        dots: false,
		  autoHeight: true,
        margin: 15,
        stopOnHover : true,
        responsiveClass:true,
        responsive:{
            0:{
                items:1
            },
            300:{
                items:1
            },
            479:{
                items:1
            },
            600:{
                items:1
            },
            768:{
                items:1
            },
            979:{
                items:1
            },
            1024:{
                items:1
            },
            1199:{
                items:1
            },
		}
    })

    }, 1000);
    //this.globals.isLoading = true;
    let id = this.route.snapshot.paramMap.get('id');
    if (id) {
      this.PerformanceReviewService.getAllQuestionData(id)
        .then((data) => {
          debugger
          this.QuestionList = data['QuestionData'];
          this.Status = data['EvaluationStatus']['StatusId'];
          this.Name = data['EvaluationStatus']['Name'];
          this.UserId = data['EvaluationStatus']['UserId'];
          //console.log(this.Status);
          //console.log(this.QuestionList);
          // for (var i = 0; i < this.QuestionList.length; i++) {
          //   if (this.QuestionList[i].AnswerText != null) {
          //     this.QuestionList[i].child.checkActive = true;
          //   } else {
          //     this.QuestionList[i].child.checkActive = false;
          //   }
          // }
          this.globals.isLoading = false;
        },
          (error) => {
            // this.globals.isLoading = false;
            this.router.navigate(['/pagenotfound']);
          });
    }
  }
  addData(evaluationForm) {
    debugger
    var count = 0;
    var totalQues=0;
    for (var i = 0; i < this.QuestionList.length; i++) {
      for (var j = 0; j < this.QuestionList[i].row.length; j++) {
       totalQues++;
        if (this.QuestionList[i].row[j].AnswerText != '')
        {
          count++;
        }
        //alert(count);
    }
  }
    //alert(count);
    // if(count==this.QuestionList.length){
    //   this.disabled=false;
    // }

    if (count == totalQues) {
      this.globals.isLoading = true;

      this.PerformanceReviewService.insertPerformance(this.QuestionList)
        .then((data) => {
          this.globals.isLoading = false;
          swal({
            position: 'top-end',
            type: 'success',
            title: 'Your Evaluation Submitted Successfully!',
            showConfirmButton: false,
            timer: 1500
          })
          this.router.navigate(['/dashboard']);
        },
          (error) => {
            //this.btn_disable = false;
            //this.submitted = false;
          });
    }
    else {
      swal({
        type: 'warning',
        title: 'Oops...',
        text: 'Please Attempt all the Questions!',
        showConfirmButton: true
      })
    }
  }
  saveAsDraft() {
    debugger
    this.globals.isLoading = true;
    //console.log(this.QuestionList);
    this.PerformanceReviewService.saveAsDraft(this.QuestionList)
      .then((data) => {
        this.globals.isLoading = false;
        swal({
          position: 'top-end',
          type: 'success',
          title: 'Your Evaluation Saved Successfully!',
          showConfirmButton: false,
          timer: 1500
        })
        // this.router.navigate(['/dashboard']);
      },
        (error) => {
          //this.btn_disable = false;
          //this.submitted = false;
        });
  }
  // checkTextbox(queId, totalAns, que) {
  //   debugger
  //   if (que.AnswerText != '')
  //     que.child.checkActive = true;
  //   else
  //     que.child.checkActive = false;
  // }
}
