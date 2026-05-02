// ── Application.java ─────────────────────────────────────────
package com.veta.models;

import java.sql.Timestamp;

public class Application {
    private int id;
    private String refNumber;
    private String fullName;
    private String nidaNumber;
    private String dateOfBirth;
    private String gender;
    private String phone;
    private String email;
    private String regionOfOrigin;
    private String residentialAddress;
    private String educationLevel;
    private int courseId;
    private String courseName;
    private String intakePeriod;
    private String documentPath;
    private String status;           // PENDING | PROCESSING | APPROVED | REJECTED | ENROLLED
    private String reviewNotes;
    private Timestamp submittedAt;
    private Timestamp updatedAt;

    public Application() {}

    // ── Getters & Setters ──────────────────────────────────────
    public int getId()                        { return id; }
    public void setId(int id)                 { this.id = id; }
    public String getRefNumber()              { return refNumber; }
    public void setRefNumber(String v)        { this.refNumber = v; }
    public String getFullName()               { return fullName; }
    public void setFullName(String v)         { this.fullName = v; }
    public String getNidaNumber()             { return nidaNumber; }
    public void setNidaNumber(String v)       { this.nidaNumber = v; }
    public String getDateOfBirth()            { return dateOfBirth; }
    public void setDateOfBirth(String v)      { this.dateOfBirth = v; }
    public String getGender()                 { return gender; }
    public void setGender(String v)           { this.gender = v; }
    public String getPhone()                  { return phone; }
    public void setPhone(String v)            { this.phone = v; }
    public String getEmail()                  { return email; }
    public void setEmail(String v)            { this.email = v; }
    public String getRegionOfOrigin()         { return regionOfOrigin; }
    public void setRegionOfOrigin(String v)   { this.regionOfOrigin = v; }
    public String getResidentialAddress()     { return residentialAddress; }
    public void setResidentialAddress(String v){ this.residentialAddress = v; }
    public String getEducationLevel()         { return educationLevel; }
    public void setEducationLevel(String v)   { this.educationLevel = v; }
    public int getCourseId()                  { return courseId; }
    public void setCourseId(int v)            { this.courseId = v; }
    public String getCourseName()             { return courseName; }
    public void setCourseName(String v)       { this.courseName = v; }
    public String getIntakePeriod()           { return intakePeriod; }
    public void setIntakePeriod(String v)     { this.intakePeriod = v; }
    public String getDocumentPath()           { return documentPath; }
    public void setDocumentPath(String v)     { this.documentPath = v; }
    public String getStatus()                 { return status; }
    public void setStatus(String v)           { this.status = v; }
    public String getReviewNotes()            { return reviewNotes; }
    public void setReviewNotes(String v)      { this.reviewNotes = v; }
    public Timestamp getSubmittedAt()         { return submittedAt; }
    public void setSubmittedAt(Timestamp v)   { this.submittedAt = v; }
    public Timestamp getUpdatedAt()           { return updatedAt; }
    public void setUpdatedAt(Timestamp v)     { this.updatedAt = v; }
}
