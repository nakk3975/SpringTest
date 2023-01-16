package com.ahn.spring.test.mybatis.bo;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ahn.spring.test.mybatis.dao.EstateDAO;
import com.ahn.spring.test.mybatis.model.Estate;

@Service
public class EstateBO {

	@Autowired
	public EstateDAO estateDao;
	
	public Estate getEstate(int id) {
		Estate estate = estateDao.selectEstate(id);
		return estate;
	}
	
	public List<Estate> getRentPrice(int rent) {
		List<Estate> rentList = estateDao.selectRentPrice(rent);
		return rentList;
	}
	
	public List<Estate> getAreaPrice(int area, int price) {
		List<Estate> areaList = estateDao.selectAreaPrice(area, price);
		return areaList;
	}

	
	public int addEstate(Estate estate) {
		return estateDao.addEstate(estate);
	}
	
	public int addEstateByObject(
			int realtorId
			, String address
			, int area
			, String type
			, int price
			, int rentPrice) {
		return estateDao.addEstateByObject(realtorId, address, area, type, price, rentPrice);
	}
	
	// 변경할 대상 id, 변경할 type, 변경할 price
	public int updateEstate(int id, String type, int price) {
		return estateDao.updateEstate(id, type, price);
	}
	
	public int deleteEstate(int id) {
		return estateDao.deleteEstate(id);
	}
}
