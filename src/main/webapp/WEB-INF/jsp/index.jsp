<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet" />
<link href="./resources/core/css/materialize.min.css" rel="stylesheet"
	type="text/css" />
<link href="./resources/core/css/custom.css" rel="stylesheet"
	type="text/css" />

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>ToDo App</title>
</head>
<body>
	<div class="headerLbl">
		<div class="container">
			<div class="row">
				<div class="center-align">
					<h4>
						<spring:message code="page.welcomemsg" />
					</h4>
				</div>
			</div>
		</div>
	</div>

	<!-- Fab icon to add new task -->
	<div class="fabIcon right-align">
		<a
			class="btn-floating btn-large waves-effect waves-light appColor tooltipped modal-trigger"
			href="#modal1" data-position="top" data-delay="50"
			data-tooltip="Add new task"> <i class="material-icons">add</i>
		</a>
	</div>

	<c:choose>
		<c:when test="${alltasks!= null && fn:length(alltasks) == 0}">
			<div class="container noTaskMsgCard">
				<div class="row">
					<div class="col s2"></div>
					<div class="col s8">
						<div class="col s12">
							<div class="card horizontal">
								<div class="card-stacked center-align">
									<div class="card-content">
										<h3>No tasks found</h3>
										<br />
										<p>Please add new task in order to track your work
											progress.</p>
									</div>
									<div class="card-action">
										<a class="waves-effect waves-light btn modal-trigger"
											href="#modal1">Add task</a>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col s2"></div>
				</div>
			</div>
		</c:when>
		<c:otherwise>
			<c:forEach var="task" items="${alltasks}">

				<div class="container">
					<div class="row">
						<div class="col s2"></div>
						<div class="col s8">
							<div class="col s12">
								<div class="card horizontal">
									<div class="card-stacked">
										<div class="card-content">
											<div class="row">
												<div class="col s8 left-align">
													<c:if test="${task.status == 'Finished'}">
														<h5>
															<strike>${task.name}</strike>
														</h5>
													</c:if>
													<c:if
														test="${task.status == 'Started' || task.status == 'In Progress'}">
														<h5>
															${task.name}
														</h5>
													</c:if>
												</div>
												<div class="col s4 right-align taskStatusLbl">
													
													<c:if test="${task.status == 'Finished'}">
														<span>${task.status}</span>
													</c:if>
													<c:if
														test="${task.status == 'Started' || task.status == 'In Progress'}">
														<h6>${task.status}</h6>
													</c:if>
												</div>
											</div>

											<c:if test="${task.status == 'Finished'}">

												<p>
													<strike>${task.desc}</strike>
												</p>

											</c:if>
											<c:if
												test="${task.status == 'Started' || task.status == 'In Progress'}">

												<p>
													${task.desc}
												</p>

											</c:if>

										</div>
										<div class="card-action">
											<div class="center-align">
												<a href="<c:url value="/edit/${task.id}" />"><i
													class="material-icons col s4 appColor tooltipped"
													data-position="top" data-delay="50"
													data-tooltip="Edit task">edit</i></a> <a
													href="<c:url value="/updateTaskStatus/${task.id}" />"><i
													class="material-icons col s4 appColor tooltipped"
													data-position="top" data-delay="50"
													data-tooltip="Task finished">done</i></a> <a
													href="<c:url value="/deleteTask/${task.id}" />"><i
													class="material-icons col s4 appColor tooltipped"
													data-position="top" data-delay="50"
													data-tooltip="Delete task">delete</i></a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col s2"></div>
					</div>
				</div>
			</c:forEach>
		</c:otherwise>
	</c:choose>



	<!-- Modal Structure -->
	<div id="modal1" class="modal">
		<div class="modal-content">
			<h5>Add task</h5>
			<hr />
			<div class="row">
				<form:form id="newTaskForm" action="/fitness/addNewTask"
					class="col s8 offset-s2" method="post" commandName="newTask">
					<div class="row">
						<div class="input-field col s12">
							<i class="material-icons prefix">create</i>
							<form:input id="icon_prefix" type="text" class="validate"
								path="name" />
							<label for="icon_prefix">Task Name</label>
						</div>

					</div>
					<div class="row">
						<div class="input-field col s12">
							<i class="material-icons prefix">create</i>
							<form:textarea id="textarea1" class="materialize-textarea"
								path="desc" />
							<label for="textarea1">Task Description</label>
						</div>

					</div>
					<div class="row">
						<div class="input-field col s12">
							<i class="material-icons prefix">dehaze</i>
							<form:select path="status">
								<option value="" disabled selected>Choose your option</option>
								<option value="Started">Started</option>
								<option value="In Progress">In Progress</option>
								<option value="Finished">Finished</option>
							</form:select>
							<label>Materialize Select</label>
						</div>

					</div>
					<div class="row">
						<div class="col s12 center-align">
							<button class="btn waves-effect waves-light" type="submit"
								name="action" onclick="return validate()">Add</button>
						</div>
					</div>
				</form:form>
			</div>
		</div>
	</div>

	<script type="text/javascript" src="./resources/core/js/jquery.min.js"></script>
	<script type="text/javascript"
		src="./resources/core/js/materialize.min.js"></script>
	<script type="text/javascript">
		function validate() {

			var taskName = document.forms["newTaskForm"]["name"].value;
			var taskDesc = document.forms["newTaskForm"]["desc"].value;
			var taskStatus = document.forms["newTaskForm"]["status"].value;

			if (taskName == "" || taskDesc == "" || taskStatus == "") {
				alert("Fill out details");
				return false;
			} else {

				return true;
			}

		}

		function confirmDelete() {

		}

		$(document).ready(function() {
			// the "href" attribute of the modal trigger must specify the modal ID that wants to be triggered
			$('.modal').modal();
			$('select').material_select();
		});
	</script>
</body>
</html>