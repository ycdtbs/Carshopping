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

@WebServlet("/usernameServlet")
public class usernameServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        System.out.println(username);
        RootuserService checkuser=new RootuserServiceimpl();
        int usernamecheck = checkuser.usernamecheck(username);
        PrintWriter writer = response.getWriter();
        JSONObject jsonObject = new JSONObject();
        System.out.println(usernamecheck+"username返回值为");
        jsonObject.put("checkusername",usernamecheck);
        writer.print(jsonObject.toJSONString());
        response.setHeader("Content-Type","text/json;charset=utf-8");
        writer.flush();
        writer.close();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    this.doPost(request,response);
    }
}
