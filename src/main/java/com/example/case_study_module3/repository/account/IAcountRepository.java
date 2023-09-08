package com.example.case_study_module3.repository.account;


import com.example.case_study_module3.model.account.Account;
import com.example.case_study_module3.model.customer.Customer;

import java.util.List;

public interface IAcountRepository {
    Account findByUserName(String userName);
    Account checkAccount(String userName, String password);
    boolean addUser(Account user);
    List<Account> getAllUser();
    boolean deleteUser(String userName);
    boolean editUser(String userName, String password);
    Customer findCustomerByUserName(String userName);
//
    String findTypeOfCustomer(Customer user);
}
