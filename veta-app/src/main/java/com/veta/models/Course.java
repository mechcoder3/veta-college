package com.veta.models;

import java.math.BigDecimal;

public class Course {
    private int id;
    private String courseCode;
    private String nameEn;
    private String nameSw;
    private String courseType;        // SHORT | LONG
    private String ntaLevel;
    private int durationMonths;
    private BigDecimal annualFee;
    private BigDecimal registrationFee;
    private BigDecimal examFee;
    private BigDecimal applicationFee;
    private String entryRequirementsEn;
    private String entryRequirementsSw;
    private String descriptionEn;
    private String descriptionSw;
    private String department;
    private int maxCapacity;
    private boolean active;
    private int enrolledCount;        // populated by JOIN query

    public Course() {}

    public int getId()                          { return id; }
    public void setId(int v)                    { this.id = v; }
    public String getCourseCode()               { return courseCode; }
    public void setCourseCode(String v)         { this.courseCode = v; }
    public String getNameEn()                   { return nameEn; }
    public void setNameEn(String v)             { this.nameEn = v; }
    public String getNameSw()                   { return nameSw; }
    public void setNameSw(String v)             { this.nameSw = v; }
    public String getCourseType()               { return courseType; }
    public void setCourseType(String v)         { this.courseType = v; }
    public String getNtaLevel()                 { return ntaLevel; }
    public void setNtaLevel(String v)           { this.ntaLevel = v; }
    public int getDurationMonths()              { return durationMonths; }
    public void setDurationMonths(int v)        { this.durationMonths = v; }
    public BigDecimal getAnnualFee()            { return annualFee; }
    public void setAnnualFee(BigDecimal v)      { this.annualFee = v; }
    public BigDecimal getRegistrationFee()      { return registrationFee; }
    public void setRegistrationFee(BigDecimal v){ this.registrationFee = v; }
    public BigDecimal getExamFee()              { return examFee; }
    public void setExamFee(BigDecimal v)        { this.examFee = v; }
    public BigDecimal getApplicationFee()       { return applicationFee; }
    public void setApplicationFee(BigDecimal v) { this.applicationFee = v; }
    public String getEntryRequirementsEn()      { return entryRequirementsEn; }
    public void setEntryRequirementsEn(String v){ this.entryRequirementsEn = v; }
    public String getEntryRequirementsSw()      { return entryRequirementsSw; }
    public void setEntryRequirementsSw(String v){ this.entryRequirementsSw = v; }
    public String getDescriptionEn()            { return descriptionEn; }
    public void setDescriptionEn(String v)      { this.descriptionEn = v; }
    public String getDescriptionSw()            { return descriptionSw; }
    public void setDescriptionSw(String v)      { this.descriptionSw = v; }
    public String getDepartment()               { return department; }
    public void setDepartment(String v)         { this.department = v; }
    public int getMaxCapacity()                 { return maxCapacity; }
    public void setMaxCapacity(int v)           { this.maxCapacity = v; }
    public boolean isActive()                   { return active; }
    public void setActive(boolean v)            { this.active = v; }
    public int getEnrolledCount()               { return enrolledCount; }
    public void setEnrolledCount(int v)         { this.enrolledCount = v; }

    /** Returns duration in years string, e.g. "2 Years" or "3 Months" */
    public String getDurationDisplay() {
        if (durationMonths >= 12) {
            int years = durationMonths / 12;
            return years + (years == 1 ? " Year" : " Years");
        }
        return durationMonths + (durationMonths == 1 ? " Month" : " Months");
    }
}
