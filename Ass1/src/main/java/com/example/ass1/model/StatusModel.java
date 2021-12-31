package com.example.ass1.model;

import com.example.ass1.entity.Product;
import com.example.ass1.entity.Status;
import com.example.ass1.repository.JpaRepository;

import java.util.ArrayList;

public class StatusModel implements IStatus{

    public static ArrayList<Status> listStatus = new ArrayList<>();
    JpaRepository<Status> jpaStatus = new JpaRepository<Status>(Status.class);

    @Override
    public ArrayList<Status> findAll() {
        try {
            listStatus = (ArrayList<Status>) jpaStatus.findAll();
            return listStatus;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }
}
