import { Component, OnInit } from '@angular/core';
import { Http } from '@angular/http';
import { Globals } from '.././globals';
import { Router } from '@angular/router';
import { ActivatedRoute } from '@angular/router';
import { GenerateEvaluationService } from '../services/generate-evaluation.service';
declare var $, swal: any;
declare function myInput(): any;
declare var $, Bloodhound: any;

@Component({
  selector: 'app-evaluation-list',
  templateUrl: './evaluation-list.component.html',
  styleUrls: ['./evaluation-list.component.css']
})
export class EvaluationListComponent implements OnInit {
  evaluationList;
  status;  
  msgflag;
  deleteEntity;

  constructor(private http: Http, public globals: Globals, private router: Router, private route: ActivatedRoute,
    private GenerateEvaluationService: GenerateEvaluationService) { }

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

    this.GenerateEvaluationService.getAllEvaluation()
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
              "sLengthMenu": "_MENU_ Evaluation per Page",
              "sInfo": "Showing _START_ to _END_ of _TOTAL_ Evaluation",
              "sInfoFiltered": "(filtered from _MAX_ total Evaluation)",
              "sInfoEmpty": "Showing 0 to 0 of 0 Evaluation"
            },
            dom: 'lBfrtip',
            buttons: [

            ]
          });

          var buttons = new $.fn.dataTable.Buttons(table, {
            buttons: [
              {
                extend: 'excel',
                title: 'Evaluation List',
                exportOptions: {
                  columns: [0, 1, 2, 3]
                }
              },
              {
                extend: 'print',
                title: 'Evaluation List',
                exportOptions: {
                  columns: [0, 1, 2, 3]
                }
              },
            ]
          }).container().appendTo($('#buttons'));
        }, 100);

        this.evaluationList = data['evaluations'];
        this.status = data['status'];
        //this.globals.isLoading = false;	
      },
        (error) => {
          // this.globals.isLoading = false;
          this.router.navigate(['/pagenotfound']);
        });
    this.msgflag = false;
  }

 
}
