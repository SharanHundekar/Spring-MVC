package com.todoapp.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.todoapp.model.Task;
import com.todoapp.service.TaskService;

@Controller
public class TaskController {

	@Autowired
	private TaskService taskService;
	
	@RequestMapping(value="/addNewTask",  method = RequestMethod.POST)
	public String addNewTask(@ModelAttribute("newTask") Task newTask) {
				
        taskService.addTask(newTask);
        
        return "redirect:/";
	}
	
	
	@RequestMapping(value = "/edit/{id}",  method = RequestMethod.GET)
	public ModelAndView editTask(@PathVariable("id") Integer id, Model modelObj) {
		
		modelObj.addAttribute("updateTask", new Task());
		
		ModelAndView modelView = new ModelAndView("editTask");
		Task task = taskService.getTask(id);
        
		modelView.addObject("taskDetails", task);
		
		return modelView;
		
	}
	
	@RequestMapping(value="/updateTask",  method = RequestMethod.POST)
	public String updateTask(@ModelAttribute("updateTask") Task updateTask) {
		
        taskService.updateTask(updateTask);     
        
        return "redirect:/";
	}
	
	@RequestMapping(value="/updateTaskStatus/{id}",  method = RequestMethod.GET)
	public String updateTaskStatus(@PathVariable("id") Integer id) {
	
        taskService.updateTaskStatusToFinished(id);
        
        return "redirect:/";
	}
	
	@RequestMapping(value="/deleteTask/{id}",  method = RequestMethod.GET)
	public String deleteTask(@PathVariable("id") Integer id) {
	
        taskService.deleteTask(id);
        
        return "redirect:/";
	}
}
