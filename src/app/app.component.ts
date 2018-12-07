import { Component } from '@angular/core';
import { Globals } from './globals';
declare var $: any;

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  title = 'app';
  
  constructor(public globals: Globals) { }
  ngOnInit() {
   
  }
}
