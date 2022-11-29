<%-- 
    Document   : registration
    Created on : Mar 15, 2022, 3:44:09 PM
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
        <header>
            <c:if test="${sessionScope.email == null}">
                <%@include file="header.jsp" %>
            </c:if>
            <c:if test="${sessionScope.email != null}">
                <%@include file="header_loginedUser.jsp" %>
            </c:if>
        </header>
        <form action="mainController" method="post" class="form">
            <table>
                <c:if test="${requestScope.UPDATE_MSG != null}">
                    <p style="color: red">${requestScope.UPDATE_MSG}</p>
                </c:if>

                <tr>
                    
                <input type="hidden" name="txtuserid" value="${requestScope.ACCOUNT_DETAIL.accId}">
                
                    <td>fullname</td>
                    <td> <input type="text" name="txtfullname" value="${requestScope.ACCOUNT_DETAIL.fullname}"> </td>
                    
                </tr>
                <tr>
                    <td>phone</td>
                    <td><input type="text" name="txtphone" value="${requestScope.ACCOUNT_DETAIL.phone}"></td>
                    
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="submit" name="action" value="Change Profile">
                    </td>
                </tr>
            </table>
        </form>
        <footer>
            <%@include file="footer.jsp" %>
        </footer>
    </body>
</html>
