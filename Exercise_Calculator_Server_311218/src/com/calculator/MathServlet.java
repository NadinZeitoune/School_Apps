package com.calculator;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class MathServlet extends javax.servlet.http.HttpServlet {
    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {

    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        String strNum1 = request.getParameter("num1");
        String strNum2 = request.getParameter("num2");
        String action = request.getParameter("action");
        System.out.println(action);
        if(isNullOrEmpty(strNum1, strNum2, action))
            return;
        int num1 = 0, num2 = 0;
        try{
            num1 = Integer.valueOf(strNum1);
            num2 = Integer.valueOf(strNum2);
        }catch (Exception e){
            return;
        }



        String result = "";

        switch (action){
            case "+":
            // " " == +;
            case " ":
                result = String.valueOf(num1 + num2);
                break;
            case "-":
                result = String.valueOf(num1 - num2);
                break;
            case "*":
                result = String.valueOf(num1 * num2);
                break;
            case "/":
                // Check division by 0.
                if (num2 == 0) {
                    response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                    return;
                }

                result = String.valueOf(num1 / num2);
                break;
            default:
                return;
        }

        response.getWriter().write(result);
    }




    private boolean isNullOrEmpty(String... strings){
        for (int i = 0; i < strings.length; i++) {
            if (strings[i] == null || strings[i].isEmpty())
                return true;
        }
        return false;
    }
}
