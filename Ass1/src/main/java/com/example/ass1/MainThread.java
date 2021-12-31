package com.example.ass1;

import com.example.ass1.annotation.Entity;
import com.example.ass1.entity.Category;
import com.example.ass1.entity.Product;
import com.example.ass1.repository.JpaRepository;

import java.util.ArrayList;
import java.util.List;

public class MainThread {
    public static void main(String[] args) {
        List<Category> lítCate = new ArrayList<>();
        JpaRepository<Category> jpaCate = new JpaRepository<Category>(Category.class);
        lítCate = (ArrayList<Category>) jpaCate.findAll();

        for (Category _cate : lítCate)
        {
            System.out.println(_cate.getCategoryID());
            System.out.println(_cate.getName());
        }
    }
}
