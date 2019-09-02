package com.tangcheng.shoopingmail.Servlet;

import com.tangcheng.shoopingmail.Service.RootcustomerService;
import com.tangcheng.shoopingmail.Service.impl.RootcustomerServiceimpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Map;
//此servlet功能：1查询所有顾客信息2按条件查询所有信息3查看黑名单信息
@WebServlet("/showcustomerServlet")
public class showcustomerServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String customername = request.getParameter("customername");
        String customeridcard = request.getParameter("customeridcard");
        String customerrtel = request.getParameter("customerrtel");
        String email = request.getParameter("email");
        String black = request.getParameter("flag");
        if(black==null){
            black="";
        }
        System.out.println(customeridcard+customername+customerrtel+email+"接收到的值"+black);
        if(customername==null&&customeridcard==null&&customerrtel==null&&email==null){
            System.out.println("我进入了非条件查询分支");
            RootcustomerService showcustomer=new RootcustomerServiceimpl();
            List<Map<String, Object>> customerlist = showcustomer.customerlist();
            request.setAttribute("customerlist",customerlist);
            request.getRequestDispatcher("customer.jsp").forward(request,response);
        }
        else {
            if(black.length()==0){
                System.out.println("我进入了条件查询分支");
                RootcustomerService showcustomerbytiaojian=new RootcustomerServiceimpl();
                List<Map<String, Object>> customerlist = showcustomerbytiaojian.selectcustomerbytiaojian(customername, customeridcard, customerrtel, customeridcard);
                request.setAttribute("customerlist",customerlist);
                request.getRequestDispatcher("customer.jsp").forward(request,response);
            }
            if(black.equals("black")){
                if(customername==null&&customeridcard==null&&customerrtel==null&&email==null){
                    System.out.println("我进入黑名单总体查询查询分支");
                    RootcustomerService blackshoecustomer=new RootcustomerServiceimpl();
                    List<Map<String, Object>> blackcustomerlist = blackshoecustomer.balckcustomerlist();
                    request.setAttribute("customerlist",blackcustomerlist);
                    request.getRequestDispatcher("customer.jsp").forward(request,response);
                }else {
                    System.out.println("我进入黑名单条件查询分支");
                    RootcustomerService showblackcustomerbytiaojian=new RootcustomerServiceimpl();
                    List<Map<String, Object>> customerlist = showblackcustomerbytiaojian.selectclackcustomerbytiaojian(customername, customeridcard, customerrtel, customeridcard);
                    request.setAttribute("customerlist",customerlist);
                    request.getRequestDispatcher("customer.jsp").forward(request,response);
                }

            }


        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    this.doPost(request,response);
    }
}
