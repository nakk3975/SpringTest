package com.ahn.spring.test.mybatis.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.ahn.spring.test.mybatis.model.Estate;

@Repository
public interface EstateDAO {

	public Estate selectEstate(@Param("id") int id);
	
	public List<Estate> selectRentPrice(@Param("rentPrice") int rent);
	
	public List<Estate> selectAreaPrice(@Param("area") int area, @Param("price") int price);
}
