/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.servlet;

import db.dbcon;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UserBillingServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */

            String fdate = request.getParameter("From_date");
            String todate = request.getParameter("To_date");

            Date currentDate = new Date();
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            String currentDateStr = dateFormat.format(currentDate);
            String user = (String) request.getSession().getAttribute("LogUsername");
            String query;

            if (fdate.equals(currentDateStr) && todate.equals(currentDateStr)) {
                // SQL query for current date
                query = "select b.date,a.Username,b.accountid,sum(b.Total)as sub,sum(b.Success)as del,b.Setup from sgc_user_billing as a left join User_Counts_Api as b ON a.userid=b.accountid and a.Setup=b.Setup where last_updated IN(select max(last_updated) from User_Counts_Api where date like '" + currentDateStr + "') and a.PM like '%" + user + "%' and date between '" + currentDateStr + "' and '" + currentDateStr + "' group By b.accountid,b.Setup";
            } else {
                query = "select b.date,a.Username,b.userId,sum(b.sub)as sub,sum(b.del)as del,b.Setup from sgc_user_billing as a left join sgc_billing as b ON a.userid=b.userId and a.Setup=b.Setup where PM like '%" + user + "%' and date between '" + fdate + "' and '" + todate + "' group By b.userId,b.Setup";

            }
            dbcon db = new dbcon();
            try {

                db.getCon("LRN_LIVE");
                System.out.println("Executing:" + query);
                ResultSet rs = db.getResult(query);

                out.println("<table border='1' width='600px;text='center';'><tr><th>UserName</th><th>Sub</th><th>Del</th><th>Percentage</th></tr>");

                int CountSub = 0;
                int CountDel = 0;
                int sub;
                int del;
                int persentCount = 0;
                while (rs.next()) {

                    sub = rs.getInt("sub");
                    del = rs.getInt("del");
                    CountSub = CountSub + sub;
                    CountDel = CountDel + del;

                    int per = (del * 100) / sub;
                    persentCount = (CountDel * 100) / CountSub;

                    out.println("<tr>"
                            + "<td>" + rs.getString("Username") + "</td>"
                            + "<td>" + rs.getString("sub") + "</td>"
                            + "<td>" + rs.getString("del") + "</td>"
                            + "<td>" + per + "</td>"
                            + "</tr>");
                }

                out.println("<tr>"
                        + "<th>Total</th>"
                        + "<td><b>" + CountSub + "</b></td>"
                        + "<td><b>" + CountDel + "</b></td>"
                        + "<td><b>" + persentCount + "<b></td>"
                        + "</tr>");

                out.println("</table>");

            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                db.closeConection();
            }

        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
