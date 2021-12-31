package com.example.ass1.entity;

import com.example.ass1.annotation.Column;
import com.example.ass1.annotation.Entity;
import com.example.ass1.annotation.Id;
import com.example.ass1.util.SQLDataTypes;

@Entity(tableName = "Category")
public class Category {

    @Id(autoIncrement = true)
    @Column(columnName = "CategoryID", columnType = SQLDataTypes.INTEGER)
    private int CategoryID;
    @Column(columnName = "Name", columnType = SQLDataTypes.VARCHAR50)
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
