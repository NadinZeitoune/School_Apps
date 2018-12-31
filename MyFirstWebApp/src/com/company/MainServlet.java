package com.company;

import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;

public class MainServlet extends javax.servlet.http.HttpServlet {
    private int counter = 0;

    @Override
    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        System.out.println("in doPost()");

        InputStream inputStream = request.getInputStream();
        byte[] buffer = new byte[1024];
        int actuallyRead = inputStream.read(buffer);
        if (actuallyRead != -1){
            String body = new String(buffer,0, actuallyRead);
            System.out.println(body);
        }

        response.getOutputStream().write("thank you client! have a nice one".getBytes());
    }

    @Override
    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        /*String userName = request.getParameter("username");
        String password = request.getParameter("password");
        String age = request.getParameter("age");*/
        String queryString = request.getQueryString();

        if (queryString == null)
            return;
        String[] keyValuePairs = queryString.split("&");

        Map<String,String> qs = new HashMap<>();
        for (String keyValuePair : keyValuePairs) {
            String[] keyValue = keyValuePair.split("=");
            if (keyValue.length != 2)
                continue;
            qs.put(keyValue[0], keyValue[1]);
        }
        String username = qs.get("username");
        String password = qs.get("password");
        String age = qs.get("age");
        /*String[] parts = queryString.split("&");
        if (parts.length != 2)
            return;
        String userName = parts[0];
        String password = parts[1];
        System.out.println(userName);
        System.out.println(password);
        //System.out.println(age);*/

        System.out.println(username);
        System.out.println(password);
        System.out.println(age);
        response.setContentType("text/plain");
        response.setCharacterEncoding("UTF-8");
        //response.getWriter().write("answer in hebrew need response.setCharacterEncoding(\"UTF-8\");");
        /*try {
            Thread.sleep(10000);
        } catch (InterruptedException e) {

        }*/
        response.getWriter().write("counter=" + counter++);
    }
}
