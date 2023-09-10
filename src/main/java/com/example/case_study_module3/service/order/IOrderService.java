package com.example.case_study_module3.service.order;

import com.example.case_study_module3.model.customer.Customer;
import com.example.case_study_module3.model.order.Cart;
import com.example.case_study_module3.model.order.Order;

import java.util.Map;

public interface IOrderService {
    void insertOrder(Order order);
    Map<Integer, Order> selectAll();
    void updateOrder(Order order);
    Order selectById(int id);
    void deleteOrder(int id);
    void addOrder(Customer customer, Cart cart);

}
