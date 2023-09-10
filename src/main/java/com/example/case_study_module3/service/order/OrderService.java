package com.example.case_study_module3.service.order;

import com.example.case_study_module3.model.customer.Customer;
import com.example.case_study_module3.model.order.Cart;
import com.example.case_study_module3.model.order.Order;
import com.example.case_study_module3.repository.order.IOrderRepository;
import com.example.case_study_module3.repository.order.OrderRepository;

import java.util.Map;

public class OrderService implements IOrderService {
    IOrderRepository orderRepository = new OrderRepository();
    @Override
    public void insertOrder(Order order) {
        orderRepository.insertOrder(order);
    }

    @Override
    public Map<Integer, Order> selectAll() {
        return orderRepository.selectAll();
    }

    @Override
    public void updateOrder(Order order) {
        orderRepository.updateOrder(order);
    }

    @Override
    public Order selectById(int id) {
        return orderRepository.selectById(id);
    }

    @Override
    public void deleteOrder(int id) {
        orderRepository.deleteOrder(id);
    }

    @Override
    public void addOrder(Customer customer, Cart cart) {
        orderRepository.addOrder(customer,cart);
    }

}
