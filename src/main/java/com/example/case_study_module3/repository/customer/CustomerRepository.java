package com.example.case_study_module3.repository.customer;

import com.example.case_study_module3.model.customer.Customer;
import com.example.case_study_module3.repository.BaseRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CustomerRepository implements ICustomerRepository {
    private static final String SELECT_ALL_USERS = "select * from user where delete_user = 0";
    private static final String INSERT_USERS = " insert into user(user_name,user_dob,user_gender,user_id_card,user_phone_number,user_mail,user_address,account_user_name)" +
            "values(?,?,?,?,?,?,?,?)";
    private static final String UPDATE_USERS = " update user set user_name = ?,user_dob= ?, user_gender =?" +
            ",user_phone_number=?,user_mail=?,user_address=?, account_user_name = ? where user_id = ? ";
    private static final String SELECT_USERS_BY_ID = " select user_id,user_name,user_dob,user_gender,user_id_card,user_phone_number,user_mail,user_address,account_user_name from user\n" +
            " where user_id =?; ";
    private static final String DELETE_ACCOUNT = "call delete_by_id(?);";
    private static final String SELECT_USERS_BY_ACC_USER_NAME = " select user_id,user_name,user_dob,user_gender,user_id_card,user_phone_number,user_mail,user_address,account_user_name from user\n" +
            " where account_user_name = ?; ";

    @Override
    public List<Customer> selectAllUser() throws SQLException {
        List<Customer> customerList = new ArrayList<>();
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_USERS);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("user_id");
                String name = resultSet.getString("user_name");
                String dob = resultSet.getString("user_dob");
                boolean gender = resultSet.getBoolean("user_gender");
                String idCard = resultSet.getString("user_id_card");
                String phoneNumber = resultSet.getString("user_phone_number");
                String email = resultSet.getString("user_mail");
                String address = resultSet.getString("user_address");
                int typeOfCustomerID = resultSet.getInt("type_of_customer_id");
                String accUserName = resultSet.getString("account_user_name");
                customerList.add(new Customer(id, name, dob, gender, idCard, phoneNumber, email, address, typeOfCustomerID, accUserName));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        return customerList;
    }

    @Override
    public void insertUser(Customer customer) {
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS);
            preparedStatement.setString(1, customer.getName());
            preparedStatement.setString(2, customer.getdOB());
            preparedStatement.setBoolean(3, customer.isGender());
            preparedStatement.setString(4, customer.getIdCard());
            preparedStatement.setString(5, customer.getPhoneNumber());
            preparedStatement.setString(6, customer.getEmail());
            preparedStatement.setString(7, customer.getAddress());
            preparedStatement.setString(8, customer.getAccUserName());
            preparedStatement.executeUpdate();
            connection.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    @Override
    public boolean updateUser(Customer customer) throws SQLException {
        boolean rowUpdate;
        Connection connection = BaseRepository.getConnection();
        PreparedStatement preparedStatement ;
        try {
            preparedStatement = connection.prepareStatement(UPDATE_USERS);
            preparedStatement.setString(1, customer.getName());
            preparedStatement.setString(2, customer.getdOB());
            preparedStatement.setBoolean(3, customer.isGender());
            preparedStatement.setString(4, customer.getPhoneNumber());
            preparedStatement.setString(5, customer.getEmail());
            preparedStatement.setString(6, customer.getAddress());
            preparedStatement.setString(7, customer.getAddress());
            preparedStatement.setString(8, customer.getAccUserName());
            rowUpdate = preparedStatement.executeUpdate() > 0;
            connection.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return rowUpdate;
    }

    @Override
    public Customer selectCustomer(int id) throws SQLException {
        Customer customer = null;
        Connection connection = BaseRepository.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USERS_BY_ID);
        preparedStatement.setInt(1, id);
        ResultSet resultSet = preparedStatement.executeQuery();
        while (resultSet.next()) {
            String name = resultSet.getString("user_name");
            String dob = resultSet.getString("user_dob");
            boolean gender = resultSet.getBoolean("user_gender");
            String idCard = resultSet.getString("user_id_card");
            String phoneNumber = resultSet.getString("user_phone_number");
            String email = resultSet.getString("user_mail");
            String address = resultSet.getString("user_address");
            String accUserName = resultSet.getString("account_user_name");
            customer = new Customer(id, name, dob, gender, idCard, phoneNumber, email, address,accUserName);
        }
        connection.close();
        return customer;
    }

    @Override
    public boolean deleteUser(int id) throws SQLException {
        Connection connection = BaseRepository.getConnection();
        boolean rowDelete;
        try {
            CallableStatement callableStatement = connection.prepareCall(DELETE_ACCOUNT);
            callableStatement.setInt(1, id);
            callableStatement.executeUpdate();
            rowDelete = callableStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        return rowDelete;
    }

    @Override
    public Customer selectCustomerByAccUser(String accUserName) throws SQLException {
        Customer customer = null;
        Connection connection = BaseRepository.getConnection();
        PreparedStatement preparedStatement;
        try {
            preparedStatement = connection.prepareStatement(SELECT_USERS_BY_ACC_USER_NAME);
            preparedStatement.setString(1, accUserName);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                int id = resultSet.getInt("user_id");
                String name = resultSet.getString("user_name");
                String dOB = resultSet.getString("user_dob");
                boolean gender = resultSet.getBoolean("user_gender");
                String idCard = resultSet.getString("user_id_card");
                String phoneNumber = resultSet.getString("user_phone_number");
                String email = resultSet.getString("user_mail");
                String address = resultSet.getString("user_address");
                customer = new Customer(id, name, dOB, gender, idCard, phoneNumber, email, address, accUserName);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }

        }
        return customer;
    }

    @Override
    public void editUser(int id, String name, String dateOfBirth, boolean gender, String phoneNumber, String email, String address, String accUserName) {
        try {
            PreparedStatement preparedStatement = BaseRepository.getConnection().prepareStatement(UPDATE_USERS);
            preparedStatement.setString(1,name);
            preparedStatement.setString(2,dateOfBirth);
            preparedStatement.setBoolean(3,gender);
            preparedStatement.setString(4,phoneNumber);
            preparedStatement.setString(5,email);
            preparedStatement.setString(6,address);
            preparedStatement.setString(7,accUserName);
            preparedStatement.setInt(8,id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }
}
