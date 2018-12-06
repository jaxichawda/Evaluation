import { Component, OnInit } from '@angular/core';
import { Http } from '@angular/http';
import { Globals } from '.././globals';
import { Router } from '@angular/router';
import { ActivatedRoute } from '@angular/router';
import { JobpositionService } from '../services/jobposition.service';
declare var $, swal: any;

@Component({
	selector: 'app-jobpositionlist',
	providers: [JobpositionService],
	templateUrl: './jobpositionlist.component.html',
	styleUrls: ['./jobpositionlist.component.css']
})
export class JobpositionlistComponent implements OnInit {
	positionList;
	deleteEntity;
	msgflag;
	message;
	type;

	constructor(private http: Http, private router: Router, private route: ActivatedRoute, private JobpositionService: JobpositionService, public globals: Globals) { }



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
		this.JobpositionService.getAll()
			.then((data) => {
				this.positionList = data;
				setTimeout(function () {
					$('#dataTables-example').dataTable({
						
						 responsive: {
            details: {
                display: $.fn.dataTable.Responsive.display.childRowImmediate,
                type: ''
            }
        },
		  scrollCollapse: true,
		  
						"oLanguage": {
							"sLengthMenu": "_MENU_ Positions per Page",
							"sInfo": "Showing _START_ to _END_ of _TOTAL_ Positions",
							"sInfoFiltered": "(filtered from _MAX_ total Positions)"
						}
					});
				}, 100);
				this.globals.isLoading = false;
			},
			(error) => {
				this.globals.isLoading = false;
			});
		this.msgflag = false;
	}

	deleteJobPosition(jobposition) {
		this.deleteEntity = jobposition;
		swal({
			title: 'Are you sure?',
			text: "You want to delete this Position?",
			type: 'warning',
			showCancelButton: true,
			confirmButtonColor: '#3085d6',
			cancelButtonColor: '#d33',
			confirmButtonText: 'Yes, delete it!'
		})
			.then((result) => {
				if (result.value) {
					this.JobpositionService.deletePosition(jobposition.JobPositionId)
						.then((data) => {
							let index = this.positionList.indexOf(jobposition);
							$('#Delete_Modal').modal('hide');
							if (index != -1) {
								this.positionList.splice(index, 1);
							}
							swal({
								position: 'top-end',
								type: 'success',
								title: 'Position deleted successfully!',
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
