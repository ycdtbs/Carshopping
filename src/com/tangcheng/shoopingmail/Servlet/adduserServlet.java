package com.tangcheng.shoopingmail.Servlet;

import com.alibaba.fastjson.JSONObject;
import com.tangcheng.shoopingmail.Service.RootuserService;
import com.tangcheng.shoopingmail.Service.impl.RootuserServiceimpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/adduserServlet")
public class adduserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String usernumber = request.getParameter("usernumber");
        String usersex = request.getParameter("usersex");
        String usertel = request.getParameter("usertel");
        String userroly = request.getParameter("userroly");
        String useraddress = request.getParameter("useraddress");
        System.out.println(username+username+usersex+usertel+userroly+useraddress);
        RootuserService adduser=new RootuserServiceimpl();
        int adduserresult = adduser.adduser(usernumber, username, usersex, usertel, userroly, useraddress);
        PrintWriter writer = response.getWriter();
        JSONObject jsonObject = new JSONObject();
        System.out.println(adduserresult+"username返回值为");
        jsonObject.put("adduserresult",adduserresult);
        writer.print(jsonObject.toJSONString());
        response.setHeader("Content-Type","text/json;charset=utf-8");
        writer.flush();
        writer.close();

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    this.doPost(request,response);
    }
}
