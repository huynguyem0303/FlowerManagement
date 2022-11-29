<%-- 
    Document   : login
    Created on : Mar 15, 2022, 3:41:39 PM
    Author     : Fang Long
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <section>

            <c:if test="${requestScope.WARNING != null}">
                <font style="color: red;">${requestScope.WARNING}</font>
            </c:if>
                
                
            <form action="mainController" method="post">
                <table>
                    <tr>
                        <td>email</td>
                        <td>
                            <input type="text" name="txtemail">
                        </td>
                    </tr>
                    <tr>
                        <td>password</td>
                        <td>
                            <input type="password" name="txtpassword">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <input type="submit" name="action" value="login">
                        </td>
                    </tr>
                </table>
            </form>
        </section>
        <footer>
            <%@include file="footer.jsp" %>
        </footer>
    </body>
</html>
