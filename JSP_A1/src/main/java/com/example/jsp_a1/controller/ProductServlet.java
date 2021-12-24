package com.example.jsp_a1.controller;

import com.example.jsp_a1.entity.Category;
import com.example.jsp_a1.entity.Product;
import com.example.jsp_a1.model.CategoryModel;
import com.example.jsp_a1.model.ProductModel;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashMap;

public class ProductServlet extends HttpServlet {

    public static ArrayList<Product> list = new ArrayList<>();
    public static ArrayList<Category> listCate = new ArrayList<>();

    ProductModel pModel = new ProductModel();
    CategoryModel cModel = new CategoryModel();

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        list = pModel.findAll();
        listCate = cModel.findAll();
        request.setAttribute("list", list);
        request.setAttribute("listCate", listCate);
        request.getRequestDispatcher("main/product.jsp").forward(request, response);
    }

    @Override
    public void doDelete(HttpServletRequest req, HttpServletResponse response) throws IOException, ServletException {
        int idProduct = Integer.parseInt(req.getParameter("idProduct"));
        boolean rs = pModel.deleteOne(idProduct);
        if (rs) {
            response.sendRedirect("main/product");
        }
        else {
            response.getWriter().println("Bad request");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int idProduct = Integer.parseInt(req.getParameter("idProduct"));
            String name = req.getParameter("name");
            double price = Double.parseDouble(req.getParameter("price"));
            String image = req.getParameter("image");
            int status = Integer.parseInt(req.getParameter("status"));
            int CategoryID = Integer.parseInt(req.getParameter("CategoryID"));
            String Code = req.getParameter("Code");

            Product product = new Product(0, name, price, image, status, CategoryID, Code, LocalDateTime.now().toString(), "");
            boolean rs = pModel.save(product);
            if (rs) {
                resp.sendRedirect("main/product");
            }
            else {
                resp.getWriter().println("Bad request");
            }
        } catch (Exception ex) {
            resp.getWriter().println("Bad request ex");
        }
    }


}
