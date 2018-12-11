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
  reportingData;
  UserId;

  constructor(private http: Http, public globals: Globals, private router: Router, private route: ActivatedRoute,
    private GenerateEvaluationService: GenerateEvaluationService) { }
    selectedCharacters:Array<string> = [];
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
    this.evaluationEntity.Check=true;
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
  generateEvaluation(evaluationForm){ debugger
   //alert(this.selectedCharacters);
    this.submitted = true;
    this.evaluationEntity.EvaluationDate = $("#EvaluationDate").val();	
    this.evaluationEntity.CreatedBy = this.globals.authData.UserId;
    this.evaluationEntity.UpdatedBy = this.globals.authData.UserId;
    //this.evaluationEntity.UserId = this.globals.authData.UserId;
    this.evaluationEntity.EvaluatorsId = this.selectedCharacters;
    console.log(this.evaluationEntity);
    if(evaluationForm.valid){
      this.btn_disable = true;
      this.GenerateEvaluationService.generateEvaluation(this.evaluationEntity)
      .then((data) => 
			{
        this.submitted = false;
        this.btn_disable = true;
        this.evaluationEntity = {};
        evaluationForm.form.markAsPristine();
        swal({
          position: 'top-end',
          type: 'success',
          title: 'Announcement generated successfully',
          showConfirmButton: false,
          timer: 1500
        })
        this.router.navigate(['/evaluation/create']);
			}, 
			(error) => 
			{
				this.btn_disable = false;
				this.submitted = false;
				this.globals.isLoading = false;
				this.router.navigate(['/pagenotfound']);
			});
      
    }
  }
  onChange(args) {
    this.UserId = args.target.value; 
    //alert(this.UserId);
    this.GenerateEvaluationService.getReportingEmployee(this.UserId)
      .then((data) => 
      { 
        this.reportingData = data;
        //alert(this.selectedCharacters.length);
        // if(this.selectedCharacters.length==0){
        //   this.selectedCharacters = [this.reportingData.UserId];
        // } else {
        //   this.selectedCharacters.push(this.reportingData.UserId);
        // }
        this.selectedCharacters = [this.reportingData.UserId];
        console.log(this.selectedCharacters);
      }, 
      (error) => 
      {
        this.globals.isLoading = false;
        this.router.navigate(['/pagenotfound']);
      });
  }
//   onSelected1(option: IOption) { 
//     alert(this.selectedCharacters);
// 		if(this.selectedCharacters.length>0){
// 			this.selectedCharacters.push(`${option.value}`);
// 		} else {
// 			this.selectedCharacters = [];
// 			this.selectedCharacters.push(`${option.value}`);
// 		}
// }
// changeSourceUser(option: IOption){ 
//   alert(this.selectedCharacters);
// 	this.selectedCharacters.splice(this.selectedCharacters.indexOf(option.value),1);
// }
}
