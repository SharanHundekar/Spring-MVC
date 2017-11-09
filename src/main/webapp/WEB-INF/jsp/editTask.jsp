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
<link href="../resources/core/css/materialize.min.css" rel="stylesheet"
	type="text/css" />
<link href="../resources/core/css/custom.css" rel="stylesheet"
	type="text/css" />

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Edit task</title>
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




	<div class="container">
		<div class="row">
			<div class="col s2"></div>
			<div class="col s8">
				<div class="card horizontal">
					<div class="card-stacked">
						<div class="card-content">
							<div class="row">
								<div class="col s12">
									<h5>Edit task</h5>
								</div>
							</div>
							<c:if test="${taskDetails != null}">
								<form:form id="editTaskForm" class="col s8 offset-s2"
									action="/fitness/updateTask" method="post"
									commandName="updateTask">
									<form:input path="id" value="${taskDetails.id}" type="hidden" />
									<div class="row">
										<div class="input-field col s12">
											<i class="material-icons prefix">create</i>
											<form:input id="icon_prefix" type="text" class="validate"
												value="${ taskDetails.name}" path="name"></form:input>
											<label for="icon_prefix">Update task Name</label>
										</div>

									</div>

									<div class="row">
										<div class="input-field col s12">
											<i class="material-icons prefix">create</i>
											<form:textarea id="textarea1" class="materialize-textarea"
												path="desc" />
											<label for="textarea1">Update task Description</label>
										</div>

									</div>

									<div class="row">
										<div class="input-field col s12">
											<i class="material-icons prefix">dehaze</i>
											<form:select path="status">
												<c:choose>
													<c:when test="${taskDetails.status == 'Started'}">
														<option value="Started" selected>"Started"</option>
														<option value="In Progress">In Progress</option>
														<option value="Finished" selected>Finished</option>

													</c:when>
													<c:when test="${taskDetails.status == 'In Progress'}">
														<option value="Started">Started</option>
														<option value="In Progress" selected>In Progress</option>
														<option value="Finished">Finished</option>

													</c:when>
													<c:when test="${taskDetails.status == 'Finished'}">
														<option value="Started">Started</option>
														<option value="In Progress">In Progress</option>
														<option value="Finished" selected>Finished</option>


													</c:when>
												</c:choose>
											</form:select>
											<label>Update task status</label>
										</div>
									</div>
									<div class="row">
										<div class="col s12 center-align">
											<button class="btn waves-effect waves-light" type="submit"
												name="action" onclick="return validate()">Update</button>
										</div>
									</div>
								</form:form>
							</c:if>
						</div>
					</div>

				</div>
			</div>
			<div class="col s2"></div>
		</div>

	</div>


	<script type="text/javascript" src="../resources/core/js/jquery.min.js"></script>
	<script type="text/javascript"
		src="../resources/core/js/materialize.min.js"></script>
	<script type="text/javascript">
		function validate() {

			var taskName = document.forms["editTaskForm"]["name"].value;
			var taskDesc = document.forms["editTaskForm"]["desc"].value;
			var taskStatus = document.forms["editTaskForm"]["status"].value;

			if (taskName == "" || taskDesc == "" || taskStatus == "") {
				alert("Fill out details");
				return false;
			} else {
				return true;
			}

		}

		$(document).ready(function() {
			// the "href" attribute of the modal trigger must specify the modal ID that wants to be triggered
			$('.modal').modal();
			$('select').material_select();
		});
	</script>
</body>
</html>