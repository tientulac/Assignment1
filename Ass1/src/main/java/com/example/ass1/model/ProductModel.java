package com.example.ass1.model;

import com.example.ass1.entity.Category;
import com.example.ass1.entity.Product;
import com.example.ass1.repository.JpaRepository;

import java.sql.ResultSet;
import java.util.ArrayList;

public class ProductModel implements IProduct{

    public static ArrayList<Product> listProduct = new ArrayList<>();
    JpaRepository<Product> jpaProduct = new JpaRepository<Product>(Product.class);

    @Override
    public ArrayList<Product> findAll() {
        try {
            listProduct = (ArrayList<Product>) jpaProduct.findAll();
            return listProduct;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }

    @Override
    public boolean save(Product product) {
        return false;
    }

    @Override
    public boolean updateOne(Product product) {
        return false;
    }

    @Override
    public boolean deleteOne(int id) {
        try {
            boolean rs = jpaProduct.delete(id);
            if (rs) {
                return true;
            }
            else {
                return false;
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return false;
    }
}
