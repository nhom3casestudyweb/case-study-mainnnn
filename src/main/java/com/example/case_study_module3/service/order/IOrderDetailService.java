package com.example.case_study_module3.service.order;

import com.example.case_study_module3.model.order.OrderDetail;

import java.util.List;

public interface IOrderDetailService {
    void insertOrderDetail(OrderDetail orderDetail);
    List<OrderDetail> selectAll();
    OrderDetail selectOrderDetail(int orderId, int productId);
    void deleteOrder(int orderId, int productId);
    void updateOrder(int id, OrderDetail orderDetail);
}
