// ── Payment.java ─────────────────────────────────────────────
package com.veta.models;

import java.math.BigDecimal;
import java.sql.Timestamp;

public class Payment {
    private int id;
    private String controlNumber;
    private String payerName;
    private String payerPhone;
    private String referenceId;
    private Integer studentId;
    private Integer applicationId;
    private String paymentType;
    private BigDecimal amount;
    private String academicYear;
    private String description;
    private String bankName;
    private String bankRef;
    private String status;      // PENDING | PAID | CANCELLED | EXPIRED
    private Timestamp expiresAt;
    private Timestamp paidAt;
    private Timestamp createdAt;

    public Payment() {}

    public int getId()                     { return id; }
    public void setId(int v)               { this.id = v; }
    public String getControlNumber()       { return controlNumber; }
    public void setControlNumber(String v) { this.controlNumber = v; }
    public String getPayerName()           { return payerName; }
    public void setPayerName(String v)     { this.payerName = v; }
    public String getPayerPhone()          { return payerPhone; }
    public void setPayerPhone(String v)    { this.payerPhone = v; }
    public String getReferenceId()         { return referenceId; }
    public void setReferenceId(String v)   { this.referenceId = v; }
    public Integer getStudentId()          { return studentId; }
    public void setStudentId(Integer v)    { this.studentId = v; }
    public Integer getApplicationId()      { return applicationId; }
    public void setApplicationId(Integer v){ this.applicationId = v; }
    public String getPaymentType()         { return paymentType; }
    public void setPaymentType(String v)   { this.paymentType = v; }
    public BigDecimal getAmount()          { return amount; }
    public void setAmount(BigDecimal v)    { this.amount = v; }
    public String getAcademicYear()        { return academicYear; }
    public void setAcademicYear(String v)  { this.academicYear = v; }
    public String getDescription()         { return description; }
    public void setDescription(String v)   { this.description = v; }
    public String getBankName()            { return bankName; }
    public void setBankName(String v)      { this.bankName = v; }
    public String getBankRef()             { return bankRef; }
    public void setBankRef(String v)       { this.bankRef = v; }
    public String getStatus()              { return status; }
    public void setStatus(String v)        { this.status = v; }
    public Timestamp getExpiresAt()        { return expiresAt; }
    public void setExpiresAt(Timestamp v)  { this.expiresAt = v; }
    public Timestamp getPaidAt()           { return paidAt; }
    public void setPaidAt(Timestamp v)     { this.paidAt = v; }
    public Timestamp getCreatedAt()        { return createdAt; }
    public void setCreatedAt(Timestamp v)  { this.createdAt = v; }
}
