<%--
  Created by IntelliJ IDEA.
  User: sittisak
  Date: 4/10/18
  Time: 13:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ page import = "com.mysql.jdbc.*" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Product</title>
</head>
<body>
<h1>Add Employees</h1>
<form action="employees-controller">
    <table>
        <tr>
            <td>Employee No</td>
            <td><input type="text" name="empNo"></td>
        </tr>
        <tr>
            <td>First Name</td>
            <td><input type="text" name="firstName"></td>
        </tr>
        <tr>
            <td>Last Name</td>
            <td><input type="text" name="lastName"></td>
        </tr>
        <tr>
            <td>Gender</td>
            <td>
                <select name="gender">
                        <option value="M">M</option>
                        <option value="F">F</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>Birth Date (Ex. 1997/01/01)</td>
            <td><input type="text" name="birthDate"></td>
        </tr>
        <tr>
            <td>Hire Date (Ex. 2018/01/01)</td>
            <td><input type="text" name="hireDate"></td>
        </tr>
        <tr>
            <td colspan="2">
                <input type="submit" value="Create">
            </td>
        </tr>
    </table>
</form>

</body>
</html>