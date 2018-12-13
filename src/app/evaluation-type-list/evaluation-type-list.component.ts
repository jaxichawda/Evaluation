import { Component, OnInit } from '@angular/core';
import { Http } from '@angular/http';
import { Globals } from '.././globals';
import { Router } from '@angular/router';
import { ActivatedRoute } from '@angular/router';
import { EvaluationTypeService } from '../services/evaluation-type.service';
declare var $, swal: any;
declare function myInput(): any;
declare var $, Bloodhound: any;

@Component({
  selector: 'app-EvaluationTypeListComponent',
  templateUrl: './evaluation-type-list.component.html',
  styleUrls: ['./evaluation-type-list.component.css']
})
export class EvaluationTypeListComponent implements OnInit {
  evaluationtypeList;
  msgflag;
  deleteEntity;

  constructor(private http: Http, public globals: Globals, private router: Router, private route: ActivatedRoute,
    private EvaluationTypeService: EvaluationTypeService) { }

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

    this.EvaluationTypeService.getAllEvaluationType()
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
              "sLengthMenu": "_MENU_ Evaluation Type per Page",
              "sInfo": "Showing _START_ to _END_ of _TOTAL_ Evaluation Type",
              "sInfoFiltered": "(filtered from _MAX_ total Evaluation Type)",
              "sInfoEmpty": "Showing 0 to 0 of 0 Evaluation Type"
            },
            dom: 'lBfrtip',
            buttons: [

            ]
          });

          var buttons = new $.fn.dataTable.Buttons(table, {
            buttons: [
              {
                extend: 'excel',
                title: 'Evaluation Type List',
                exportOptions: {
                  columns: [0, 1, 2, 3]
                }
              },
              {
                extend: 'print',
                title: 'Evaluation Type List',
                exportOptions: {
                  columns: [0, 1, 2, 3]
                }
              },
            ]
          }).container().appendTo($('#buttons'));
        }, 100);

        this.evaluationtypeList = data;
        console.log(this.evaluationtypeList);
        //this.globals.isLoading = false;	
      },
        (error) => {
          // this.globals.isLoading = false;
          this.router.navigate(['/pagenotfound']);
        });
    this.msgflag = false;
  }
  isActiveChange(changeEntity, i) {
    if (this.evaluationtypeList[i].IsActive == 1) {
      this.evaluationtypeList[i].IsActive = 0;
      changeEntity.IsActive = 0;
    } else {
      this.evaluationtypeList[i].IsActive = 1;
      changeEntity.IsActive = 1;
    }
    // this.globals.isLoading = true;
    changeEntity.UpdatedBy = 1;

    this.EvaluationTypeService.isActiveChange(changeEntity)
      .then((data) => {
        // this.globals.isLoading = false;	
        swal({
          position: 'top-end',
          type: 'success',
          title: 'Evaluation Type Updated Successfully!',
          showConfirmButton: false,
          timer: 1500
        })

      },
        (error) => {
          // this.globals.isLoading = false;
          this.router.navigate(['/pagenotfound']);
        });
  }
  deleteEvaluationType(evaluationtype) {
    this.deleteEntity = evaluationtype;
    swal({
      title: 'Are you sure?',
      text: "You want to delete this Evaluation Type?",
      type: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
      confirmButtonText: 'Yes, delete it!'
    })
      .then((result) => {
        if (result.value) {
          var del = { 'Userid': 1, 'id': evaluationtype.EvaluationTypeId, 'Name': evaluationtype.EvaluationTypeName };
          this.EvaluationTypeService.deleteEvaluationType(del)
            .then((data) => {
              let index = this.evaluationtypeList.indexOf(evaluationtype);
              $('#Delete_Modal').modal('hide');
              if (index != -1) {
                this.evaluationtypeList.splice(index, 1);
              }
              swal({
                position: 'top-end',
                type: 'success',
                title: 'Evaluation Type deleted successfully!',
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