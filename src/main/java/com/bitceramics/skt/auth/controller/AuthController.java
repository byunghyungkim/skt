package com.bitceramics.skt.auth.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.luuf.core.spring.controller.ControllerCore;

/**
 * User authentication controller
 * @author patrick
 *
 */
@Controller
public class AuthController extends ControllerCore {

	@RequestMapping(value="/login")
	public String login() {
		return "auth/login";
	}
	
	@RequestMapping(value="/logout")
	public String logout() {
		return "auth/login";
	}
	
	@RequestMapping(value="/loginFailed")
	public String loginFailed(Model model) {
		markError(model, "Access Denied! Please check user email and password");
		return "auth/login";
	}
	
	@RequestMapping(value="/invalidSession")
	public String invalidSession() {
		return "auth/invalidSession";
	}
}
