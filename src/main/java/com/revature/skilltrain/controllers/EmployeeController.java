package com.revature.skilltrain.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.revature.skilltrain.domains.Employee;
import com.revature.skilltrain.services.IEmployeeService;

@RestController
public class EmployeeController {

	@Autowired
	IEmployeeService empService;

	@GetMapping("/employess")
	public ResponseEntity<List<Employee>> getAllEmployees() {
		List<Employee> employees = null;
		employees = empService.getAllEmployees();
		return new ResponseEntity<List<Employee>>(employees, HttpStatus.OK);
	}
}
