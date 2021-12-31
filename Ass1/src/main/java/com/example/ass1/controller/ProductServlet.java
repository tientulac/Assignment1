package com.example.ass1.controller;

import com.example.ass1.entity.Category;
import com.example.ass1.entity.Product;
import com.example.ass1.entity.Status;
import com.example.ass1.repository.JpaRepository;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashMap;

public class ProductServlet extends HttpServlet {

    public static ArrayList<Category> listCate = new ArrayList<>();
    public static ArrayList<Product> listProduct = new ArrayList<>();
    public static ArrayList<Status> listStatus = new ArrayList<>();

    JpaRepository<Category> jpaCate = new JpaRepository<Category>(Category.class);
    JpaRepository<Product> jpaProduct = new JpaRepository<Product>(Product.class);
    JpaRepository<Status> jpaStatus = new JpaRepository<Status>(Status.class);

    protected void  getAllData(HttpServletRequest req, HttpServletResponse resp) {
        listCate = (ArrayList<Category>) jpaCate.findAll();
        listProduct = (ArrayList<Product>) jpaProduct.findAll();
        listStatus = (ArrayList<Status>) jpaStatus.findAll();

        req.setAttribute("listCate", listCate);
        req.setAttribute("listProduct", listProduct);
        req.setAttribute("listStatus", listStatus);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        getAllData(req, resp);
        req.getRequestDispatcher("main/product.jsp").forward(req, resp);
    }

    @Override
    public void doDelete(HttpServletRequest req, HttpServletResponse response) throws IOException, ServletException {
        int idProduct = Integer.parseInt(req.getParameter("idProduct"));
        boolean rs = jpaProduct.delete(idProduct);
        if (rs) {
            response.sendRedirect("main/product.jsp");
        }
        else {
            response.getWriter().println("Bad request");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            boolean rs = false;

            int idProduct = Integer.parseInt(req.getParameter("idProduct"));
            String name = req.getParameter("name");
            double price = Double.parseDouble(req.getParameter("price"));
            String image = req.getParameter("image");
            int status = Integer.parseInt(req.getParameter("statusID"));
            int categoryID = Integer.parseInt(req.getParameter("categoryID"));
            String code = req.getParameter("code");
            String desc = req.getParameter("desc");
            String created_date = req.getParameter("created_date");
            System.out.println(idProduct);
            Product product = new Product(idProduct, name, price, image, status, categoryID, code, desc, created_date, (LocalDateTime.now().getDayOfMonth()+"-"+LocalDateTime.now().getMonthValue()+"-"+LocalDateTime.now().getYear()).toString());

            if (product.isValid()) {
                if (idProduct > 0) {
                    rs = jpaProduct.update(product);
                }
                else {
                    rs = jpaProduct.save(product);
                }
                if (rs) {
                    getAllData(req, resp);
                    req.getRequestDispatcher("main/product.jsp").forward(req, resp);
                }
                else {
                    resp.getWriter().println("Bad request");
                }
            }
            else {
                getAllData(req, resp);
                HashMap<String, String> errors = product.getErrors();
                req.setAttribute("errors", errors);
                req.setAttribute("product", product);
                req.getRequestDispatcher("main/product.jsp").forward(req, resp);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            resp.getWriter().println(ex.getMessage());
        }
    }
}
