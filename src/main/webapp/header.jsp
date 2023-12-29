<%-- 
    Document   : header
    Created on : 18 Dec, 2023, 10:28:59 AM
    Author     : Ram Ishwer Kumar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <!-- ======= Header ======= -->
        <header id="header" class="fixed-top">
            <div class="container d-flex align-items-center justify-content-between">
                <h1 class="logo"><a href="index.html"><img src="assets1/img/logo.png"></a></h1>
                <nav id="navbar" class="navbar">
                    <ul>
                        <li><a class="nav-link scrollto active" id="createnew-link" href="#hero" >MY BOTS</a></li>
                        <li><a class="nav-link scrollto" id="brandsheader" href="#about">MY BRANDS</a></li>
                        <li><a class="nav-link scrollto" href="#services">MY CAMPAIGNS</a></li>
                        <li><a class="nav-link scrollto o" href="#portfolio">API</a></li>
                        <li><a class="nav-link scrollto" id="billingnew" href="#team">MY BILLING</a></li>
                    </ul>
                    <i class="bi bi-list mobile-nav-toggle"></i>

                </nav><!-- .navbar -->
                <div class="dropdown">
                    <button class="btn btn-secondary1 dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                        <img src="assets1/img/profile_img.png">
                    </button>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#">Action</a></li>
                        <li><a class="dropdown-item" href="#">Another action</a></li>
                        <li><a class="dropdown-item" href="#">Something else here</a></li>
                    </ul>
                </div>
            </div>
        </header><!-- End Header -->
        
         <script>
         document.addEventListener('DOMContentLoaded', function () {
            document.getElementById('createnew-link').addEventListener('click', function () {
                console.log("Clicked on createnew-link");
                // Redirect to CreateNewRcs.jsp
                window.location.href = 'CreateNewRcs.jsp';

                // Toggle 'active' class for MY BOTS link
                document.getElementById('createnew-link').classList.add('active');
                document.getElementById('billingnew').classList.remove('active');
            });

            document.getElementById('billingnew').addEventListener('click', function () {
                console.log("Clicked on billingnew");
                // Redirect to billingD.jsp
                window.location.href = 'billingD.jsp';

                // Toggle 'active' class for MY BILLING link
                document.getElementById('billingnew').classList.add('active');
                document.getElementById('createnew-link').classList.remove('active');
            });
            
             document.getElementById('brandsheader').addEventListener('click', function () {
                console.log("Clicked on billingnew");
                // Redirect to billingD.jsp
                window.location.href = 'Brands.jsp';

                // Toggle 'active' class for MY BILLING link
                document.getElementById('brandsheader').classList.add('active');
                document.getElementById('billingnew').classList.remove('active');
                document.getElementById('createnew-link').classList.remove('active');
            });
            
//            document.getElementById('tester-link').addEventListener('click', function () {
//                console.log("Clicked on billingnew");
//                // Redirect to billingD.jsp
//                window.location.href = 'index.jsp';
//
//                // Toggle 'active' class for MY BILLING link
//                document.getElementById('tester-link').classList.add('active');
//                document.getElementById('billingnew').classList.remove('active');
//                document.getElementById('createnew-link').classList.remove('active');
//                 document.getElementById('brandsheader').classList.remove('active');
//            });
        });
    </script>
    
    </body>
</html>
