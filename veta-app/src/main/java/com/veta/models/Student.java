package com.veta.models;

import java.sql.Date;
import java.sql.Timestamp;

public class Student {
    private int id;
    private String studentNumber;
    private int userId;
    private int applicationId;
    private String fullName;
    private String nidaNumber;
    private String phone;
    private String email;
    private Date dateOfBirth;
    private String gender;
    private int courseId;
    private String courseName;
    private int yearOfStudy;
    private int semester;
    private int intakeYear;
    private Date enrollmentDate;
    private String status;      // ACTIVE | DEFERRED | GRADUATED | EXPELLED | WITHDRAWN
    private String photoPath;
    private Timestamp createdAt;

    public Student() {}

    public int getId()                    { return id; }
    public void setId(int v)              { this.id = v; }
    public String getStudentNumber()      { return studentNumber; }
    public void setStudentNumber(String v){ this.studentNumber = v; }
    public int getUserId()                { return userId; }
    public void setUserId(int v)          { this.userId = v; }
    public int getApplicationId()         { return applicationId; }
    public void setApplicationId(int v)   { this.applicationId = v; }
    public String getFullName()           { return fullName; }
    public void setFullName(String v)     { this.fullName = v; }
    public String getNidaNumber()         { return nidaNumber; }
    public void setNidaNumber(String v)   { this.nidaNumber = v; }
    public String getPhone()              { return phone; }
    public void setPhone(String v)        { this.phone = v; }
    public String getEmail()              { return email; }
    public void setEmail(String v)        { this.email = v; }
    public Date getDateOfBirth()          { return dateOfBirth; }
    public void setDateOfBirth(Date v)    { this.dateOfBirth = v; }
    public String getGender()             { return gender; }
    public void setGender(String v)       { this.gender = v; }
    public int getCourseId()              { return courseId; }
    public void setCourseId(int v)        { this.courseId = v; }
    public String getCourseName()         { return courseName; }
    public void setCourseName(String v)   { this.courseName = v; }
    public int getYearOfStudy()           { return yearOfStudy; }
    public void setYearOfStudy(int v)     { this.yearOfStudy = v; }
    public int getSemester()              { return semester; }
    public void setSemester(int v)        { this.semester = v; }
    public int getIntakeYear()            { return intakeYear; }
    public void setIntakeYear(int v)      { this.intakeYear = v; }
    public Date getEnrollmentDate()       { return enrollmentDate; }
    public void setEnrollmentDate(Date v) { this.enrollmentDate = v; }
    public String getStatus()             { return status; }
    public void setStatus(String v)       { this.status = v; }
    public String getPhotoPath()          { return photoPath; }
    public void setPhotoPath(String v)    { this.photoPath = v; }
    public Timestamp getCreatedAt()       { return createdAt; }
    public void setCreatedAt(Timestamp v) { this.createdAt = v; }
}
