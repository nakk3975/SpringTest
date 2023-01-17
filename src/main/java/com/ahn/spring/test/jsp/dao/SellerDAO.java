package com.ahn.spring.test.jsp.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.ahn.spring.test.jsp.model.Seller;

@Repository
public interface SellerDAO {

	public int addSeller(
			@Param("nickname") String nickname
			, @Param("image") String image
			, @Param("temperature") double temperature);
	
	public Seller sellerInfo(@Param("id") Integer id);
	public Seller lastSellerInfo();
	
}
