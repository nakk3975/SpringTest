package com.ahn.spring.test.ajax;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ahn.spring.test.ajax.bo.PensionBO;
import com.ahn.spring.test.ajax.model.Booking;

@Controller
@RequestMapping("/pension")
public class PensionController {

	@Autowired
	private PensionBO pensionBO;

	@GetMapping("/main")
	public String mainPage() {
		return "/ajax/pension/pension";
	}

	@GetMapping("list")
	public String listPage(Model model) {

		List<Booking> bookingList = pensionBO.bookingList();

		model.addAttribute("bookings", bookingList);

		return "ajax/pension/pensionReservation";
	}

	@GetMapping("booking")
	public String bookingPage() {
		return "ajax/pension/pensionBooking";
	}

	@PostMapping("/deleteList")
	@ResponseBody
	public Map<String, Boolean> deleteList(@RequestParam("id") int id) {

		Map<String, Boolean> result = new HashMap<>();

		result.put("result", pensionBO.deleteList(id));

		return result;
	}

	@PostMapping("/insert")
	@ResponseBody
	public Map<String, Boolean> insertReserve(@ModelAttribute Booking booking) {
		System.out.println("확인 " + booking.toString());
		
		Map<String, Boolean> result = new HashMap<>();
		
		result.put("result", pensionBO.insertReserve(booking));
		
		return result;
	}

}
