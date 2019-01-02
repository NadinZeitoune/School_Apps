package com.example.nadins.exercise_calculator_311218;

// Exercise_Calculator_Server_311218
public class MathematicsServlet /*extends javax.servlet.http.HttpServlet */ {
    /*protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {

    }*/

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        String strNum1 = request.getParameter("num1");
        String strNum2 = request.getParameter("num2");
        String action = request.getParameter("action");

        if(strNum1 == null || strNum2 == null || strNum1.isEmpty() || strNum2.isEmpty())
            return;
        int num1 = 0, num2 = 0;
        try{
            num1 = Integer.valueOf(strNum1);
            num2 = Integer.valueOf(strNum2);
        }catch (Exception e){
            return;
        }

        // Check division by 0.
        if (num2 == 0 && action == "/")
            return;

        String result = "";

        switch (action){
            case "+":
                result = String.valueOf(num1 + num2);
                break;
            case "-":
                result = String.valueOf(num1 - num2);
                break;
            case "*":
                result = String.valueOf(num1 * num2);
                break;
            case "/":
                result = String.valueOf(num1 / num2);
                break;
        }

        try {
            Thread.sleep(2000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }

        response.getWriter().write(result);
    }
}