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

@WebServlet("/addCarinfServlet")
public class addCarinfServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String carbrandkey = request.getParameter("Carbrandkey");
        String carbrandname = request.getParameter("Carbrandname");
        String carname = request.getParameter("Carname");
        String caridcard = request.getParameter("Caridcard");
        RootcarService addcar=new RootcarServiceimpl();
        int addcar1 = addcar.addcar(carbrandkey, carbrandname, carname, caridcard);
        PrintWriter writer = response.getWriter();
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("addresult",addcar1);
        writer.print(jsonObject.toJSONString());
        response.setHeader("Content-Type","text/json;charset=utf-8");
        writer.flush();
        writer.close();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    this.doPost(request,response);
    }
}
