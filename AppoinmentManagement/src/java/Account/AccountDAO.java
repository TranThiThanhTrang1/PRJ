/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Account;

import DBUtil.DBUtils;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Admin
 */
public class AccountDAO {
    
    public AccountDTO login(String account, String pass) {
        AccountDTO Account = null;
        try {
            Connection con = DBUtils.getConnection();
            String sql = "SELECT [account], [pass], [roleDB], [fullName], [gender], [birthDay], [phone], [addr] FROM [AppointmentManagement].[dbo].[Account] WHERE account = ? AND pass = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, account);
            ps.setString(2, pass);
            ResultSet rs = ps.executeQuery();
            if (rs != null) {
                if (rs.next()) {
                    String roleDB = rs.getString("roleDB");
                    String fullName = rs.getString("fullName");
                    boolean gender = rs.getBoolean("gender");
                    Date birthDay = rs.getDate("birthDay");
                    String phone = rs.getString("phone");
                    String addr = rs.getString("addr");
                    
                    Account = new AccountDTO(account, pass, roleDB, fullName, gender, birthDay, phone, addr);
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return Account;
    }
    
    public static void main(String[] args) {
        AccountDAO dao = new AccountDAO();
        System.out.println(dao.login("admin", "11111"));
    }
}
