package com.example.case_study_module3.controller.order;

import com.example.case_study_module3.model.account.Account;
import com.example.case_study_module3.model.customer.Customer;
import com.example.case_study_module3.model.order.Cart;
import com.example.case_study_module3.service.customer.CustomerService;
import com.example.case_study_module3.service.customer.ICustomerService;
import com.example.case_study_module3.service.order.IOrderService;
import com.example.case_study_module3.service.order.OrderService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "Checkout", value = "/checkout")
public class Checkout extends HttpServlet {
    private static final ICustomerService customerService = new CustomerService();
    private static final IOrderService orderService = new OrderService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        Cart cart = null;
        Object o = session.getAttribute("cart");
        if (o != null) {
            cart = (Cart) o;
        } else {
            cart = new Cart();
        }

        Account account = (Account) session.getAttribute("account");
        Customer customer = null;
        if (account != null) {
            try {
                customer = customerService.selectCustomerByAccUser(account.getUserName());
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
            orderService.addOrder(customer, cart);
            session.removeAttribute("cart");
            session.setAttribute("size", 0);
            response.sendRedirect("index.jsp");

        } else {
            response.sendRedirect("login.jsp");
        }
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        Account account = (Account) session.getAttribute("account");
        if (account != null){

        }
    }
}