package com.example.case_study_module3.controller.order;

import com.example.case_study_module3.model.order.Cart;
import com.example.case_study_module3.model.order.Item;
import com.example.case_study_module3.model.product.Product;
import com.example.case_study_module3.service.customer.CustomerService;
import com.example.case_study_module3.service.customer.ICustomerService;
import com.example.case_study_module3.service.order.IOrderService;
import com.example.case_study_module3.service.order.OrderService;
import com.example.case_study_module3.service.product.IProductService;
import com.example.case_study_module3.service.product.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "OrderServlet", value = "/order")
public class OrderServlet extends HttpServlet {
    static IOrderService orderService = new OrderService();
    static IProductService productService = new ProductService();
    static ICustomerService customerService = new CustomerService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null){
            action = "";
        }
        switch (action){
            case "delete":
                deleteOrder(request,response);
                break;
            case "addToCart":
                addToCart(request,response);
                break;
            case "showCart":
                showCart(request,response);
                break;
            case "checkOut":
                checkOut(request,response);
                break;
            default:
                showListOrder(request,response);
                break;
        }
    }

    private void showListOrder(HttpServletRequest request, HttpServletResponse response) {
    }

    private void checkOut(HttpServletRequest request, HttpServletResponse response) {
    }

    private void showCart(HttpServletRequest request, HttpServletResponse response) {
    }

    private void addToCart(HttpServletRequest request, HttpServletResponse response) {
//        int id = Integer.parseInt(request.getParameter("id"));
//        int quantity = Integer.parseInt(request.getParameter("quantity"));
//        Product product = productService.finById(id);
//        Cart.addProduct(product,quantity);
//        request.setAttribute("totalQuantity",Cart.totalQuantity);
//        try {
//            response.sendRedirect("/product-servlet");
//        } catch (IOException e) {
//            throw new RuntimeException(e);
//        }
    }

    private void deleteOrder(HttpServletRequest request, HttpServletResponse response) {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null){
            action = "";
        }
        switch (action){
            default:
                addQuantity(request,response);
                break;
        }

    }

    private void addQuantity(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession(true);
        Cart cart = null;
        Object o = session.getAttribute("cart");
        if (o!= null){
            cart = (Cart)o;
        }else {
            cart = new Cart();
        }
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        int id  = Integer.parseInt(request.getParameter("id"));
        Product product = productService.finById(id);
        double price = product.getProductPrice();
        Item item = new Item(product,quantity,price);
        cart.addItem(item);

        List<Item> list = cart.getItems();
        session.setAttribute("totalMoney",cart.getTotalMoney());
        session.setAttribute("cart", cart);
        session.setAttribute("size",list.size());
        try {
            request.getRequestDispatcher("index.jsp").forward(request,response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

//        Cart cart = new Cart();
//        int quantity = Integer.parseInt(request.getParameter("quantity"));
//        int id = Integer.parseInt(request.getParameter("id"));
//        Product product = productService.finById(id);
//        double price = product.getProductPrice();
//        Item item = new Item(product,quantity,price);
//        cart.addItem(item);
//        List<Item> list = cart.getItems();

    }
}