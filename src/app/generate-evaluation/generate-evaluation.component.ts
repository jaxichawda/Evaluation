import { Component, OnInit } from '@angular/core';
import { Http } from '@angular/http';
import { Globals } from '.././globals';
import { Router } from '@angular/router';
import { ActivatedRoute } from '@angular/router';
import { GenerateEvaluationService } from '../services/generate-evaluation.service';
import { debug } from 'util';
import { IOption } from 'ng-select';
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
  userlist1;
  evaluationtypelist;
  reportingData;
  UserId;
  header;
  DateValid;
  showError;


  constructor(private http: Http, public globals: Globals, private router: Router, private route: ActivatedRoute,
    private GenerateEvaluationService: GenerateEvaluationService) { }
  selectedCharacters: Array<string> = [];
  ngOnInit() {
    debugger
    this.globals.isLoading = false;
    this.DateValid = false;
    this.showError = false;
    setTimeout(function () {
      if ($("body").height() < $(window).height()) {
        $('footer').addClass('footer_fixed');
      }
      else {
        $('footer').removeClass('footer_fixed');
      }
      $("#collapseExample2").addClass("in");
      $("#test_evaluation").removeClass("collapsed");
      $("#test_evaluation").attr("aria-expanded","true");
    }, 100);

    const body = document.querySelector('body');
    var count = $(window).height() - 270;
    body.style.setProperty('--screen-height', count + "px");

    let id = this.route.snapshot.paramMap.get('id');
    if (id) {
      this.header = 'ReGenerate';
      this.globals.isLoading = true;
      this.GenerateEvaluationService.getEvaluationById(id)
        .then((data) => {
          this.evaluationEntity = data;
          if (data['IsActive'] == 0) {
            this.evaluationEntity.IsActive = 0;
          } else {
            this.evaluationEntity.IsActive = '1';
          }
          //alert(data['self']);
          this.selectedCharacters = this.evaluationEntity.evalutor;
          // if(data['self']==0){
          //   this.evaluationEntity.Check=false;
          // }
          // else if(data['self']==1){
          //   this.evaluationEntity.Check=true;
          // }
          this.globals.isLoading = false;
        },
          (error) => {
            //alert('error');
            this.btn_disable = false;
            this.submitted = false;

            //	this.router.navigate(['/admin/pagenotfound']);
          });
    }
    else {
      this.header = 'Generate';
      this.evaluationEntity = {};
      this.evaluationEntity.EvaluationId = 0;
      this.evaluationEntity.IsActive = '1';
      this.globals.isLoading = false;
      //this.evaluationEntity.Check=true;
    }

    setTimeout(function () {
      $('.form_date').datetimepicker({
        startDate: new Date(),
        weekStart: 1,
        todayBtn: 1,
        autoclose: 1,
        todayHighlight: 1,
        startView: 2,
        //minView: 2
        format: 'mm/dd/yyyy hh:ii',
        showMeridian: true,
      });
    }, 500);
    this.default();
  }
  default() {
    this.globals.isLoading = true;
    this.GenerateEvaluationService.getData()
      .then((data) => {
        this.userlist = data['users'];
        this.userlist1 = data['users'];
        this.evaluationtypelist = data['evaluationtypes'];
        this.globals.isLoading = false;
      },
        (error) => {
          this.globals.isLoading = false;
          this.router.navigate(['/pagenotfound']);
        });
  }
  generateEvaluation(evaluationForm) {
    debugger
    this.evaluationEntity.EvaluationDate = $("#EvaluationDate").val();
    this.evaluationEntity.EvaluatorsId = this.selectedCharacters;
    if (this.evaluationEntity.EvaluationDate == "" || this.evaluationEntity.EvaluationDate == null || this.evaluationEntity.EvaluationDate == undefined) {
      this.DateValid = true;
    } else {
      this.DateValid = false;
    }
    if (this.evaluationEntity.EvaluationDescription == "" || this.evaluationEntity.EvaluationDescription == null || this.evaluationEntity.EvaluationDescription == undefined) {
      this.evaluationEntity.EvaluationDescription = null;
    } else {
      this.evaluationEntity.EvaluationDescription = this.evaluationEntity.EvaluationDescription;
    }
    if (this.evaluationEntity.EvaluatorsId.length == 0 || this.evaluationEntity.EvaluatorsId == "" || this.evaluationEntity.EvaluatorsId == null || this.evaluationEntity.EvaluatorsId == undefined) {
      this.showError = true;
    } else {
      this.showError = false;
    }

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
    //console.log(this.evaluationEntity);
    if (evaluationForm.valid && !this.DateValid && !this.showError) {
      this.btn_disable = true;
      this.globals.isLoading = true;
      this.GenerateEvaluationService.generateEvaluation(this.evaluationEntity)
        .then((data) => {
          this.submitted = false;
          this.btn_disable = true;
          this.evaluationEntity = {};
          evaluationForm.form.markAsPristine();

          if (id) {
            this.globals.isLoading = false;
            swal({
              position: 'top-end',
              type: 'success',
              title: 'Evaluation re-generated successfully!',
              showConfirmButton: false,
              timer: 1500
            })
          } else {
            this.globals.isLoading = false;
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
          (error) => {
            this.btn_disable = false;
            this.submitted = false;
            this.globals.isLoading = false;
          });

    }
  }
  onChange(args, userId) {
    this.UserId = args.target.value;
    this.globals.isLoading = true;
    this.GenerateEvaluationService.getReportingEmployee(this.UserId)
      .then((data) => {
        this.reportingData = data;
        this.selectedCharacters = [this.reportingData.UserId, this.UserId];
        //this.selectedCharacters['1'] = [this.UserId];
        //console.log(this.selectedCharacters);
        this.globals.isLoading = false;
        
      },
        (error) => {
          this.globals.isLoading = false;
          this.router.navigate(['/pagenotfound']);
        });
  }

}
