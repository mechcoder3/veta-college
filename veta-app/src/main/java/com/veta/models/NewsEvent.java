// ── NewsEvent.java ────────────────────────────────────────────
package com.veta.models;

import java.sql.Date;
import java.sql.Timestamp;

public class NewsEvent {
    private int id;
    private String titleEn;
    private String titleSw;
    private String excerptEn;
    private String excerptSw;
    private String contentEn;
    private String contentSw;
    private String category;
    private String icon;
    private String bgGradient;
    private String imagePath;
    private Date eventDate;
    private boolean published;
    private Timestamp publishedAt;
    private Timestamp createdAt;

    public NewsEvent() {}

    public int getId()                      { return id; }
    public void setId(int v)                { this.id = v; }
    public String getTitleEn()              { return titleEn; }
    public void setTitleEn(String v)        { this.titleEn = v; }
    public String getTitleSw()              { return titleSw; }
    public void setTitleSw(String v)        { this.titleSw = v; }
    public String getExcerptEn()            { return excerptEn; }
    public void setExcerptEn(String v)      { this.excerptEn = v; }
    public String getExcerptSw()            { return excerptSw; }
    public void setExcerptSw(String v)      { this.excerptSw = v; }
    public String getContentEn()            { return contentEn; }
    public void setContentEn(String v)      { this.contentEn = v; }
    public String getContentSw()            { return contentSw; }
    public void setContentSw(String v)      { this.contentSw = v; }
    public String getCategory()             { return category; }
    public void setCategory(String v)       { this.category = v; }
    public String getIcon()                 { return icon; }
    public void setIcon(String v)           { this.icon = v; }
    public String getBgGradient()           { return bgGradient; }
    public void setBgGradient(String v)     { this.bgGradient = v; }
    public String getImagePath()            { return imagePath; }
    public void setImagePath(String v)      { this.imagePath = v; }
    public Date getEventDate()              { return eventDate; }
    public void setEventDate(Date v)        { this.eventDate = v; }
    public boolean isPublished()            { return published; }
    public void setPublished(boolean v)     { this.published = v; }
    public Timestamp getPublishedAt()       { return publishedAt; }
    public void setPublishedAt(Timestamp v) { this.publishedAt = v; }
    public Timestamp getCreatedAt()         { return createdAt; }
    public void setCreatedAt(Timestamp v)   { this.createdAt = v; }
}
