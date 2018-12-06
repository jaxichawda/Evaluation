import {  Component, OnInit, Inject,ViewChild,ElementRef } from '@angular/core';
import { Http } from '@angular/http';
import { Globals } from '.././globals';
import { Router } from '@angular/router';
import { ActivatedRoute } from '@angular/router';
import { CandidateuserService } from '../services/candidateuser.service';
declare var $,unescape,newWin,html2pdf: any;
declare var angular: any;
import { SampleModule } from 'angular-pdf-generator';
import * as jsPDF from 'jspdf';
import * as html2canvas from 'html2canvas';
declare var $,swal: any;

@Component({
  
  selector: 'app-candidatelist',
  providers: [CandidateuserService],
  templateUrl: './candidatelist.component.html',
  styleUrls: ['./candidatelist.component.css']
})
export class CandidatelistComponent implements OnInit {

  candidateList;
  deleteEntity;
  candidateEntity;
	msgflag;
	message;
  type;
  questionList;
  candidateData;
	submitted;
  btn_disable;
  fileExtension;
  
  @ViewChild('content')content:ElementRef;

  constructor(private http: Http, public globals: Globals,private elem: ElementRef, private router: Router, private route: ActivatedRoute,
		private CandidateuserService: CandidateuserService) { }

 
    ngOnInit()
    {
      
      this.candidateEntity=[];
      this.candidateList = [];
      this.candidateData = {};

    $('body').tooltip({
      selector: '[data-toggle="tooltip"], [title]:not([data-toggle="popover"])',
      trigger: 'hover',
      container: 'body'
      }).on('click mousedown mouseup', '[data-toggle="tooltip"], [title]:not([data-toggle="popover"])', function () {
      $('[data-toggle="tooltip"], [title]:not([data-toggle="popover"])').tooltip('destroy');
      });
	   $('.modal').on('hidden.bs.modal', function () {
			$('.right_content_block').removeClass('style_position');
	  });
      setTimeout(function(){
        if ($("body").height() < $(window).height()) {  
          $('footer').addClass('footer_fixed');     
      }      
      else{  
          $('footer').removeClass('footer_fixed');    
      }
      },100);

      this.globals.isLoading = true;
      this.CandidateuserService.getAllDefaultData()
      .then((data) => {
        this.questionList = data['question'];
      },
      (error) => {
        //alert('error');   
      });

     
    this.CandidateuserService.getAll()

    .then((data) => 
    {
      
      this.candidateList = data;
      setTimeout(function(){
      var table = $('#dataTables-example').DataTable( {
		  responsive: {
            details: {
                display: $.fn.dataTable.Responsive.display.childRowImmediate,
                type: ''
            }
        },
		  scrollCollapse: true,
          "oLanguage": {
            "sLengthMenu": "_MENU_ Candidates per Page",
            "sInfo": "Showing _START_ to _END_ of _TOTAL_ Candidates",
            "sInfoFiltered": "(filtered from _MAX_ total Candidates)"
          },
      dom: 'lBfrtip',
          buttons: [
                //'pageLength','print','excel'
               ]
        });
        var buttons = new $.fn.dataTable.Buttons(table, {
          buttons: [
              {
              extend: 'excel',
              title: 'Candidate List',
              exportOptions: {
                columns: [ 0, 1, 2, 3, 4, 5, 6 ]
                  }
                },
                  {
                  extend: 'print',
                  title: 'Candidate List',
                  exportOptions: {
                  columns: [ 0, 1, 2, 3, 4, 5, 6 ]
                  }
                },
              ]
            }).container().appendTo($('#buttons'));
          
          $('.buttons-excel').attr('data-original-title', 'Export All Candidates').tooltip();
          $('.buttons-print').attr('data-original-title', 'Print').tooltip();
          
          $('#dataTables-example').dataTable();
          $('#dataTables-example_filter input').addClass('input-sm');
        
        
        $(".user").addClass("selected");
    },500); 
      this.globals.isLoading = false;
    }, 
    (error) => 
    {
      this.msgflag = false;
      this.globals.isLoading = false;
    	});	
     
    }


        deleteCompany(CandidateId)
      { 
        

        this.CandidateuserService.getAllDefaultData()
        .then((data) => {
        
          this.questionList = data['question'];
        
        
        },
        (error) => {
          //alert('error');
          
        });
        this.CandidateuserService.getById(CandidateId)
        .then((data) => {
          this.candidateData = data['Users'];
          this.questionList = data['QuestionAnswer'];
        
          $('#Delete_Modal').modal('show');
		  $('.right_content_block').addClass('style_position');
            
        },
        (error) => {
          alert('error');
            
        });
      

                
      } 

      viewCandidate(CandidateId)
      { 
        debugger
          this.CandidateuserService.getById(CandidateId)
            .then((data) => {
              this.candidateData = data['Users'];
              this.questionList = data['QuestionAnswer'];
              console.log(this.questionList);
              
          
              setTimeout(function(){
                var innerContents = document.getElementById('printSectionId').innerHTML;
                var popupWinindow = window.open('', '_blank', 'width=600,height=700,scrollbars=no,menubar=no,toolbar=no,location=no,status=no,titlebar=no');
                popupWinindow.document.open();
                popupWinindow.document.write(innerContents);
                popupWinindow.document.close();
                popupWinindow.print();
                popupWinindow.close();
              }, 1000);      	
            },
            (error) => {
              alert('error');
                
            });
          
      }
  
      download(){
        let doc = new jsPDF();
        let specialElementHandlers ={
            '#editor':function(element,renderer){
              return true;
            }
        };
        let content=this.content.nativeElement;
      
        doc.fromHTML(content.innerHTML,15,15,{
          'width':190,
          'elementHandlers':specialElementHandlers
        });
        doc.save('Candidate.pdf');   
      }
            
      public downloadPDF(CandidateId) 
        {
      debugger
      let doc = new jsPDF();
      let specialElementHandlers ={
          '#editor':function(element,renderer){
            return true;
          }
      };
      let content=this.content.nativeElement;

      doc.fromHTML(content.innerHTML,15,15,{
        'width':190,
        'elementHandlers':specialElementHandlers
      });
      doc.save('Candidate.pdf');  

      }

      uploadFile(CandidateId)
      {debugger
        this.globals.isLoading = true;
          //  Use for file upload script start
          const body = document.querySelector('body');
          var count = jQuery(window).height() - 270;
          body.style.setProperty('--screen-height', count + "px");
       
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
					title: 'Please Input PDF File',
					showConfirmButton: false,
					timer: 1500
        })
        
			}
			
			

			//console.log (fileExtension);
		});
    //  Use for file upload script end
    this.candidateEntity = {};
   this.candidateEntity.CandidateId=CandidateId;
        this.CandidateuserService.getById(CandidateId)
        .then((data) => {
          this.candidateData = data['Users'];
        
          $('#Upload_Modal').modal('show');
		  $('.right_content_block').addClass('style_position');
        
            this.globals.isLoading = false;
        },
        (error) => {
          alert('error');
          this.globals.isLoading = false;
        });
       
      }

      addUser(candidateForm) {
        debugger
        let id = this.route.snapshot.paramMap.get('CandidateId');
    
        let file2 = this.elem.nativeElement.querySelector('#Favicon').files[0];
        var fd = new FormData();
        if (file2) {
          var favicon = Date.now()+'_'+file2['name'];
          fd.append('favicon', file2,favicon);
          this.candidateEntity.Faviconicon = Date.now()+'_'+file2['name'];
          var fileName = file2['name'];
          var fileExtension = fileName.substr((fileName.lastIndexOf('.') + 1));
          this.candidateEntity.CandidateHrForm = this.candidateEntity.Faviconicon;
        } else {
          fd.append('favicon', null);
          this.candidateEntity.Faviconicon = null;
        }
        this.submitted = true;
        if (candidateForm.valid && fileExtension == 'pdf') { debugger
          this.CandidateuserService.add({ 'candidatevalue': this.candidateEntity })
            .then((data) => {
    
              if (file2) {
                this.CandidateuserService.uploadFile(fd,this.candidateEntity.CandidateId)
              //  this.CandidateuserService.uploadFile(fd)
                  .then((data) => {
                    this.btn_disable = false;
                    this.submitted = false;
    
                    candidateForm.form.markAsPristine();
                    if (id) {
    
                      swal({
                        position: 'top-end',
                        type: 'success',
                        title: 'File uploaded successfully!',
                        showConfirmButton: false,
                        timer: 1500
                      })
                    } else {
    
                      swal({
                        position: 'top-end',
                        type: 'success',
                        title: 'File uploaded successfully!',
                        showConfirmButton: false,
                        timer: 1500
                      })
                    }
                  
                      

                    window.location.reload();
                    //this.router.navigate(['/admin/candidate/list']);
    
                  }, (error) => {
                      this.btn_disable = false;
                      this.submitted = false;
    
                      this.router.navigate(['/pagenotfound']);
                    });
              } else {
                this.btn_disable = false;
                this.submitted = false;
                //	this.CourseEntity = {};
                candidateForm.form.markAsPristine();
                if (id) {
    
                  swal({
                    position: 'top-end',
                    type: 'success',
                    title: 'File uploaded successfully!',
                    showConfirmButton: false,
                    timer: 1500
                  })
                } else {
    
                  swal({
                    position: 'top-end',
                    type: 'success',
                    title: 'File uploaded successfully!',
                    showConfirmButton: false,
                    timer: 1500
                  })
                }
                window.location.reload();
                //this.router.navigate(['/admin/candidate/list']);
              }
    
    
            }, (error) => {
             
              this.btn_disable = false;
              this.submitted = false;
    
              
            });
        }
        else {
    
          swal({
            position: 'top-end',
            type: 'danger',
            title: 'Please select PDF file!',
            showConfirmButton: false,
            timer: 1500
          })
        }
       // window.location.reload();
                //this.router.navigate(['/admin/candidate/list']);
      }

 

}
