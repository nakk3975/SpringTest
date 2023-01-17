package com.ahn.spring.test.jsp;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ahn.spring.test.jsp.bo.SellerBO;
import com.ahn.spring.test.jsp.model.Seller;

@Controller
@RequestMapping("/jsp/seller")
public class SellerController {

	@Autowired
	private SellerBO sellerBO;
	
	@PostMapping("/add")
	@ResponseBody
	public String addSeller(
			@RequestParam("nickname") String nickname
			, @RequestParam("image") String image
			, @RequestParam("temperature") double temperature
			) {
		
		int count = sellerBO.addSeller(nickname, image, temperature);
		return "삽입 결과 " + count;
	}
	
	@GetMapping("/input")
	public String sellerInput() {
		return "jsp/sellerinput";
	}
	
	@GetMapping("/sellerinfo")
	public String sellerParamInfo(
			Model model
			, @RequestParam(value = "id", required = false) Integer id) {
		Seller seller = sellerBO.sellerInfo(id);
		model.addAttribute("user", seller);
		return "/jsp/sellerinfo";
	}
	
	
}
