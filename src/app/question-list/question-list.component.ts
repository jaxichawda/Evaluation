import { Component, OnInit } from '@angular/core';
import { Http } from '@angular/http';
import { Globals } from '.././globals';
import { Router } from '@angular/router';
import { ActivatedRoute } from '@angular/router';
import { QuestionService } from '../services/question.service';
declare var $, swal: any;
declare function myInput(): any;
declare var $, Bloodhound: any;

@Component({
  selector: 'app-question-list',
  templateUrl: './question-list.component.html',
  styleUrls: ['./question-list.component.css']
})
export class QuestionListComponent implements OnInit {

  questionList;
  msgflag;
  deleteEntity;

  constructor(private http: Http, public globals: Globals, private router: Router, private route: ActivatedRoute,
    private QuestionService: QuestionService) { }

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
    }, 1000);
    this.globals.isLoading = true;
    this.QuestionService.getAllQuestion()
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
              "sLengthMenu": "_MENU_ Question per Page",
              "sInfo": "Showing _START_ to _END_ of _TOTAL_ Question",
              "sInfoFiltered": "(filtered from _MAX_ total Question)",
              "sInfoEmpty": "Showing 0 to 0 of 0 Question"
            },
            dom: 'lBfrtip',
            buttons: [

            ]
          });

          var buttons = new $.fn.dataTable.Buttons(table, {
            buttons: [
              {
                extend: 'excel',
                title: 'Question List',
                exportOptions: {
                  columns: [0, 1, 2, 3]
                }
              },
              {
                extend: 'print',
                title: 'Question List',
                exportOptions: {
                  columns: [0, 1, 2, 3]
                }
              },
            ]
          }).container().appendTo($('#buttons'));
        }, 100);

        this.questionList = data;
        console.log(this.questionList);
        this.globals.isLoading = false;	
      },
        (error) => {
          this.globals.isLoading = false;
          this.router.navigate(['/pagenotfound']);
        });
    this.msgflag = false;
  }
  isActiveChange(changeEntity, i) {
    if (this.questionList[i].IsActive == 1) {
      this.questionList[i].IsActive = 0;
      changeEntity.IsActive = 0;
    } else {
      this.questionList[i].IsActive = 1;
      changeEntity.IsActive = 1;
    }
    this.globals.isLoading = true;
    changeEntity.UpdatedBy = 1;

    this.QuestionService.isActiveChange(changeEntity)
      .then((data) => {
        this.globals.isLoading = false;	
        swal({
          position: 'top-end',
          type: 'success',
          title: 'Question Updated Successfully!',
          showConfirmButton: false,
          timer: 1500
        })

      },
        (error) => {
          this.globals.isLoading = false;
          this.router.navigate(['/pagenotfound']);
        });
  }
  deleteQuestion(question) {
    this.deleteEntity = question;
    swal({
      title: 'Are you sure?',
      text: "You want to delete this Question?",
      type: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
      confirmButtonText: 'Yes, delete it!'
    })
      .then((result) => {
        if (result.value) {
          var del = { 'Userid': 1, 'id': question.QuestionId, 'Name': question.QuestionText };
          this.globals.isLoading = true;
          this.QuestionService.deleteQuestion(del)
            .then((data) => {
              let index = this.questionList.indexOf(question);
              $('#Delete_Modal').modal('hide');
              if (index != -1) {
                this.questionList.splice(index, 1);
              }
              this.globals.isLoading = false;
              swal({
                position: 'top-end',
                type: 'success',
                title: 'Question deleted successfully!',
                showConfirmButton: false,
                timer: 1500
              })
            },
              (error) => {
                $('#Delete_Modal').modal('hide');
                if (error.text) {
                  this.globals.isLoading = false;
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