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
  addprogess;
  TotalQuestion;
  percent;
  submit_true;
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


    var progress = document.getElementById("progress");
    $(progress).css("width", "0%");
    let id = this.route.snapshot.paramMap.get('id');
    var obj = { 'Id': id, 'UserId': this.globals.authData.UserId };
    if (id) {
      this.PerformanceReviewService.getAllQuestionData(obj)
        .then((data) => {
          debugger
          setTimeout(function () {
            "use strict";
            $('#carousel').flexslider({
              animation: "slide",
              controlNav: false,
              animationLoop: false,
              slideshow: false,
              itemWidth: 120,
              minItems: 1,
              maxItems: 7,
              itemMargin: 5,
              asNavFor: '#slider'
            });

            $('#slider').flexslider({
              animation: "slide",
              controlNav: false,
              animationLoop: false,
              slideshow: false,
              smoothHeight: true,
              sync: "#carousel"
            });
          }, 100);

          this.QuestionList = data['Questions']['QuestionData'];
          console.log(this.QuestionList);
          this.Status = data['EvaluationStatus']['StatusId'];
          this.Name = data['EvaluationStatus']['Name'];
          this.UserId = data['EvaluationStatus']['UserId'];
          this.TotalQuestion = data['Questions']['TotalQuestion'];
          this.addprogess = 100 / this.TotalQuestion;

          for (let obj of this.QuestionList) {
            let j = this.QuestionList.indexOf(obj);
            for (let child of obj.row) {
              let i = this.QuestionList[j].row.indexOf(child);
              if (child.AnswerText != null) {
                setTimeout(function () {
                  $('#question' + ((4 * j) + i + 1) + '_dots').removeClass('fa-circle-o');
                  $('#question' + ((4 * j) + i + 1) + '_dots').addClass('fa-dot-circle-o');
                }, 100);
              }
            }
          }
          this.checkprogress();

          this.globals.isLoading = false;
          if (this.QuestionList == 'error') {
            this.router.navigate(['/dashboard']);
          }
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
    var totalQues = 0;
    for (var i = 0; i < this.QuestionList.length; i++) {
      for (var j = 0; j < this.QuestionList[i].row.length; j++) {
        totalQues++;
        if ((this.QuestionList[i].row[j].AnswerText == '') || (this.QuestionList[i].row[j].AnswerText == null) || (this.QuestionList[i].row[j].AnswerText == undefined)) {
        }
        else {
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

  selectRadio(no, que, i, j) {
    if (que.AnswerText != '') {
      $('#question' + no + '_dots').removeClass('fa-circle-o');
      $('#question' + no + '_dots').addClass('fa-dot-circle-o');
    } else {
      $('#question' + no + '_dots').removeClass('fa-dot-circle-o');
      $('#question' + no + '_dots').addClass('fa-circle-o');
    }
    this.checkprogress();
  }

  checkprogress() {
    let k = 0;
    for (let i = 1; i <= this.TotalQuestion; i++) {
      setTimeout(() => {
        let q = ($('#question' + i + '_dots').hasClass('fa-dot-circle-o'));
        if (q) {
          k++;
        }
        let addpro = (100 * k) / this.TotalQuestion;
        this.percent = Math.round(addpro);
        var progress = document.getElementById("progress");
        $(progress).css("width", addpro + "%");
        if (k == this.TotalQuestion) {
          this.submit_true = false;
        } else {
          this.submit_true = true;
        }
      }, 100);
    }
  }
}
