import { Component, OnInit } from '@angular/core';
import { Http } from '@angular/http';
import { Globals } from '.././globals';
import { Router } from '@angular/router';
import { ActivatedRoute } from '@angular/router';
import { DepartmentService } from '../services/department.service';
declare var $, swal: any;

@Component({
  selector: 'app-department',
  templateUrl: './department.component.html',
  styleUrls: ['./department.component.css']
})
export class DepartmentComponent implements OnInit {

  departmentEntity;
  submitted;
  btn_disable;
  header;

  constructor(private http: Http, public globals: Globals, private router: Router, private route: ActivatedRoute, private DepartmentService: DepartmentService) { }

  ngOnInit() {
    debugger
    this.globals.isLoading = false;
    setTimeout(function () {
      if ($("body").height() < $(window).height()) {
        $('footer').addClass('footer_fixed');
      }
      else {
        $('footer').removeClass('footer_fixed');
      }
      $("#collapseExample5").addClass("in");
      $("#test_department").removeClass("collapsed");
      $("#test_department").attr("aria-expanded","true");
    }, 100);

    const body = document.querySelector('body');
    var count = $(window).height() - 270;
    body.style.setProperty('--screen-height', count + "px");

    let id = this.route.snapshot.paramMap.get('id');
    if (id) {
      this.header = 'Edit';
      this.globals.isLoading = true;
      this.DepartmentService.getById(id)
        .then((data) => {
          this.departmentEntity = data;
          if(data['IsActive']==0){
            this.departmentEntity.IsActive = 0;
          } else {
            this.departmentEntity.IsActive = '1';
          }
          this.globals.isLoading = false;
        },
          (error) => {
            this.globals.isLoading = false;
            //alert('error');
            this.btn_disable = false;
            this.submitted = false;

            //	this.router.navigate(['/admin/pagenotfound']);
          });
    }
    else {
      this.header = 'Add';
      this.departmentEntity = {};
      this.departmentEntity.DepartmentId = 0;
      this.departmentEntity.IsActive = '1';
    }
  }
  addDepartment(departmentForm) {
    debugger
    let id = this.route.snapshot.paramMap.get('id');

    if (id) {
      this.departmentEntity.UpdatedBy = this.globals.authData.UserId;
      this.submitted = false;
    } else {
      this.departmentEntity.CreatedBy = this.globals.authData.UserId;
      this.departmentEntity.UpdatedBy = this.globals.authData.UserId;
      this.departmentEntity.DepartmentId = 0;
      this.submitted = true;
    }

    if (departmentForm.valid) {
      this.btn_disable = true;
      this.globals.isLoading = true;
      this.DepartmentService.addDepartment(this.departmentEntity)
        .then((data) => {
          this.btn_disable = false;
          this.submitted = false;
          this.departmentEntity = {};
          departmentForm.form.markAsPristine();
          if (id) {
            swal({
              position: 'top-end',
              type: 'success',
              title: 'Position updated successfully!',
              showConfirmButton: false,
              timer: 1500
            })
          } else {
            swal({
              position: 'top-end',
              type: 'success',
              title: 'Position added successfully!',
              showConfirmButton: false,
              timer: 1500
            })
          }
          this.router.navigate(['/department/list']);
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
