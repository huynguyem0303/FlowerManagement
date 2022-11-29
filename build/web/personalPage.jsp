<%-- 
    Document   : personalPage
    Created on : Mar 15, 2022, 4:02:50 PM
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
        <%


        %>



        <h1>${requestScope.IS_LOGIN}</h1>

        <c:if test="${sessionScope.name == null}">
            <p>You must login to view personal page</p>
        </c:if>
        <c:if test="${sessionScope.name != null}">

            <c:if test="${requestScope.UPDATE_MSG != null}">
                <p style="color: red">${requestScope.UPDATE_MSG}</p>
            </c:if>

            <header>



                <c:if test="${sessionScope.email == null}">
                    <%@include file="header.jsp" %>
                </c:if>
                <c:if test="${sessionScope.email != null}">
                    <%@include file="header_loginedUser.jsp" %>
                </c:if>
            </header>
            <section>
                <h3>Welcome, ${sessionScope.name}</h3>
                <a href="mainController?action=logout&action2=testnek">Logout</a>
                <table class="order">
                    <thead>
                        <tr>
                            <th>Order ID</th>
                            <th>Order Date</th>
                            <th>Ship Date</th>
                            <th>Order's status</th>
                            <th>action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="o" items="${sessionScope.ORDERS_LIST}">
                            <tr>
                                <td>${o.orderID}</td>
                                <td>${o.orderDate}</td>
                                <td>${o.shipDate}</td>
                                <td>
                                    <c:if test="${o.status == '1'}">
                                        <p>Processing</p>
                                    </c:if>
                                    <c:if test="${o.status == '2'}">
                                        <p>completed</p>
                                    </c:if>
                                    <c:if test="${o.status == '3'}">
                                        <p>canceled</p>
                                        <a href="mainController?action=updateOrderStatus&orderid=${o.orderID}">change to Process</a>
                                    </c:if>
                                </td>
                                <td>
                                    <a href="orderDetail.jsp?orderid=${o.orderID}">detail</a>
                                </td>
                            </tr>
                        </c:forEach>


                    </tbody>
                </table>
            </section>
            <footer>
                <%@include file="footer.jsp" %>
            </footer>
        </c:if>
    </body>
</html>
