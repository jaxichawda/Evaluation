import { Component, OnInit } from '@angular/core';
import { Http } from '@angular/http';
import { Globals } from '.././globals';
import { Router } from '@angular/router';
import { ActivatedRoute } from '@angular/router';
import { JobpositionService } from '../services/jobposition.service';
declare var $, swal: any;

@Component({
	selector: 'app-jobposition',
	providers: [JobpositionService],
	templateUrl: './jobposition.component.html',
	styleUrls: ['./jobposition.component.css']
})
export class JobpositionComponent implements OnInit {
	positionEntity;
	submitted;
	btn_disable;
	header;

	constructor(private http: Http, public globals: Globals, private router: Router, private route: ActivatedRoute, private JobpositionService: JobpositionService) { }


	ngOnInit() {
		debugger
		setTimeout(function () {
			if ($("body").height() < $(window).height()) {
				$('footer').addClass('footer_fixed');
			}
			else {
				$('footer').removeClass('footer_fixed');
			}
		}, 100);
		
		const body = document.querySelector('body');
		var count = jQuery(window).height() - 270;
		body.style.setProperty('--screen-height', count + "px");


		let id = this.route.snapshot.paramMap.get('id');
		if (id) {
			//this.header = 'Edit';
			this.JobpositionService.getById(id)
				.then((data) => {
					this.positionEntity = data;


				},
					(error) => {
						//alert('error');
						this.btn_disable = false;
						this.submitted = false;

						//	this.router.navigate(['/admin/pagenotfound']);
					});
		}
		else {
			this.positionEntity = {};
			this.positionEntity.JobPositionId = 0;
			this.positionEntity.IsActive = '1';

		}
	}



	addPosition(positionForm) {
		debugger
		let id = this.route.snapshot.paramMap.get('id');

		if (id) {
			this.positionEntity.UpdatedBy = this.globals.authData.UserId;
			this.submitted = false;
		  } else {
			this.positionEntity.CreatedBy = this.globals.authData.UserId;
			this.positionEntity.UpdatedBy = this.globals.authData.UserId;
			this.positionEntity.JobPositionId = 0;
			this.submitted = true;
		  }

		if (positionForm.valid) {
			this.btn_disable = true;
		
			this.JobpositionService.add(this.positionEntity)
				.then((data) => {
					//alert('success');
					//this.aa=true;
					this.btn_disable = false;
					this.submitted = false;
					this.positionEntity = {};
					positionForm.form.markAsPristine();
					if (id) {
					
						swal({
							position: 'top-end',
							type: 'success',
							title: 'Position updated successfully!',
							showConfirmButton: false,
							timer: 1500
						})
					} else {
						
						swal({
							position: 'top-end',
							type: 'success',
							title: 'Position added successfully!',
							showConfirmButton: false,
							timer: 1500
						})
					}


					this.router.navigate(['/admin/position/list']);
				},
					(error) => {
						alert('error');
						this.btn_disable = false;
						this.submitted = false;

						//	this.router.navigate(['/admin/pagenotfound']);
					});

		}
	}

	clearForm(positionForm) {
		this.positionEntity = {};
		this.positionEntity.JobpositionId = 0;
		this.positionEntity.IsActive = '1';
		this.submitted = false;
		positionForm.form.markAsPristine();
	}

}
