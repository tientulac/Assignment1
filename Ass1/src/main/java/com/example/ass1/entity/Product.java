package com.example.ass1.entity;

import com.example.ass1.annotation.Column;
import com.example.ass1.annotation.Entity;
import com.example.ass1.annotation.Id;
import com.example.ass1.util.SQLDataTypes;

import java.util.HashMap;

@Entity(tableName = "Product")
public class Product {

    @Id(autoIncrement = true)
    @Column(columnName = "ProductID", columnType = SQLDataTypes.INTEGER)
    private int ProductID;
    @Column(columnName = "Name", columnType = SQLDataTypes.VARCHAR50)
    private String Name;
    @Column(columnName = "Price", columnType = SQLDataTypes.DOUBLE)
    private double Price;
    @Column(columnName = "Image", columnType = SQLDataTypes.VARCHAR255)
    private String Image;
    @Column(columnName = "Status", columnType = SQLDataTypes.INTEGER)
    private int Status;
    @Column(columnName = "CategoryID", columnType = SQLDataTypes.INTEGER)
    private int CategoryID;
    @Column(columnName = "Code", columnType = SQLDataTypes.VARCHAR50)
    private String Code;
    @Column(columnName = "Desc", columnType = SQLDataTypes.VARCHAR255)
    private String Desc;
    @Column(columnName = "Created_date", columnType = SQLDataTypes.VARCHAR255)
    private String Created_date;
    @Column(columnName = "Updated_date", columnType = SQLDataTypes.VARCHAR255)
    private String Updated_date;

    public Product() {}

    public int getProductID() {
        return ProductID;
    }

    public void setProductID(int productID) {
        ProductID = productID;
    }

    public String getName() {
        return Name;
    }

    public void setName(String name) {
        Name = name;
    }

    public double getPrice() {
        return Price;
    }

    public void setPrice(double price) {
        Price = price;
    }

    public String getImage() {
        return Image;
    }

    public String getDesc() {
        return Desc;
    }

    public void setDesc(String desc) {
        Desc = desc;
    }

    public void setImage(String image) {
        Image = image;
    }

    public int getStatus() {
        return Status;
    }

    public void setStatus(int status) {
        Status = status;
    }

    public int getCategoryID() {
        return CategoryID;
    }

    public void setCategoryID(int categoryID) {
        CategoryID = categoryID;
    }

    public String getCode() {
        return Code;
    }

    public void setCode(String code) {
        Code = code;
    }

    public String getCreated_date() {
        return Created_date;
    }

    public void setCreated_date(String created_date) {
        Created_date = created_date;
    }

    public String getUpdated_date() {
        return Updated_date;
    }

    public void setUpdated_date(String updated_date) {
        Updated_date = updated_date;
    }

    public Product(int productID, String name, double price, String image, int status, int categoryID, String code, String desc, String created_date, String updated_date) {
        ProductID = productID;
        Name = name;
        Price = price;
        Image = image;
        Status = status;
        CategoryID = categoryID;
        Code = code;
        Desc = desc;
        Created_date = created_date;
        Updated_date = updated_date;
    }

    public boolean isValid() {
        return (getErrors().size() == 0);
    }

    public HashMap<String, String> getErrors() {
        HashMap<String, String> errors = new HashMap<>();
        if (Name == null || Name.length() == 0) {
            errors.put("name", "Name ís required !");
        }
        else if (Name.length() <= 7) {
            errors.put("name", "You should input length of name > 7 !");
        }
        if (!(Price > 0)) {
            errors.put("price", "Price is required !");
        }
        if (Image == null || Image.length() == 0) {
            errors.put("image", "Image is required !");
        }
        if (Status == 0) {
            errors.put("status", "Status is required !");
        }
        if (CategoryID == 0) {
            errors.put("category", "Category is required !");
        }
        if (Code == null || Code.length() == 0) {
            errors.put("code", "Code is required !");
        }
        if (Desc == null || Desc.length() == 0) {
            errors.put("desc", "Desc is required !");
        }
        return errors;
    }
}
