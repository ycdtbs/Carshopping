package com.tangcheng.shoopingmail.Servlet;

import com.alibaba.fastjson.JSONObject;
import com.tangcheng.shoopingmail.Service.RootcustomerService;
import com.tangcheng.shoopingmail.Service.impl.RootcustomerServiceimpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/delcustomerServlet")
//这个servlet中是顾客表中的数据。在这个servlet中由于太简单，继承了三个功能，使用了ajax
//形成了三个分支，功能分别对因删除，黑名单，和重置密码
public class delcustomerServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String delid = request.getParameter("delid");
        String flag = request.getParameter("flag");
        System.out.println(flag);
        if(flag==null){
            System.out.println("我进入了删除");
            RootcustomerService delbyid=new RootcustomerServiceimpl();
            int delresult = delbyid.delbyid(delid);
            PrintWriter writer = response.getWriter();
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("delresult",delresult);
            writer.print(jsonObject.toJSONString());
            response.setHeader("Content-Type","text/json;charset=utf-8");
            writer.flush();
            writer.close();
        }else {
            if(flag.equals("black")) {
                System.out.println("我进入了黑名单");
                RootcustomerService delbyid=new RootcustomerServiceimpl();
                int delresult = delbyid.black(delid);
                PrintWriter writer = response.getWriter();
                JSONObject jsonObject = new JSONObject();
                jsonObject.put("delresult",delresult);
                writer.print(jsonObject.toJSONString());
                response.setHeader("Content-Type","text/json;charset=utf-8");
                writer.flush();
                writer.close();
            }
            if(flag.equals("removeblack")) {
                System.out.println("我进入了移除黑名单");
                RootcustomerService delbyid=new RootcustomerServiceimpl();
                int delresult = delbyid.removeblack(delid);
                PrintWriter writer = response.getWriter();
                JSONObject jsonObject = new JSONObject();
                jsonObject.put("delresult",delresult);
                writer.print(jsonObject.toJSONString());
                response.setHeader("Content-Type","text/json;charset=utf-8");
                writer.flush();
                writer.close();
            }
            if(flag.equals("repwd")) {
                System.out.println("我进入了重置密码");
                RootcustomerService delbyid=new RootcustomerServiceimpl();
                int delresult = delbyid.repwd(delid);
                PrintWriter writer = response.getWriter();
                JSONObject jsonObject = new JSONObject();
                jsonObject.put("delresult",delresult);
                writer.print(jsonObject.toJSONString());
                response.setHeader("Content-Type","text/json;charset=utf-8");
                writer.flush();
                writer.close();
            }
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    this.doPost(request,response);
    }
}
