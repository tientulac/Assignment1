package com.example.jsp_a1.model;
import com.example.jsp_a1.config.DatabaseConnection;
import com.example.jsp_a1.entity.Product;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class ProductModel implements IProduct{

    DatabaseConnection db = new DatabaseConnection();
    Statement st = db.getConnection();

    @Override
    public ArrayList<Product> findAll() {
        ArrayList<Product> listProduct = new ArrayList<>();
        try {
            ResultSet result = st.executeQuery("SELECT * FROM Product");
            while (result.next()) {
                Product _product = new Product();
                _product.setProductID(result.getInt(1));
                _product.setName(result.getString(2));
                _product.setPrice(result.getDouble(3));
                _product.setImage(result.getString(4));
                _product.setStatus(result.getInt(5));
                _product.setCategoryID(result.getInt(6));
                _product.setCode(result.getString(7));
                _product.setCreated_date(result.getString(8));
                _product.setUpdated_date(result.getString(9));
                listProduct.add(_product);
            }
            return listProduct;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }

    @Override
    public boolean save(Product product) {
        try {
            boolean result = st.execute(String.format(
                    "INSERT INTO Product(Name, Price, Image, Status, CategoryID, Code, Created_date, Updated_date) VALUES(N'%s','%f',N'%s','%d','%d','%s','%s','%s')",
                    product.getName(),
                    product.getPrice(),
                    product.getImage(),
                    product.getStatus(),
                    product.getCategoryID(),
                    product.getCode(),
                    product.getCreated_date(),
                    product.getUpdated_date()));
            if (result)
            {
                return true;
            }
            else
            {
                return false;
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean updateOne(Product product) {
        try {
            boolean result = st.execute(String.format(
                    "UPDATE Product SET Name = N'%s', Price = '%d', Image = '%s', Status = '%d', CategoryID = '%d', Code = '%s', Created_date = '%s', Updated_date = '%s' WHERE ProductID = %d",
                    product.getName(),
                    product.getPrice(),
                    product.getImage(),
                    product.getStatus(),
                    product.getCategoryID(),
                    product.getCode(),
                    product.getCreated_date(),
                    product.getProductID()));
            if (result)
            {
                return true;
            }
            else
            {
                return false;
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean deleteOne(int id) {
        try {
            boolean result = st.execute(String.format("DELETE FROM Product WHERE ProductID = %d", id));
            if (result)
            {
                return true;
            }
            else
            {
                return false;
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return false;
    }
}
