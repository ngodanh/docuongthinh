/**
 * 
 */
package net.codejava.spring.controller;

import java.io.IOException;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * @author Administrator
 *
 */
@Controller
public class DesignOnlineController {
	
	@RequestMapping("/design-online.html")
	public ModelAndView initPage(ModelAndView model) throws IOException{
		model.setViewName("online-design/index");
		return model;
	}
}
