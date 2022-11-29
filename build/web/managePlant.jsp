<%-- 
    Document   : manageOrder
    Created on : Mar 18, 2022, 3:47:49 PM
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
            <input type="submit" value="searchPlant" name="action">
        </form>
        <h1></h1>
        <table class="order">
            <tr>
                <th>ID</th>
                <th>name</th>
                <th>price</th>
                <th>imgpath</th>
                <th>description</th>
                <th>status</th>
                <th>cateid</th>
                <th>catename</th>
                <th>Action</th>

            </tr>

            <c:forEach var="p" items="${requestScope.plantList}">
                <tr>
                    <td>${p.id}</td>
                    <td>${p.name}</td>
                    <td>${p.price}</td>
                    <td>
                        <img src="${p.imgpath}" class="plantimg" alt="alt"/>
                    </td>
                    <td>
                        ${p.description}
                    </td>
                    <td>
                        ${p.status}
                    </td>
                    <td>
                        ${p.cateid}
                    </td>
                    <td>
                        ${p.catename}
                    </td>
                    <td>

                    </td>
                </tr>


            </c:forEach>


        </table>

    </body>
</html>
