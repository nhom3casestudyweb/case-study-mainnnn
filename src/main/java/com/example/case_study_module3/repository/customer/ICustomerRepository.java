package com.example.case_study_module3.repository.customer;

import com.example.case_study_module3.model.customer.Customer;

import java.sql.SQLException;
import java.util.List;

public interface ICustomerRepository {
    List<Customer> selectAllUser() throws SQLException;
    void insertUser(Customer customer);
    boolean updateUser(Customer customer) throws SQLException;
    Customer selectCustomer(int id) throws SQLException;
    boolean deleteUser(int id) throws SQLException;
    Customer selectCustomerByAccUser(String accUserName) throws SQLException;

    void editUser(int id, String name, String dateOfBirth, boolean gender, String phoneNumber, String email, String address, String accUserName);
}
