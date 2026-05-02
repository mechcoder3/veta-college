package com.veta.models;

import java.sql.Timestamp;

public class User {
    private int id;
    private String username;
    private String passwordHash;
    private String role;       // ADMIN | STUDENT | STAFF | REGISTRAR | FINANCE
    private String fullName;
    private String email;
    private String phone;
    private boolean active;
    private Timestamp lastLogin;
    private Timestamp createdAt;

    public User() {}

    public int getId()                     { return id; }
    public void setId(int v)               { this.id = v; }
    public String getUsername()            { return username; }
    public void setUsername(String v)      { this.username = v; }
    public String getPasswordHash()        { return passwordHash; }
    public void setPasswordHash(String v)  { this.passwordHash = v; }
    public String getRole()                { return role; }
    public void setRole(String v)          { this.role = v; }
    public String getFullName()            { return fullName; }
    public void setFullName(String v)      { this.fullName = v; }
    public String getEmail()               { return email; }
    public void setEmail(String v)         { this.email = v; }
    public String getPhone()               { return phone; }
    public void setPhone(String v)         { this.phone = v; }
    public boolean isActive()              { return active; }
    public void setActive(boolean v)       { this.active = v; }
    public Timestamp getLastLogin()        { return lastLogin; }
    public void setLastLogin(Timestamp v)  { this.lastLogin = v; }
    public Timestamp getCreatedAt()        { return createdAt; }
    public void setCreatedAt(Timestamp v)  { this.createdAt = v; }

    public boolean isAdmin()      { return "ADMIN".equals(role); }
    public boolean isStudent()    { return "STUDENT".equals(role); }
    public boolean isStaff()      { return "STAFF".equals(role) || "REGISTRAR".equals(role) || "FINANCE".equals(role) || "ADMIN".equals(role); }
}
