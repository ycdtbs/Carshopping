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
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/addorderServlet")
public class addorderServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String money = request.getParameter("money");
        String carid = request.getParameter("carid");
        String startime = request.getParameter("startime");
        String endtime = request.getParameter("endtime");
        String yajin = request.getParameter("yajin");
        String customerid = request.getParameter("customerid");
        CustomerShoping addorder=new CustomerShopingimpl();
        String selectidcard = addorder.selectidcard(customerid);
        customerid=selectidcard;
        addorder.addorder(carid,customerid,startime,yajin,money);
        RootcarService sendcar=new RootcarServiceimpl();
        int sendcar1 = sendcar.sendcar(carid);
        System.out.println(money);
        System.out.println(carid);
        System.out.println(startime);
        System.out.println(endtime);
        System.out.println(yajin);
        System.out.println(customerid+"customer");
        HttpSession session = request.getSession();
        session.setAttribute("idcardnumber",customerid);
        request.getRequestDispatcher("showpersonorderServlet").forward(request,response);


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    this.doPost(request,response);
    }
}
