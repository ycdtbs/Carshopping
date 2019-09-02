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

@WebServlet("/rootshoworderServlet")
public class rootshoworderServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String orderid = request.getParameter("id");
        String orderzhuangtai = request.getParameter("statement");
        String ordertime = request.getParameter("ordertime");
        System.out.println(orderid+"id");
        System.out.println(orderzhuangtai+"orderzhuangtai");
        System.out.println(ordertime+"ordertime");
        if(orderid==null&&orderzhuangtai==null&&ordertime==null){
            System.out.println("我进入了非条件查询");
            RootorderService showorder=new RootorderServiceimpl();
            List<Map<String, Object>> rootshoworder = showorder.rootshoworder();
            request.setAttribute("orderlist",rootshoworder);
            request.getRequestDispatcher("rootshoworder.jsp").forward(request,response);
        }else {
            System.out.println("我进入了条件查询");
            RootorderService showorder=new RootorderServiceimpl();
            List<Map<String, Object>> rootshoworderbymohu = showorder.rootshoworderbymohu(orderid, orderzhuangtai, ordertime);
            request.setAttribute("orderlist",rootshoworderbymohu);
            request.getRequestDispatcher("rootshoworder.jsp").forward(request,response);
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
