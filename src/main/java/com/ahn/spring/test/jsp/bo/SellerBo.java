package com.ahn.spring.test.jsp.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ahn.spring.test.jsp.dao.SellerDAO;

@Service
public class SellerBO {

	@Autowired
	private SellerDAO sellerDAO;
	
	public int addSeller(
			String nickname
			, String image
			, double temperature
			) {
		return sellerDAO.addSeller(nickname, image, temperature);
	}
	
}
