package com.tangcheng.shoopingmail.Servlet;

import com.tangcheng.shoopingmail.Service.RootcarService;
import com.tangcheng.shoopingmail.Service.impl.RootcarServiceimpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet("/showcarinfServlet")
public class showcarinfServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String carnumber = request.getParameter("carnumber");
        String carbrandname = request.getParameter("carbrandname");
        String carname = request.getParameter("carname");
        String caridcard = request.getParameter("caridcard");
        String carstatue = request.getParameter("carstatue");
        System.out.println(carnumber+carbrandname);
        if(carnumber==null&&carbrandname==null&&carname==null&&caridcard==null&&carstatue==null){
            System.out.println("我进入了汽车信息的非条件查询");
            RootcarService showcarinf=new RootcarServiceimpl();
            List<Map<String, Object>> maps = showcarinf.showCarinf();
            System.out.println(maps);
            request.setAttribute("carlist",maps);
            request.getRequestDispatcher("Car.jsp").forward(request,response);
        }else {
            System.out.println("我进入了汽车信息的条件查询");
            RootcarService showcarinfbytiaojian=new RootcarServiceimpl();
            List<Map<String, Object>> maps = showcarinfbytiaojian.showCarinfbytiaojian(carnumber, carbrandname, carname, caridcard, carstatue);
            request.setAttribute("carlist",maps);
            request.getRequestDispatcher("Car.jsp").forward(request,response);
        }



    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    this.doPost(request,response);
    }
}
