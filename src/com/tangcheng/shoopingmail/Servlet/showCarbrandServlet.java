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

@WebServlet("/showCarbrandServlet")
public class showCarbrandServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String carbrandkey = request.getParameter("Carbrandkey");
        String carbrandname = request.getParameter("Carbrandname");
        String carbrandaddress = request.getParameter("Carbrandaddress");
        if(carbrandkey==null&&carbrandaddress==null&&carbrandname==null){
            RootcarService carbrand=new RootcarServiceimpl();
            List<Map<String, Object>> maps = carbrand.showCarbrand();
            request.setAttribute("carbrandlist",maps);
            request.getRequestDispatcher("Carbrand.jsp").forward(request,response);
        }else {
            RootcarService carbrandbytiaojian=new RootcarServiceimpl();
            List<Map<String, Object>> maps = carbrandbytiaojian.showCarbrandbytiaojian(carbrandkey, carbrandname, carbrandaddress);
            request.setAttribute("carbrandlist",maps);
            request.getRequestDispatcher("Carbrand.jsp").forward(request,response);
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    this.doPost(request,response);
    }
}
