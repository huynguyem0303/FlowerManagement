<%-- 
    Document   : OrderDetail
    Created on : Mar 15, 2022, 5:20:27 PM
    Author     : Fang Long
--%>

<%@page import="sample.dao.OrderDAO"%>
<%@page import="sample.dto.OrderDetail"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="mycss.css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <h1>${requestScope.IS_LOGIN}</h1>

        <c:if test="${sessionScope.name == null}">
            <p>You must login to view personal page</p>
        </c:if>
        <c:if test="${sessionScope.name != null}">


            <header>
                <c:if test="${sessionScope.email == null}">
                    <%@include file="header.jsp" %>
                </c:if>
                <c:if test="${sessionScope.email != null}">
                    <%@include file="header_loginedUser.jsp" %>
                </c:if>


            </header>
            <section>

                <h1>OrderID: ${pageScope.orderid}</h1>

                <%
                    String orderid = request.getParameter("orderid");
                    if (orderid != null) {
                        int orderID = Integer.parseInt(orderid);
                        ArrayList<OrderDetail> list = OrderDAO.getOrderDetail(orderID);
                        if (list != null && !list.isEmpty()) {
                            int money = 0;
                            for (OrderDetail detail : list) {
                %>




                <table border="1" class="order">
                    <thead>
                        <tr>
                            <th>Order ID</th>
                            <th>Plant ID</th>
                            <th>Plant Name</th>
                            <th>Image</th>
                            <th>Quantity</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td> <%=detail.getOrderID()%>  </td>
                            <td> <%=detail.getPlantID()%></td>
                            <td> <%=detail.getPlantName()%></td>
                            <td>
                                <img src="<%=detail.getImgPath()%>" class="plantimg" alt="alt"/>
                                <br>
                                <%=detail.getPrice()%>
                            </td>
                            <td><%=detail.getQuantity()%></td>
                            <%  money = money + detail.getPrice() * detail.getQuantity(); %>
                        </tr>
                    </tbody>
                </table>
                <%                            }//end for %>
                <h3>Total money: <%=money%></h3>
                <%

                }//end if
                else {
                %>
                <p>You don't have any order</p>
                <%
                        }
                    }//end if
%>
            </section>
            <footer>
                <%@include file="footer.jsp" %>
            </footer>
        </c:if> 

    </body>
</html>
