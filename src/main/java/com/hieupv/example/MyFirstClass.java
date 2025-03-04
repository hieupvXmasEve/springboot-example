package com.hieupv.example;

public class MyFirstClass {

    private final String myVar;
    
    public MyFirstClass(String myVar) {
        this.myVar = myVar;
    }

    public String sayHello() {
        return "Hello from MyFirstClass" + myVar;
    }
}
