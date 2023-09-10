package com.example.case_study_module3.service.customer;

import com.example.case_study_module3.model.customer.Customer;
import com.example.case_study_module3.model.product.Product;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface ICustomerService {
    List<Customer> selectAllCustomer() throws SQLException;
    Customer selectCustomer(int id) throws SQLException;
    boolean removeUser(int id) throws SQLException;
    Map<String, String> save(Customer customer);
    Map<String, String> updateUser(Customer customer);
    Customer selectCustomerByAccUser(String accUserName) throws SQLException;

    void editUser(int id, String name, String dateOfBirth, boolean gender, String phoneNumber, String email, String address, String accUserName);
}
