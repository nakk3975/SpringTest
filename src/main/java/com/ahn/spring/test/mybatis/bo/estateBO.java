package com.ahn.spring.test.mybatis.bo;

import java.util.List;

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
}
