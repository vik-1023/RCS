 
<%

HttpSession s = request.getSession(false);
String username = null;

 
    username = (String) s.getAttribute("Dusername");

    if (username == null) {
        // No valid username found, and not on the login page, redirect to login page
        response.sendRedirect("Login.jsp");
    }





%>
