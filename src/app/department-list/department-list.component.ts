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
  deleteEntity;

  constructor(private http: Http, public globals: Globals, private router: Router, private route: ActivatedRoute,
    private DepartmentService: DepartmentService) { }

  ngOnInit() {
    debugger
    this.globals.isLoading = false;
    $('.buttons-excel').attr('data-original-title', 'Export to Excel').tooltip();
    $('.buttons-print').attr('data-original-title', 'Print').tooltip();

    setTimeout(function () {
      if ($(".bg_white_block").hasClass("ps--active-y")) {
        $('footer').removeClass('footer_fixed');
      }
      else {
        $('footer').addClass('footer_fixed');
      }
      $("#collapseExample5").addClass("in");
      $("#test_department").removeClass("collapsed");
      $("#test_department").attr("aria-expanded","true");
    }, 100);
    this.globals.isLoading = true;
    this.DepartmentService.getAllDepartment()
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
              "sLengthMenu": "_MENU_ Departments per Page",
              "sInfo": "Showing _START_ to _END_ of _TOTAL_ Departments",
              "sInfoFiltered": "(filtered from _MAX_ total Departments)",
              "sInfoEmpty": "Showing 0 to 0 of 0 Departments"
            },
            dom: 'lBfrtip',
            buttons: [
{
                extend: 'excel',
                title: 'Department List',
                exportOptions: {
                  columns: [0, 1]
                }
              },
              {
                extend: 'print',
                title: 'Department List',
                exportOptions: {
                  columns: [0, 1]
                }
              },
            ]
          });
$('.buttons-excel').attr('data-original-title', 'Export to Excel').tooltip();
		   $('.buttons-print').attr('data-original-title', 'Print').tooltip();
        }, 100);

        this.departmentList = data;
        console.log(this.departmentList);
        this.globals.isLoading = false;	
      },
        (error) => {
          this.globals.isLoading = false;
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
    this.globals.isLoading = true;
    changeEntity.UpdatedBy = 1;

    this.DepartmentService.isActiveChange(changeEntity)
      .then((data) => {
        this.globals.isLoading = false;	
        swal({
          position: 'top-end',
          type: 'success',
          title: 'Department updated Successfully!',
          showConfirmButton: false,
          timer: 1500
        })

      },
        (error) => {
          this.globals.isLoading = false;
          this.router.navigate(['/pagenotfound']);
        });
  }
  deleteDepartment(department) {
    this.deleteEntity = department;
    swal({
      title: 'Are you sure?',
      text: "You want to delete this Department?",
      type: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
      confirmButtonText: 'Yes, delete it!'
    })
      .then((result) => {
        if (result.value) {
          var del = { 'Userid': 1, 'id': department.DepartmentId, 'Name': department.DepartmentName };
          this.globals.isLoading = true;
          this.DepartmentService.deleteDepartment(del)
            .then((data) => {
              this.globals.isLoading = false;
              let index = this.departmentList.indexOf(department);
              $('#Delete_Modal').modal('hide');
              if (index != -1) {
                this.departmentList.splice(index, 1);
              }
              swal({
                position: 'top-end',
                type: 'success',
                title: 'Department deleted successfully!',
                showConfirmButton: false,
                timer: 1500
              })
            },
              (error) => {
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
