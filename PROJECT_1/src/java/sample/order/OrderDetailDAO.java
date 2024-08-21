/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import sample.product.Cart;
import sample.product.Product;
import sample.user.UserDTO;
import sample.utils.DBUtils;

/**
 *
 * @author Admin
 */
public class OrderDetailDAO {
    
    private static final String SEARCH = "SELECT orderID, productID, price, quantity, [status] FROM [dbo].[tblOrderDetail] WHERE productID LIKE ?";
    
    private static final String INSERT_ORDER = "INSERT INTO [dbo].[tblOrders] (userID, orderDate, total, status) VALUES (?, ?, ?, ?)";
    private static final String SELECT_ORDER = "SELECT TOP 1 orderID FROM [dbo].[tblOrders] ORDER BY orderID DESC";
    private static final String INSERT_ORDERDETAIL = "INSERT INTO tblOrderDetail (orderID, productID, price, quantity, status) VALUES (?, ?, ?, ?, ?)";
    
    private static final String UPDATE_PRODUCT = "UPDATE tblProducts SET quantity=quantity-? WHERE productID= ?";

    public void addOrder(UserDTO user, Cart cart) throws SQLException {
        try (Connection conn = DBUtils.getConnection();
                PreparedStatement orderStmt = conn.prepareStatement(INSERT_ORDER);
                PreparedStatement detailStmt = conn.prepareStatement(INSERT_ORDERDETAIL);
                PreparedStatement productStmt = conn.prepareStatement(UPDATE_PRODUCT)) {

            // Insert new order
            LocalDate currentDate = LocalDate.now();
            orderStmt.setString(1, user.getUserID());
            orderStmt.setString(2, currentDate.toString());
            orderStmt.setDouble(3, cart.getTotalMoney());
            orderStmt.setInt(4, 1); // Order status: 1 (active)
            orderStmt.executeUpdate();

            // Get the order ID of the newly inserted order
            try (ResultSet rs = conn.prepareStatement(SELECT_ORDER).executeQuery()) {
                if (rs.next()) {
                    int orderId = rs.getInt("orderID");

                    // Insert order details
                    for (Product product : cart.getCart().values()) {
                        detailStmt.setInt(1, orderId);
                        detailStmt.setString(2, product.getId());
                        detailStmt.setInt(3, product.getQuantity());
                        detailStmt.setDouble(4, product.getPrice());
                        detailStmt.setInt(5, 1); // Order detail status: 1 (active)
                        detailStmt.executeUpdate();
                    }
                }
            }

            // Update product quantities
            for (Product product : cart.getCart().values()) {
                productStmt.setInt(1, product.getQuantity());
                productStmt.setString(2, product.getId());
                productStmt.executeUpdate();
            }
        } catch (ClassNotFoundException | SQLException e) {
            // Handle exceptions
        }
    }
    

    public static boolean createOrderDetail(OrderDetail orderDetail) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;

        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                    ptm = conn.prepareStatement(INSERT_ORDERDETAIL);
                    ptm.setInt(1, orderDetail.getOrderID());
                    ptm.setString(2, orderDetail.getProductID());
                    ptm.setInt(3, orderDetail.getQuantity());
                    ptm.setDouble(4, orderDetail.getPrice());
                    ptm.setInt(5, orderDetail.getStatus());
                }             
                check = ptm.executeUpdate()>0?true:false;

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public List<OrderDetail> getOrderDetails(String search) throws ClassNotFoundException, SQLException {
        List<OrderDetail> orderDetails = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        
        
        try {            
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SEARCH);
                ptm.setString(1, "%" + search + "%");
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int orderID = rs.getInt("orderID");
                    String productID = rs.getString("productID");
                    double price = rs.getDouble("price");
                    int quantity = rs.getInt("quantity");
                    int status = rs.getInt("status");
                    orderDetails.add(new OrderDetail(orderID, productID, price, quantity, status));
                }
                
                
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return orderDetails;
    }
    
    

}
