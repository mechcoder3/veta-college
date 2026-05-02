// ── ProductionOrder.java ──────────────────────────────────────
package com.veta.models;

import java.math.BigDecimal;
import java.sql.Date;
import java.sql.Timestamp;

public class ProductionOrder {
    private int id;
    private String orderNumber;
    private String clientName;
    private String clientPhone;
    private String clientEmail;
    private Integer productId;
    private String customProduct;
    private String specifications;
    private int quantity;
    private BigDecimal estimatedBudget;
    private BigDecimal quotedAmount;
    private String department;
    private String status; // PENDING|QUOTED|ACCEPTED|IN_PROGRESS|COMPLETED|CANCELLED
    private Integer paymentId;
    private String notes;
    private Timestamp orderDate;
    private Date expectedDate;
    private Date completedDate;

    public ProductionOrder() {}

    public int getId()                         { return id; }
    public void setId(int v)                   { this.id = v; }
    public String getOrderNumber()             { return orderNumber; }
    public void setOrderNumber(String v)       { this.orderNumber = v; }
    public String getClientName()              { return clientName; }
    public void setClientName(String v)        { this.clientName = v; }
    public String getClientPhone()             { return clientPhone; }
    public void setClientPhone(String v)       { this.clientPhone = v; }
    public String getClientEmail()             { return clientEmail; }
    public void setClientEmail(String v)       { this.clientEmail = v; }
    public Integer getProductId()              { return productId; }
    public void setProductId(Integer v)        { this.productId = v; }
    public String getCustomProduct()           { return customProduct; }
    public void setCustomProduct(String v)     { this.customProduct = v; }
    public String getSpecifications()          { return specifications; }
    public void setSpecifications(String v)    { this.specifications = v; }
    public int getQuantity()                   { return quantity; }
    public void setQuantity(int v)             { this.quantity = v; }
    public BigDecimal getEstimatedBudget()     { return estimatedBudget; }
    public void setEstimatedBudget(BigDecimal v){ this.estimatedBudget = v; }
    public BigDecimal getQuotedAmount()        { return quotedAmount; }
    public void setQuotedAmount(BigDecimal v)  { this.quotedAmount = v; }
    public String getDepartment()              { return department; }
    public void setDepartment(String v)        { this.department = v; }
    public String getStatus()                  { return status; }
    public void setStatus(String v)            { this.status = v; }
    public Integer getPaymentId()              { return paymentId; }
    public void setPaymentId(Integer v)        { this.paymentId = v; }
    public String getNotes()                   { return notes; }
    public void setNotes(String v)             { this.notes = v; }
    public Timestamp getOrderDate()            { return orderDate; }
    public void setOrderDate(Timestamp v)      { this.orderDate = v; }
    public Date getExpectedDate()              { return expectedDate; }
    public void setExpectedDate(Date v)        { this.expectedDate = v; }
    public Date getCompletedDate()             { return completedDate; }
    public void setCompletedDate(Date v)       { this.completedDate = v; }
}
