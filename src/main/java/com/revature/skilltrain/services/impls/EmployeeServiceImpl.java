package com.revature.skilltrain.services.impls;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.revature.skilltrain.daos.IEmployeeDao;
import com.revature.skilltrain.domains.EmployeeDetail;
import com.revature.skilltrain.services.IEmployeeService;

@Service
public class EmployeeServiceImpl implements IEmployeeService {

	@Autowired
	IEmployeeDao employeeDao;

	@Override
	public List<EmployeeDetail> getAllEmployees() {
		return employeeDao.retrieveAllEmployees();
	}

}
