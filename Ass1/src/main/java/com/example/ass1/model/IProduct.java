package com.example.ass1.model;

import com.example.ass1.entity.Product;

import java.util.ArrayList;

public interface IProduct {
    ArrayList<Product> findAll();
    boolean save(Product product);
    boolean updateOne(Product product);
    boolean deleteOne(int id);
}
