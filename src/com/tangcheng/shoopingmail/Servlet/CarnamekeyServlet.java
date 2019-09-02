package com.tangcheng.shoopingmail.Servlet;

import com.alibaba.fastjson.JSONObject;
import com.tangcheng.shoopingmail.Service.RootcarService;
import com.tangcheng.shoopingmail.Service.impl.RootcarServiceimpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/CarnamekeyServlet")
public class CarnamekeyServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String carnamekey = request.getParameter("Carnamekey");
        RootcarService check=new RootcarServiceimpl();
        int checkCarbrandkey = check.checkCarnamekey(carnamekey);
        System.out.println(checkCarbrandkey+"检查是否重复");
        PrintWriter writer = response.getWriter();
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("checkresult",checkCarbrandkey);
        writer.print(jsonObject.toJSONString());
        response.setHeader("Content-Type","text/json;charset=utf-8");
        writer.flush();
        writer.close();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    this.doPost(request,response);
    }
}
