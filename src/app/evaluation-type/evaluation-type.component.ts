import { Component, OnInit } from '@angular/core';
import { Http } from '@angular/http';
import { Globals } from '.././globals';
import { Router } from '@angular/router';
import { ActivatedRoute } from '@angular/router';
import { EvaluationTypeService } from '../services/evaluation-type.service';
declare var $, swal: any;

@Component({
  selector: 'app-evaluation-type',
  templateUrl: './evaluation-type.component.html',
  styleUrls: ['./evaluation-type.component.css']
})
export class EvaluationTypeComponent implements OnInit {

  evaluationtypeEntity;
  submitted;
  btn_disable;
  header;

  constructor(private http: Http, public globals: Globals, private router: Router, private route: ActivatedRoute, private EvaluationTypeService: EvaluationTypeService) { }

  ngOnInit() {
    
    this.globals.isLoading = false;
    setTimeout(function () {
      if ($("body").height() < $(window).height()) {
        $('footer').addClass('footer_fixed');
      }
      else {
        $('footer').removeClass('footer_fixed');
      }
      $("#collapseExample4").addClass("in");
      $("#test_evaluation_type").removeClass("collapsed");
      $("#test_evaluation_type").attr("aria-expanded","true");
    }, 100);

    const body = document.querySelector('body');
    var count = $(window).height() - 270;
    body.style.setProperty('--screen-height', count + "px");

    let id = this.route.snapshot.paramMap.get('id');
    if (id) {
      this.header = 'Edit';
      this.globals.isLoading = true;
      this.EvaluationTypeService.getById(id)
        .then((data) => {
          this.evaluationtypeEntity = data;
          if(data['IsActive']==0){
            this.evaluationtypeEntity.IsActive = 0;
          } else {
            this.evaluationtypeEntity.IsActive = '1';
          }
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
      this.header = 'Add';
      this.evaluationtypeEntity = {};
      this.evaluationtypeEntity.EvaluationTypeId = 0;
      this.evaluationtypeEntity.IsActive = '1';
    }
  }
  addEvaluationType(evaluationtypeForm) {
    debugger
    let id = this.route.snapshot.paramMap.get('id');

    if (id) {
      this.evaluationtypeEntity.UpdatedBy = this.globals.authData.UserId;
      this.submitted = false;
    } else {
      this.evaluationtypeEntity.CreatedBy = this.globals.authData.UserId;
      this.evaluationtypeEntity.UpdatedBy = this.globals.authData.UserId;
      this.evaluationtypeEntity.EvaluationTypeId = 0;
      this.submitted = true;
    }

    if (evaluationtypeForm.valid) {
      this.btn_disable = true;
      this.globals.isLoading = true;
      this.EvaluationTypeService.addEvaluationType(this.evaluationtypeEntity)
        .then((data) => {
          this.btn_disable = false;
          this.submitted = false;
          this.evaluationtypeEntity = {};
          evaluationtypeForm.form.markAsPristine();
          if (id) {
            this.globals.isLoading = false;
            swal({
              position: 'top-end',
              type: 'success',
              title: 'Evaluation Type updated successfully!',
              showConfirmButton: false,
              timer: 1500
            })
          } else {
            this.globals.isLoading = false;
            swal({
              position: 'top-end',
              type: 'success',
              title: 'Evaluation Type added successfully!',
              showConfirmButton: false,
              timer: 1500
            })
          }
          this.router.navigate(['/evaluation-type/list']);
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
