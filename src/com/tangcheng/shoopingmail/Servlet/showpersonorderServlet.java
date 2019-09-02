package com.tangcheng.shoopingmail.Servlet;

import com.tangcheng.shoopingmail.Service.CustomerShoping;
import com.tangcheng.shoopingmail.Service.impl.CustomerShopingimpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet("/showpersonorderServlet")
public class showpersonorderServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String customernumber = session.getAttribute("idcardnumber").toString();
        System.out.println(customernumber);
        CustomerShoping showorder=new CustomerShopingimpl();
        List<Map<String, Object>> showorderbycustomername = showorder.showorderbycustomername(customernumber);
        request.setAttribute("personorderlist",showorderbycustomername);
        request.getRequestDispatcher("personorder.jsp").forward(request,response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
