package com.student.model;

public class Score {
    private int id;
    private int studentId;

    private String studentCode;
    private String fullName;
    private String className;

    private String subjectName;
    private double processScore;
    private double midtermScore;
    private double finalScore;
    private double averageScore;
    private String note;

    public Score() {
    }

    public int getId() {
        return id;
    }

    public int getStudentId() {
        return studentId;
    }

    public String getStudentCode() {
        return studentCode;
    }

    public String getFullName() {
        return fullName;
    }

    public String getClassName() {
        return className;
    }

    public String getSubjectName() {
        return subjectName;
    }

    public double getProcessScore() {
        return processScore;
    }

    public double getMidtermScore() {
        return midtermScore;
    }

    public double getFinalScore() {
        return finalScore;
    }

    public double getAverageScore() {
        return averageScore;
    }

    public String getNote() {
        return note;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setStudentId(int studentId) {
        this.studentId = studentId;
    }

    public void setStudentCode(String studentCode) {
        this.studentCode = studentCode;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public void setClassName(String className) {
        this.className = className;
    }

    public void setSubjectName(String subjectName) {
        this.subjectName = subjectName;
    }

    public void setProcessScore(double processScore) {
        this.processScore = processScore;
    }

    public void setMidtermScore(double midtermScore) {
        this.midtermScore = midtermScore;
    }

    public void setFinalScore(double finalScore) {
        this.finalScore = finalScore;
    }

    public void setAverageScore(double averageScore) {
        this.averageScore = averageScore;
    }

    public void setNote(String note) {
        this.note = note;
    }
}
