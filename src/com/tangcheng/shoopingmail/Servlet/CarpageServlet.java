package com.tangcheng.shoopingmail.Servlet;

import com.tangcheng.shoopingmail.Service.RootcarService;
import com.tangcheng.shoopingmail.Service.impl.RootcarServiceimpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;

@WebServlet("/CarpageServlet")
@MultipartConfig
public class CarpageServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String carpagename = request.getParameter("carpagename");
        Part part = request.getPart("carpage");//得到上传的文件对象
        System.out.println("我获取到的part对象"+part);
        System.out.println("我获取到carnumber"+carpagename);
        String realPath = request.getRealPath("//");//得到服务器地址，复制到这里的地址
        RootcarService inputpage=new RootcarServiceimpl();
        String newcarpagename = inputpage.inputCarpage(part, carpagename, realPath);
        request.getRequestDispatcher("showcarinfServlet").forward(request,response);



    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    this.doPost(request,response);
    }
}
