package com.example.jsp_a1.model;

import com.example.jsp_a1.entity.Category;
import com.example.jsp_a1.entity.Product;

import java.util.ArrayList;

public interface ICategory {
    ArrayList<Category> findAll();
    boolean save(Category category);
}
