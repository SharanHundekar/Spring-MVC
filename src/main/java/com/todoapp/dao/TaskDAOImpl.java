package com.todoapp.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.todoapp.model.Task;

@Repository
public class TaskDAOImpl implements TaskDAO {

	@Autowired
	private SessionFactory sessionFactory;

	private Session getCurrentSession() {
		return sessionFactory.getCurrentSession();
	}

	public void addTask(Task task) {
		getCurrentSession().save(task);

	}

	public void updateTask(Task task) {

		Task taskToUpdate = getTask(task.getId());

		taskToUpdate.setName(task.getName());
		taskToUpdate.setDesc(task.getDesc());
		taskToUpdate.setStatus(task.getStatus());

		getCurrentSession().update(taskToUpdate);

	}

	public void updateTaskStatusToFinished(int id) {

		Task taskToUpdate = getTask(id);		
		taskToUpdate.setStatus("Finished");
		getCurrentSession().update(taskToUpdate);

	}

	public Task getTask(int id) {
		Task task = (Task) getCurrentSession().get(Task.class, id);
		return task;
	}

	public void deleteTask(int id) {
		Task taskToDelete = getTask(id);
		if(taskToDelete!=null) {
			getCurrentSession().delete(taskToDelete);
		}
		
		

	}

	@SuppressWarnings("unchecked")
	public List<Task> getTasks() {

		return getCurrentSession().createQuery("from Task").list();

	}

}
