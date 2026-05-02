// ── Staff.java ────────────────────────────────────────────────
package com.veta.models;

public class Staff {
    private int id;
    private Integer userId;
    private String fullName;
    private String title;
    private String roleTitle;
    private String department;
    private String qualifications;
    private String welcomeMessage;
    private String photoPath;
    private int displayOrder;
    private boolean isPrincipal;
    private boolean isVisible;

    public Staff() {}

    public int getId()                     { return id; }
    public void setId(int v)               { this.id = v; }
    public Integer getUserId()             { return userId; }
    public void setUserId(Integer v)       { this.userId = v; }
    public String getFullName()            { return fullName; }
    public void setFullName(String v)      { this.fullName = v; }
    public String getTitle()               { return title; }
    public void setTitle(String v)         { this.title = v; }
    public String getRoleTitle()           { return roleTitle; }
    public void setRoleTitle(String v)     { this.roleTitle = v; }
    public String getDepartment()          { return department; }
    public void setDepartment(String v)    { this.department = v; }
    public String getQualifications()      { return qualifications; }
    public void setQualifications(String v){ this.qualifications = v; }
    public String getWelcomeMessage()      { return welcomeMessage; }
    public void setWelcomeMessage(String v){ this.welcomeMessage = v; }
    public String getPhotoPath()           { return photoPath; }
    public void setPhotoPath(String v)     { this.photoPath = v; }
    public int getDisplayOrder()           { return displayOrder; }
    public void setDisplayOrder(int v)     { this.displayOrder = v; }
    public boolean isPrincipal()           { return isPrincipal; }
    public void setPrincipal(boolean v)    { this.isPrincipal = v; }
    public boolean isVisible()             { return isVisible; }
    public void setVisible(boolean v)      { this.isVisible = v; }

    /** Full display name e.g. "Dr. John Mwangi Kamau" */
    public String getDisplayName() {
        return (title != null && !title.isEmpty()) ? title + " " + fullName : fullName;
    }
}
