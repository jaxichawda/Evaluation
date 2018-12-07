import { Component, OnInit } from '@angular/core';
import { Http } from '@angular/http';
import { Globals } from '.././globals';
import { Router } from '@angular/router';
import { ActivatedRoute } from '@angular/router';
import { DepartmentService } from '../services/department.service';
declare var $, swal: any;
declare function myInput(): any;
declare var $, Bloodhound: any;

@Component({
  selector: 'app-department-list',
  templateUrl: './department-list.component.html',
  styleUrls: ['./department-list.component.css']
})
export class DepartmentListComponent implements OnInit {
  departmentList;
  msgflag;

  constructor(private http: Http, public globals: Globals, private router: Router, private route: ActivatedRoute,
    private DepartmentService: DepartmentService) { }

  ngOnInit() {
    debugger

    $('.buttons-excel').attr('data-original-title', 'Export to Excel').tooltip();
    $('.buttons-print').attr('data-original-title', 'Print').tooltip();

    setTimeout(function () {
      if ($(".bg_white_block").hasClass("ps--active-y")) {
        $('footer').removeClass('footer_fixed');
      }
      else {
        $('footer').addClass('footer_fixed');
      }
    }, 1000);

    this.DepartmentService.getAllDepartment()
      .then((data) => {
        debugger
        setTimeout(function () {
          var table = $('#list_tables').DataTable({
            // scrollY: '55vh',
            responsive: {
              details: {
                display: $.fn.dataTable.Responsive.display.childRowImmediate,
                type: ''
              }
            },
            scrollCollapse: true,
            "oLanguage": {
              "sLengthMenu": "_MENU_ Department per Page",
              "sInfo": "Showing _START_ to _END_ of _TOTAL_ Department",
              "sInfoFiltered": "(filtered from _MAX_ total Department)",
              "sInfoEmpty": "Showing 0 to 0 of 0 Department"
            },
            dom: 'lBfrtip',
            buttons: [

            ]
          });

          var buttons = new $.fn.dataTable.Buttons(table, {
            buttons: [
              {
                extend: 'excel',
                title: 'Department List',
                exportOptions: {
                  columns: [0, 1, 2, 3]
                }
              },
              {
                extend: 'print',
                title: 'Department List',
                exportOptions: {
                  columns: [0, 1, 2, 3]
                }
              },
            ]
          }).container().appendTo($('#buttons'));
        }, 100);

        this.departmentList = data;
        console.log(this.departmentList);
        //this.globals.isLoading = false;	
      },
        (error) => {
          // this.globals.isLoading = false;
          this.router.navigate(['/pagenotfound']);
        });
    this.msgflag = false;
  }
  isActiveChange(changeEntity, i) {
    if (this.departmentList[i].IsActive == 1) {
      this.departmentList[i].IsActive = 0;
      changeEntity.IsActive = 0;
    } else {
      this.departmentList[i].IsActive = 1;
      changeEntity.IsActive = 1;
    }
    // this.globals.isLoading = true;
    changeEntity.UpdatedBy = 1;

    this.DepartmentService.isActiveChange(changeEntity)
      .then((data) => {
        // this.globals.isLoading = false;	
        swal({
          position: 'top-end',
          type: 'success',
          title: 'Certificate Updated Successfully!',
          showConfirmButton: false,
          timer: 1500
        })

      },
        (error) => {
          // this.globals.isLoading = false;
          this.router.navigate(['/pagenotfound']);
        });
  }
}
