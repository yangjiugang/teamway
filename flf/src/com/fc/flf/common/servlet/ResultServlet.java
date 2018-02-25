package com.fc.flf.common.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ResultServlet extends HttpServlet {      
    
    public void doGet(HttpServletRequest request, HttpServletResponse response)      
            throws ServletException, IOException {      
     
        doPost(request, response);      
    }      
     
    public void doPost(HttpServletRequest request, HttpServletResponse response)      
            throws ServletException, IOException {      
     
        response.setContentType("text/html;charset=utf-8");      
        String validateC = (String) request.getSession().getAttribute("validateCode");  
        String veryCode = request.getParameter("code");    
        PrintWriter out = response.getWriter();            
        veryCode = veryCode.toUpperCase();   
        if(veryCode==null||"".equals(veryCode)){      
            out.print("false");   
        }else{      
            if(validateC.equals(veryCode)){      
                out.print("true");   
            }else{      
                out.print("false");   
            }      
        }      
        out.flush();      
        out.close();      
    }      
}    

