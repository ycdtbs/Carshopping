package com.tangcheng.shoopingmail.Servlet;

import com.alibaba.fastjson.JSONObject;
import com.tangcheng.shoopingmail.Dao.CustomerDao;
import com.tangcheng.shoopingmail.Service.CustomerShoping;
import com.tangcheng.shoopingmail.Service.impl.CustomerShopingimpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/customerloginServlet")
public class customerloginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String customername = request.getParameter("customername");
        String customerpassword = request.getParameter("customerpassword");
        String jump = request.getParameter("jump");
        System.out.println(customername);
        System.out.println(customerpassword);
        System.out.println("wojinrule ");
        System.out.println(jump+"jump");
        if(jump!=null){
            request.getRequestDispatcher("ShowcarmailServlet").forward(request,response);
        }
        System.out.println("!@332");
        CustomerShoping login=new CustomerShopingimpl();
        int customerlogin = login.customerlogin(customername,customerpassword);
        System.out.println(customerlogin+"顾客查询接收到的值");
        if(customerlogin==1){
            CustomerShoping realname=new CustomerShopingimpl();
            String realname1 = realname.realname(customername);
            HttpSession session = request.getSession();
            CustomerShoping addorder=new CustomerShopingimpl();
            String selectidcard = addorder.selectidcard(customername);
            session.setAttribute("customername",realname1);
            session.setAttribute("idcardnumber",selectidcard);
            session.setAttribute("customernumber",customername);
        }
        PrintWriter writer = response.getWriter();
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("flag",customerlogin);
        writer.print(jsonObject.toJSONString());
        response.setHeader("Content-Type","text/json;charset=utf-8");
        writer.flush();
        writer.close();


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    this.doPost(request,response);
    }
}
