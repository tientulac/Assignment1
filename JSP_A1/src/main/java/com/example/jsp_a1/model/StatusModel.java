package com.example.jsp_a1.model;

import com.example.jsp_a1.entity.Status;

import java.util.ArrayList;

public class StatusModel implements IStatus{
    @Override
    public ArrayList<Status> findAll() {
        return null;
    }

    @Override
    public boolean save(Status status) {
        return false;
    }
}
