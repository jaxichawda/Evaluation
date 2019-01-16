import { Component, OnInit } from '@angular/core';
import { Http } from '@angular/http';
import { Globals } from '.././globals';
import { Router } from '@angular/router';
import { ActivatedRoute } from '@angular/router';
import { EmployeeService } from '../services/employee.service';
declare var $, swal: any;

@Component({
  selector: 'app-employee',
  templateUrl: './employee.component.html',
  styleUrls: ['./employee.component.css']
})
export class EmployeeComponent implements OnInit {

  employeeEntity;
  submitted;
  btn_disable;
  jobtitleList;
  roleList;
  linemanagerList;
  header;

  constructor(private http: Http, public globals: Globals, private router: Router, private route: ActivatedRoute, private EmployeeService: EmployeeService) { }

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
          $("#collapseExample1").addClass("in");
          $("#test_employee").removeClass("collapsed");
      		$("#test_employee").attr("aria-expanded","true");
    }, 100);

    const body = document.querySelector('body');
    var count = $(window).height() - 270;
    body.style.setProperty('--screen-height', count + "px");

    this.globals.isLoading = true;
    this.EmployeeService.getAllJobTitle()
      .then((data) => {
        this.jobtitleList = data;
        console.log(this.jobtitleList);
      },
        (error) => {
          //alert('error');
        });

    this.EmployeeService.getAllRole()
      .then((data) => {
        this.roleList = data;
        console.log(this.roleList);
      },
        (error) => {
          //alert('error');
        });

    this.EmployeeService.getAllLineManager()
      .then((data) => {
        this.linemanagerList = data;
        console.log(this.linemanagerList);
        this.globals.isLoading = false;
      },
        (error) => {
          //alert('error');
        });

    let id = this.route.snapshot.paramMap.get('id');
    if (id) {
      this.header = 'Edit';
      this.globals.isLoading = true;
      this.EmployeeService.getById(id)
        .then((data) => {
          this.employeeEntity = data;
          console.log(this.employeeEntity);
          if (data['IsActive'] == 0) {
            this.employeeEntity.IsActive = 0;
          } else {
            this.employeeEntity.IsActive = '1';
          }
          this.globals.isLoading = false;
        },
          (error) => {
            //alert('error');
            this.btn_disable = false;
            this.submitted = false;
            this.globals.isLoading = false;
          });
    }
    else {
      this.header = 'Add';
      this.employeeEntity = {};
      this.employeeEntity.UserId = 0;
      this.employeeEntity.IsActive = '1';
      this.employeeEntity.RoleId = '';
      this.employeeEntity.JobId = '';
      this.employeeEntity.LineManagerId = '';
      this.globals.isLoading = false;
    }
  }

  addEmployee(employeeForm) {
    debugger
    let id = this.route.snapshot.paramMap.get('id');

    if (id) {
      this.employeeEntity.UpdatedBy = this.globals.authData.UserId;
      this.submitted = false;
    } else {
      this.employeeEntity.CreatedBy = this.globals.authData.UserId;
      this.employeeEntity.UpdatedBy = this.globals.authData.UserId;
      this.submitted = true;
    }

    if (employeeForm.valid) {
      this.btn_disable = true;
      this.globals.isLoading = true;
      this.EmployeeService.addEmployee(this.employeeEntity)
        .then((data) => {
          if (data == 'Exist User') {
            this.globals.isLoading = false;
            swal({
              type: 'warning',
              title: 'Oops...',
              text: 'You already added this Employee!',
            })
            this.btn_disable = false;
            this.submitted = false;
            this.router.navigate(['/employee/add']);
          } else {
            this.btn_disable = false;
            this.submitted = false;
            this.employeeEntity = {};
            employeeForm.form.markAsPristine();
            if (id) {
              this.globals.isLoading = false;
              swal({
                position: 'top-end',
                type: 'success',
                title: 'Employee updated successfully!',
                showConfirmButton: false,
                timer: 1500
              })
            } else {
              this.globals.isLoading = false;
              swal({
                position: 'top-end',
                type: 'success',
                title: 'Employee added successfully!',
                showConfirmButton: false,
                timer: 1500
              })
            }
            this.router.navigate(['/employee/list']);
          }
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
