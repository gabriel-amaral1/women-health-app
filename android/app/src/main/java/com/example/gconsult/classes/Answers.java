package com.gconsult.classes;

public class Answers 
{
    private float answer;
    private Symptom symptom;

    public Answers(Symptom symptom, float answer)
    {
        this.symptom = symptom;
        this.answer = answer;
    }

    public Symptom getSymptom()
    {
        return symptom;
    }

    public float getAnswer()
    {
        return answer;
    }

    public int getSymptomID()
    {
        return symptom.getSymptomID();
    }
}
