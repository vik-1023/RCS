

<%

    HttpSession s = request.getSession(false);

    String LogUsername = null;

    if (s != null) {
        LogUsername = (String) s.getAttribute("LogUsername");
        System.out.println(LogUsername);
        if (LogUsername == null) {
            response.sendRedirect("Telegram_Email_Login.jsp");
            return;
        }
    } else {
        response.sendRedirect("Telegram_Email_Login.jsp");
        return;
    }


%>

    <%             String requested_date = java.time.LocalDate.now().toString();

    %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="common_js_css_bootstrap/comman_js_css.jsp" %>
        <script type="text/javascript" src="https://unpkg.com/xlsx@0.15.1/dist/xlsx.full.min.js"></script>
        <script src="Js/script.js" type="text/javascript"></script> 
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col col-6 offset-3">
                    <div class="card mt-5">
                        <div class="card-header">
                            <h3 class="text-center">
                                User_Billing
                            </h3>
                        </div>
                        <div class="card-body">
                            <form action="UserBillingServlet">
                                 <input type="hidden" value="addcategory"  name="addcat"/>
                                <lable>From_Date</lable>
                                <input type="date" name="From_date" value="<%=requested_date%>" id="From_date">&nbsp;&nbsp;  
                                <lable>To_Date</lable>
                                <input type="date" name="To_date" value="<%=requested_date%>" id="To_date">                                
                                <div class="text-center mt-3">
                                    <button type="button" class="btn btn-primary mx-auto " onclick="displayData()">Submit</button>
                                </div>

                            </form>

                        </div>
                    </div>  

                    <div class="mt-2 d-flex justify-content-center"id="getExcel">
                        <button onclick="ExportToExcel('xlsx')" >Export table to excel</button> 
                    </div>
                    <div id="test" class=" mt-2 d-flex justify-content-center">

                    </div>






                </div>


            </div>

    </body>
</html>


