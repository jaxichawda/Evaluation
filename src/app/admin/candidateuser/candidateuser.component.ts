import { Component, OnInit, ElementRef } from '@angular/core';
import { Http } from '@angular/http';
import { Globals } from '.././globals';
import { Router } from '@angular/router';
import { ActivatedRoute } from '@angular/router';
import { CandidateuserService } from '../services/candidateuser.service';
import { debug } from 'util';
declare var $, unescape: any;
declare var $, swal: any;
@Component({
	selector: 'app-candidateuser',
	providers: [CandidateuserService],
	templateUrl: './candidateuser.component.html',
	styleUrls: ['./candidateuser.component.css']
})
export class CandidateuserComponent implements OnInit {
	jobpositionList;
	candidateEntity;
	questionList;
	cansEntity;
	submitted;
	btn_disable;
	header;
	msgflag;
	message;
	type;
	primary;
	second1;
	first1;
	fileExtension;
	constructor(private http: Http, public globals: Globals, private elem: ElementRef, private router: Router, private route: ActivatedRoute,
		private CandidateuserService: CandidateuserService) { }

	ngOnInit() {
		//  Use for footer bottom script start	
		setTimeout(function () {
			if ($("body").height() < $(window).height()) {
				$('footer').addClass('footer_fixed');
			}
			else {
				$('footer').removeClass('footer_fixed');
			}
		}, 100);
		//  Use for footer bottom script end
		const body = document.querySelector('body');
		var count = jQuery(window).height() - 270;
		body.style.setProperty('--screen-height', count + "px");



		//  Use for file upload script start
		$('.file_upload input[type="file"]').change(function (e) {
			var fileName = e.target.files[0].name;
			var fileExtension = fileName.substr((fileName.lastIndexOf('.') + 1));
			if(fileExtension=='pdf')
			{
				$('.file_upload input[type="text"]').val(fileName);
			}
			else
			{
				swal({
					position: 'top-end',
					type: 'danger',
					title: 'You Choosed file is wrong!',
					showConfirmButton: false,
					timer: 1500
				})
			}
			
			

			//console.log (fileExtension);
		});
		//  Use for file upload script end

		this.first1 = true;
		this.candidateEntity = {};
		this.cansEntity = {};
		this.CandidateuserService.getAllDefaultData()
			.then((data) => {
				this.jobpositionList = data['jobpositon'];
				this.questionList = data['question'];
				//console.log(this.questionList);


			},
				(error) => {

				});
		let id = this.route.snapshot.paramMap.get('id');
		if (id) {


			this.header = 'Edit';
			this.CandidateuserService.getById(id)
				.then((data) => {
					// option 
					this.candidateEntity = data;
					this.questionList = data;
					//	console.log(this.questionList);

				},
					(error) => {
						alert('error');

						//	this.router.navigate(['/admin/pagenotfound']);
						this.btn_disable = false;
						this.submitted = false;
					});
		}
		else {
			this.header = 'Add';
			this.candidateEntity = {};
			this.candidateEntity.CandidateId = 0;
			this.candidateEntity.IsActive = '1';

		}

	}




	addUser(candidateForm) {
		debugger

		let id = this.route.snapshot.paramMap.get('id');

		
		this.submitted = true;
		if (candidateForm.valid) {

			//this.btn_disable = true;
			this.candidateEntity.CandidateId = id;
			this.CandidateuserService.add({ 'candidatevalue': this.candidateEntity })
				.then((data) => {

					
						this.btn_disable = false;
						this.submitted = false;
						//	this.CourseEntity = {};
						candidateForm.form.markAsPristine();
						if (id) {

							swal({
								position: 'top-end',
								type: 'success',
								title: 'File Uploaded Successfully!',
								showConfirmButton: false,
								timer: 1500
							})
						} else {

							swal({
								position: 'top-end',
								type: 'success',
								title: 'File Uploaded Successfully!',
								showConfirmButton: false,
								timer: 1500
							})
						}
						this.router.navigate(['/admin/candidate/list']);
				


				}, (error) => {
					//alert('error');
					this.btn_disable = false;
					this.submitted = false;

					//this.router.navigate(['/admin/pagenotfound']);
				});
		}
		else {

			swal({
				position: 'top-end',
				type: 'danger',
				title: 'You Choosed file is wrong!',
				showConfirmButton: false,
				timer: 1500
			})
		}
		this.router.navigate(['/admin/candidate/list']);
	}

	clearForm(candidateForm) {
		this.candidateEntity = {};
		this.candidateEntity.CandidateId = 0;
		this.candidateEntity.IsActive = '1';
		this.submitted = false;
		candidateForm.form.markAsPristine();
	}



	first(candidateForm) {
		console.log(this.questionList);
		this.submitted = true;
		if (candidateForm.valid) {
			this.primary = true;
			this.submitted = false;
			this.btn_disable = false;
			this.second1 = false;
			this.first1 = false;
		}

	}
	pre() {
		this.primary = false;
		this.first1 = true;
		this.second1 = false;

	}

	checked(k, j, value, length) {
		debugger
		//alert(length);
		for (var i = 0; i < length; i++) {
			if (i == j) {
				//this.questionList[k].child[i].CAnswer = value;
			} else {
				//this.questionList[k].child[i].CAnswer = '';
			}
			//this.questionList[k].child[j].CAnswer = value;
		}

		console.log(this.questionList[k].child);

	}

	Third(candidateForm) {
		this.submitted = true;
		if (candidateForm.valid) {
			this.second1 = true;
			this.submitted = false;
			this.btn_disable = false;
			this.primary = false;
			this.first1 = false;
		}
	}
	pre1() {
		this.primary = true;
		this.second1 = false;
		this.first1 = false;

	}






}


