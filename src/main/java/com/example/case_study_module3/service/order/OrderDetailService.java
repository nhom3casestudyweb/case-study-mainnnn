package com.example.case_study_module3.service.order;

import com.example.case_study_module3.model.order.OrderDetail;
import com.example.case_study_module3.repository.order.IOrderDetailRepository;
import com.example.case_study_module3.repository.order.OrderDetailRepository;

import java.util.List;

public class OrderDetailService implements IOrderDetailService{
    private static final IOrderDetailRepository orderDetailRepository = new OrderDetailRepository();
    @Override
    public void insertOrderDetail(OrderDetail orderDetail) {
        orderDetailRepository.insertOrderDetail(orderDetail);
    }

    @Override
    public List<OrderDetail> selectAll() {
        return orderDetailRepository.selectAll();
    }

    @Override
    public OrderDetail selectOrderDetail(int orderId, int productId) {
        return orderDetailRepository.selectOrderDetail(orderId,productId);
    }

    @Override
    public void deleteOrder(int orderId, int productId) {
        orderDetailRepository.deleteOrder(orderId,productId);
    }

    @Override

    public void updateOrder(int id, OrderDetail orderDetail) {
        orderDetailRepository.updateOrder(id,orderDetail);
    }
}
