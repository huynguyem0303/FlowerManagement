<%-- 
    Document   : viewPlant
    Created on : Mar 18, 2022, 2:04:55 PM
    Author     : Fang Long
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Plant Details</title>
        <link rel="stylesheet" href="mycss.css"/>
    </head>
    <body>
        <header>
            <c:if test="${sessionScope.email == null}">
                <%@include file="header.jsp" %>
            </c:if>
            <c:if test="${sessionScope.email != null}">
                <%@include file="header_loginedUser.jsp" %>
            </c:if>
        </header>
        <c:if test="${sessionScope.name != null}">
            <h3>Welcome, ${sessionScope.name}</h3>
            <h3><a href="mainController?action=logout&action2=testnek">Logout</a></h3>
            <h3><a href="personalPage.jsp">Personal Page</a></h3>
        </c:if>
            <table border="1" class="" style="width: 700px; height: 500px; font-weight: 100">
                <tr><td rowspan="8"><img src="${requestScope.plantObj.imgpath}" class="" style="width: 300px; height: 300px" alt="alt"/></td></tr>
            <tr><td>id:${requestScope.plantObj.id}</td></tr>
            <tr><td>product name:${requestScope.plantObj.name}</td></tr>
            <tr><td>price: ${requestScope.plantObj.price}</td></tr>
            <tr><td>description: ${requestScope.plantObj.description}</td></tr>
            <tr><td>status: ${requestScope.plantObj.status}</td></tr>
            <tr><td>cate Id: ${requestScope.plantObj.cateid}</td></tr>
            <tr><td>Category: ${requestScope.plantObj.catename}</td></tr>
        </table>

        <footer>
            <%@include file="footer.jsp" %>
        </footer>


    </body>
</html>
