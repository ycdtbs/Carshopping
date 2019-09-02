package com.tangcheng.shoopingmail.Servlet;

import com.tangcheng.shoopingmail.Service.RootuserService;
import com.tangcheng.shoopingmail.Service.impl.RootuserServiceimpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet("/ShowServlet")
public class ShowServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String usernumber = request.getParameter("usernumber");
        String usersex = request.getParameter("usersex");
        String userroly = request.getParameter("userroly");
        String usertel = request.getParameter("usertel");
        String useraddress = request.getParameter("useraddress");
        if(username==null&&usernumber==null&usersex==null&&useraddress==null&&userroly==null&&usertel==null){
            System.out.println("我进入了非条件查询");
            RootuserService userlist=new RootuserServiceimpl();
            List<Map<String, Object>> maps = userlist.showUser();
            request.setAttribute("userlist",maps);
            request.getRequestDispatcher("Staff.jsp").forward(request,response);
        }
        else {
            System.out.println("我进入了条件查询");
            RootuserService selectresult=new RootuserServiceimpl();
            List<Map<String, Object>> selectbytiaojian = selectresult.selectbytiaojian(usernumber, username, usersex, usertel, userroly, useraddress);
            request.setAttribute("userlist",selectbytiaojian);
            request.getRequestDispatcher("Staff.jsp").forward(request,response);

        }



    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    this.doPost(request,response);
    }
}
