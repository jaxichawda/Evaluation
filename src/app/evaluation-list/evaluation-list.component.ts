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
  EvaluatorList;
  evaluatorEntity;
  date;
  TodaysDate;
  NewEvaluatorList;
  submitted;
  btn_disable;

  constructor(private http: Http, public globals: Globals, private router: Router, private route: ActivatedRoute,
    private GenerateEvaluationService: GenerateEvaluationService) { }

  ngOnInit() {
    debugger

    $('#Evaluator_Modal').on('hidden.bs.modal', function () {
      $('#Details_Modal').modal('hide');
    });
    this.globals.isLoading = false;
    this.evaluatorEntity={};
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
      $("#collapseExample2").addClass("in");
      $("#test_evaluation").removeClass("collapsed");
      $("#test_evaluation").attr("aria-expanded", "true");
    }, 100);
    this.evaluationList = [];
    this.EvaluatorList = [];
    this.globals.isLoading = true;
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
              "sLengthMenu": "_MENU_ Evaluations per Page",
              "sInfo": "Showing _START_ to _END_ of _TOTAL_ Evaluations",
              "sInfoFiltered": "(filtered from _MAX_ total Evaluations)",
              "sInfoEmpty": "Showing 0 to 0 of 0 Evaluations"
            },
            dom: 'lBfrtip',
            buttons: [
              {
                extend: 'excel',
                title: 'List of Evaluations',
                exportOptions: {
                  columns: [0, 1, 2, 3, 4]
                }
              },
              {
                extend: 'print',
                title: 'List of Evaluations',
                exportOptions: {
                  columns: [0, 1, 2, 3, 4]
                }
              },
            ]
          });

          $('.buttons-excel').attr('data-original-title', 'Export as Excel').tooltip();
          $('.buttons-print').attr('data-original-title', 'Print').tooltip();
        }, 100);

        this.evaluationList = data['evaluations'];
        this.status = data['status'];
        this.globals.isLoading = false;
      },
        (error) => {
          this.globals.isLoading = false;
          this.router.navigate(['/pagenotfound']);
        });
    this.msgflag = false;
    this.TodaysDate = new Date();
  }

  revokeEvaluation(evaluation) {
    swal({
      title: 'Are you sure?',
      text: "You want to revoke this Evaluation?",
      type: 'info',
      showCancelButton: true,
      confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
      confirmButtonText: 'Yes, revoke it!'
    }).then((result) => {
      if (result.value) {
        this.globals.isLoading = true;
        var del = { 'UserId': this.globals.authData.UserId, 'evaluationid': evaluation.EvaluationId };
        this.GenerateEvaluationService.revokeEvaluation(del)
          .then((data) => {
            this.globals.isLoading = false;
            let index = this.evaluationList.indexOf(evaluation);
            this.evaluationList[index].StatusId = 3;
            swal({
              position: 'top-end',
              type: 'success',
              title: 'Evaluation revoked successfully',
              showConfirmButton: false,
              timer: 1500
            })
            //this.default();
          },
            (error) => {
              this.globals.isLoading = false;
              this.router.navigate(['/pagenotfound']);
            });
      }

    })
  }
  revokeEvaluator(evaluators) {
    swal({
      title: 'Are you sure?',
      text: "You want to revoke this Evaluator?",
      type: 'info',
      showCancelButton: true,
      confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
      confirmButtonText: 'Yes, revoke it!'
    }).then((result) => {
      if (result.value) {
        this.globals.isLoading = true;
        var del = { 'UserId': this.globals.authData.UserId, 'EvaluatorId': evaluators.EvaluatorId };
        this.GenerateEvaluationService.revokeEvaluator(del)
          .then((data) => {
            this.globals.isLoading = false;
            let index = this.EvaluatorList.indexOf(evaluators);
            this.EvaluatorList[index].StatusId = 3;
            swal({
              position: 'top-end',
              type: 'success',
              title: 'Evaluator revoked successfully',
              showConfirmButton: false,
              timer: 1500
            })
            //this.default();
          },
            (error) => {
              this.globals.isLoading = false;
              this.router.navigate(['/pagenotfound']);
            });

      }

    })
  }
  statusChange(changeEntity, i) {
    if (this.EvaluatorList[i].StatusId == 1) {
      this.EvaluatorList[i].StatusId = 2;
      changeEntity.StatusId = 2;
    } else {
      this.EvaluatorList[i].StatusId = 1;
      changeEntity.StatusId = 1;
    }
    this.globals.isLoading = true;

    changeEntity.UpdatedBy = this.globals.authData.UserId;

    this.GenerateEvaluationService.statusChange(changeEntity)
      .then((data) => {
        this.globals.isLoading = false;
        swal({
          position: 'top-end',
          type: 'success',
          title: 'Status updated Successfully!',
          showConfirmButton: false,
          timer: 1500
        })

      },
        (error) => {
          this.globals.isLoading = false;
          this.router.navigate(['/pagenotfound']);
        });
  }

  showEvaluators(evaluation) {
    this.evaluatorEntity={};
    this.evaluatorEntity.EvaluationId=evaluation.EvaluationId;
    this.evaluatorEntity.EvaluationTypeName=evaluation.EvaluationTypeName;
    this.evaluatorEntity.UserName=evaluation.Name;
    this.date = evaluation.EvaluationDate;
    var obj = { 'UserId': evaluation.UserId, 'EvaluationId': evaluation.EvaluationId };
    this.globals.isLoading = true;
    this.GenerateEvaluationService.getEvaluators(obj)
      .then((data) => {
        if (data) {
          this.EvaluatorList = data;
        }
        this.globals.isLoading = false;
        $('#Details_Modal').modal('show');
        $('.right_content_block').addClass('style_position');
      },
        (error) => {
          this.globals.isLoading = false;
          this.router.navigate(['/pagenotfound']);
        });

  }
  displayNewEvaluators(evaluatorEntity){
    //console.log(evaluatorEntity);
    var obj = { 'UserId': evaluatorEntity.UserId, 'EvaluationId': evaluatorEntity.EvaluationId };
    this.globals.isLoading = true;
    this.GenerateEvaluationService.getNewEvaluators(obj)
      .then((data) => {
        if (data) {
          this.NewEvaluatorList = data;
        }
        this.globals.isLoading = false;
        this.evaluatorEntity.EvaluatorId="";
        $('#Evaluator_Modal').modal('show');
        $('.right_content_block').addClass('style_position');
      },
        (error) => {
          this.globals.isLoading = false;
          this.router.navigate(['/pagenotfound']);
        });

  }
  InviteConfirm(InviteForm){
    this.evaluatorEntity.CreatedBy = this.globals.authData.UserId;
	  this.evaluatorEntity.UpdatedBy = this.globals.authData.UserId;
    this.submitted = true;
		if (InviteForm.valid) {
			this.btn_disable = true;
			this.globals.isLoading = true;
			
		this.GenerateEvaluationService.Invite(this.evaluatorEntity)
		.then((data) => 
		{
      this.globals.isLoading = false;
      $('#Evaluator_Modal').modal('hide');
      $('#Details_Modal').modal('hide');
      this.btn_disable = false;
      this.submitted = false;
      this.evaluatorEntity = {};
      InviteForm.form.markAsPristine();
			swal({
				position: 'top-end',
				type: 'success',
				title: 'Invite Successfully',
				showConfirmButton: false,
				timer: 1500
			})
			
			this.globals.isLoading = false;
			this.router.navigate(['/evaluation/list']);
    }, 
		(error) => 
		{
			this.globals.isLoading = false;
      $('#Evaluator_Modal').modal('hide');
      $('#Details_Modal').modal('hide');
			if(error.text){
				this.globals.message = "You can't send this Email";
				this.globals.type = 'danger';
				this.globals.msgflag = true;
			}	
		});	

  }
}
noForm1(InviteForm) {
  this.evaluatorEntity = {};
  $('#Details_Modal').modal('hide');	
  this.submitted = false;
  InviteForm.form.markAsPristine();
}
}
