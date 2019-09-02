package com.tangcheng.shoopingmail.Servlet;

import com.mysql.cj.Session;
import com.tangcheng.shoopingmail.Service.RootuserService;
import com.tangcheng.shoopingmail.Service.impl.RootuserServiceimpl;
import netscape.javascript.JSObject;
import com.alibaba.fastjson.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("我进入了servlet");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String jump = request.getParameter("jump");
        if(jump!=null){
            request.getRequestDispatcher("index.jsp").forward(request,response);
        }else{
            System.out.println(jump+"这是jump");
            System.out.println(username+password);
            RootuserService login=new RootuserServiceimpl();
            int loginselect = login.loginselect(username, password);
            if(loginselect==1){
                RootuserService login1=new RootuserServiceimpl();
                String realname = login1.selectusername(username, password);
                HttpSession session = request.getSession();
                session.setAttribute("realname",realname);
            }
            System.out.println("返回值"+loginselect);
            PrintWriter writer = response.getWriter();
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("flag",loginselect);
            writer.print(jsonObject.toJSONString());
            response.setHeader("Content-Type","text/json;charset=utf-8");
            writer.flush();
            writer.close();
        }



    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
