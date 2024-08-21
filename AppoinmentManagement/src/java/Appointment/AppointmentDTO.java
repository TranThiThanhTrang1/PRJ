/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Appointment;

import java.sql.Timestamp;

/**
 *
 * @author Admin
 */
public class AppointmentDTO {
    private int idApp;
    private String account;
    private String partnerPhone;
    private String partnerName;
    private Timestamp timeToMeet;
    private String place;
    private double expense;
    private String note;

    public AppointmentDTO() {
    }

    public AppointmentDTO(int idApp, String account, String partnerPhone, String partnerName, Timestamp timeToMeet, String place, double expense, String note) {
        this.idApp = idApp;
        this.account = account;
        this.partnerPhone = partnerPhone;
        this.partnerName = partnerName;
        this.timeToMeet = timeToMeet;
        this.place = place;
        this.expense = expense;
        this.note = note;
    }

    public int getIdApp() {
        return idApp;
    }

    public void setIdApp(int idApp) {
        this.idApp = idApp;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getPartnerPhone() {
        return partnerPhone;
    }

    public void setPartnerPhone(String partnerPhone) {
        this.partnerPhone = partnerPhone;
    }

    public String getPartnerName() {
        return partnerName;
    }

    public void setPartnerName(String partnerName) {
        this.partnerName = partnerName;
    }

    public Timestamp getTimeToMeet() {
        return timeToMeet;
    }

    public void setTimeToMeet(Timestamp timeToMeet) {
        this.timeToMeet = timeToMeet;
    }

    public String getPlace() {
        return place;
    }

    public void setPlace(String place) {
        this.place = place;
    }

    public double getExpense() {
        return expense;
    }

    public void setExpense(double expense) {
        this.expense = expense;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }
    
    
   
}
