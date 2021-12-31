package com.example.ass1.entity;

import com.example.ass1.annotation.Column;
import com.example.ass1.annotation.Entity;
import com.example.ass1.annotation.Id;
import com.example.ass1.util.SQLDataTypes;

@Entity(tableName = "Status")
public class Status {

    @Id(autoIncrement = true)
    @Column(columnName = "StatusID", columnType = SQLDataTypes.INTEGER)
    private int StatusID;
    @Column(columnName = "Name", columnType = SQLDataTypes.VARCHAR50)
    private String Name;

    public Status(int statusID, String name) {
        StatusID = statusID;
        Name = name;
    }

    public Status() {}

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
