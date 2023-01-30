package com.ahn.spring.test.ajax;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ahn.spring.test.ajax.bo.FavoriteBO;
import com.ahn.spring.test.ajax.model.Favorite;

@Controller
@RequestMapping("/ajax/favorite")
public class AjaxController {

	@Autowired
	private FavoriteBO favoriteBO;
	
	@GetMapping("/list")
	public String favoriteList(Model model) {
		
		List<Favorite> favoriteList = favoriteBO.favoriteList();
		
		model.addAttribute("favorites", favoriteList);
		
		return "ajax/favoriteList";
	}
	
	@GetMapping("/input")
	public String favoriteInput() {
		return "ajax/favoriteadd";
	}
	
	@PostMapping("/add")
	@ResponseBody
	public Map<String, String> favoriteAdd(
			@RequestParam("name") String name
			, @RequestParam("url") String url
			) {
		
		int count = favoriteBO.favoriteAdd(name, url);
		
		Map<String, String> result = new HashMap<>();
		if(count == 1) {
			result.put("result", "success");
		} else {
			result.put("result", "fail");
		}
		return result;
	}
	
	@PostMapping("/urlCheck")
	@ResponseBody
	public Map<String, Boolean> checkUrl(@RequestParam("url") String url) {
		Map<String, Boolean> result = new HashMap<>(); 
		
		result.put("urlCheck", favoriteBO.checkUrl(url));

		return result;
	}

	@PostMapping("/deleteUrl")
	@ResponseBody
	public Map<String, Boolean> favoriteDelete(
			@RequestParam("id") int id) {
		Map<String, Boolean> result = new HashMap<>();

		result.put("deleteUrl", favoriteBO.favoriteDelete(id));

		return result;
	}
}
