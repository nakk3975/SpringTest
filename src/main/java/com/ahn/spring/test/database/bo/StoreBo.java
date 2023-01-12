package com.ahn.spring.test.database.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ahn.spring.test.database.dao.StoreDAO;
import com.ahn.spring.test.database.model.Store;

@Service
public class StoreBo {
	
	@Autowired
	public StoreDAO storeDao;
	
	public List<Store> getStoreList() {
		List<Store> storeList = storeDao.selectStoreList();
		return storeList;
	}
}