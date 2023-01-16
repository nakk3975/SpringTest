package com.ahn.spring.test.mybatis.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.ahn.spring.test.mybatis.model.Estate;

@Repository
public interface EstateDAO {

	public Estate selectEstate(@Param("id") int id);
	
	public 
	List<Estate> selectRentPrice(@Param("rentPrice") int rent);
	
	public List<Estate> selectAreaPrice(
			@Param("area") int area
			 , @Param("price") int price);
	
	public int addEstate(
			Estate estate
			);
	
	public int addEstateByObject(
			@Param("realtorId") int realtorId
			, @Param("address") String address
			, @Param("area") int area
			, @Param("type") String type
			, @Param("price") int price
			, @Param("rentPrice") int rentPrice
			);
	
	public int updateEstate(
			@Param("id") int id
			, @Param("type") String type
			, @Param("price") int price
			);
	
	public int deleteEstate(@Param("id") int id);
}
