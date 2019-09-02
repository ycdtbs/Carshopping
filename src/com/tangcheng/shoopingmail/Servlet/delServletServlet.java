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

@WebServlet("/delServletServlet")
public class delServletServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String delid = request.getParameter("delid");
        RootuserService deluser=new RootuserServiceimpl();
        int delresult = deluser.deluser(delid);
        PrintWriter writer = response.getWriter();
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("delresult",delresult);
        writer.print(jsonObject.toJSONString());
        response.setHeader("Content-Type","text/json;charset=utf-8");
        writer.flush();
        writer.close();


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    this.doPost(request,response);
    }
}
