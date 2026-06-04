package com.student.model;

public class ClassRoom {
    private int id;
    private String className;
    private int totalStudents;

    public ClassRoom() {
    }

    public ClassRoom(int id, String className, int totalStudents) {
        this.id = id;
        this.className = className;
        this.totalStudents = totalStudents;
    }

    public int getId() {
        return id;
    }

    public String getClassName() {
        return className;
    }

    public int getTotalStudents() {
        return totalStudents;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setClassName(String className) {
        this.className = className;
    }

    public void setTotalStudents(int totalStudents) {
        this.totalStudents = totalStudents;
    }
}
