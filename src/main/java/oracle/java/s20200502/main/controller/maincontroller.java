package oracle.java.s20200502.main.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class maincontroller {
	
	private static final Logger logger = LoggerFactory.getLogger(maincontroller.class);
	
	@RequestMapping("main")
	public String main(Model model) {
		model.addAttribute("message", "방문을 환영합니다.");
		return "main/main";
	}
	
	@RequestMapping(value = "searchList")
	public String searchList(Model model) {
		
		return "main/searchList";
		
	}
}
