<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ page import = "com.mysql.jdbc.*" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<sql:query dataSource="jdbc/employees" var="employee">
    SELECT * FROM employees WHERE emp_no = ?
    <sql:param value="${param.id}" />
</sql:query>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Employee Update</title>
</head>
<body>
<h1>Employee <c:out value="${param.id}"/></h1>
<c:forEach var="e" items="${employee.rows}">
    <form action="employees-controller">
        <input type="hidden" name="cmd" value="update"/>
        <input type="hidden" name="empNo" value='<c:out value="${param.id}"/>'/>
        <table>
            <tr>
                <td>First Name</td>
                <td><input type="text" name="firstName" value='<c:out value="${e.first_name}"/>'></td>
            </tr>
            <tr>
                <td>Last Name</td>
                <td><input type="text" name="lastName" value='<c:out value="${e.last_name}"/>'></td>
            </tr>
            <tr>
                <td>Gender</td>
                <td>
                    <select name="gender" value='<c:out value="${e.gender}"/>'>
                        <option value="M">M</option>
                        <option value="F">F</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>Birth Date (Ex. 1997/01/01)</td>
                <td><input type="text" name="birthDate" value='<c:out value="${e.birth_date}"/>'></td>
            </tr>
            <tr>
                <td>Hire Date (Ex. 2018/01/01)</td>
                <td><input type="text" name="hireDate" value='<c:out value="${e.hire_date}"/>'></td>
            </tr>
            <tr>
                <td colspan="2">
                    <input type="submit" value="Update">
                </td>
            </tr>
        </table>
</c:forEach>

</body>
</html>