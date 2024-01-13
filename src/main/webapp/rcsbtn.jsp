<%
  HttpSession s = request.getSession(false);
  String userType = (String) s.getAttribute("UserType");
%>

<!-- Your HTML content here -->

<%
  if ("Admin".equals(userType)) {
%>
    <script>
      document.addEventListener('DOMContentLoaded', function() {
        var rcsBtn = document.getElementById("RCS_BTN");
        if (rcsBtn) {
          rcsBtn.style.display = "inline";
        }
      });
    </script>
<%
  }
%>
