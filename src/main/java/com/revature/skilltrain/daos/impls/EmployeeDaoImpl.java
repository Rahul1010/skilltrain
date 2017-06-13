package com.revature.skilltrain.daos.impls;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.revature.skilltrain.daos.IEmployeeDao;
import com.revature.skilltrain.daos.impls.source.DataSourceConnector;
import com.revature.skilltrain.domains.Employee;

@Repository
public class EmployeeDaoImpl implements IEmployeeDao {

	@Autowired
	DataSourceConnector dsConnector;

	@Override
	public List<Employee> retrieveAllEmployees() {
		List<Employee> employees = null;

		Session session = dsConnector.getSession();
		session.beginTransaction();

		Query query = session.createQuery("from Employee");
		employees = query.list();
		return employees;
	}

}
