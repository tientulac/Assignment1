package com.example.jsp_a1.model;

import com.example.jsp_a1.config.DatabaseConnection;
import com.example.jsp_a1.entity.Category;
import com.example.jsp_a1.entity.Product;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class CategoryModel implements ICategory{

    DatabaseConnection db = new DatabaseConnection();
    Statement st = db.getConnection();

    @Override
    public ArrayList<Category> findAll() {
//        ArrayList<Category> listCate = new ArrayList<>();
//        try {
//            ResultSet result = st.executeQuery("SELECT * FROM Category");
//            while (result.next()) {
//                Category _category = new Category();
//                _category.setCategoryID(result.getInt(1));
//                _category.setName(result.getString(2));
//                listCate.add(_category);
//            }
//            return listCate;
//        } catch (Exception ex) {
//            ex.printStackTrace();
//        }
        return null;
    }

    @Override
    public boolean save(Category category) {
        return false;
    }
}
