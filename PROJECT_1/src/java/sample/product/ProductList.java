/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import sample.utils.DBUtils;

/**
 *
 * @author Admin
 */
public class ProductList {
    
    private static final String TABLE = "SELECT * FROM tblProducts";
    private static final String TOP3 = "SELECT TOP 3 * FROM tblProducts ORDER BY ProductID DESC";
    private static final String INFO = "SELECT * FROM tblProducts WHERE productID = ?";
    private static final String UPDATE = "UPDATE tblProducts SET quantity=? WHERE productID= ?";
    
    private static final String DUPLICATE = "SELECT productName FROM tblProducts WHERE userID=?";
    private static final String INSERT = "INSERT INTO tblProducts (productID, productName, productPrice, quantity) VALUES(?,?,?,?)";
    

    
    public List<Product> getListProduct() throws SQLException {
        List<Product> listProduct = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(TABLE);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String productID = rs.getString("productID");
                    String productName = rs.getString("productName");
                    double productPrice = Double.parseDouble(rs.getString("productPrice"));
                    int quantity = Integer.parseInt(rs.getString("quantity"));
                    listProduct.add(new Product(productID, productName, productPrice, quantity));
                }
            }
        } catch (ClassNotFoundException | NumberFormatException | SQLException e) {
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
        return listProduct;
    }
    
    public Product getInfoAProduct(String id) throws SQLException {
        Product product = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(INFO);
                ptm.setString(1, id);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    String productName = rs.getString("productName");
                    double productPrice = Double.parseDouble(rs.getString("productPrice"));
                    int quantity = Integer.parseInt(rs.getString("quantity"));
                    product = new Product(id, productName, productPrice, quantity);
                }
            }
        } catch (ClassNotFoundException | NumberFormatException | SQLException e) {
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
        return product;
    }
    
    public boolean updateProducts(Product product) throws SQLException {
        boolean check = false;
        
        List<Product> listProduct = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATE);
                
                ptm.setInt(1, product.getQuantity());
                ptm.setString(2, product.getId());
            
                check = ptm.executeUpdate() > 0;
            }
        } catch (ClassNotFoundException | SQLException e) {
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
    
        public List<Product> getTop3Product() throws SQLException {
        List<Product> listProduct = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(TOP3);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String productID = rs.getString("productID");
                    String productName = rs.getString("productName");
                    double productPrice = Double.parseDouble(rs.getString("productPrice"));
                    int quantity = Integer.parseInt(rs.getString("quantity"));
                    listProduct.add(new Product(productID, productName, productPrice, quantity));
                }
            }
        } catch (ClassNotFoundException | NumberFormatException | SQLException e) {
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
        return listProduct;
    }

    public boolean checkDulicate(String productID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(DUPLICATE);
                ptm.setString(1, productID);

                rs = ptm.executeQuery();
                if (rs.next()) {
                    check = true;
                }
            }
        } catch (Exception e) {
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
        return check;

    }

    public boolean insert(Product product) throws SQLException, ClassNotFoundException{
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;

        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(INSERT);
                ptm.setString(1, product.getId());
                ptm.setString(2, product.getName());
                ptm.setDouble(3, product.getPrice());
                ptm.setInt(4, product.getQuantity());

                check = ptm.executeUpdate()>0?true:false;
            }
        } catch (SQLException e) {
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
    
}
