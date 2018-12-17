import { Component, OnInit } from '@angular/core';
import { Http } from '@angular/http';
import { Globals } from '.././globals';
import { Router } from '@angular/router';
import { ActivatedRoute } from '@angular/router';
import { QuestionService } from '../services/question.service';
declare var $, swal: any;

@Component({
  selector: 'app-question',
  templateUrl: './question.component.html',
  styleUrls: ['./question.component.css']
})
export class QuestionComponent implements OnInit {

  questionEntity;
  submitted;
  btn_disable;
  questiontypeList;
  evaluationtypeList;
  header;
  OptionList;

  constructor(private http: Http, public globals: Globals, private router: Router, private route: ActivatedRoute, private QuestionService: QuestionService) { }

  ngOnInit() {
    
    this.globals.isLoading = false;
    setTimeout(function () {
      if ($("body").height() < $(window).height()) {
        $('footer').addClass('footer_fixed');
      }
      else {
        $('footer').removeClass('footer_fixed');
      }
      $("#collapseExample3").addClass("in");
      $("#test_question").removeClass("collapsed");
      $("#test_question").attr("aria-expanded","true");
    }, 100);

    const body = document.querySelector('body');
    var count = $(window).height() - 270;
    body.style.setProperty('--screen-height', count + "px");

    this.globals.isLoading = true;
    this.QuestionService.getAllQuestionType()
      .then((data) => {
        this.questiontypeList = data;
      },
        (error) => {
          //alert('error');
        });
    this.QuestionService.getAllEvaluationType()
      .then((data) => {
        this.evaluationtypeList = data;
        this.globals.isLoading = false;
      },
        (error) => {
          //alert('error');
        });

    let id = this.route.snapshot.paramMap.get('id');
    if (id) {
      this.header = 'Edit';
      this.globals.isLoading = true;
      this.QuestionService.getById(id)
        .then((data) => {
          
          this.questionEntity = data['question'];
          this.OptionList = data['option'];

          if (data['IsActive'] == 0) {
            this.questionEntity.IsActive = 0;
          } else {
            this.questionEntity.IsActive = '1';
          }
          this.globals.isLoading = false;
        },
          (error) => {
            //alert('error');
            this.btn_disable = false;
            this.submitted = false;
            this.globals.isLoading = false;
            //	this.router.navigate(['/admin/pagenotfound']);
          });
    }
    else {
      this.header = 'Add';
      this.questionEntity = {};
      this.questionEntity.QuestionTypeId = '';
      this.questionEntity.EvaluationTypeId = '';
      this.questionEntity.IsActive = '1';
      this.questionEntity.QuestionId = '';
      var item = { 'QueOption': '' };
      this.OptionList = [];
      this.OptionList.push(item);
      this.globals.isLoading = false;
    }
  }
  AddOption(index) {
    var item = { 'QueOption': '', 'CreatedBy': 1, 'UpdatedBy': 1 };
    if (this.OptionList.length <= index + 1) {
      this.OptionList.splice(index + 1, 0, item);
    }
  }
  RemoveOption(item) {
    var index = this.OptionList.indexOf(item);
    this.OptionList.splice(index, 1);
  }
  addQuestion(questionForm) {
    debugger
    
    let id = this.route.snapshot.paramMap.get('id');

    if (id) {
      this.questionEntity.UpdatedBy = this.globals.authData.UserId;
      this.submitted = false;
    } else {
      this.questionEntity.CreatedBy = this.globals.authData.UserId;
      this.questionEntity.UpdatedBy = this.globals.authData.UserId;
      this.questionEntity.JobTitleId = 0;
      this.submitted = true;
    }

    if (questionForm.valid) {
      this.btn_disable = true;
      var question = { 'question': this.questionEntity, 'option': this.OptionList };
      this.globals.isLoading = true;
      this.QuestionService.addQuestion(question)
        .then((data) => {
          this.btn_disable = false;
          this.submitted = false;
          this.questionEntity = {};
          questionForm.form.markAsPristine();
          if (id) {
            this.globals.isLoading = false;
            swal({
              position: 'top-end',
              type: 'success',
              title: 'Question updated successfully!',
              showConfirmButton: false,
              timer: 1500
            })
          } else {
            this.globals.isLoading = false;
            swal({
              position: 'top-end',
              type: 'success',
              title: 'Question added successfully!',
              showConfirmButton: false,
              timer: 1500
            })
          }
          this.router.navigate(['/question/list']);
        },
          (error) => {
            alert('error');
            this.btn_disable = false;
            this.submitted = false;
            this.globals.isLoading = false;
            //	this.router.navigate(['/admin/pagenotfound']);
          });
    }
  }
}
