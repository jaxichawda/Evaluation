import { Component, OnInit } from '@angular/core';
import { Http } from '@angular/http';
import { Globals } from '.././globals';
import { Router } from '@angular/router';
import { ActivatedRoute } from '@angular/router';
import { JobTitleService } from '../services/job-title.service';
declare var $, swal: any;

@Component({
  selector: 'app-job-title',
  templateUrl: './job-title.component.html',
  styleUrls: ['./job-title.component.css']
})
export class JobTitleComponent implements OnInit {

  jobtitleEntity;
  submitted;
  btn_disable;
  departmentList;
  header;

  constructor(private http: Http, public globals: Globals, private router: Router, private route: ActivatedRoute, private JobTitleService: JobTitleService) { }

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
      $("#collapseExample6").addClass("in");
      $("#test_job_title").removeClass("collapsed");
      $("#test_job_title").attr("aria-expanded","true");
    }, 100);

    const body = document.querySelector('body');
    var count = $(window).height() - 270;
    body.style.setProperty('--screen-height', count + "px");

    this.globals.isLoading = true;
    this.JobTitleService.getAllDepartment()
      .then((data) => {
        this.departmentList = data;
        this.globals.isLoading = false;
      },
        (error) => {
          //alert('error');
        });

    let id = this.route.snapshot.paramMap.get('id');
    if (id) {
      this.header = 'Edit';
      this.globals.isLoading = true;
      this.JobTitleService.getById(id)
        .then((data) => {
          this.jobtitleEntity = data;
          if (data['IsActive'] == 0) {
            this.jobtitleEntity.IsActive = 0;
          } else {
            this.jobtitleEntity.IsActive = '1';
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
      this.jobtitleEntity = {};
      this.jobtitleEntity.JobTitleId = 0;
      this.jobtitleEntity.IsActive = '1';
      this.jobtitleEntity.DepartmentId='';
    }
  }
  addJobTitle(jobtitleForm) {
    debugger
    let id = this.route.snapshot.paramMap.get('id');

    if (id) {
      this.jobtitleEntity.UpdatedBy = this.globals.authData.UserId;
      this.submitted = false;
    } else {
      this.jobtitleEntity.CreatedBy = this.globals.authData.UserId;
      this.jobtitleEntity.UpdatedBy = this.globals.authData.UserId;
      this.jobtitleEntity.JobTitleId = 0;
      this.submitted = true;
    }

    if (jobtitleForm.valid) {
      this.btn_disable = true;
      this.globals.isLoading = true;
      this.JobTitleService.addJobTitle(this.jobtitleEntity)
        .then((data) => {
          this.btn_disable = false;
          this.submitted = false;
          this.jobtitleEntity = {};
          jobtitleForm.form.markAsPristine();
          if (id) {
            this.globals.isLoading = false;
            swal({
              position: 'top-end',
              type: 'success',
              title: 'Job Title updated successfully!',
              showConfirmButton: false,
              timer: 1500
            })
          } else {
            this.globals.isLoading = false;
            swal({
              position: 'top-end',
              type: 'success',
              title: 'Job Title added successfully!',
              showConfirmButton: false,
              timer: 1500
            })
          }
          this.router.navigate(['/job-title/list']);
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
