package com.company.hackeru.a3119_working_with_files;

import java.security.InvalidParameterException;
import java.util.HashMap;
import java.util.Map;

public class Circle {
    private int radius, x, y;

    public Circle(int radius, int x, int y) {

        this.radius = radius;
        this.x = x;
        this.y = y;
    }

    public Circle(String queryString) {
        if (queryString == null)
            throw new InvalidParameterException("query string was null");
        String[] parts = queryString.split("&");
        if (parts.length != 3)
            throw new InvalidParameterException("query string did not have exactly 3 parts");

        try {
            this.radius = Integer.valueOf(parts[0]);
            this.x = Integer.valueOf(parts[1]);
            this.y = Integer.valueOf(parts[2]);
        }catch (Exception e){
            throw new InvalidParameterException("was not valid integer");
        }


        /*Map<String, String> map = new HashMap<>();
        for (String keyValue : parts) {
            String[] keyValuePair = keyValue.split("=");
            if (keyValuePair.length != 2)
                throw new InvalidParameterException("illegal");
            map.put(keyValuePair[0], keyValuePair[1]);
        }

        if (map.containsKey("radius")){
            String radiusString = map.get("radius");
            try {
                this.radius = Integer.valueOf(radiusString);
            }catch (Exception e){
                throw e;
            }
        }
        if (map.containsKey("x")){
            String xString = map.get("x");
            try {
                this.x = Integer.valueOf(xString);
            }catch (Exception e){
                throw e;
            }
        }
        if (map.containsKey("y")){
            String yString = map.get("y");
            try {
                this.y = Integer.valueOf(yString);
            }catch (Exception e){
                throw e;
            }
        }*/
    }

    public int getRadius() {
        return radius;
    }

    public void setRadius(int radius) {
        this.radius = radius;
    }

    public int getX() {
        return x;
    }

    public void setX(int x) {
        this.x = x;
    }

    public int getY() {
        return y;
    }

    public void setY(int y) {
        this.y = y;
    }

    public String toQueryString() {
        return radius + "&" + x + "&" + y;
        //return "radius=" + radius + "&x=" + x + "&y=" + y;
    }
}
