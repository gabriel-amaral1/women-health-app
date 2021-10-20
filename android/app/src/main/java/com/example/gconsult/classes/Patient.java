package com.gconsult.classes;

public class Patient 
{
    private String fullName;
    private long phone;

    public Patient()
    {
       
    }

    public void setFullName(String fullName)
    {
        this.fullName = fullName;
    }

    public void setPhone(long phone)
    {
        this.phone = phone;
    }

    public String getFullName() 
    {
        return fullName;
    }

    public long getPhone() 
    {
        return phone;
    }
}
