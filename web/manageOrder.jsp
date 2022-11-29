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
            <input type="submit" value="searchOrder" name="action">
        </form>
        <h1></h1>
        <table class="order">
            <tr>
                <th>ID</th>
                <th>orderDate</th>
                <th>shipDate</th>
                <th>status</th>
                <th>accID</th>
                <th>Action</th>
            </tr>

            <c:forEach var="o" items="${requestScope.orderList}">
                <tr>
                    <td>${o.orderID}</td>
                    <td>${o.orderDate}</td>
                    <td>${o.shipDate}</td>
                    <td>
                        ${o.status}
                    </td>
                    <td>
                        ${o.accID}
                    </td>
                    <td>
                        
                    </td>
                </tr>


            </c:forEach>


        </table>

    </body>
</html>
