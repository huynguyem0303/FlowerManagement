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
            <%@include file="header.jsp" %>
        </header>
        
        <form action="mainController" method="post" class="form" style="width: 50%; margin-left: 80px; margin-right: auto">
            <table style="text-align: center">
                <tr>
                    <td>email</td>
                    <td> <input type="text" required="" pattern="^(\\w)+@(a-zA-Z]+([.](\\w)+){1,2}" name="txtemail" value="${param.txtemail}"> </td>
                </tr>
                <tr>
                    <td>fullname</td>
                    <td> <input type="text" name="txtfullname" value="${param.txtfullname}"> </td>
                </tr>
                <tr>
                    <td>password</td>
                    <td><input type="password" name="txtpassword" value="${param.txtpassword}"></td>
                </tr>
                <tr>
                    <td>phone</td>
                    <td><input type="text" name="txtphone" value="${param.txtphone}">
                        <c:if test="${requestScope.ERROR != null}">
                            ${requestScope.ERROR}
                        </c:if>
                    </td>

                </tr>
                <tr>
                    <td colspan="2"><input type="submit" name="action" value="register"></td>
                </tr>


            </table>

        </form>
        <footer>
            <%@include file="footer.jsp" %>
        </footer>
    </body>
</html>
