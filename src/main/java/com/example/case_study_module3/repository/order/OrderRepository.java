package com.example.case_study_module3.repository.order;

import com.example.case_study_module3.model.customer.Customer;
import com.example.case_study_module3.model.order.Cart;
import com.example.case_study_module3.model.order.Item;
import com.example.case_study_module3.model.order.Order;
import com.example.case_study_module3.repository.BaseRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.HashMap;
import java.util.Map;

public class OrderRepository implements IOrderRepository {

    private static final String INSERT_ORDER = "INSERT INTO `order`(order_date,user_id,status,total_price)" +
            "values(?,?,?,?);";
    private static final String SHOW_ALL = "SELECT * FROM order;";
    private static final String DELETE = "DELETE FROM order WHERE order_id = ?;";
    private static final String SELECT_BY_ID = "SELECT * FROM order WHERE order_id = ?;";
    private static final String GET_ID_LAST = "SELECT order_id FROM `order`ORDER BY order_id DESC LIMIT 1;";
    private static final String INSERT_ORDER_DETAIL = "INSERT INTO order_detail(order_id, product_id, order_detail_price, product_quantity)" +
            "VALUES(?,?,?,?);";
    private static final String UPDATE_INVENTORY = "UPDATE product SET product_inventory = ? WHERE product_id = ?;";
    @Override
    public void addOrder(Customer customer, Cart cart) {
        LocalDate curDate = LocalDate.now();
        String date = curDate.toString();
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_ORDER);
            preparedStatement.setString(1,date);
            preparedStatement.setInt(2,customer.getId());
            preparedStatement.setInt(3,0);
            preparedStatement.setInt(4,cart.getTotalMoney());
            preparedStatement.executeUpdate();
            //lấy ra id của order mới add vào
            PreparedStatement preparedStatement1 = connection.prepareStatement(GET_ID_LAST);
            ResultSet resultSet = preparedStatement1.executeQuery();
            //add vào bảng orderDetail
            if (resultSet.next()){
                int orderId = resultSet.getInt("order_id");
                for (Item item : cart.getItems()) {
                    PreparedStatement preparedStatement2 = connection.prepareStatement(INSERT_ORDER_DETAIL);
                    preparedStatement2.setInt(1,orderId);
                    preparedStatement2.setInt(2,item.getProduct().getProductId());
                    preparedStatement2.setDouble(3,item.getPrice());
                    preparedStatement2.setInt(4,item.getQuantity());
                    preparedStatement2.executeUpdate();

                    PreparedStatement preparedStatement3 = connection.prepareStatement(UPDATE_INVENTORY);
                    preparedStatement3.setInt(1, item.getProduct().getProductInventory() - item.getQuantity());
                    preparedStatement3.setInt(2,item.getProduct().getProductId());
                    preparedStatement3.executeUpdate();
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }


    @Override
    public void insertOrder(Order order) {
//        Connection connection = BaseProductRepository.getConnection();
//        try {
//            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_ORDER);
//            preparedStatement.setString(1,order.getOrderDate());
//            preparedStatement.setInt(2,order.getUserId());
//            preparedStatement.executeUpdate();
//        } catch (SQLException e) {
//            throw new RuntimeException(e);
//        }
    }

    @Override
    public Map<Integer, Order> selectAll() {
        Map<Integer, Order> orderMap = new HashMap<>();
//        Connection connection = BaseProductRepository.getConnection();
//        try {
//            PreparedStatement preparedStatement = connection.prepareStatement(SHOW_ALL);
//            ResultSet resultSet = preparedStatement.executeQuery();
//            while (resultSet.next()){
//                int orderId = resultSet.getInt("order_id");
//                String orderDate = resultSet.getString("order_date");
//                int userId = resultSet.getInt("user_id");
//                orderMap.put(orderId,new Order(orderId,orderDate,userId));
//            }
//        } catch (SQLException e) {
//            throw new RuntimeException(e);
//        }
        return orderMap;
    }

    @Override
    public void updateOrder(Order order) {

    }

    @Override
    public Order selectById(int id) {
        Order order = null;
//        Connection connection = BaseProductRepository.getConnection();
//        try {
//            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_BY_ID);
//            preparedStatement.setInt(1,id);
//            ResultSet resultSet = preparedStatement.executeQuery();
//            while (resultSet.next()){
//                int orderId = resultSet.getInt("order_id");
//                String orderDate = resultSet.getString("order_date");
//                int userId = resultSet.getInt("user_id");
//                order = new Order(orderId,orderDate,userId);
//            }
//        } catch (SQLException e) {
//            throw new RuntimeException(e);
//        }
        return order;
    }

    @Override
    public void deleteOrder(int id) {
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE);
            preparedStatement.setInt(1,id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }


}
