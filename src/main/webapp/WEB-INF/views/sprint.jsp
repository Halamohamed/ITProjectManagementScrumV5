<%--
  Created by IntelliJ IDEA.
  User: BTH
  Date: 2019-04-15
  Time: 13:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    <title>Sprint</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

</head>
<body>
<div class="container">
    <h2 id="article_header" class="text-warning" align="center">All sprints</h2>
    <div>&nbsp;</div>

    <!-- Div to add a new sprint to the mongo database -->
    <div id="add_new_sprint">
        <c:url var="addUrl" value="/api/sprint/add" /><a id="add" href="${addUrl}" class="btn btn-success">Add sprint</a>
    </div>
    <div>&nbsp;</div>
    <!-- Table to display the sprint list from the mongo database -->
    <table id="sprint_table" class="table">
        <thead>
        <tr align="center">

            <th>Name</th>
            <th>Goal</th>
            <th>Delivery</th>
            <th>Retrospective</th>
            <th>Demo</th>
            <th>Review</th>
            <th>Daily meeting</th>
            <th colspan="2"></th>

        </tr>
        </thead>
        <tbody>
        <c:forEach items="${sprints}" var="sprint">
            <tr align="center">
                <td><c:out value="${sprint.name}" /></td>
                <td><c:out value="${sprint.goal}" /></td>
                <td><c:out value="${sprint.delivery}" /></td>
                <td><c:out value="${sprint.retrospective}" /></td>
                <td><c:out value="${sprint.demo}" /></td>
                <td><c:out value="${sprint.review}" /></td>
                <td><c:out value="${sprint.daily_meeting}" /></td>
                <td>
                    <c:url var="editUrl" value="/api/sprint/edit?id=${sprint.id}" /><a id="update" href="${editUrl}" class="btn btn-warning">Update</a>
                </td>
                <td>
                    <c:url var="deleteUrl" value="/api/sprint/delete?id=${sprint.id}" /><a id="delete" href="${deleteUrl}" class="btn btn-danger">Delete</a>
                </td>

            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

</body>
</html>
