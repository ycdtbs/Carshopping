package com.tangcheng.shoopingmail.Servlet;

import com.tangcheng.shoopingmail.Service.RootcarService;
import com.tangcheng.shoopingmail.Service.impl.RootcarServiceimpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/updatecarmoneyServlet")
public class updatecarmoneyServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String money = request.getParameter("money");
        String color = request.getParameter("color");
        color=color+" ";
        String zaikerenshu = request.getParameter("zaikerenshu");
        String baigongliyouhao = request.getParameter("baigongliyouhao");
        String pailiang = request.getParameter("pailiang");
        String baoxian = request.getParameter("baoxian");
        System.out.println("我输入的color"+color);
        String text=null;
        System.out.println("凭借前的color是"+color);
        text="color="+color+"**zaikerenshu="+zaikerenshu+"**baigongliyouhao="+baigongliyouhao+"**pailiang="+pailiang+"**baoxian="+baoxian+"";
        System.out.println("拼接后的添加语句是"+text);

        String carid = request.getParameter("carid");
        RootcarService updatemoney=new RootcarServiceimpl();
        int updatemoneyandtext = updatemoney.updatemoneyandtext(carid, money, text);
        request.getRequestDispatcher("CardetailedinfServlet").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    this.doPost(request,response);
    }
}
