<%-- 
    Document   : home
    Created on : 11.Nis.2018, 20:40:35
    Author     : esrae
--%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
    </head>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <style>   
            .navbar {
                overflow:auto;
                background-color:#00b3b3;
                font-family: Arial, Helvetica, sans-serif;
            }
            .login
            {
                float:right;
                font-size: 20px;
            }
            .navbar a {
                float: left;
                font-size: 20px;
                color:  #000099;
                text-align: center;
                padding: 16px 16px;
                text-decoration: none;
            }

            .dropdown {
                float: left;
                overflow: hidden;
            }

            .dropdown .dropbtn {
                font-size: 20px;    
                border: none;
                outline: none;
                color:  #000099;
                padding: 16px 16px;
                background-color: inherit;
                font-family: inherit;
                margin: 0;
            }

            .navbar a:hover, .dropdown:hover .dropbtn {
                background-color: #1ac6ff;
            }

            * {box-sizing: border-box;}
            body {font-family: Verdana, sans-serif;}
            .mySlides {display: none;}
            img {vertical-align: middle;}
            .glyphicon { margin-right:5px; }
            .thumbnail
            {
                margin-bottom: 20px;
                padding: 0px;
                -webkit-border-radius: 0px;
                -moz-border-radius: 0px;
                border-radius: 0px;
            }

            .item.list-group-item
            {
                float: none;
                width: 100%;
                background-color: #fff;
                margin-bottom: 10px;
            }
            .item.list-group-item:nth-of-type(odd):hover,.item.list-group-item:hover
            {
                background: #428bca;
            }

            .item.list-group-item .list-group-image
            {
                margin-right: 10px;
            }
            .item.list-group-item .thumbnail
            {
                margin-bottom: 0px;
            }
            .item.list-group-item .caption
            {
                padding: 9px 9px 0px 9px;
            }
            .item.list-group-item:nth-of-type(odd)
            {
                background: #eeeeee;
            }

            .item.list-group-item:before, .item.list-group-item:after
            {
                display: table;
                content: " ";
            }

            .item.list-group-item img
            {
                float: left;
            }
            .item.list-group-item:after
            {
                clear: both;
            }
            .list-group-item-text
            {
                margin: 0 0 11px;
            }
        </style>
        <body background=arka2.png>
        <div class="navbar">
            <a href="home.jsp">Home</a>
            <div class="dropdown">
                <button class="dropbtn">Communication 
                    <i class="fa fa-caret-down"></i>
                </button>
                <div class="dropdown-content">

                </div>
            </div>
            <%
                if (session.getAttribute("uname") != null) { // yani uname adını verdiğimiz session boş değilse
                    out.println("<div class=\"sepet\"><a href=\"#\" style=\"pointer-events: none;cursor: default;text-decoration: none;color: black;\">Shop Basket ( " + session.getAttribute("productList") + " )</a></div>\"");
                    out.println("<div class=\"sepet\"><a href=\"Sepet.jsp\" style=\" position: relative; top:-20px;color: #000099;\">COMPLETE</a></div>\"");
                }
            %>

            <div class="social">
                <a href="https://tr-tr.facebook.com/" style="float:right;">  <img src="facebook.png"  style="float:right; width:35px; display: block ;"> </a>
                <a href="https://twitter.com/?lang=tr" style="float:right;">  <img src="twitter.png"  style="float:right; width:35px; display: block ;"> </a>
                <a href="https://mail.google.com"     style="float:right;">  <img src="google.png"  style="float:right; width:35px; display: block ;"> </a>
            </div>

            <%
                if (session.getAttribute("uname") != null) { // yani uname adını verdiğimiz session boş değilse
                    out.println("<div class=\"login\"><a href=\"ServletOut\"> Çıkış Yap</a></div>\"");
                    out.println("<div class=\"login\"><a href=\"#\" style=\"pointer-events: none;cursor: default;text-decoration: none;color: black;\">Hoşgeldin, " + session.getAttribute("uname") + "</a></div>\"");
                } else {//session boşsa -- neden hata verdi sence?
                    out.println("<div class=\"login\"><a href=\"form.html\"> Login</a></div>\"");
                }
            %>
             
        </div>

        <div class="container">
            <div class="well well-sm">

                

            <div id="products" class="row list-group">
                <div class="item  col-xs-4 col-lg-4">
                    <div class="thumbnail">
                        <img class="group list-group-image" src="B_canta5.jpg" height="420" width="420" value="pro01">
                            <div class="caption">
                                <div class="row">
                                    <div class="col-xs-12 col-md-6">
                                        <p class="lead">
                                            45 TL</p>
                                    </div>
                                    <div class="col-xs-12 col-md-6">
                                        <button type="button" class="btn btn-success"> <a href="ServletShop?urun=pro01" style="color:white;">Shopping Basket</button> </a>
                                    </div>
                                </div>
                            </div>
                    </div>
                </div>
                <div class="item  col-xs-4 col-lg-4">
                    <div class="thumbnail">
                        <img class="group list-group-image" src="ba3.jpg" height="420" width="420"">
                            <div class="caption">
                                <div class="row">
                                    <div class="col-xs-12 col-md-6">
                                        <p class="lead">
                                            50 TL</p>
                                    </div>
                                    <div class="col-xs-12 col-md-6">
                                        <button type="button" class="btn btn-success"> <a href="ServletShop?urun=pro02" style="color:white;"> Shopping Basket</button> </a>
                                    </div>
                                </div>
                            </div>
                    </div>
                </div>
                <div class="item  col-xs-4 col-lg-4">
                    <div class="thumbnail">
                        <img class="group list-group-image" src="B_canta1.jpg" height="100" width="300">
                            <div class="caption">
                                <div class="row">
                                    <div class="col-xs-12 col-md-6">
                                        <p class="lead">
                                            75 TL</p>
                                    </div>
                                    <div class="col-xs-12 col-md-6">
                                        <button type="button" class="btn btn-success" > <a href="ServletShop?urun=pro03" style="color:white;">Shopping Basket</button> </a>
                                    </div>
                                </div>
                            </div>
                    </div>
                </div>
                <div class="item  col-xs-4 col-lg-4">
                    <div class="thumbnail">
                        <img class="group list-group-image" src="B_canta3.jpg" height="420" width="320">
                            <div class="caption">
                                <div class="row">
                                    <div class="col-xs-12 col-md-6">
                                        <p class="lead">
                                            40 TL</p>
                                    </div>
                                    <div class="col-xs-12 col-md-6">
                                        <button type="button" class="btn btn-success">  <a href="ServletShop?urun=pro04" style="color:white;">Shopping Basket</button> </a>
                                    </div>
                                </div>
                            </div>
                    </div>
                </div>
                <div class="item  col-xs-4 col-lg-4">
                    <div class="thumbnail">
                        <img class="group list-group-image" src="US_canta2.jpg" height="420" width="320">
                            <div class="caption">
                                <div class="row">
                                    <div class="col-xs-12 col-md-6">
                                        <p class="lead">
                                            95 TL</p>
                                    </div>
                                    <div class="col-xs-12 col-md-6">
                                        <button type="button" class="btn btn-success">  <a href="ServletShop?urun=pro05" style="color:white;">>Shopping Basket</button> </a>
                                    </div>
                                </div>
                            </div>
                    </div>
                </div>
                <div class="item  col-xs-4 col-lg-4">
                    <div class="thumbnail">
                        <img class="group list-group-image" src="B_canta9.jpg" height="420" width="350" >
                            <div class="caption">
                                <div class="row">
                                    <div class="col-xs-12 col-md-6">
                                        <p class="lead">
                                            50 TL</p>
                                    </div>
                                    <div class="col-xs-12 col-md-6">
                                        <button type="button" class="btn btn-success">  <a href="ServletShop?urun=pro06" style="color:white;"> Shopping Basket</button> </a>
                                    </div>
                                </div>
                            </div>
                    </div>
                </div>

                <div class="item  col-xs-4 col-lg-4">
                    <div class="thumbnail">
                        <img class="group list-group-image" src="ba12.jpg" height="100" width="320" >
                            <div class="caption">
                                <div class="row">
                                    <div class="col-xs-12 col-md-6">
                                        <p class="lead">
                                            65 TL</p>
                                    </div>
                                    <div class="col-xs-12 col-md-6">
                                        <button type="button" class="btn btn-success" > <a href="ServletShop?urun=pro07" style="color:white;">Shopping Basket</button> </a>
                                    </div>
                                </div>
                            </div>
                    </div>
                </div> 
                <div class="item  col-xs-4 col-lg-4">
                    <div class="thumbnail">
                        <img class="group list-group-image" src="ea2.jpg" height="420" width="350">
                            <div class="caption">
                                <div class="row">
                                    <div class="col-xs-12 col-md-6">
                                        <p class="lead">
                                            100 TL</p>
                                    </div>
                                    <div class="col-xs-12 col-md-6">
                                        <button type="button" class="btn btn-success">  <a href="ServletShop?urun=pro08" style="color:white;">Shopping Basket</button> </a>
                                    </div>
                                </div>
                            </div>
                    </div>
                </div>
                <div class="item  col-xs-4 col-lg-4">
                    <div class="thumbnail">
                        <img class="group list-group-image" src="E_canat6.jpg" height="420" width="320">
                            <div class="caption">
                                <div class="row">
                                    <div class="col-xs-12 col-md-6">
                                        <p class="lead">
                                            50 TL</p>
                                    </div>
                                    <div class="col-xs-12 col-md-6">
                                        <button type="button" class="btn btn-success" > <a href="ServletShop?urun=pro09" style="color:white;">Shopping Basket</button> </a>
                                    </div>
                                </div>
                            </div>
                    </div>
                </div>
                <div class="item  col-xs-4 col-lg-4">
                    <div class="thumbnail">
                        <img class="group list-group-image" src="B_canta12.jpg" height="420" width="420">
                            <div class="caption">
                                <div class="row">
                                    <div class="col-xs-12 col-md-6">
                                        <p class="lead">
                                            55 TL</p>
                                    </div>
                                    <div class="col-xs-12 col-md-6">
                                        <button type="button" class="btn btn-success"> <a href="ServletShop?urun=pro10" style="color:white;">Shopping Basket</button> </a>
                                    </div>
                                </div>
                            </div>
                    </div>
                </div>

                <div class="item  col-xs-4 col-lg-4">
                    <div class="thumbnail">
                        <img class="group list-group-image" src="B_canta.jpg" height="420" width="420">
                            <div class="caption">
                                <div class="row">
                                    <div class="col-xs-12 col-md-6">
                                        <p class="lead">
                                            45 TL</p>
                                    </div>
                                    <div class="col-xs-12 col-md-6">
                                        <button type="button" class="btn btn-success" >  <a href="ServletShop?urun=pro11" style="color:white;">Shopping Basket</button></a>
                                    </div>
                                </div>
                            </div>
                    </div>
                </div>
                <div class="item  col-xs-4 col-lg-4">
                    <div class="thumbnail">
                        <img class="group list-group-image" src="ba1.jpg" height="500" width="500">
                            <div class="caption">
                                <div class="row">
                                    <div class="col-xs-12 col-md-6">
                                        <p class="lead">
                                            56 TL</p>
                                    </div>
                                    <div class="col-xs-12 col-md-6">
                                        <button type="button" class="btn btn-success">  <a href="ServletShop?urun=pro12" style="color:white;">Shopping Basket</button> </a>
                                    </div>
                                </div>
                            </div>
                    </div>
                </div>

            </div> 
            <div class="item  col-xs-4 col-lg-4">
                <div class="thumbnail">
                    <img class="group list-group-image" src="ba6.jpg" height="420" width="320">
                        <div class="caption">
                            <div class="row">
                                <div class="col-xs-12 col-md-6">
                                    <p class="lead">
                                        65 TL</p>
                                </div>
                                <div class="col-xs-12 col-md-6">
                                    <button type="button" class="btn btn-success" >  <a href="ServletShop?urun=pro13" style="color:white;">Shopping Basket</button> </a>
                                </div>
                            </div>
                        </div>
                </div>
            </div>
            <div class="item  col-xs-4 col-lg-4">
                <div class="thumbnail">
                    <img class="group list-group-image" src="ba5.jpg" height="420" width="320">
                        <div class="caption">
                            <div class="row">
                                <div class="col-xs-12 col-md-6">
                                    <p class="lead">
                                        65 TL</p>
                                </div>
                                <div class="col-xs-12 col-md-6">
                                    <button type="button" class="btn btn-success">
                                        <a href="ServletShop?urun=pro14" style="color:white;"> Shopping Basket</button> </a>
                                </div>
                            </div>
                        </div>
                </div>
            </div> 
            

            </body>
            </html>
