package com.example.jsp_a1.entity;

import java.util.Date;

public class Product {
    private int ProductID;
    private String Name;
    private double Price;
    private String Image;
    private int Status;
    private int CategoryID;
    private String Code;
    private String Created_date;
    private String Updated_date;

    public Product() {}

    public Product(int productID, String name, double price, String image, int status, int categoryID, String code, String created_date, String updated_date) {
        ProductID = productID;
        Name = name;
        Price = price;
        Image = image;
        Status = status;
        CategoryID = categoryID;
        Code = code;
        Created_date = created_date;
        Updated_date = updated_date;
    }

    public int getProductID() {
        return ProductID;
    }

    public void setProductID(int productID) {
        ProductID = productID;
    }

    public String getName() {
        return Name;
    }

    public void setName(String name) {
        Name = name;
    }

    public double getPrice() {
        return Price;
    }

    public void setPrice(double price) {
        Price = price;
    }

    public String getImage() {
        return Image;
    }

    public void setImage(String image) {
        Image = image;
    }

    public int getStatus() {
        return Status;
    }

    public void setStatus(int status) {
        Status = status;
    }

    public int getCategoryID() {
        return CategoryID;
    }

    public void setCategoryID(int categoryID) {
        CategoryID = categoryID;
    }

    public String getCode() {
        return Code;
    }

    public void setCode(String code) {
        Code = code;
    }

    public String getCreated_date() {
        return Created_date;
    }

    public void setCreated_date(String created_date) {
        Created_date = created_date;
    }

    public String getUpdated_date() {
        return Updated_date;
    }

    public void setUpdated_date(String updated_date) {
        Updated_date = updated_date;
    }
}