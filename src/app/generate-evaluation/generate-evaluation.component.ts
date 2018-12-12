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
  header;

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

    let id = this.route.snapshot.paramMap.get('id');
    if (id) {
      this.header = 'Edit';
      this.GenerateEvaluationService.getEvaluationById(id)
        .then((data) => {
          this.evaluationEntity = data;
          //alert(data['self']);
          this.selectedCharacters = this.evaluationEntity.evalutor;
          if(data['self']==0){
            this.evaluationEntity.Check=false;
          }
          else if(data['self']==1){
            this.evaluationEntity.Check=true;
          }

        },
          (error) => {
            //alert('error');
            this.btn_disable = false;
            this.submitted = false;

            //	this.router.navigate(['/admin/pagenotfound']);
          });
    }
    else {
      this.header = 'Add';
      this.evaluationEntity = {};
      this.evaluationEntity.EvaluationId = 0;
      this.evaluationEntity.Check=true;
    }
    
    setTimeout(function(){
			$('.form_date').datetimepicker({
				startDate : new Date(),
				weekStart: 1,
				todayBtn:  1,
				autoclose: 1,
				todayHighlight: 1,
				startView: 2,
        //minView: 2
        format: 'mm-dd-yyyy hh:ii',
		    showMeridian: true,
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
    let id = this.route.snapshot.paramMap.get('id');

    if (id) {
      this.evaluationEntity.UpdatedBy = this.globals.authData.UserId;
      this.submitted = false;
    } else {
      this.evaluationEntity.CreatedBy = this.globals.authData.UserId;
      this.evaluationEntity.UpdatedBy = this.globals.authData.UserId;
      this.evaluationEntity.EvaluationId = 0;
      this.submitted = true;
    }
   
    this.evaluationEntity.EvaluationDate = $("#EvaluationDate").val();	
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
        if (id) {
          swal({
            position: 'top-end',
            type: 'success',
            title: 'Evaluation re-generated successfully!',
            showConfirmButton: false,
            timer: 1500
          })
        } else {
          swal({
            position: 'top-end',
            type: 'success',
            title: 'Evaluation generated successfully!',
            showConfirmButton: false,
            timer: 1500
          })
        }
        this.router.navigate(['/evaluation/list']);
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
  onChange(args,userId) {
    this.UserId = args.target.value; 
    //this.userlist.splice(this.userlist.indexOf(userId),1);
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
     // console.log(this.userlist);
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
