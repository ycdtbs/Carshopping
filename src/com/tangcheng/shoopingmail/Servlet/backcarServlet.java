package com.tangcheng.shoopingmail.Servlet;

import com.tangcheng.shoopingmail.Service.CustomerShoping;
import com.tangcheng.shoopingmail.Service.RootcarService;
import com.tangcheng.shoopingmail.Service.impl.CustomerShopingimpl;
import com.tangcheng.shoopingmail.Service.impl.RootcarServiceimpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/backcarServlet")
public class backcarServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String orderid = request.getParameter("orderid");
        String money = request.getParameter("money");
        String carid = request.getParameter("carid");
        RootcarService updatecar=new RootcarServiceimpl();
        int backcar2 = updatecar.backcar(carid);
        CustomerShoping backcar=new CustomerShopingimpl();
        int backcar1 = backcar.backcar(orderid,money);
        request.getRequestDispatcher("showpersonorderServlet").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    this.doPost(request,response);
    }
}
