import { Component, OnInit } from '@angular/core';
import { Http } from '@angular/http';
import { Globals } from '.././globals';
import { Router } from '@angular/router';
import { ActivatedRoute } from '@angular/router';
import { EmployeeService } from '../services/employee.service';
declare var $, swal: any;
declare function myInput(): any;
declare var $, Bloodhound: any;

@Component({
  selector: 'app-employee-list',
  templateUrl: './employee-list.component.html',
  styleUrls: ['./employee-list.component.css']
})
export class EmployeeListComponent implements OnInit {
  employeeList;
  msgflag;
  deleteEntity;

  constructor(private http: Http, public globals: Globals, private router: Router, private route: ActivatedRoute,
    private EmployeeService: EmployeeService) { }

  ngOnInit() {
    debugger
    this.globals.isLoading = false;

    setTimeout(function () {
      if ($(".bg_white_block").hasClass("ps--active-y")) {
        $('footer').removeClass('footer_fixed');
      }
      else {
        $('footer').addClass('footer_fixed');
      }
      $("#collapseExample1").addClass("in");
      $("#test_employee").removeClass("collapsed");
      $("#test_employee").attr("aria-expanded", "true");
    }, 100);
    this.globals.isLoading = true;
    this.EmployeeService.getAllEmployee()
      .then((data) => {
        debugger
        setTimeout(function () {
          var table = $('#dataTables-example').DataTable({
            // scrollY: '55vh',
            responsive: {
              details: {
                display: $.fn.dataTable.Responsive.display.childRowImmediate,
                type: ''
              }
            },
            scrollCollapse: true,
            "oLanguage": {
              "sLengthMenu": "_MENU_ Employees per Page",
              "sInfo": "Showing _START_ to _END_ of _TOTAL_ Employees",
              "sInfoFiltered": "(filtered from _MAX_ total Employees)",
              "sInfoEmpty": "Showing 0 to 0 of 0 Employees"
            },
            dom: 'lBfrtip',
            buttons: [{
              extend: 'excel',
              title: 'Employee List',
              exportOptions: {
                columns: [0, 1, 2, 3, 4]
              }
            },
            {
              extend: 'print',
              title: 'Employee List',
              exportOptions: {
                columns: [0, 1, 2, 3, 4]
              }
            },
            ]
          });
          $('.buttons-excel').attr('data-original-title', 'Export as Excel').tooltip();
          $('.buttons-print').attr('data-original-title', 'Print').tooltip();
        }, 100);

        this.employeeList = data;
        this.globals.isLoading = false;
      },
        (error) => {
          this.globals.isLoading = false;
          this.router.navigate(['/pagenotfound']);
        });
    this.msgflag = false;
  }
  isActiveChange(changeEntity, i) {
    if (this.employeeList[i].IsActive == 1) {
      this.employeeList[i].IsActive = 0;
      changeEntity.IsActive = 0;
    } else {
      this.employeeList[i].IsActive = 1;
      changeEntity.IsActive = 1;
    }
    this.globals.isLoading = true;
    changeEntity.UpdatedBy = this.globals.authData.UserId;

    this.EmployeeService.isActiveChange(changeEntity)
      .then((data) => {
        this.globals.isLoading = false;
        swal({
          position: 'top-end',
          type: 'success',
          title: 'Employee updated Successfully!',
          showConfirmButton: false,
          timer: 1500
        })

      },
        (error) => {
          this.globals.isLoading = false;
          this.router.navigate(['/pagenotfound']);
        });
  }
  deleteEmployee(employee) {
    this.deleteEntity = employee;
    swal({
      title: 'Are you sure?',
      text: "You want to delete this Employee?",
      type: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
      confirmButtonText: 'Yes, delete it!'
    })
      .then((result) => {
        if (result.value) {
          var del = { 'Userid': this.globals.authData.UserId, 'id': employee.UserId, 'FirstName': employee.FirstName, 'LastName': employee.LastName };
          this.globals.isLoading = true;
          this.EmployeeService.deleteEmployee(del)
            .then((data) => {
              let index = this.employeeList.indexOf(employee);
              $('#Delete_Modal').modal('hide');
              if (index != -1) {
                this.employeeList.splice(index, 1);
              }
              this.globals.isLoading = false;
              swal({
                position: 'top-end',
                type: 'success',
                title: 'Employee deleted successfully!',
                showConfirmButton: false,
                timer: 1500
              })
            },
              (error) => {
                this.globals.isLoading = false;
                $('#Delete_Modal').modal('hide');
                if (error.text) {
                  swal({
                    position: 'top-end',
                    type: 'success',
                    title: "You can't delete this record because of their dependency!",
                    showConfirmButton: false,
                    timer: 1500
                  })
                }
              });
        }
      })
  }
}
