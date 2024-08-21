/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Appointment;

import DBUtil.DBUtils;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class AppointmentDAO {

    public boolean insert(AppointmentDTO appointment) {
        boolean check = false;
        try {
            Connection con = DBUtils.getConnection();
            String sql = "INSERT INTO [dbo].[Appointments] ([account],[partnerPhone],[partnerName],[timeToMeet],[place],[expense],[note]) VALUES (?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, appointment.getAccount());
            ps.setString(2, appointment.getPartnerPhone());
            ps.setString(3, appointment.getPartnerName());
            ps.setTimestamp(4, appointment.getTimeToMeet());
            ps.setString(5, appointment.getPlace());
            ps.setDouble(6, appointment.getExpense());
            ps.setString(7, appointment.getNote());
            ps.executeUpdate();
            con.close();
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e.getMessage());
            e.printStackTrace();
        }
        return check;
    }

    public List<AppointmentDTO> list() {
        List<AppointmentDTO> list = new ArrayList<>();
        try {
            Connection con = DBUtils.getConnection();
            String sql = "SELECT idApp, account, partnerPhone, partnerName, timeToMeet, place, expense, note FROM [dbo].[Appointments]";

            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    int idApp = rs.getInt("idApp");
                    String account = rs.getString("account");
                    String partnerPhone = rs.getString("partnerPhone");
                    String partnerName = rs.getString("partnerName");
                    Timestamp timeToMeet = rs.getTimestamp("timeToMeet");
                    String place = rs.getString("place");
                    double expense = rs.getDouble("expense");
                    String note = rs.getString("note");

                    AppointmentDTO app = new AppointmentDTO(idApp, account, partnerPhone, partnerName, timeToMeet, place, expense, note);
                    list.add(app);
                }
            }
            con.close();
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e.getMessage());
            e.printStackTrace();
        }
        return list;
    }

    public static void main(String[] args) {
        AppointmentDAO dao = new AppointmentDAO();
        Timestamp time = new Timestamp(5);
        AppointmentDTO app = new AppointmentDTO(0, "admin", "1", "hdhdh", time, "aa", 5, "");
        System.out.println(dao.list());
    }

}
