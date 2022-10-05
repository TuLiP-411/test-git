<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: LINH
  Date: 9/30/2022
  Time: 3:21 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User Management Application</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        .sortButton {
            border: none;
            background: none;
            color: #969696;
        }

        .sortButton:hover {
            background: #cdcbcb;
            color: black;
        }

        .button_plus {
            position: absolute;
            width: 30px;
            height: 30px;
            background: #fff;
            cursor: pointer;
            border: 2px solid #095776;
            top: 18%;
            left: 55%;
        }

        .button_plus:after {
            content: '';
            position: absolute;
            transform: translate(-50%, -50%);
            height: 4px;
            width: 50%;
            background: #095776;
            top: 50%;
            left: 50%;
        }

        .button_plus:before {
            content: '';
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background: #095776;
            height: 50%;
            width: 4px;
        }

        .button_plus:hover:before,
        .button_plus:hover:after {
            background: #fff;
            transition: 0.2s;
        }

        .button_plus:hover {
            background-color: #095776;
            transition: 0.2s;
        }
    </style>
</head>
<body>
<center>
    <h1>User Management</h1>
</center>
<div align="center">
    <tr>
        <td>
            <form method="post" action="users?action=search">
                <input style="width: 450px;height: 35px" type="text" name="searchByCountry" id="searchByCountry"
                       placeholder="Enter country name">
                <input style="width: 100px;height: 35px" type="submit" value="Search">
            </form>
        </td>
    </tr>
    <table border="1" cellpadding="5">
        <div>
            <caption>
                <h2>List of Users
                    <a href="/users?action=create">
                        <div class="button_plus"></div>
                    </a>
                </h2>
            </caption>
        </div>
        <tr>
            <th>ID
                <button class="sortButton" style="font-size:12px" name="sortID"><i class="fa fa-sort"></i></button>
            </th>
            <th>Name
                <button class="sortButton" style="font-size:12px" name="sortName"><i class="fa fa-sort"></i></button>
            </th>
            <th>Email
                <button class="sortButton" style="font-size:12px" name="sortEmail"><i class="fa fa-sort"></i></button>
            </th>
            <th>Country
                <button class="sortButton" style="font-size:12px" name="sortCountry"><i class="fa fa-sort"></i></button>
            </th>
            <th>Actions</th>
        </tr>
        <c:forEach var="user" items="${listUser}">
            <tr>
                <td><c:out value="${user.id}"/></td>
                <td><c:out value="${user.name}"/></td>
                <td><c:out value="${user.email}"/></td>
                <td><c:out value="${user.country}"/></td>
                <td>
                    <a href="/users?action=edit&id=${user.id}">Edit</a>
                    <a href="/users?action=delete&id=${user.id}">Delete</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>
