package com.todoapp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.todoapp.dao.TaskDAO;
import com.todoapp.model.Task;

@Service
@Transactional
public class TaskServiceImpl implements TaskService {

	@Autowired
	private TaskDAO taskDao;

	public void addTask(Task task) {
		taskDao.addTask(task);

	}

	public void updateTask(Task task) {

		taskDao.updateTask(task);

	}

	public void updateTaskStatusToFinished(int id) {

		taskDao.updateTaskStatusToFinished(id);

	}

	public Task getTask(int id) {

		return taskDao.getTask(id);
	}

	public void deleteTask(int id) {
		taskDao.deleteTask(id);

	}

	public List<Task> getTasks() {
		return taskDao.getTasks();

	}

}
