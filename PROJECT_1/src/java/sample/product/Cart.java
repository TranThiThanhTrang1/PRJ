/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.product;

import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author Admin
 */
public class Cart {
    
    private Map<String, Product> cart;

    public Cart() {
    }

    public Cart(Map<String, Product> cart) {
        this.cart = cart;
    }

    public Map<String, Product> getCart() {
        return cart;
    }

    public void setCart(Map<String, Product> cart) {
        this.cart = cart;
    }

    public boolean add(Product product) {
        boolean check = false;
        try {
            if (this.cart == null) {
                this.cart = new HashMap<>();       
            }
            if (this.cart.containsKey(product.getId())) {
                int currentQuanit = this.cart.get(product.getId()).getQuantity();
                product.setQuantity(currentQuanit + product.getQuantity());              
            }
            this.cart.put(product.getId(), product);
            check = true;
        } catch (Exception e) {
        }
        return check;
    }

    public boolean remove(String id) {
        boolean check=false;
        try {
            if (this.cart != null) {
                if (this.cart.containsKey(id)) {
                    this.cart.remove(id);
                    check = true;
                }
            }
        } catch (Exception e) {
        }
        return check;
    }

    public void update(String cartID) {
        if (cart != null) {
            for (Product product : cart.values()) {

                if (product.getId().equals(cartID)) {
                    product.setQuantity(product.getQuantity());
                }

            }
        }
    }

        
        
    public Product findProductbyID(String cartID) {

        if (cart != null) {
            for (Product product : cart.values()) {

                if (product.getId().equals(cartID)) {
                    return product;

                }
            }
        }
        return null;
    }
    
    
    public double getTotalMoney() {
        double totalMoney = 0;
        if (this.cart != null) {
            for (Product product : this.cart.values()) {
                totalMoney += product.getPrice() * product.getQuantity();
            }
        }
        return totalMoney;
    }
    
}
