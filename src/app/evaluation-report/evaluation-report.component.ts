import { Component, OnInit } from '@angular/core';
import { Http } from '@angular/http';
import { Globals } from '.././globals';
import { Router } from '@angular/router';
import { ActivatedRoute } from '@angular/router';
import { EvaluationReportService } from '../services/evaluation-report.service';
declare var $, swal: any;

@Component({
  selector: 'app-evaluation-report',
  templateUrl: './evaluation-report.component.html',
  styleUrls: ['./evaluation-report.component.css']
})
export class EvaluationReportComponent implements OnInit {

  EmployeeData;

  commonEvaluationList;
  commonEmployeeList;

  evaluatorEvaluationList;
  evaluatorEmployeeList;

  employeeEvaluationList;
  employeeEmployeeList;

  constructor(private http: Http, public globals: Globals, private router: Router, private route: ActivatedRoute,
    private EvaluationReportService: EvaluationReportService) { }

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
      this.EvaluationReportService.getCommonReport(id)
        .then((data) => {
          console.log(data);

          this.EmployeeData = data['EmployeeData'];

          //Common Report
          this.commonEmployeeList = data['commonEmployee'];
          this.commonEvaluationList = data['commonReport'];
          //Evaluator Report
          this.evaluatorEmployeeList = data['evaluatorEmployee'];
          this.evaluatorEvaluationList = data['evaluatorReport'];
          //Employee Report
          this.employeeEmployeeList = data['employeeEmployee'];
          this.employeeEvaluationList = data['employeeReport'];

          this.globals.isLoading = false;
          var column_length = this.commonEmployeeList.length;
          var column_array = [0, 1];
          if (column_length > 0) {
            for (var i = 2; i <= column_length + 2; i++) {
              column_array.push(i);
            }
          }
          var employeeName = this.EmployeeData.EmployeeName;
          setTimeout(function () {

            var table = $('#CommonReport').DataTable({
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
                title: 'Common Evaluation Report of ' + employeeName,
                exportOptions: {
                  columns: column_array
                }
              },
              {
                extend: 'print',
                title: 'Common Evaluation Report of ' + employeeName,
                exportOptions: {
                  columns: column_array
                }
              },
              ]
            });

            $('.buttons-excel').attr('data-original-title', 'Export as Excel').tooltip();
            $('.buttons-print').attr('data-original-title', 'Print').tooltip();

          }, 100);

          setTimeout(function () {

            var table = $('#EvaluatorReport').DataTable({
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
                title: 'Evaluator Evaluation Report of ' + employeeName,
                exportOptions: {
                  columns: column_array
                }
              },
              {
                extend: 'print',
                title: 'Evaluator Evaluation Report of ' + employeeName,
                exportOptions: {
                  columns: column_array
                }
              },
              ]
            });

            $('.buttons-excel').attr('data-original-title', 'Export as Excel').tooltip();
            $('.buttons-print').attr('data-original-title', 'Print').tooltip();

          }, 100);

          setTimeout(function () {

            var table = $('#EmployeeReport').DataTable({
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
                title: 'Employee Evaluation Report of ' + employeeName,
                exportOptions: {
                  columns: column_array
                }
              },
              {
                extend: 'print',
                title: 'Employee Evaluation Report of ' + employeeName,
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
      this.commonEvaluationList = {};
      this.globals.isLoading = false;
    }
  }
}
