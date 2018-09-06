<%-- 
    Document   : Sepet
    Created on : 13.Nis.2018, 16:05:32
    Author     : esrae
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="customer.Cust" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<%@ page language="java" import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <style>
            body {
                font-family: Arial;
                font-size: 17px;
                padding: 8px;
            }

            * {
                box-sizing: border-box;
            }

            .row {
                display: -ms-flexbox; 
                display: flex;
                -ms-flex-wrap: wrap;
                flex-wrap: wrap;
                margin: 0 -16px;
            }

            .third{
                -ms-flex: 25%; /* IE10 */
                flex: 25%;
            }

            .second {
                -ms-flex: 50%; /* IE10 */
                flex: 50%;
            }

            .first {
                -ms-flex: 75%; 
                flex: 75%;
            }

            .third,
            .second,
            .first {
                padding: 0 16px;
            }

            .container {
                background-color: #f2f2f2;
                padding: 5px 20px 15px 20px;
                border: 1px solid lightgrey;
                border-radius: 3px;
            }

            input[type=text] {
                width: 100%;
                margin-bottom: 20px;
                padding: 12px;
                border: 1px solid #ccc;
                border-radius: 3px;
            }

            label {
                margin-bottom: 10px;
                display: block;
            }


            .btn {
                background-color: #4CAF50;
                color: white;
                padding: 12px;
                margin: 10px 0;
                border: none;
                width: 100%;
                border-radius: 3px;
                cursor: pointer;
                font-size: 17px;
            }

            .btn:hover {
                background-color: #45a049;
            }

            a {
                color: #2196F3;
            }

            hr {
                border: 1px solid lightgrey;
            }

            span.price {
                float: right;
                color: grey;
            }

            /* Responsive layout - when the screen is less than 800px wide, make the two columns stack on top of each other instead of next to each other (also change the direction - make the "cart" column go on top) */
            @media (max-width: 800px) {
                .row {
                    flex-direction: column-reverse;
                }
                .third {
                    margin-bottom: 20px;
                }
            }
        </style>
    </head>
    <<body background=arka1.jpg>

        <h2>Checkout Form</h2>
    <div class="row">
        <div class="first">
            <div class="container">
                <form  method="POST" action="order.jsp">
              

                    <div class="row">
                        <div class="second">
                            <h3>Billing Address</h3>
                            <label for="fname"><i class="fa fa-user"></i> Full Name</label>
                            <input type="text" id="fname" name="firstname">
                                <label for="email"><i class="fa fa-envelope"></i> Email</label>
                                <input type="text" id="email" name="email" >
                                    <label for="adr"><i class="fa fa-address-card-o"></i> Address</label>
                                    <input type="text" id="adr" name="address">
                                        </div>

                                        <div class="second">
                                            <h3>Payment</h3>
                                            <label for="cname">Name on Card</label>
                                            <input type="text" id="cname" name="cardname">
                                                <label for="ccnum">Credit card number</label>
                                                <input type="text" id="ccnum" name="cardnumber" >
                                                    <label for="expmonth">Exp Month</label>
                                                    <input type="text" id="expmonth" name="expmonth">
                                                        <div class="row">
                                                            <div class="second">
                                                                <label for="expyear">Exp Year</label>
                                                                <input type="text" id="expyear" name="expyear">
                                                            </div>
                                                            <div class="second">
                                                                <label for="cvv">CVV</label>
                                                                <input type="text" id="cvv" name="cvv">
                                                            </div>
                                                        </div>
                                                        </div>
                                                        </div>
                                                        <input type="submit" value="Continue to checkout" class="btn">
                                                           
                                                            </form>
                                                            </div>
                                                            </div> 
                                                            <div class="third">
                                                                <div class="container">
                                                                    <h4>Cart <span class="price" style="color:black"><i class="fa fa-shopping-cart"></i> <b>
                                                                       
                                                                        
                                                                            </b></span></h4>
                                                                    <!--      <p><a href="#"></a> <span class="price">$5</span> </p> -->
                                                                    <%
                                                                        Cust cObject=new Cust();
                                                                    String html= cObject.selectedProductList(request, response);
                                                                    out.print(html);
                                                                    %>
                                                                 
                                                                </div>
                                                            </div>
                                                            </div>

                                                            </body>
                                                            </html>
