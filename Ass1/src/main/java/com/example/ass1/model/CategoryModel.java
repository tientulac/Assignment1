package com.example.ass1.model;

import com.example.ass1.entity.Category;
import com.example.ass1.entity.Product;
import com.example.ass1.repository.JpaRepository;

import java.sql.ResultSet;
import java.util.ArrayList;

public class CategoryModel implements ICategory {

    public static ArrayList<Category> listCate = new ArrayList<>();
    JpaRepository<Category> jpaCate = new JpaRepository<Category>(Category.class);

    @Override
    public ArrayList<Category> findAll() {
        try {
            listCate = (ArrayList<Category>) jpaCate.findAll();
            return listCate;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }
}
