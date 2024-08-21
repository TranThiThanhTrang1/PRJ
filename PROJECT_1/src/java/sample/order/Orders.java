/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.order;

import java.util.Date;

/**
 *
 * @author Admin
 */
public class Orders {
    private int orderID;
    private String userID;
    private Date datetime;
    private String total;
    private int status;

    public Orders() {
    }

    public Orders(int orderID, String userID, Date datetime, String total, int status) {
        this.orderID = orderID;
        this.userID = userID;
        this.datetime = datetime;
        this.total = total;
        this.status = status;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public Date getDatetime() {
        return datetime;
    }

    public void setDatetime(Date datetime) {
        this.datetime = datetime;
    }

    public String getTotal() {
        return total;
    }

    public void setTotal(String total) {
        this.total = total;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    
    

   


    
    
    
}
