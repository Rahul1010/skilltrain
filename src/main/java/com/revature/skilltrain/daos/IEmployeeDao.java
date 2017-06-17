package com.revature.skilltrain.daos;

import java.util.List;

import com.revature.skilltrain.domains.EmployeeDetail;


public interface IEmployeeDao {

	List<EmployeeDetail> retrieveAllEmployees();
}
