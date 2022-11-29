<%-- 
    Document   : manageAccount
    Created on : Mar 18, 2022, 3:07:10 PM
    Author     : Fang Long
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="mycss.css"/>
    </head>
    <body>
        <c:import url="header_loginedAdmin.jsp"></c:import>
            <form action="mainController" method="post">
                <input type="text" name="txtSearch" value="${param.txtSearch}">
            <input type="submit" value="searchCategory" name="action">
        </form>
        <h1></h1>
        <table class="order">
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Action</th>
            </tr>

            <c:forEach var="c" items="${requestScope.categoryList}">
                <tr>
                    <td>${c.cateId}</td>
                    <td>${c.cateName}</td>
                    <td>

                    </td>
                </tr>


            </c:forEach>


        </table>

    </body>
</html>
