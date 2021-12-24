package com.example.jsp_a1;

import com.example.jsp_a1.entity.Category;
import com.example.jsp_a1.model.CategoryModel;

import java.util.ArrayList;
import java.util.List;

import static java.lang.Integer.parseInt;

public class MainThread {
    public static void main(String[] args) {
        CategoryModel cate = new CategoryModel();
        List<Category> listCate = new ArrayList<>();
        for (Category _cate : cate.findAll())
        {
            System.out.println(_cate.getCategoryID());
            System.out.println(_cate.getName());
        }
    }
}
