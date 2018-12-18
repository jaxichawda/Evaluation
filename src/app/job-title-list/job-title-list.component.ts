import { Component, OnInit } from '@angular/core';
import { Http } from '@angular/http';
import { Globals } from '.././globals';
import { Router } from '@angular/router';
import { ActivatedRoute } from '@angular/router';
import { JobTitleService } from '../services/job-title.service';
declare var $, swal: any;
declare function myInput(): any;
declare var $, Bloodhound: any;

@Component({
  selector: 'app-job-title-list',
  templateUrl: './job-title-list.component.html',
  styleUrls: ['./job-title-list.component.css']
})
export class JobTitleListComponent implements OnInit {
  jobtitleList;
  msgflag;
  deleteEntity;

  constructor(private http: Http, public globals: Globals, private router: Router, private route: ActivatedRoute,
    private JobTitleService: JobTitleService) { }

  ngOnInit() {
    debugger
    this.globals.isLoading = false;
    $('.buttons-excel').attr('data-original-title', 'Export to Excel').tooltip();
    $('.buttons-print').attr('data-original-title', 'Print').tooltip();

    setTimeout(function () {
      if ($(".bg_white_block").hasClass("ps--active-y")) {
        $('footer').removeClass('footer_fixed');
      }
      else {
        $('footer').addClass('footer_fixed');
      }
      $("#collapseExample6").addClass("in");
      $("#test_job_title").removeClass("collapsed");
      $("#test_job_title").attr("aria-expanded","true");
    }, 100);
    this.globals.isLoading = true;
    this.JobTitleService.getAllJobTitle()
      .then((data) => {
        debugger
        setTimeout(function () {
          var table = $('#dataTables-example').DataTable({
            // scrollY: '55vh',
            responsive: {
              details: {
                display: $.fn.dataTable.Responsive.display.childRowImmediate,
                type: ''
              }
            },
            scrollCollapse: true,
            "oLanguage": {
              "sLengthMenu": "_MENU_ Job Titles per Page",
              "sInfo": "Showing _START_ to _END_ of _TOTAL_ Job Titles",
              "sInfoFiltered": "(filtered from _MAX_ total Job Titles)",
              "sInfoEmpty": "Showing 0 to 0 of 0 Job Titles"
            },
            dom: 'lBfrtip',
            buttons: [
{
                extend: 'excel',
                title: 'Job Title List',
                exportOptions: {
                  columns: [0, 1, 2]
                }
              },
              {
                extend: 'print',
                title: 'Job Title List',
                exportOptions: {
                  columns: [0, 1, 2]
                }
              },
            ]
          });
		  
		   $('.buttons-excel').attr('data-original-title', 'Export to Excel').tooltip();
		   $('.buttons-print').attr('data-original-title', 'Print').tooltip();
        }, 100);

        this.jobtitleList = data;
        console.log(this.jobtitleList);
        this.globals.isLoading = false;	
      },
        (error) => {
          this.globals.isLoading = false;
          this.router.navigate(['/pagenotfound']);
        });
    this.msgflag = false;
  }
  isActiveChange(changeEntity, i) {
    if (this.jobtitleList[i].IsActive == 1) {
      this.jobtitleList[i].IsActive = 0;
      changeEntity.IsActive = 0;
    } else {
      this.jobtitleList[i].IsActive = 1;
      changeEntity.IsActive = 1;
    }
    this.globals.isLoading = true;
    changeEntity.UpdatedBy = 1;

    this.JobTitleService.isActiveChange(changeEntity)
      .then((data) => {
        this.globals.isLoading = false;	
        swal({
          position: 'top-end',
          type: 'success',
          title: 'Job Title updated successfully!',
          showConfirmButton: false,
          timer: 1500
        })

      },
        (error) => {
          this.globals.isLoading = false;
          this.router.navigate(['/pagenotfound']);
        });
  }
  deleteJobTitle(jobtitle) {
    this.deleteEntity = jobtitle;
    swal({
      title: 'Are you sure?',
      text: "You want to delete this Job Title?",
      type: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
      confirmButtonText: 'Yes, delete it!'
    })
      .then((result) => {
        if (result.value) {
          var del = { 'Userid': 1, 'id': jobtitle.JobTitleId, 'Name': jobtitle.JobTitleName };
          this.globals.isLoading = true;
          this.JobTitleService.deleteJobTitle(del)
            .then((data) => {
              let index = this.jobtitleList.indexOf(jobtitle);
              $('#Delete_Modal').modal('hide');
              if (index != -1) {
                this.jobtitleList.splice(index, 1);
              }
              this.globals.isLoading = false;
              swal({
                position: 'top-end',
                type: 'success',
                title: 'Job Title deleted successfully!',
                showConfirmButton: false,
                timer: 1500
              })
            },
              (error) => {
                $('#Delete_Modal').modal('hide');
                if (error.text) {
                  swal({
                    position: 'top-end',
                    type: 'success',
                    title: "You can't delete this record because of their dependency!",
                    showConfirmButton: false,
                    timer: 1500
                  })
                }
              });
        }
      })
  }

}
