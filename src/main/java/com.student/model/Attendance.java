package com.student.model;

public class Attendance {
    private int id;
    private int studentId;
    private String attendanceDate;
    private String status;
    private String note;
    private String createdAt;

    public int getId() {
        return id;
    }

    public int getStudentId() {
        return studentId;
    }

    public String getAttendanceDate() {
        return attendanceDate;
    }

    public String getStatus() {
        return status;
    }

    public String getNote() {
        return note;
    }

    public String getCreatedAt() {
        return createdAt;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setStudentId(int studentId) {
        this.studentId = studentId;
    }

    public void setAttendanceDate(String attendanceDate) {
        this.attendanceDate = attendanceDate;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public void setCreatedAt(String createdAt) {
        this.createdAt = createdAt;
    }
}
