<%-- 
    Document   : appoinment
    Created on : Aug 21, 2024, 12:13:10 PM
    Author     : Admin
--%>

<%@page import="java.util.List"%>
<%@page import="Appointment.AppointmentDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <div>${sessionScope.usersession.fullName}</div>
        <a href="MainController?action=logout">LOGOUT</a>
        <a href="Create.jsp">CREATE</a>
        
        <table border="1">
            <thead>
                <tr>
                    <th>idApp</th>
                    <th>account</th>
                    <th>partnerPhone</th>
                    <th>partnerName</th>
                    <th>timeToMeet</th>
                    <th>place</th>
                    <th>expense</th>
                    <th>note</th>
                </tr>
            </thead>
            <%
                List<AppointmentDTO> listApp= (List<AppointmentDTO>) request.getAttribute("LISTAPP");
                for (AppointmentDTO appointment : listApp) {
//                    pageContext.setAttribute("appointment", appointment);
            %>
            <tbody>
                <tr>
                    <td><%= appointment.getIdApp() %></td>
                    <td><%= appointment.getAccount() %></td>
                    <td><%= appointment.getPartnerPhone() %></td>
                    <td><%= appointment.getPartnerName() %></td>
                    <td><%= appointment.getTimeToMeet() %></td>
                    <td><%= appointment.getPlace() %></td>
                    <td><%= appointment.getExpense() %></td>
                    <td><%= appointment.getNote() %></td>
                </tr>
            </tbody>
            <%
            }
            %>
        </table>

        
    </body>
</html>
