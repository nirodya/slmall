/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DB.Stock;

/**
 *
 * @author Nirodya Gamage
 */
public class CarttItems {
    private int qty;
    private DB.Stock stock;

    public CarttItems(int qty, Stock stock) {
        this.qty = qty;
        this.stock = stock;
    }

    /**
     * @return the qty
     */
    public int getQty() {
        return qty;
    }

    /**
     * @param qty the qty to set
     */
    public void setQty(int qty) {
        this.qty = qty;
    }

    /**
     * @return the stock
     */
    public DB.Stock getStock() {
        return stock;
    }

    /**
     * @param stock the stock to set
     */
    public void setStock(DB.Stock stock) {
        this.stock = stock;
    }
}
