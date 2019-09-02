package com.tangcheng.shoopingmail.Servlet;

import com.tangcheng.shoopingmail.Service.CustomerShoping;
import com.tangcheng.shoopingmail.Service.impl.CustomerShopingimpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/singinServlet")
public class singinServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String realname = request.getParameter("realname");
        String telnumber = request.getParameter("telnumber");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String idcard = request.getParameter("idcard");
        CustomerShoping singin=new CustomerShopingimpl();
        int customerinf = singin.customerinf(realname, password, email, telnumber, idcard);
        System.out.println(customerinf+"1223");
        if(customerinf>0){
            request.getRequestDispatcher("shoppage.jsp").forward(request,response);
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    this.doPost(request,response);
    }
}
