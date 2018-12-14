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
  constructor(private http: Http, public globals: Globals, private router: Router, private route: ActivatedRoute,
    private PerformanceReviewService: PerformanceReviewService) { }

  ngOnInit() {
    var item = { 'OptionValue': '' };
		this.ans = [];
    this.ans.push(item);
    this.globals.isLoading = true;
    // setTimeout(function () {
    //   if ($(".bg_white_block").hasClass("ps--active-y")) {
    //     $('footer').removeClass('footer_fixed');
    //   }
    //   else {
    //     $('footer').addClass('footer_fixed');
    //   }
    // }, 1000);
    setTimeout(function () {
      $('#carousel').flexslider({
        animation: "slide",
        controlNav: false,
        animationLoop: false,
        slideshow: false,
        itemWidth: 250,
        itemMargin: 5,
        asNavFor: '#slider'
      });

      $('#slider').flexslider({
        animation: "slide",
        controlNav: false,
        animationLoop: false,
        slideshow: false,
        sync: "#carousel",
        start: function (slider) {
          $('body').removeClass('loading');
        }
      });

    }, 1000);
    //this.globals.isLoading = true;
    let id = this.route.snapshot.paramMap.get('id');
    if (id) {
    this.PerformanceReviewService.getAllQuestionData(id)
      .then((data) => {
        this.QuestionList=data;
        this.globals.isLoading = false;
      },
      (error) => {
        // this.globals.isLoading = false;
        this.router.navigate(['/pagenotfound']);
      });
    }
  }

}
