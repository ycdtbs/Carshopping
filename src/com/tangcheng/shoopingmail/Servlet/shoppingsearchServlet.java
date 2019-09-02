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
import java.util.List;
import java.util.Map;

@WebServlet("/shoppingsearchServlet")
public class shoppingsearchServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String search = request.getParameter("search");
        System.out.println("search的值是"+search);
        CustomerShoping searchbyalltable=new CustomerShopingimpl();
        List<Map<String, Object>> searchbyalltable1 = searchbyalltable.searchbyalltable(search);
        request.setAttribute("carlist",searchbyalltable1);
        RootcarService showcarinf=new RootcarServiceimpl();
        List<Map<String, Object>> showCarbrandname = showcarinf.showCarname();
        List<Map<String, Object>> showCaraddress = showcarinf.showCaraddress();
        System.out.println("我查到的"+showCarbrandname);
        System.out.println("我查到的"+showCaraddress);
        request.setAttribute("carbrand",showCarbrandname);
        request.setAttribute("address",showCaraddress);
        request.getRequestDispatcher("mail.jsp").forward(request,response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    this.doPost(request, response);
    }
}
