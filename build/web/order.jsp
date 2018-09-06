<%-- 
    Document   : order
    Created on : 04.May.2018, 16:25:27
    Author     : esrae
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="customer.Cust" %>
<!DOCTYPE html>
<html>
    <head>
    <title> Orders</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body background=resim.jpg>
    

    <label class="yazi" style="font-size:45px; color:white; align-content:auto;"> Dear 
    <% if (session.getAttribute("uname") != null) {
         out.print(session.getAttribute("uname"));
         
    }
        %>;your order is complete
    </p>
<h class="yazi" style="font-size:30px; color:whitesmoke; "> Product : 
    <% if (session.getAttribute("productList") != null) {
         out.print(session.getAttribute("productList"));
    }
        %> </h>
<center>
    <p class="yazi" style="font-size:65px; color:blueviolet; align-content:auto;">Thanks for Shopping</p>
        <img src="https://media.giphy.com/media/3oFzm64utSGoIBM26Q/giphy.gif" style="width:250px; height:255 px">
</center>
</body>
</html>

