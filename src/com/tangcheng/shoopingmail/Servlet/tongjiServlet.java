package com.tangcheng.shoopingmail.Servlet;

import com.tangcheng.shoopingmail.Service.RootorderService;
import com.tangcheng.shoopingmail.Service.impl.RootorderServiceimpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet("/tongjiServlet")
public class tongjiServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RootorderService paiming=new RootorderServiceimpl();
        List<Map<String, Object>> paiming1 = paiming.paiming();
        String getmoney = paiming.getmoney();
        request.setAttribute("paimimnglist",paiming1);
        request.setAttribute("money",getmoney);
        request.getRequestDispatcher("tongji.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    this.doPost(request,response);
    }
}
