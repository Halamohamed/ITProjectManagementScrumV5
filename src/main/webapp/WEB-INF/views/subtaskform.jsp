<%--
  Created by IntelliJ IDEA.
  User: BTH
  Date: 2019-04-16
  Time: 14:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>Sub Task form</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <h3 id="form_header" class="text-warning" align="center">Sub Task Form</h3>
    <div>&nbsp;</div>

    <!-- Sub Task input form to add a new sub task or update the existing sub task-->
    <c:url var="saveUrl" value="/api/subtask/save" />
    <form:form id="task_form" modelAttribute="subtaskAttr" method="POST" action="${saveUrl}">
        <form:hidden path="id" />
        <label for="task_name">Enter Name: </label>
        <form:input id="task_name" cssClass="form-control" path="name" />
        <label for="task_name">Enter Status: </label>
        <form:input id="task_name" cssClass="form-control" path="status" />
        <label for="task_name">Enter Estimate: </label>
        <form:input id="task_name" cssClass="form-control" path="estimate" />
        <label for="task_name">Enter ActualHours: </label>
        <form:input id="task_name" cssClass="form-control" path="actualHours" />
        <label for="task_name">Enter Users: </label>
        <form:input id="task_name" cssClass="form-control" path="users" />
        <div>&nbsp;</div>
        <button id="saveBtn" type="submit" class="btn btn-primary">Save</button>
    </form:form>
</div>

</body>
</html>
