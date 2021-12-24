package com.example.jsp_a1.model;

import com.example.jsp_a1.entity.Category;
import com.example.jsp_a1.entity.Status;

import java.util.ArrayList;

public interface IStatus {
    ArrayList<Status> findAll();
    boolean save(Status status);
}
