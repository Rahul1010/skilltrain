package com.revature.skilltrain.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.revature.skilltrain.domains.EmployeeDetail;
import com.revature.skilltrain.services.IEmployeeService;

@RestController
public class EmployeeRestController {

	@Autowired
	IEmployeeService empService;

	@GetMapping("/employees")
	public ResponseEntity<List<EmployeeDetail>> getAllEmployees() {
		List<EmployeeDetail> employees = null;
		employees = empService.getAllEmployees();
		return new ResponseEntity<List<EmployeeDetail>>(employees, HttpStatus.OK);
	}
}
