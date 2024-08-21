/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.product;

/**
 *
 * @author Admin
 */
public class ProductError {
    private String idError;
    private String nameError;
    private double priceError;
    private int quantityError;
    private String error;

    public ProductError() {
        this.idError = "";
        this.nameError = "";
        this.priceError = 0;
        this.quantityError = 0;
        this.error = "";
    }

    public ProductError(String idError, String nameError, double priceError, int quantityError) {
        this.idError = idError;
        this.nameError = nameError;
        this.priceError = priceError;
        this.quantityError = quantityError;
        this.error = error;
    }

    public String getIdError() {
        return idError;
    }

    public void setIdError(String idError) {
        this.idError = idError;
    }

    public String getNameError() {
        return nameError;
    }

    public void setNameError(String nameError) {
        this.nameError = nameError;
    }

    public double getPriceError() {
        return priceError;
    }

    public void setPriceError(double priceError) {
        this.priceError = priceError;
    }

    public int getQuantityError() {
        return quantityError;
    }

    public void setQuantityError(int quantityError) {
        this.quantityError = quantityError;
    }

    public String getError() {
        return error;
    }

    public void setError(String error) {
        this.error = error;
    }
    
    
    


    
    
}
