package com.example.case_study_module3.controller.product;

import com.example.case_study_module3.model.product.Product;
import com.example.case_study_module3.service.product.IProductService;
import com.example.case_study_module3.service.product.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductServlet", value = "/product-servlet")
public class ProductServlet extends HttpServlet {
    private IProductService productService = new ProductService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "showFormCreate":
                break;
            case "showFormSearch":
                showFormSearch(request,response);
                break;
            case "showListChair":
                showListChair(request, response);
                break;
            case "showListDesk":
                showListDesk(request, response);
                break;
            case "showListAccessories":
                showListAccessories(request, response);
                break;
            case "showListChairUser":
                showListChairUser(request,response);
                break;
            case "showListDeskUser":
                showListDeskUser(request,response);
                break;
            case "showListAccessoriesUser":
                showListAccessoriesUser(request,response);
                break;
            case "showProductDetail":
                showProductDetail(request, response);
                break;
            case "showListChairAdmin":
                showListChairAdmin(request,response);
                break;
            case "showListDeskAdmin":
                showListDeskAdmin(request,response);
                break;
            case "showListAccessoriesAdmin":
                showListAccessoriesAdmin(request,response);
                break;
            case "editProduct" :
                editProduct(request,response);
                break;
            default:
                showFormCreate(request,response);
                break;
        }
    }
    private void editProduct(HttpServletRequest request, HttpServletResponse response) {
        int idProduct = Integer.parseInt(request.getParameter("code"));
        Product product = productService.editProduct(idProduct);
        long productPrice = (long) product.getProductPrice();
        request.setAttribute("productPrice",productPrice);
        request.setAttribute("product",product);
        try {
            request.getRequestDispatcher("form_edit_product.jsp").forward(request,response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
    private void showFormCreate(HttpServletRequest request, HttpServletResponse response) {
        List<Product> productList = productService.showListProduct();
        request.setAttribute("productList",productList);
        try {
            request.getRequestDispatcher("adimin_product.jsp").forward(request,response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showFormSearch(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/form_search.jsp");
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showProductDetail(HttpServletRequest request, HttpServletResponse response) {
        int productId = Integer.parseInt(request.getParameter("productId"));
        Product product = productService.finById(productId);
        request.setAttribute("product", product);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/productdetails.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showListChair(HttpServletRequest request, HttpServletResponse response) {
        List<Product> listChair = productService.showListChair();
        request.setAttribute("listChair", listChair);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/product_chair.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }
    private void showListChairUser(HttpServletRequest request, HttpServletResponse response) {
        List<Product> listChair = productService.showListChair();
        request.setAttribute("listChair", listChair);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/product_chair_user.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }
    private void showListChairAdmin(HttpServletRequest request, HttpServletResponse response) {
        List<Product> listChair = productService.showListChair();
        request.setAttribute("listChair", listChair);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/product_chair_admin.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showListDesk(HttpServletRequest request, HttpServletResponse response) {
        List<Product> listDesk = productService.showListDesk();
        request.setAttribute("listDesk", listDesk);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/product_desk.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }
    private void showListDeskUser(HttpServletRequest request, HttpServletResponse response) {
        List<Product> listDesk = productService.showListDesk();
        request.setAttribute("listDesk", listDesk);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/product_desk_user.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }
    private void showListDeskAdmin(HttpServletRequest request, HttpServletResponse response) {
        List<Product> listDesk = productService.showListDesk();
        request.setAttribute("listDesk", listDesk);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/product_desk_admin.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showListAccessories(HttpServletRequest request, HttpServletResponse response) {
        List<Product> listAccessories = productService.showListAccessories();
        request.setAttribute("listAccessories", listAccessories);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/product_accessories.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }
    private void showListAccessoriesUser(HttpServletRequest request, HttpServletResponse response) {
        List<Product> listAccessories = productService.showListAccessories();
        request.setAttribute("listAccessories", listAccessories);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/product_accessories_user.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }
    private void showListAccessoriesAdmin(HttpServletRequest request, HttpServletResponse response) {
        List<Product> listAccessories = productService.showListAccessories();
        request.setAttribute("listAccessories", listAccessories);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/product_accessories_admin.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action){
            case "search":
                searchByName(request,response);
                break;
            case "deleteProduct":
                deleteProduct(request,response);
                break;
            case "editProduct" :
                editProducts(request,response);
                break;
            case "createProduct" :
                createProduct(request,response);
                break;
        }
    }
    private void createProduct(HttpServletRequest request, HttpServletResponse response) {
        String product_name = request.getParameter("product_name");
        double product_price = Double.parseDouble(request.getParameter("product_price"));
        String description = request.getParameter("product_description");
        int product_type = Integer.parseInt(request.getParameter("product_type"));
        int product_inventory = Integer.parseInt(request.getParameter("product_inventory"));
        String fileInput = request.getParameter("fileInput");
        productService.createProduct(product_name,product_price,description,product_type,product_inventory,fileInput);
        try {
            response.sendRedirect("/product-servlet");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
    private void editProducts(HttpServletRequest request, HttpServletResponse response) {
        int productId = Integer.parseInt(request.getParameter("code"));
        String productNam = request.getParameter("product_name");
        double productPrice = Double.parseDouble(request.getParameter("price"));
        int productType = Integer.parseInt(request.getParameter("product_type"));
        int productInventory = Integer.parseInt(request.getParameter("product_inventory"));
        productService.editProducts(productId,productNam,productPrice,productType,productInventory);
        try {
            response.sendRedirect("/product-servlet");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
    private void deleteProduct(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        productService.deleteProduct(id);
        try {
            response.sendRedirect("/product-servlet");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void searchByName(HttpServletRequest request, HttpServletResponse response) {
        String productName = request.getParameter("product_name");
        List<Product> productList = productService.findByName(productName);
        request.setAttribute("productList",productList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/form_search_product.jsp");
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }
}