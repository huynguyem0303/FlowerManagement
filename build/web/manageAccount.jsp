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
            <input type="submit" value="searchAccount" name="action">
        </form>
        <h1></h1>
        <table class="order">
            <tr>
                <th>ID</th>
                <th>Email</th>
                <th>Fullname</th>
                <th>Status</th>
                <th>Phone</th>
                <th>Role</th>
                <th>Action</th>
            </tr>

            <c:forEach var="a" items="${requestScope.accountList}">
                <tr>
                    <td>${a.accId}</td>
                    <td>${a.email}</td>
                    <td>${a.fullname}</td>
                    <td>
                        <c:if test="${a.status eq 1}">
                            Active
                        </c:if>
                        <c:if test="${a.status ne 1}">
                            inActive
                        </c:if>
                    </td>
                    <td>${a.phone}</td>
                    <td>
                        ${a.role}
                        <c:if test="${a.role == '1'}">
                            Admin
                        </c:if>
                        <c:if test="${a.role == '0'}">
                            User
                        </c:if>
                    </td>
                    <td>
                        <c:if test="${a.role eq 0}">
                            <c:url var="mylink" value="mainController">
                                <c:param name="email" value="${a.email}"></c:param>
                                <c:param name="status" value="${a.status}"></c:param>
                                <c:param name="action" value="updateStatusAccount"></c:param>
                            </c:url>
                            <a href="${mylink}">Block/UnBlock</a>
                        </c:if>
                    </td>
                </tr>


            </c:forEach>


        </table>

    </body>
</html>
