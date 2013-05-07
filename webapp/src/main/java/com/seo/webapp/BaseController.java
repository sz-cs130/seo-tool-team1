package com.seo.webapp;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
 
@Controller
public class BaseController {
	
	@RequestMapping(value="/search", method = RequestMethod.GET)
	public String search(ModelMap model) {
 
		model.addAttribute("message", "Maven Web Project + Spring 3 MVC - welcome()");
 
		return "index";
 
	}
 
	@RequestMapping(value="/welcome", method = RequestMethod.GET)
	public String welcome(ModelMap model) {
 
		model.addAttribute("message", "Maven Web Project + Spring 3 MVC - welcome()");
 
		//Spring uses InternalResourceViewResolver and return back sample.jsp
		return "sample";
 
	}

	@RequestMapping(value="/test", method = RequestMethod.GET)
	public String test(ModelMap model) {
 
		model.addAttribute("message", "Test completed successfully.");
 
		//Spring uses InternalResourceViewResolver and return back sample.jsp
		return "sample";
 
	}
 
 
	@RequestMapping(value="/welcome/{name}", method = RequestMethod.GET)
	public String welcomeName(@PathVariable String name, ModelMap model) {
 
		model.addAttribute("message", "Maven Web Project + Spring 3 MVC - " + name);
		return "sample";
 
	}
 
}
