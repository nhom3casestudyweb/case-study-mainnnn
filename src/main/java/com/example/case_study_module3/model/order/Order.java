
package com.example.case_study_module3.model.order;



public class Order {
    private int orderId;
    private String orderDate;
    private int userId;
    private boolean status;
    private double totalPrice;

    public Order(int orderId, String orderDate, int userId, boolean status, double totalPrice) {
        this.orderId = orderId;
        this.orderDate = orderDate;
        this.userId = userId;
        this.status = status;
        this.totalPrice = totalPrice;
    }

    public Order(String orderDate, int userId, boolean status, double totalPrice) {
        this.orderDate = orderDate;
        this.userId = userId;
        this.status = status;
        this.totalPrice = totalPrice;
    }
}
