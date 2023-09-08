package com.example.case_study_module3.controller.customer;

import com.example.case_study_module3.model.customer.Customer;
import com.example.case_study_module3.service.customer.CustomerService;
import com.example.case_study_module3.service.customer.ICustomerService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

@WebServlet(name = "CustomerServlet", value = "/customer")
public class CustomerServlet extends HttpServlet {
    private final ICustomerService customerService = new CustomerService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        try {
            switch (action) {
                case "create":
                    showCreateForm(request, response);
                    break;
                case "edit":
                    showEditForm(request, response);
                    break;
                case "customerChangeInfo":
                    customerChangeInfo(request, response);
                default:
                    listUser(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    private void listUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        List<Customer> customerList = customerService.selectAllCustomer();
        request.setAttribute("customerList", customerList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/user_management.jsp");
        requestDispatcher.forward(request, response);
    }

    private void customerChangeInfo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        String accUserName = request.getParameter("userName");
        Customer customer = customerService.selectCustomerByAccUser(accUserName);
        request.setAttribute("customer", customer);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("customer/edit.jsp");
        requestDispatcher.forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Customer customer = customerService.selectCustomer(id);
        request.setAttribute("customer", customer);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("edit_user.jsp");
        requestDispatcher.forward(request, response);
    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/create.jsp");
        requestDispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        try {
            switch (action) {
                case "create":
                    insertUser(request, response);
                    break;
                case "update":
                    updateUser(request, response);
                    break;
                case "delete":
                    deleteUser(request, response);
                    break;
                case "editUser":
                    editUser(request,response);
                    break;

            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    private void editUser(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("user_id"));
        String name = request.getParameter("user_name");
        String dateOfBirth = "";
        if (!request.getParameter("user_dob").isEmpty()) {
            dateOfBirth = request.getParameter("user_dob");
        }
        boolean gender = request.getParameter("user_gender").equals("nam");
        String phoneNumber = request.getParameter("user_phone_number");
        String email = request.getParameter("user_mail");
        String address = request.getParameter("user_address");
        String accUserName = request.getParameter("account_user_name");
        customerService.editUser(id,name,dateOfBirth,gender,phoneNumber,email,address,accUserName);
        try {
            response.sendRedirect("/customer");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void updateUser(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("user_id"));
        String name = request.getParameter("user_name");
        String dateOfBirth = "";
        if (!request.getParameter("user_dob").isEmpty()) {
            dateOfBirth = request.getParameter("user_dob");
        }
        boolean gender = request.getParameter("user_gender").equals("nam");
        String phoneNumber = request.getParameter("user_phone_number");
        String email = request.getParameter("user_mail");
        String address = request.getParameter("user_address");
        String accUserName = request.getParameter("account_user_name");
        Customer customer = new Customer(id, name, dateOfBirth, gender, phoneNumber, email, address,accUserName);
        Map<String, String> errMapEdit = this.customerService.updateUser(customer);
        if (errMapEdit.isEmpty()) {
            response.sendRedirect("/customer");
        } else {
            request.setAttribute("customer", customer);
            request.setAttribute("error", errMapEdit);
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("user_management.jsp");
            requestDispatcher.forward(request, response);
        }
    }

    private void deleteUser(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        System.out.println(id);
        customerService.removeUser(id);
        List<Customer> customerList = customerService.selectAllCustomer();
        request.setAttribute("customerList", customerList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("user_management.jsp");
        requestDispatcher.forward(request, response);
    }

    private void insertUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String name = request.getParameter("user_name");
//        Date dateOfBirth = Date.valueOf(LocalDate.now());
//
//        if (request.getParameter("user_dob")!=null){
//            dateOfBirth = Date.valueOf((request.getParameter("user_dob")));
//        }
        String dateOfBirth = "";
        if (!request.getParameter("user_dob").isEmpty()) {
            dateOfBirth = request.getParameter("user_dob");
        }
        boolean gender = request.getParameter("user_gender").equals("nam");
        String userIdCard = request.getParameter("user_id_card");
        String phoneNumber = request.getParameter("user_phone_number");
        String email = request.getParameter("user_mail");
        String address = request.getParameter("user_address");
        String accountUserName = request.getParameter("account_user_name");
        Customer customer = new Customer(name, dateOfBirth, gender, userIdCard, phoneNumber, email, address, accountUserName);
        Map<String, String> errMap = this.customerService.save(customer);
        if (errMap.isEmpty()) {
            response.sendRedirect("home.jsp");
        } else {
            request.setAttribute("customer", customer);
            request.setAttribute("error", errMap);
            try {
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("customer/create.jsp");
                requestDispatcher.forward(request, response);
            } catch (ServletException e) {
                throw new RuntimeException(e);
            }
        }
    }
}