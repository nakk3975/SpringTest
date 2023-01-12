package com.ahn.spring.test.database;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ahn.spring.test.database.bo.StoreBO;
import com.ahn.spring.test.database.model.Store;

@Controller
public class StoreController {
	
	@Autowired
	public StoreBO storeBo;
	
	@ResponseBody
	@RequestMapping("/database/test01")
	public List<Store> test01() {
		List<Store> storeList = storeBo.getStoreList();
		return storeList;
	}
}
