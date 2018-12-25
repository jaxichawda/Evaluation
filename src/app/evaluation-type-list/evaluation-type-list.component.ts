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
      $("#collapseExample4").addClass("in");
      $("#test_evaluation_type").removeClass("collapsed");
      $("#test_evaluation_type").attr("aria-expanded","true");
    }, 100);

    this.globals.isLoading = true;
    this.EvaluationTypeService.getAllEvaluationType()
      .then((data) => {
        
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
              "sLengthMenu": "_MENU_ Evaluation Types per Page",
              "sInfo": "Showing _START_ to _END_ of _TOTAL_ Evaluation Types",
              "sInfoFiltered": "(filtered from _MAX_ total Evaluation Types)",
              "sInfoEmpty": "Showing 0 to 0 of 0 Evaluation Types"
            },
            dom: 'lBfrtip',
            buttons: [
{
                extend: 'excel',
                title: 'Evaluation Type List',
                exportOptions: {
                  columns: [0, 1]
                }
              },
              {
                extend: 'print',
                title: 'Evaluation Type List',
                exportOptions: {
                  columns: [0, 1]
                }
              },
            ]
          });
		  $('.buttons-excel').attr('data-original-title', 'Export to Excel').tooltip();
		   $('.buttons-print').attr('data-original-title', 'Print').tooltip();
        }, 100);

        this.evaluationtypeList = data;
        console.log(this.evaluationtypeList);
        this.globals.isLoading = false;	
      },
        (error) => {
          this.globals.isLoading = false;
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
    this.globals.isLoading = true;
    changeEntity.UpdatedBy = this.globals.authData.UserId;

    this.EvaluationTypeService.isActiveChange(changeEntity)
      .then((data) => {
        this.globals.isLoading = false;	
        swal({
          position: 'top-end',
          type: 'success',
          title: 'Evaluation Type updated Successfully!',
          showConfirmButton: false,
          timer: 1500
        })

      },
        (error) => {
          this.globals.isLoading = false;
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
          this.globals.isLoading = true;
          this.EvaluationTypeService.deleteEvaluationType(del)
            .then((data) => {
              let index = this.evaluationtypeList.indexOf(evaluationtype);
              $('#Delete_Modal').modal('hide');
              if (index != -1) {
                this.evaluationtypeList.splice(index, 1);
              }
              this.globals.isLoading = false;
              swal({
                position: 'top-end',
                type: 'success',
                title: 'Evaluation Type deleted successfully!',
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