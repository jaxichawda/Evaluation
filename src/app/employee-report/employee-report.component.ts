import { Component, OnInit } from '@angular/core';
import { Http } from '@angular/http';
import { Globals } from '.././globals';
import { Router } from '@angular/router';
import { ActivatedRoute } from '@angular/router';
import { GenerateEvaluationService } from '../services/generate-evaluation.service';
declare var $, swal: any;

@Component({
  selector: 'app-employee-report',
  templateUrl: './employee-report.component.html',
  styleUrls: ['./employee-report.component.css']
})
export class EmployeeReportComponent implements OnInit {

  evaluationList;
  status;
  EvaluatorList;
  employeelist;
  employeeData;

  constructor(private http: Http, public globals: Globals, private router: Router, private route: ActivatedRoute,
    private GenerateEvaluationService: GenerateEvaluationService) { }

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

      $('.modal').on('hidden.bs.modal', function () {
        $('.right_content_block').removeClass('style_position');
      });

    }, 100);
    this.globals.isLoading = true;
    let id = this.route.snapshot.paramMap.get('id');
    if (id) {
      this.GenerateEvaluationService.getEmployeeReport(id)
        .then((data) => {
          this.employeeData = data['employeeData'];
          this.employeelist = data['employee'];
          this.evaluationList = data['report'];
          this.globals.isLoading = false;
          var column_length = this.employeelist.length;
          var column_array = [0, 1];
          if (column_length > 0) {
            for (var i = 2; i <= column_length + 1; i++) {
              column_array.push(i);
            }
          }
          var employeeName = this.employeeData.EmployeeName;
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
                "sLengthMenu": "_MENU_ Questions per Page",
                "sInfo": "Showing _START_ to _END_ of _TOTAL_ Questions",
                "sInfoFiltered": "(filtered from _MAX_ total Questions)",
                "sInfoEmpty": "Showing 0 to 0 of 0 Questions"
              },
              dom: 'lBfrtip',
              buttons: [{
                extend: 'excel',
                title: 'Evaluation Report of ' + employeeName,
                exportOptions: {
                  columns: column_array
                }
              },
              {
                extend: 'print',
                title: 'Evaluation Report of ' + employeeName,
                exportOptions: {
                  columns: column_array
                }
              },
              ]
            });
            $('.buttons-excel').attr('data-original-title', 'Export as Excel').tooltip();
            $('.buttons-print').attr('data-original-title', 'Print').tooltip();
          }, 100);
        },
          (error) => {
            this.globals.isLoading = false;
            this.router.navigate(['/pagenotfound']);
          });
    } else {
      this.evaluationList = {};
      this.globals.isLoading = false;
    }
  }

}
