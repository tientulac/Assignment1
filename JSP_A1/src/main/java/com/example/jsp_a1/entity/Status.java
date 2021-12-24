package com.example.jsp_a1.entity;

public class Status {
    private int StatusID;
    private String Name;

    public Status() {}
    public Status(int statusID, String name) {
        StatusID = statusID;
        Name = name;
    }

    public int getStatusID() {
        return StatusID;
    }

    public void setStatusID(int statusID) {
        StatusID = statusID;
    }

    public String getName() {
        return Name;
    }

    public void setName(String name) {
        Name = name;
    }
}
