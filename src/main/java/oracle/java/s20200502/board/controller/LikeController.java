package oracle.java.s20200502.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class LikeController {
	
	public static int count = 0;
	
	@RequestMapping(value="boardLike", method=RequestMethod.POST)
	@ResponseBody
	public String boardLike (@RequestParam String flag) {
		
		return ("plus".equals(flag)) ? String.valueOf(++count) : String.valueOf(--count);
	}
}
