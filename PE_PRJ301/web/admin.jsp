<%-- 
    Document   : foodList
    Created on : 30-10-2022
    Author     : hd
--%>


<%@page import="java.util.List"%>
<%@page import="prj301.pe.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Food List Page</title>
    </head>
    <body>
        <!--your code here-->
        <a href="MainController?action=logout" >Logout </a>
        
        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null) {
                response.sendRedirect("login.jsp");
                return;
            }
            String search = request.getParameter("search");
            if (search == null) search="";
        %>
        <h1>Welcome: <%= loginUser.getFullName() %></h1>
        <form action="MainController">
            Search: <input type="text" name="search" value="<%= search %>" />
            <input type="submit" name="action" value="Search"/>
        </form>
        <%
            List<UserDTO> listUser = (List<UserDTO>) request.getAttribute("LIST_USER");
            if(listUser!= null){
                if (listUser.size() >0) {
        %>
            <table border="1">
                <thead>
                    <th>No</th>
                    <th>User ID</th>
                    <th>Full Name</th>
                    <th>Role ID</th>
                    <th>Password</th>
                </thead>
                <tbody>
                    <%
                        int count = 1;
                        for (UserDTO user : listUser) {
                    %>
                    <tr>
                        <td><%= count++ %></td>
                        <td><%= user.getUserID()%></td>
                        <td>
                            <input type="text" name="fullName" value="<%= user.getFullName()%>" required>
                        </td>
                        <td>
                            <input type="text" name="roleID" value="<%= user.getRoleID()%>" required>
                        </td>
                        <td><%= user.getPassword()%></td>
                    </tr>  
                    <%
                        }
                    %>
                </tbody>
            </table>
                    
        <%
                };
            }
            
        %>

    </body>
</html>
