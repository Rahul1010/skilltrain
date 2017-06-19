import { Component, OnInit } from '@angular/core';
import { Observable } from 'rxjs/Observable';

import { Http, Response, Headers, RequestOptions } from '@angular/http';
import 'rxjs/add/operator/map';

@Component({
  selector: 'app-employee-details',
  templateUrl: './employee-details.component.html',
  styleUrls: ['./employee-details.component.css']
})
export class EmployeeDetailsComponent implements OnInit {

    getData: string;
    showEditBtn: boolean = true;
    showDeleteBtn: boolean = true;
    data: string = '[{"id":1,"code":"REV100","name":"VIGHNESH S","rolesId":2,"emailid":"JEEVAVIGNESH@GMAIL.COM","phone":"8148285956","dateOfJoining":"2017-06-12","active":true},{"id":2,"code":"REV101","name":"RAHUL","rolesId":2,"emailid":"RAHUL@REVATURE.COM","phone":"9456873210","dateOfJoining":"2017-06-11","active":true},{"id":3,"code":"REV200","name":"AISHVARYA","rolesId":2,"emailid":"AISHWARYA@REVATURE.COM","phone":"8769542210","dateOfJoining":"2017-06-13","active":true},{"id":4,"code":"REV3","name":"VENKY","rolesId":2,"emailid":"VENKY@REVATURE.COM","phone":"7894563210","dateOfJoining":"2017-06-01","active":true},{"id":5,"code":"REV4","name":"RADHA","rolesId":1,"emailid":"RADHA@REVATURE.COM","phone":"9863657420","dateOfJoining":"2017-04-07","active":true},{"id":6,"code":"REV1","name":"MANI","rolesId":2,"emailid":"MANI@REVATURE.COM","phone":"9875856430","dateOfJoining":"2016-10-07","active":true},{"id":7,"code":"REV1000","name":"AYNNA","rolesId":2,"emailid":"AYNNA@MYNA.COM","phone":"9865769440","dateOfJoining":"2017-06-14","active":true}]';
    employeeDetails: object;

    constructor(private http: Http){
        this.getEmployeeDetails().subscribe(
                data =>this.employeeDetails = data,
                error => alert(error),
                () => console.log("Finished")
            )
            this.employeeDetails = JSON.parse(this.data);
    }

    getEmployeeDetails() {
    	return this.http.get('/employees')
    	.map(res => res.json())

    }

    makeEditable() {
      this.showEditBtn = false;
   }

    ngOnInit(){}
}
