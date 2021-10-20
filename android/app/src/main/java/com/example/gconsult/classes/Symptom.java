package com.gconsult.classes;

public class Symptom 
{
    private int symptomID;
    private Object symptomType;
    
    public Symptom(Object symptomType, int symptomID)
    {
        this.symptomType = symptomType;
        this.symptomID = symptomID;
    }


	public int getSymptomID()
    {
        return symptomID;
    }

    public Object getSymptomType()
    {
        return symptomType;
    }

    public String toString()
    {
        return String.format("%s", symptomType);
    }
}
