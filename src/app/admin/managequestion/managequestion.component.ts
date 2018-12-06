import { Component, OnInit } from '@angular/core';
import { Http } from '@angular/http';
import { Globals } from '.././globals';
import { Router } from '@angular/router';
import { ActivatedRoute } from '@angular/router';
import { ManagequestionService } from '../services/managequestion.service';
declare var $: any;
declare function myInput() : any;
declare var $,swal: any;

@Component({
  selector: 'app-managequestion',
  providers: [ManagequestionService],
  templateUrl: './managequestion.component.html',
  styleUrls: ['./managequestion.component.css']
})
export class ManagequestionComponent implements OnInit {

  queAnsTypeList;
  questionEntity;
	submitted;
	btn_disable;
	header;
	msgflag;
	message;
  type;
  QuestionList;
  QuestionType;
  QuestionAnswer;
    
  constructor(private http: Http, public globals: Globals, private router: Router, private route: ActivatedRoute,
		private ManagequestionService: ManagequestionService) { }

  ngOnInit() {
    debugger

    setTimeout(function(){
			if ($("body").height() < $(window).height()) {  
				$('footer').addClass('footer_fixed');     
		}      
		else{  
				$('footer').removeClass('footer_fixed');    
		}
    },100);
    const body = document.querySelector('body');
    var count = jQuery(window).height() - 270;
    body.style.setProperty('--screen-height', count+"px");
    
    this.questionEntity = {};
    
    this.questionEntity.QuestionId = 0;
    
    var item = { 'QLabel': '','QValue': ''};
    
  this.QuestionList = [];
  this.QuestionList.push(item);

    if ($("body").height() < $(window).height()) {  
      $('footer').addClass('footer_fixed');     
  }      
  else{  
      $('footer').removeClass('footer_fixed');    
  }
  	this.questionEntity={};
    this.questionEntity.AnswerTypeId='';
      this.ManagequestionService.getAllDefaultData()
      .then((data) => {
        this.queAnsTypeList = data['quetypeans'];
       // this.questionEntity = data['quetype'];   
       // this.QuestionList = data['typeans'];
      },
      (error) => {
        //alert('error');
        
      });

	 
      let id = this.route.snapshot.paramMap.get('id');
     if(id)
     {	
     //  this.header = 'Edit';
     
      this.ManagequestionService.getById(id)
        .then((data) => 
        {
         // this.questionEntity=data;
          this.questionEntity=data;
          this.questionEntity = data['quetype'];   
           this.QuestionList = data['typeans'];
        
          
        }, 
        (error) => 
        {
          //alert('error');
          this.btn_disable = false;
          this.submitted = false;
        
        });
     }
     else
     {
         this.questionEntity = {};
         this.questionEntity.QuestionId = 0;
         this.questionEntity.AnswerTypeId ='';
          this.questionEntity.IsActive = '1';
        
     }
  

  }

  Reset()
  {
    debugger
    this.QuestionList = [];
    var item = { 'QLabel': '', 'QValue': '', 'CreatedBy': 1, 'UpdatedBy':1};
    this.QuestionList.push(item);
    setTimeout(function(){
      myInput();
       },100);
  }

  AddNewQuestion(index){ 
    
    var item = { 'QLabel': '', 'QValue': '', 'CreatedBy': 1, 'UpdatedBy':1};
    if (this.QuestionList.length <= index + 1) {
      this.QuestionList.splice(index + 1, 0, item);
    }  
    setTimeout(function(){
      myInput();
       },100);
    }
  
    DeleteQuestion(item){
       
    var index = this.QuestionList.indexOf(item);	
    this.QuestionList.splice(index, 1);		
    }


  addQuestion(questionForm) {
		debugger
			
      let id = this.route.snapshot.paramMap.get('id');
      if (id) {
        this.questionEntity.UpdatedBy = this.globals.authData.UserId;
        this.submitted = false;
      } else {
        this.questionEntity.CreatedBy = this.globals.authData.UserId;
        this.questionEntity.UpdatedBy = this.globals.authData.UserId;
        this.questionEntity.QuestionId=0;
        this.submitted = true;
      }
     
      this.submitted = true;
			if (questionForm.valid) {
				
        this.submitted = false;
        var addque={'question1':this.QuestionList,'question':this.questionEntity};
				this.ManagequestionService.add(addque)
					.then((data) => {

					
						//alert('success');
						this.btn_disable = false;
						this.submitted = false;
						this.questionEntity = {};
						questionForm.form.markAsPristine();
						if (id) {
              swal({
                position: 'top-end',
                type: 'success',
                title: 'Question updated successfully!',
                showConfirmButton: false,
                timer: 1500
              })
						} else {
              swal({
                position: 'top-end',
                type: 'success',
                title: 'Question added successfully!',
                showConfirmButton: false,
                timer: 1500
              })
						}						
							this.router.navigate(['/admin/question/list']);
					},
					(error) => {
						//alert('error');
						this.btn_disable = false;
						this.submitted = false;
						
						//this.router.navigate(['/admin/pagenotfound']);
					});
			}
		}
	



}