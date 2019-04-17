<%--
  Created by IntelliJ IDEA.
  User: BTH
  Date: 2019-04-16
  Time: 14:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>Sub Task</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

</head>
<body>
<div class="container">
    <h2 id="article_header" class="text-warning" align="center">All sub tasks</h2>
    <div>&nbsp;</div>

    <!-- Div to add a new sub task to the mongo database -->
    <div id="add_new_subtask">
        <c:url var="addUrl" value="/api/subtask/add" /><a id="add" href="${addUrl}" class="btn btn-success">Add sub task</a>
    </div>
    <div>&nbsp;</div>
    <!-- Table to display the sub task list from the mongo database -->
    <table id="subtasks_table" class="table">
        <thead>
        <tr align="center">
            <th>Id</th>
            <th>Name</th>
            <th>Status</th>
            <th>Estimate</th>
            <th>Actual hours</th>
            <th>Users</th>
            <th colspan="2"></th>

        </tr>
        </thead>
        <tbody>
        <c:forEach items="${subtasks}" var="subtask">
            <tr align="center">
                <td><c:out value="${subtask.id}" /></td>
                <td><c:out value="${subtask.name}" /></td>
                <td><c:out value="${subtask.status}" /></td>
                <td><c:out value="${subtask.estimate}" /></td>
                <td><c:out value="${subtask.actualHours}" /></td>
                <td><c:out value="${subtask.users}" /></td>


                <td>
                    <c:url var="editUrl" value="/api/subtask/edit?id=${subtask.id}" /><a id="update" href="${editUrl}" class="btn btn-warning">Update</a>
                </td>
                <td>
                    <c:url var="deleteUrl" value="/api/subtask/delete?id=${subtask.id}" /><a id="delete" href="${deleteUrl}" class="btn btn-danger">Delete</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>


</body>
</html>
