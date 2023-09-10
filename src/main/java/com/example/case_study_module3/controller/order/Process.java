package com.example.case_study_module3.controller.order;

import com.example.case_study_module3.model.order.Cart;
import com.example.case_study_module3.model.order.Item;
import com.example.case_study_module3.model.product.Product;
import com.example.case_study_module3.service.product.IProductService;
import com.example.case_study_module3.service.product.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "Process", value = "/process")
public class Process extends HttpServlet {
    private static final IProductService productService = new ProductService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        Cart cart = null;
        Object o = session.getAttribute("cart");
        if (o!= null){
            cart = (Cart)o;
        }else {
            cart = new Cart();
        }
        int num = Integer.parseInt(request.getParameter("num"));
        int id =  Integer.parseInt(request.getParameter("id"));
        if (num == -1 && (cart.getQuantityById(id) <=1)){
            cart.removeItem(id);
        }else {
            Product product = productService.finById(id);
            Item item = new Item(product,num,product.getProductPrice());
            cart.addItem(item);
        }
        List<Item> list = cart.getItems();
        session.setAttribute("cart", cart);
        session.setAttribute("size",list.size());
        try {
            request.getRequestDispatcher("/order/order.jsp").forward(request,response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        Cart cart = null;
        Object o = session.getAttribute("cart");
        if (o!= null){
            cart = (Cart)o;
        }else {
            cart = new Cart();
        }
        int id  = Integer.parseInt(request.getParameter("id"));
        cart.removeItem(id);
        List<Item> list = cart.getItems();
        session.setAttribute("cart", cart);
        session.setAttribute("size",list.size());
        session.setAttribute("totalMoney",cart.getTotalMoney());
        try {
            request.getRequestDispatcher("/order/order.jsp").forward(request,response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}