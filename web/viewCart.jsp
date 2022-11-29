<%-- 
    Document   : viewCart.jsp
    Created on : Mar 17, 2022, 6:28:15 PM
    Author     : Fang Long
--%>

<%@page import="java.util.Date"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
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

        <%
//            Map<String, Integer> cart = (Map<String, Integer>) session.getAttribute("cart");
//            if (cart == null) {
//                cart = new HashMap<>();
//            }
//            session.setAttribute("cart", cart);
        %>
        <c:if test="${sessionScope.name != null}">
            <h3>Welcome, ${sessionScope.name}</h3>
            <h3><a href="mainController?action=logout&action2=testnek">Logout</a></h3>
            <h3><a href="personalPage.jsp">Personal Page</a></h3>
        </c:if>

        <c:if test="${requestScope.WARNING != null}">
            <font style="color: red;">${requestScope.WARNING}</font>
        </c:if>



        <table class="order">
            <c:if test="${sessionScope.cart != null}">

                <tr><td>product id</td><td>Name</td><td>price</td><td>Photo</td><td>quantity</td><td>action</td></tr>

                <c:forEach var="c" items="${sessionScope.cart}">
                    <form action="mainController">
                        <tr>
                            <td>
                                <input type="hidden" name="pid" value="${c.key}">
                                <a href="getPlantServlet?pid=${c.key}">${c.key}</a>
                            </td>
                            <td>

                                ${c.value.name}
                            </td>
                            <td>

                                ${c.value.price}
                            </td>
                            <td>
                                <img src="${c.value.imgpath}" alt="alt" class="plantimg"/>
                            </td>

                            <td>
                                <input type="number" name="quantity" value="${c.value.quantity}">
                            </td>
                            <td><input type="submit" name="action" value="update">
                                <input type="submit" name="action" value="delete">
                            </td>
                        </tr>
                    </form>


                </c:forEach>
            </c:if>
            <c:if test="${sessionScope.cart == null}">
                <tr><td style="color: red">Not thing in cart!!!</td></tr>

            </c:if>

            <tr>
                <td>Total Money: ${sessionScope.TOTAL}</td>
            </tr>
            <tr>
                <td>Order Date: <%= (new Date()).toString()%></td>
            </tr>
            <tr>
                <td>Ship Date: N/A</td>
            </tr>
        </table>
        <section>
            <form action="mainController" method="post">
                <input type="submit" name="action" value="saveOrder" style="color: white; font-weight: 200; background-color: green; width: 100px; height: 40px" class="buttonsubmit">
            </form>
        </section>

        <footer>
            <%@include file="footer.jsp" %>
        </footer>



    </body>
</html>
