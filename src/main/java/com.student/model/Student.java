package com.student.model;

public class Student {
    private int id;
    private String studentCode;
    private String fullName;
    private String gender;
    private String email;
    private String phone;
    private int classId;
    private String className;

    public Student() {
    }

    public Student(int id, String studentCode, String fullName, String gender, String email, String phone, int classId, String className) {
        this.id = id;
        this.studentCode = studentCode;
        this.fullName = fullName;
        this.gender = gender;
        this.email = email;
        this.phone = phone;
        this.classId = classId;
        this.className = className;
    }

    public int getId() {
        return id;
    }

    public String getStudentCode() {
        return studentCode;
    }

    public String getFullName() {
        return fullName;
    }

    public String getGender() {
        return gender;
    }

    public String getEmail() {
        return email;
    }

    public String getPhone() {
        return phone;
    }

    public int getClassId() {
        return classId;
    }

    public String getClassName() {
        return className;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setStudentCode(String studentCode) {
        this.studentCode = studentCode;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public void setClassId(int classId) {
        this.classId = classId;
    }

    public void setClassName(String className) {
        this.className = className;
    }
}
