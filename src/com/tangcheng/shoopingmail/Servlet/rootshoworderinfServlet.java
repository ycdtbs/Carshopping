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

@WebServlet("/rootshoworderinfServlet")
public class rootshoworderinfServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        RootorderService showorderinf=new RootorderServiceimpl();
        List<Map<String, Object>> rootshoworderinf = showorderinf.rootshoworderinf(id);
        request.setAttribute("inflist",rootshoworderinf);
        request.getRequestDispatcher("userorderinf.jsp").forward(request,response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    this.doPost(request,response);
    }
}
