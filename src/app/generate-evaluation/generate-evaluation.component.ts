import { Component, OnInit } from '@angular/core';
import { Http } from '@angular/http';
import { Globals } from '.././globals';
import { Router } from '@angular/router';
import { ActivatedRoute } from '@angular/router';
import { GenerateEvaluationService } from '../services/generate-evaluation.service';
import { debug } from 'util';
import {IOption} from 'ng-select';
declare var $, unescape: any;
declare function myInput(): any;
declare var $, swal: any;
declare var $, PerfectScrollbar: any;

@Component({
  selector: 'app-generate-evaluation',
  templateUrl: './generate-evaluation.component.html',
  styleUrls: ['./generate-evaluation.component.css']
})
export class GenerateEvaluationComponent implements OnInit {
  evaluationEntity;
  submitted;
  btn_disable;
  userlist;
  evaluationtypelist;

  constructor(private http: Http, public globals: Globals, private router: Router, private route: ActivatedRoute,
    private GenerateEvaluationService: GenerateEvaluationService) { }

  ngOnInit() {
    setTimeout(function () {
      if ($("body").height() < $(window).height()) {
        $('footer').addClass('footer_fixed');
      }
      else {
        $('footer').removeClass('footer_fixed');
      }
    }, 100);

    const body = document.querySelector('body');
    var count = $(window).height() - 270;
    body.style.setProperty('--screen-height', count + "px");
    
    this.evaluationEntity={};
    setTimeout(function(){
			$('.form_date').datetimepicker({
				startDate : new Date(),
				weekStart: 1,
				todayBtn:  1,
				autoclose: 1,
				todayHighlight: 1,
				startView: 2,
				minView: 2
			});
    },500);
    this.default();
  }
  default(){
    this.GenerateEvaluationService.getData()
			.then((data) => {
        this.userlist = data['users'];
        this.evaluationtypelist = data['evaluationtypes'];
				this.globals.isLoading = false;
			},
			(error) => {
       this.globals.isLoading = false;	
        this.router.navigate(['/pagenotfound']);
      });
  }
  generateEvaluation(evaluationForm){
    this.submitted = true;
    this.evaluationEntity.CreatedBy = this.globals.authData.UserId;
    this.evaluationEntity.UpdatedBy = this.globals.authData.UserId;
    this.evaluationEntity.UserId = this.globals.authData.UserId;
    if(evaluationForm.valid){
      this.submitted = false;
      this.btn_disable = true;
      this.evaluationEntity = {};
      evaluationForm.form.markAsPristine();
    }
    
  }
}
