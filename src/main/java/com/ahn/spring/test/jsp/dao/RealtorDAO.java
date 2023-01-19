package com.ahn.spring.test.jsp.dao;

import org.springframework.stereotype.Repository;

import com.ahn.spring.test.jsp.model.Realtor;

@Repository
public interface RealtorDAO {

	public int addRealtor(Realtor realtor);
}
