package com.ahn.spring.test.jsp.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface SellerDAO {

	public int addSeller(
			@Param("nickname") String nickname
			, @Param("image") String image
			, @Param("temperature") double temperature);
	
}
