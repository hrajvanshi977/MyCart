package com.MyCart.helper;

public class Helper {
    public static String getTenWords(String description) {
       String[] str = description.split(" ");
       StringBuilder sb = new StringBuilder();
       if(str.length > 10) {
           for(int i= 0;i<10;i++) {
            sb.append(str[i]+" ");      
           }
           return sb.toString();
       } else {
           return description;
       }
    }
}
