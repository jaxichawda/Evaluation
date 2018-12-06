import { Component, OnInit } from '@angular/core';
import { Http } from '@angular/http';
import { Globals } from '.././globals';
import { Router } from '@angular/router';
import { ActivatedRoute } from '@angular/router';
import { ManagequestionService } from '../services/managequestion.service';
declare var $, unescape: any;
import { debug } from 'util';
declare var $, swal: any;
@Component({
	selector: 'app-managequestionlist',
	providers: [ManagequestionService],
	templateUrl: './managequestionlist.component.html',
	styleUrls: ['./managequestionlist.component.css']
})
export class ManagequestionlistComponent implements OnInit {
	questionList;
	deleteEntity;
	constructor(private http: Http, public globals: Globals, private router: Router, private route: ActivatedRoute,
		private ManagequestionService: ManagequestionService) { }

	ngOnInit() {

		$('body').tooltip({
			selector: '[data-toggle="tooltip"], [title]:not([data-toggle="popover"])',
			trigger: 'hover',
			container: 'body'
			}).on('click mousedown mouseup', '[data-toggle="tooltip"], [title]:not([data-toggle="popover"])', function () {
			$('[data-toggle="tooltip"], [title]:not([data-toggle="popover"])').tooltip('destroy');
			});
		setTimeout(function () {
			if ($("body").height() < $(window).height()) {
				$('footer').addClass('footer_fixed');
			}
			else {
				$('footer').removeClass('footer_fixed');
			}
		}, 100);
		this.globals.isLoading = true;
		this.ManagequestionService.getAll()

			.then((data) => {

				this.questionList = data;
				setTimeout(function () {
					var table = $('#dataTables-example').DataTable({
						
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
							"sInfoFiltered": "(filtered from _MAX_ total Questions)"
						},
					});

				}, 500);
				this.globals.isLoading = false;
			},
				(error) => {
					this.globals.isLoading = false;
					// this.msgflag = false;
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
					this.ManagequestionService.deleteQuestion(question.QuestionId)
						.then((data) => {
							let index = this.questionList.indexOf(question);
							$('#Delete_Modal').modal('hide');
							if (index != -1) {
								this.questionList.splice(index, 1);
							}
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
