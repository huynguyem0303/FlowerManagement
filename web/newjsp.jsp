<%-- 
    Document   : newjsp
    Created on : Mar 14, 2022, 4:18:08 PM
    Author     : Fang Long
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="mycss.css" type="text/css" />
    </head>
    <body>
        <header>
            <nav>
                <ul>
                    <li><a href=""><img src="images/logo.jpg"></a> </li>
                    <li><a href="index.html">Home</a></li>
                    <li><a href="registration.html">Register</a></li>
                    <li><a href="login.html" >Login</a></li>
                    <li>
                        <form action="searchServlet" method="post" class="formsearch">
                            <input type="text" name="txtsearch">
                            <select name=”searchby”>
                                <option value=”byname”>by name</option>
                                <option value=”bycate”>by category</option>
                            </select>
                            <input type="submit" value="search" name="action" >
                        </form>
                    </li>
                </ul>
            </nav>
        </header>
        <section>
            <h1>INDEX HERE!</h1>








        </section>
        <footer>
            <p></p>
        </footer>
    </body>
</html>
