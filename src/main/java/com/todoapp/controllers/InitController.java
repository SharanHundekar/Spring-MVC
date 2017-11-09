package com.todoapp.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.todoapp.model.Task;
import com.todoapp.service.TaskService;


@Controller
public class InitController {
	
	@Autowired
	private TaskService taskservice;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView sayHello(Model model1) {
		
		ModelAndView model = new ModelAndView("index");
		List<Task> alltasks = taskservice.getTasks();
		
		model1.addAttribute("newTask", new Task());
		
		model.addObject("alltasks", alltasks);
		
		for (Task task : alltasks) {
			
			System.out.println(task.getName());
			System.out.println(task.getDesc());
			System.out.println(task.getStatus());
		}
		
		
		return model;
	}
	
}
