package com.example.case_study_module3.service.product;

import com.example.case_study_module3.model.product.Product;
import com.example.case_study_module3.repository.product.IProductRepository;
import com.example.case_study_module3.repository.product.ProductRepository;

import java.util.List;

public class ProductService implements IProductService {
    private IProductRepository productRepository = new ProductRepository();
    @Override
    public List<Product> showListChair() {
        return productRepository.showListChair();
    }

    @Override
    public List<Product> showListDesk() {
        return productRepository.showListDesk();
    }

    @Override
    public List<Product> showListAccessories() {
        return productRepository.showListAccessories();
    }

    @Override
    public Product finById(int productId) {
        return productRepository.finById(productId);
    }

    @Override
    public List<Product> findByName(String searchName) {
        return productRepository.findByName(searchName);
    }

    @Override
    public void deleteProduct(int id) {
        productRepository.deleteProduct(id);
    }

    @Override
    public Product editProduct(int idProduct) {
        return productRepository.editProduct(idProduct);
    }
    @Override
    public List<Product> showListProduct() {
        return productRepository.showListProduct();
    }
    @Override
    public void editProducts(int productId, String productNam, double productPrice, int productType, int productInventory) {
        productRepository.editProducts(productId,productNam,productPrice,productType,productInventory);
    }

    @Override
    public void createProduct(String productName, double productPrice, String description, int productType, int productInventory, String fileInput) {
        productRepository.createProduct(productName,productPrice,description,productType,productInventory,fileInput);
    }
}
