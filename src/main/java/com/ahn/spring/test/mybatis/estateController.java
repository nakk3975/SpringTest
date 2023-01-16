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
@RequestMapping("/mybatis")
public class EstateController {
	
	@Autowired
	public EstateBO estateBo;
	
	@ResponseBody
	@RequestMapping("/test01/1")
	public Estate testIdSelect(@RequestParam("id") int id) {
		Estate result = estateBo.getEstate(id);
		return result;
	}
	
	@ResponseBody
	@RequestMapping("/test01/2")
	public List<Estate> testRentPrice(@RequestParam("rent") int rent) {
		List<Estate> result = estateBo.getRentPrice(rent);
		return result;
	}
	
	@ResponseBody
	@RequestMapping("/test01/3")
	public List<Estate> testArea(
			@RequestParam("area") int area 
			, @RequestParam("price") int price){
		List<Estate> result = estateBo.getAreaPrice(area, price);
		return result;
	}
	
	@ResponseBody
	@RequestMapping("/test02/1")
	public int insertEstate() {
		Estate estate = new Estate();
		estate.setRealtorId(3);
		estate.setAddress("푸르지용 리버 303동 1104호");
		estate.setArea(89);
		estate.setType("매매");
		estate.setPrice(100000);
		int count = estateBo.addEstate(estate);
		return count;
	}
	
	@ResponseBody
	@RequestMapping("/test02/2")
	public String insertEstateByObjcet(@RequestParam("id") int realtorId) {
		int count = estateBo.addEstateByObject(realtorId, "썅떼빌리버 오피스텔 814호", 45, "월세", 100000, 120);
		return "실행결과 " + count;
	}
	
	@ResponseBody
	@RequestMapping("/test03")
	public String updateEstate() {
		
		// id가 24인 매물의 타입을 전세 price를 70000로 변경
		int count = estateBo.updateEstate(24, "전세", 70000);
		return "수정사항 : " + count;
	}
	
	@ResponseBody
	@RequestMapping("/test04")
	public String deleteEstate(@RequestParam("id") int id) {
		int count = estateBo.deleteEstate(id);
		return "삭제 : " + count;
	}
}
