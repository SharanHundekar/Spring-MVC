package com.todoapp.dao;

import java.util.List;

import com.todoapp.model.Task;


public interface TaskDAO {

	public void addTask(Task team);
	public void updateTask(Task team);
	public void updateTaskStatusToFinished(int id);
	public Task getTask(int id);
	public void deleteTask(int id);
	public List<Task> getTasks();
}
