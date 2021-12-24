package com.example.jsp_a1.model;

import com.example.jsp_a1.entity.Product;

import java.util.ArrayList;

public interface IProduct {
    ArrayList<Product> findAll();
    boolean save(Product product);
    boolean updateOne(Product product);
    boolean deleteOne(int id);
}
