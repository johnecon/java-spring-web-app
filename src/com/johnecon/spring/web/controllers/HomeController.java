package com.johnecon.spring.web.controllers;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class HomeController {
	@RequestMapping("/")
	public String showHome(HttpServletRequest r) {
		System.out.println(r.getUserPrincipal());
		return "home";
	}
}
