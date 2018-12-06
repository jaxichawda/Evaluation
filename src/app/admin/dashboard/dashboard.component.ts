import { Component, OnInit } from '@angular/core';
import { Http } from '@angular/http';
import { Globals } from '.././globals';
import { Router } from '@angular/router';
declare var $,unescape	: any;

@Component({
  selector: 'app-dashboard',
  templateUrl: './dashboard.component.html',
  styleUrls: ['./dashboard.component.css']
})
export class DashboardComponent implements OnInit {

  constructor() { }

  ngOnInit() {
    setTimeout(function(){
			if ($("body").height() < $(window).height()) {  
				$('footer').addClass('footer_fixed');     
		}      
		else{  
				$('footer').removeClass('footer_fixed');    
		}
	  },100);
  }

}
