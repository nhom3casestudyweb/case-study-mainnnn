package com.example.case_study_module3.repository.product;

import com.example.case_study_module3.model.product.Product;

import java.util.List;

public interface IProductRepository {
    List<Product> showListChair();
    List<Product> showListDesk();
    List<Product> showListAccessories();
    Product finById(int productId);
    List<Product> findByName(String searchName);
    List<Product> showListProduct();
    void deleteProduct(int id);

    Product editProduct(int idProduct);

    void editProducts(int productId, String productNam, double productPrice, int productType, int productInventory);

    void createProduct(String productName, int old_price, int productPrice, String productDescription, int productType, int productInventory);
}
