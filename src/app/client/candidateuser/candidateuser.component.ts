import { Component, OnInit } from '@angular/core';
import { Http } from '@angular/http';
import { Globals } from '.././globals';
import { Router } from '@angular/router';
import { ActivatedRoute } from '@angular/router';
import { CandidateuserService } from '../services/candidateuser.service';
import { debug } from 'util';
declare var $, unescape: any;
declare function myInput(): any;
declare var $, swal: any;
declare var $, PerfectScrollbar: any;
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
	ans;
	constructor(private http: Http, public globals: Globals, private router: Router, private route: ActivatedRoute,
		private CandidateuserService: CandidateuserService) { }

	ngOnInit() {
		debugger
		var item = { 'QLabel': '', 'QValue': '' };
		this.ans = [];
		this.ans.push(item);

		$('body').tooltip({
			selector: '[data-toggle="tooltip"], [title]:not([data-toggle="popover"])',
			trigger: 'hover',
			container: 'body'
		}).on('click mousedown mouseup', '[data-toggle="tooltip"], [title]:not([data-toggle="popover"])', function () {
			$('[data-toggle="tooltip"], [title]:not([data-toggle="popover"])').tooltip('destroy');
		});

		setTimeout(function () {
			if ($("body").height() < $(window).height()) {
				//$('footer').addClass('footer_fixed');
			}
			else {
				//$('footer').removeClass('footer_fixed');
			}
		}, 100);

		this.first1 = true;
		this.candidateEntity = {};
		this.cansEntity = {};

		this.CandidateuserService.getAllDefaultData()
			.then((data) => {
				this.jobpositionList = data['jobpositon'];
				this.questionList = data['question'];
			},
				(error) => {
					this.btn_disable = false;
					this.submitted = false;
				});
		let id = this.route.snapshot.paramMap.get('id');
		if (id) {
			this.header = 'Edit';
			this.CandidateuserService.getById(id)
				.then((data) => {
					this.candidateEntity = data;
					this.questionList = data;
				},
					(error) => {
						this.btn_disable = false;
						this.submitted = false;
					});
		}
		else {
			this.header = 'Add';
			this.candidateEntity = {};
			this.candidateEntity.CandidateId = 0;
			this.candidateEntity.JobPositionId = '';
			this.candidateEntity.IsActive = '1';

		}


	}


	AddNewQuestion(index) {
		debugger
		var item = { 'QLabel': '', 'QValue': '', 'CreatedBy': 1, 'UpdatedBy': 1 };
		if (this.ans.length <= index + 1) {
			this.ans.splice(index + 1, 0, item);
		}
		setTimeout(function () {
			myInput();
		}, 100);
	}

	DeleteQuestion(item) {
		debugger
		var index = this.ans.indexOf(item);
		this.ans.splice(index, 1);
	}


	addUser(candidateForm) {
		debugger
		let id = this.route.snapshot.paramMap.get('id');
		this.submitted = true;
		if (candidateForm.valid) {

			//this.btn_disable = true;
			this.CandidateuserService.add({ 'candidatevalue': this.candidateEntity, 'questionvalue': this.questionList })
				.then((data) => {
					this.btn_disable = false;
					this.submitted = false;
					this.candidateEntity = {};
					candidateForm.form.markAsPristine();
					if (id) {
						swal({
							position: 'top-end',
							type: 'success',
							title: 'Your Form Submitted Successfully!',
							showConfirmButton: false,
							timer: 1500
						})
					} else {
						swal({
							position: 'top-end',
							type: 'success',
							title: 'Your Form Submitted Successfully!',
							showConfirmButton: false,
							timer: 1500
						})
					}
					this.router.navigate(['/thankyou']);
				},
					(error) => {
						this.btn_disable = false;
						this.submitted = false;
					});
		}
		else {
			swal({
				type: 'warning',
				title: 'Oops...',
				text: 'Please fill all the data!',
			})
		}

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


			//slider
			setTimeout(function () {
				$('#carousel').flexslider({
					animation: "slide",
					controlNav: false,
					animationLoop: false,
					slideshow: false,
					itemWidth: 250,
					itemMargin: 5,
					asNavFor: '#slider'
				});

				$('#slider').flexslider({
					animation: "slide",
					controlNav: false,
					animationLoop: false,
					slideshow: false,
					sync: "#carousel",
					start: function (slider) {
						$('body').removeClass('loading');
					}
				});

			}, 100);
			//slider




		}

	}
	checkTextbox(queId, totalAns, que) {
		var count = 0;
		for (var i = 0; i < totalAns; i++) {
			if (que.child[i].CAnswer != '')
				count++;
		}
		if (count == totalAns)
			que.child.checkActive = true;
		else
			que.child.checkActive = false;
	}

	pre() {
		this.primary = false;
		this.first1 = true;
		this.second1 = false;
		console.log(this.questionList);
	}
	checked(k, j, value, length) {
		debugger
		//alert(length);
		for (var i = 0; i < length; i++) {
			if (i == j) {
				this.questionList[k].child[i].CAnswer1 = value;
				//this.questionList[k].child[i].CAnswer = value;
			} else {
				this.questionList[k].child[i].CAnswer1 = '';
				//this.questionList[k].child[i].CAnswer = '';
			}
			this.questionList[k].child[i].CAnswer = '';
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


