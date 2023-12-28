<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="db.dbcon"%>
<%@page contentType="application/json" pageEncoding="UTF-8"%>
<%@include file="session.jsp" %>

<%
// Create a logger instance for the current class (you can customize the name)
    Logger logger = Logger.getLogger("TrafficDashboardJSP");

    try {
       // String username = "ram";
        String fdate = request.getParameter("startDate1");
        String tdate = request.getParameter("endDate1");
        String BrandN = request.getParameter("BrandList1");
        String BotN = request.getParameter("BotList1");
        String templateN = request.getParameter("templatesid");
        String List = request.getParameter("listby1");


        String commonPart = "SELECT SUBSTRING(DateRange, 1, 10) as DateRange, Brands, Bots, Templates, "
                + "MessagesSubmittedColumn, MessagesSentColumn, MessagesReadColumn, "
                + "MessagesFailedColumn, MessagesRevokedColumn, DeliveryRateColumn, ReadRateColumn, "
                + "P2AResponsesColumn, P2AResponseRateColumn, P2AMessagesColumn "
                + "FROM tester_invite "
                + "WHERE DateRange BETWEEN '" + fdate + " 00:00:00' AND '" + tdate + " 23:59:59' "
                + "AND Brands LIKE '" + BrandN + "' AND Bots LIKE '" + BotN + "' "
                + "AND Templates LIKE '" + templateN + "' AND username='" + username + "' ";

        String sql = "";
        if (List.equals("DateRanget")) {
            sql = commonPart + "GROUP BY DateRange;";
        } else if (List.equals("Brandst")) {
            sql = commonPart + "GROUP BY Brands;";
        } else if (List.equals("Botst")) {
            sql = commonPart + "GROUP BY Bots;";
        } else if (List.equals("Templates")) {
            sql = commonPart + "GROUP BY Templates;";
        } else if (List.equals("ALLT")) {
            sql = commonPart + "GROUP BY DateRange, Brands, Bots, Templates;";
        }

        dbcon db = new dbcon();
        db.getCon("VNS_RCS");
        logger.info("Executing:" + sql);
        ResultSet rs = db.getResult(sql);

        List<Map<String, Object>> dataList = new ArrayList<>();

        while (rs.next()) {
            Map<String, Object> data = new HashMap<>();
            data.put("DateRange", rs.getString("DateRange"));
            data.put("Brands", rs.getString("Brands"));
            data.put("Bots", rs.getString("Bots"));
            data.put("Templates", rs.getString("Templates"));
            data.put("MessagesSubmittedColumn", rs.getInt("MessagesSubmittedColumn"));
            data.put("MessagesSentColumn", rs.getInt("MessagesSentColumn"));
            data.put("MessagesReadColumn", rs.getInt("MessagesReadColumn"));
            data.put("MessagesFailedColumn", rs.getString("MessagesFailedColumn"));
            data.put("MessagesRevokedColumn", rs.getString("MessagesRevokedColumn"));
            data.put("DeliveryRateColumn", rs.getString("DeliveryRateColumn"));
            data.put("ReadRateColumn", rs.getString("ReadRateColumn"));
            data.put("P2AResponsesColumn", rs.getString("P2AResponsesColumn"));
            data.put("P2AResponseRateColumn", rs.getString("P2AResponseRateColumn"));
            data.put("P2AMessagesColumn", rs.getString("P2AMessagesColumn"));

            dataList.add(data);
        }

        db.closeConection();

        // Convert dataList to JSON using Gson
        Gson gson = new Gson();
        String jsonData = gson.toJson(dataList);

        // Write JSON data to the response
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(jsonData);

    } catch (Exception e) {
        // Log any exceptions using the logger
        logger.severe("An error occurred: " + e.getMessage());
        e.printStackTrace();
    }
%>
