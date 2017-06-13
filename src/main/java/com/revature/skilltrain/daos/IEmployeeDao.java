package com.revature.skilltrain.daos;

import java.util.List;

import com.revature.skilltrain.domains.Employee;


public interface IEmployeeDao {

	List<Employee> retrieveAllEmployees();
}
