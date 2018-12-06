import { Component, OnInit } from '@angular/core';
import { Http } from '@angular/http';
import { Globals } from '.././globals';
import { Router } from '@angular/router';
import { ActivatedRoute } from '@angular/router';
import { ChangepassService } from '../services/changepass.service';
declare var $: any;
declare var $, swal: any;

@Component({
	selector: 'app-changepass',
	providers: [ChangepassService],
	templateUrl: './changepass.component.html'

})
export class ChangepassComponent implements OnInit {
	newpassEntity;
	submitted;
	btn_disable;
	header;
	same;
	oldnewsame;
	//globals;

	constructor(private http: Http, public globals: Globals, private router: Router, private route: ActivatedRoute, private ChangepassService: ChangepassService) { }

	ngOnInit() {
		//this.globals = this.global;
		//this.globals.isLoading = false;
		setTimeout(function () {
			if ($("body").height() < $(window).height()) {
				$('footer').addClass('footer_fixed');
			}
		}, 1000);
		const body = document.querySelector('body');
		var count = jQuery(window).height() - 270;
		body.style.setProperty('--screen-height', count + "px");


		this.newpassEntity = {};
		this.globals.msgflag = false;
	}

	addNewPassword(newpassForm) {
		debugger
		let id = this.route.snapshot.paramMap.get('id');

		//var id=new JwtHelper().decodeToken(id);
		this.newpassEntity.UserId = id;
		if (id) {
			this.submitted = false;
		} else {
			this.newpassEntity.UserId = 0;
			this.submitted = true;
		}
		if (newpassForm.valid && !this.same && !this.oldnewsame) {

			this.newpassEntity.UserId = this.globals.authData.UserId;
			this.btn_disable = true;
			
			//this.globals.isLoading = true;
			this.ChangepassService.add(this.newpassEntity)
				.then((data) => {
					if (data == 'Code duplicate') {
						swal({
							type: 'warning',
							title: 'Oops...',
							text: 'Your current password is incorrect!',
						  })
						this.btn_disable = false;
						this.submitted = false;
						this.router.navigate(['/admin/changepass']);
					}
					else {
						//alert('success');
						//this.aa=true;
						this.btn_disable = false;
						this.submitted = false;
						this.newpassEntity = {};
						newpassForm.form.markAsPristine();
						swal({
							position: 'top-end',
							type: 'success',
							title: 'Your password has been changed!',
							showConfirmButton: false,
							timer: 1500
						})
						this.router.navigate(['/admin/candidate/list']);
					}
				},
					(error) => {
						//	this.globals.isLoading = false;
						//this.router.navigate(['/pagenotfound']);
						//alert('error');
						this.btn_disable = false;
						this.submitted = false;
					});

		}
	}

	checkpassword() { debugger
		if (this.newpassEntity.cPassword != this.newpassEntity.nPassword) {
			this.same = true;
			this.oldnewsame = false;
		} else {
			this.same = false;
			if(this.newpassEntity.Password == this.newpassEntity.nPassword)
			{
				this.oldnewsame = true;
			}
			else
			{
				
				this.oldnewsame = false;
			}
			
		}

	}

}
