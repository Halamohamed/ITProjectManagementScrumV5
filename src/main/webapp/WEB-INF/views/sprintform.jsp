<%--
  Created by IntelliJ IDEA.
  User: BTH
  Date: 2019-04-15
  Time: 13:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    <title>Sprint form</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

</head>
<body>
<div class="container">
    <h3 id="form_header" class="text-warning" align="center">Sprint Form</h3>
    <div>&nbsp;</div>
    <!-- Sprint input form to add a new sprint or update the existing sprint-->
    <c:url var="saveUrl" value="/api/sprint/save" />
    <form:form id="sprint_form" modelAttribute="sprintAttr" method="POST" action="${saveUrl}">
        <form:hidden path="id" />
        <label for="sprint_name">Enter Name: </label>
        <form:input id="sprint_name" cssClass="form-control" path="name" />
        <label for="sprint_name">Enter Goal: </label>
        <form:input id="sprint_name" cssClass="form-control" path="goal" />
        <label for="sprint_name">Enter Delivery: </label>
        <form:input id="sprint_name"  cssClass="form-control"  path="delivery" />
        <label for="sprint_name">Enter Retrospective: </label>
        <form:input id="sprint_name" cssClass="form-control" path="retrospective" />
        <label for="sprint_name">Enter Demo: </label>
        <form:input id="sprint_name" cssClass="form-control" path="demo" />
        <label for="sprint_name">Enter Review: </label>
        <form:input id="sprint_name" cssClass="form-control" path="review" />
        <label for="sprint_name">Enter Daily meeting: </label>
        <form:input id="sprint_name" cssClass="form-control" path="daily_meeting" />
        <div>&nbsp;</div>
        <button id="saveBtn" type="submit" class="btn btn-primary">Save</button>
        <c:url var="selectUrl" value="/api/sprint/detail/list" />

            <button id="selectBtn" type="submit" class="btn btn-primary">select team</button>
        <select>
            <c:forEach items="${teams}" var="team"/>
            <option value="${team.name}">${team.name}</option>

            <option value="${team.name}">${team.name}</option>
        </select>
        <a href="/api/task/tasks" target="_blank"><h4>-Tasks</h4></a>


    </form:form>
</div>


</body>
</html>
