package com.example.case_study_module3.model.product;

public class ProductImages {
    private int productImagesId;
    private String imagesUrl;
    private String erasingImg;

    public ProductImages() {
    }

    public ProductImages(int productImagesId, String imagesUrl, String erasingImg) {
        this.productImagesId = productImagesId;
        this.imagesUrl = imagesUrl;
        this.erasingImg = erasingImg;
    }
    public ProductImages(String imagesUrl, String erasingImg) {
        this.imagesUrl = imagesUrl;
        this.erasingImg = erasingImg;
    }

    public int getProductImagesId() {
        return productImagesId;
    }

    public void setProductImagesId(int productImagesId) {
        this.productImagesId = productImagesId;
    }

    public String getImagesUrl() {
        return imagesUrl;
    }

    public void setImagesUrl(String imagesUrl) {
        this.imagesUrl = imagesUrl;
    }

    public String getErasingImg() {
        return erasingImg;
    }

    public void setErasingImg(String erasingImg) {
        this.erasingImg = erasingImg;
    }
}
