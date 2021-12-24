package com.example.jsp_a1.entity;

public class Category {
    private int CategoryID;
    private String Name;

    public  Category() {}

    public Category(int categoryID, String name) {
        CategoryID = categoryID;
        Name = name;
    }

    public int getCategoryID() {
        return CategoryID;
    }

    public void setCategoryID(int categoryID) {
        CategoryID = categoryID;
    }

    public String getName() {
        return Name;
    }

    public void setName(String name) {
        Name = name;
    }
}
