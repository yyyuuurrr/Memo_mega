package com.cona.memo.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

// view 페이지를 위한 Controller
@Controller
@RequestMapping("/user")
public class UserController {
	
	@GetMapping("/join-view")
	public String joinInput() {		
		return "user/join";
		
	}
}
