import { Component, OnInit } from '@angular/core';
import { Http } from '@angular/http';
import { Globals } from '.././globals';
import { Router } from '@angular/router';
import { ActivatedRoute } from '@angular/router';
import { GenerateEvaluationService } from '../services/generate-evaluation.service';
import { debug } from 'util';
import {IOption} from 'ng-select';
declare var $, unescape: any;
declare function myInput(): any;
declare var $, swal: any;
declare var $, PerfectScrollbar: any;

@Component({
  selector: 'app-generate-evaluation',
  templateUrl: './generate-evaluation.component.html',
  styleUrls: ['./generate-evaluation.component.css']
})
export class GenerateEvaluationComponent implements OnInit {
  evaluationEntity;
  myOptions: Array<IOption> = [
    {label: 'Belgium', value: 'BE'},
    {label: 'Luxembourg', value: 'LU'},
    {label: 'Netherlands', value: 'NL'}
];
// myOptions: Array<string> = ['1', '3'];
  constructor(private http: Http, public globals: Globals, private router: Router, private route: ActivatedRoute,
		private GenerateEvaluationService: GenerateEvaluationService) { }

  ngOnInit() {
    this.evaluationEntity={};
    setTimeout(function(){
			$('.form_date').datetimepicker({
				startDate : new Date(),
				weekStart: 1,
				todayBtn:  1,
				autoclose: 1,
				todayHighlight: 1,
				startView: 2,
				minView: 2
			});
			myInput();
		},500);
  }

}
