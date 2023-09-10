package com.example.case_study_module3.service.product;

import com.example.case_study_module3.model.product.Product;

import java.util.List;

//package com.example.case_study_group3.service.product;
public interface IProductService {
    List<Product> showListChair();
    List<Product> showListDesk();
    List<Product> showListAccessories();
    Product finById(int productId);
    List<Product> findByName(String searchName);
    void deleteProduct(int id);
    List<Product> showListProduct();

    Product editProduct(int idProduct);

    void editProducts(int productId, String productNam, double productPrice, int productType, int productInventory);

    void createProduct(String productName, double productPrice, String description, int productType, int productInventory, String fileInput);
}
