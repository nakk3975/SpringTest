package com.ahn.spring.test.mybatis;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ahn.spring.test.mybatis.bo.EstateBO;
import com.ahn.spring.test.mybatis.model.Estate;

@Controller
public class EstateController {
	
	@Autowired
	public EstateBO estateBo;
	
	@ResponseBody
	@RequestMapping("/mybatis/test01/1")
	public Estate testIdSelect(@RequestParam("id") int id) {
		Estate result = estateBo.getEstate(id);
		return result;
	}
	
	@ResponseBody
	@RequestMapping("/mybatis/test01/2")
	public List<Estate> testRentPrice(@RequestParam("rent") int rent) {
		List<Estate> result = estateBo.getRentPrice(rent);
		return result;
	}
	
	@ResponseBody
	@RequestMapping("/mybatis/test01/3")
	public List<Estate> testArea(@RequestParam("area") int area, @RequestParam("price") int price){
		List<Estate> result = estateBo.getAreaPrice(area, price);
		return result;
	}
}
