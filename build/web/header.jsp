<%-- 
    Document   : header
    Created on : Mar 15, 2022, 3:35:30 PM
    Author     : Fang Long
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <header>
            <nav>
                <ul>
                    <li><a href="mainController?action=search&txtsearch=&searchBy=byname"><img style="height: 80px; width: 80px" src="https://i.pinimg.com/originals/b8/9c/ca/b89cca6ae79f9369f0aef7ee3a0a2fb9.png"></a> </li>
                    <li><a href="mainController?action=search&txtsearch=&searchBy=byname">Home</a></li>


                    <li><a href="registration.jsp">Register</a></li>
                    <li><a href="login.jsp" >Login</a></li>
                    <li><a href="mainController?action=viewcart" >View Cart</a></li>




                    <li>
                        <form action="mainController" method="post" class="formsearch">

                            <input type="text" name="txtsearch" value="${param.txtsearch}">
                            <select id="id" name="searchBy">
                                <option value="byname">byname</option>
                                <option value="bycate">bycate</option>
                            </select>
                            <input type="submit" value="search" name="action" >
                        </form>
                    </li>


                </ul>
            </nav>
        </header>
    </body>
</html>
