package com.example.case_study_module3.repository.order;

import com.example.case_study_module3.model.order.OrderDetail;
import com.example.case_study_module3.repository.BaseRepository;
import com.example.case_study_module3.repository.product.IProductRepository;
import com.example.case_study_module3.repository.product.ProductRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class OrderDetailRepository implements IOrderDetailRepository {

    private static final IProductRepository productRepository = new ProductRepository();
    private static final String INSERT = "INSERT INTO order_detail(order_id, product_id, order_detail_price, product_quantity)" +
            "values(?,?,?,?);";
    private static final String SELECT = "SELECT * FROM order_detail;";
    private static final String DELETE = "DELETE FROM order_detail WHERE order_id = ? AND product_id = ?;";
    private static final String UPDATE = "UPDATE order_detail SET order_detail_price = ?," +
            "product_quantity = ? " +
            "WHERE order_id = ? AND product_id = ?; ";

    @Override
    public void insertOrderDetail(OrderDetail orderDetail) {
//        Connection connection = BaseProductRepository.getConnection();
//        try {
//            PreparedStatement preparedStatement = connection.prepareStatement(INSERT);
//            preparedStatement.setInt(1,orderDetail.getOrderId());
//            preparedStatement.setInt(2,orderDetail.getProduct().getProductId());
//            preparedStatement.setInt(3,orderDetail.getPrice());
//            preparedStatement.setInt(4,orderDetail.getQuantity());
//            preparedStatement.executeUpdate();
//        } catch (SQLException e) {
//            throw new RuntimeException(e);
//        }

    }

    @Override
    public List<OrderDetail> selectAll() {
        List<OrderDetail> orderDetailList = new ArrayList<>();
//        Connection connection = BaseProductRepository.getConnection();
//        try {
//            PreparedStatement preparedStatement = connection.prepareStatement(SELECT);
//            ResultSet resultSet = preparedStatement.executeQuery();
//            while (resultSet.next()){
//                int orderId = resultSet.getInt("order_id");
//                int productId = resultSet.getInt("product_id");
//                Product product = productRepository.selectProduct(productId);
//                int price = resultSet.getInt("order_detail_price");
//                int quantity = resultSet.getInt("product_quantity");
//                orderDetailList.add(new OrderDetail(orderId,product,price,quantity));
//            }
//        } catch (SQLException e) {
//            throw new RuntimeException(e);
//        }
        return orderDetailList;
    }

    @Override
    public OrderDetail selectOrderDetail(int orderId, int productId) {
        for (OrderDetail orderDetail: selectAll()) {
//            if (orderDetail.getOrderId() == orderId && orderDetail.getProduct().getProductId() == productId){
//                return orderDetail;
//            }
        }
        return null;
    }

    @Override
    public void deleteOrder(int orderId, int productId) {
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE);
            preparedStatement.setInt(1,orderId);
            preparedStatement.setInt(2,productId);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void updateOrder(int id, OrderDetail orderDetail) {
//        Connection connection = BaseProductRepository.getConnection();
//
//        try {
//            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE);
//            preparedStatement.setInt(1,orderDetail.getPrice());
//            preparedStatement.setInt(2,orderDetail.getQuantity());
//            preparedStatement.setInt(3,orderDetail.getOrderId());
//            preparedStatement.setInt(4,orderDetail.getProduct().getProductId());
//        } catch (SQLException e) {
//            throw new RuntimeException(e);
//        }
    }
}
