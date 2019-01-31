import { Component, OnInit } from '@angular/core';
import { Http } from '@angular/http';
import { Globals } from '.././globals';
import { Router } from '@angular/router';
import { ActivatedRoute } from '@angular/router';
import { ForgotResetService } from '../services/forgot-reset.service';
import { JwtHelper } from 'angular2-jwt';
declare var $, swal: any;

@Component({
	selector: 'app-reset-password',
	templateUrl: './reset-password.component.html',
	styleUrls: ['./reset-password.component.css']
})
export class ResetPasswordComponent implements OnInit {

	resetpasswordEntity;
	submitted;
	btn_disable;
	header;
	newconfsame;

	constructor(private http: Http, public globals: Globals, private router: Router, private route: ActivatedRoute, private ForgotResetService: ForgotResetService) { }

	ngOnInit() {
		debugger
		this.globals.isLoading = false;
		const body = document.querySelector('body');
		var count = $(window).height();
		body.style.setProperty('--screen-height', count + "px");
		this.resetpasswordEntity = {};
		let id = this.route.snapshot.paramMap.get('id');
		id = new JwtHelper().decodeToken(id);
		this.ForgotResetService.getResetlink2(id)
			.then((data) => {
				this.globals.isLoading = false;
				if (data == 'fail') {
					swal({
						type: 'warning',
						title: 'Oops...',
						text: 'Your password reset link is not valid, or already used!',
					})

					this.router.navigate(['/admin/login']);
				}

			},
				(error) => {
					this.btn_disable = false;
					this.submitted = false;
					this.globals.isLoading = false;
					this.router.navigate(['/pagenotfound']);
				});
	}
	resetPassword(resetForm) {
		debugger
		let id = this.route.snapshot.paramMap.get('id');

		var id1 = new JwtHelper().decodeToken(id);
		this.resetpasswordEntity.UserId = id1.UserId;
		if (id1) {
			this.submitted = false;
		} else {
			this.resetpasswordEntity.UserId = 0;
			this.submitted = true;
		}
		if (resetForm.valid && !this.newconfsame) {
			this.globals.isLoading = true;
			this.btn_disable = true;
			this.ForgotResetService.resetPassword(this.resetpasswordEntity)
				.then((data) => {
					if (data = 'Code duplicate') {
						swal({
							position: 'top-end',
							type: 'success',
							title: 'Your Password changed successfully!',
							showConfirmButton: false,
							timer: 1500
						})

					} else {
						this.globals.isLoading = false;
						this.btn_disable = false;
						this.submitted = false;
						this.resetpasswordEntity = {};
						resetForm.form.markAsPristine();
					}
					this.router.navigate(['/login']);
				},
					(error) => {
						//alert('error');
						this.btn_disable = false;
						this.submitted = false;
						this.globals.isLoading = false;
						this.router.navigate(['/pagenotfound']);
					});

		}
	}

	confirmPassword() {
		if (this.resetpasswordEntity.ConfirmPassword != this.resetpasswordEntity.NewPassword) {
			this.newconfsame = true;
		} else {
			this.newconfsame = false;
		}
	}
}
