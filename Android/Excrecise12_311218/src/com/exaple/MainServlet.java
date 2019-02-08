package com.exaple;

import java.io.IOException;
import java.io.InputStream;

public class MainServlet extends javax.servlet.http.HttpServlet {
    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {

    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        String num1 = request.getParameter("num1");
        String num2 = request.getParameter("num2");
        int num1int, num2int;
        if (num1 == null || num2 == null || num1.isEmpty() || num2.isEmpty())
            return;
        try {
            num1int = Integer.valueOf(num1);
            num2int = Integer.valueOf(num2);
        }catch (Exception e){
            return;
        }
        String sum = String.valueOf(num1int + num2int);
        response.getWriter().write("Sum is: " + sum);
    }
}
