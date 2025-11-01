package com.example.app_money_manager.model;

public class Transaction {
    private String dateTime;
    private String title;
    private String content;
    private double amount;

    public Transaction() {}

    public Transaction(String dateTime, String title, String content, double amount) {
        this.dateTime = dateTime;
        this.title = title;
        this.content = content;
        this.amount = amount;
    }

    public String getDateTime() { return dateTime; }
    public void setDateTime(String dateTime) { this.dateTime = dateTime; }

    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }

    public String getContent() { return content; }
    public void setContent(String content) { this.content = content; }

    public double getAmount() { return amount; }
    public void setAmount(double amount) { this.amount = amount; }
}

