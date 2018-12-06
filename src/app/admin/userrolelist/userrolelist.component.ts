import { Component, OnInit } from '@angular/core';
import { Http } from '@angular/http';
import { Router } from '@angular/router';
import { ActivatedRoute } from '@angular/router';
import { UserroleService } from '../services/userrole.service';
import { Globals } from '.././globals';
declare var $: any;

@Component({
  selector: 'app-userrolelist',
  providers: [ UserroleService ],
  templateUrl: './userrolelist.component.html'
})
export class UserrolelistComponent implements OnInit {

  userroleList;
  deleteEntity;
	msgflag;
	message;
	type;
	
   constructor(private http: Http, private router: Router, private route: ActivatedRoute, private UserroleService: UserroleService, public globals: Globals) { }

  
  ngOnInit()
  {

		 setTimeout(function(){
			if ($("body").height() < $(window).height()) {  
				$('footer').addClass('footer_fixed');     
		}      
		else{  
				$('footer').removeClass('footer_fixed');    
		}
	  },100);
		
	this.UserroleService.getAll()
	
	.then((data) => 
	{
		this.userroleList = data;
				setTimeout(function(){
      $('#dataTables-example').dataTable( {
		  
		   responsive: {
            details: {
                display: $.fn.dataTable.Responsive.display.childRowImmediate,
                type: ''
            }
        },
		  scrollCollapse: true,
		  
		  
        "oLanguage": {
          "sLengthMenu": "_MENU_ Userrole per Page",
					"sInfo": "Showing _START_ to _END_ of _TOTAL_ Userrole",
					"sInfoFiltered": "(filtered from _MAX_ total Userrole)"
        }
      });
		},100); 
	
	}, 
	(error) => 
	{
	
		this.router.navigate(['/admin/pagenotfound']);	});	
	  this.msgflag = false;
  }
  
  deleteUserrole(userrole)
	{ 
		this.deleteEntity =  userrole;
		$('#Delete_Modal').modal('show');					
	}
  
  deleteConfirm(userrole)
	{ 
		var del={'Userid':this.globals,'id':userrole.RoleId};
		this.UserroleService.delete(del)
		.then((data) => 
		{
			let index = this.userroleList.indexOf(userrole);
			$('#Delete_Modal').modal('hide');
			if (index != -1) {
				this.userroleList.splice(index, 1);
	
			}			
	
			this.globals.message = 'Data Deleted successfully!';
			this.globals.type = 'success';
			this.globals.msgflag = true;
		}, 
		(error) => 
		{
			$('#Delete_Modal').modal('hide');
			if(error.text){
				// this.globals.message = "You can't delete this record because of their dependency!";
				// this.globals.type = 'danger';
				// this.globals.msgflag = true;
			}	
		});	
	}
  

}
