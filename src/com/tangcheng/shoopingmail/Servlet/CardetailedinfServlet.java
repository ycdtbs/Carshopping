package com.tangcheng.shoopingmail.Servlet;

import com.tangcheng.shoopingmail.Service.RootcarService;
import com.tangcheng.shoopingmail.Service.impl.RootcarServiceimpl;
import com.tangcheng.shoopingmail.Util.raplace;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@WebServlet("/CardetailedinfServlet")
public class CardetailedinfServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String carid = request.getParameter("carid");
        ArrayList<String> reducestr=null;
        String color=null;
        String zaikerenshu=null;
        String baigongliyouhao=null;
        String pailiang=null;
        String baoxian=null;
        String text=null;
        String flag = request.getParameter("flag");
        RootcarService showcarinf=new RootcarServiceimpl();
        List<Map<String, Object>> showcardetailedinf = showcarinf.showcardetailedinf(carid);
        for (Map<String, Object> beizhu:showcardetailedinf
        ) {
             text = beizhu.get("Carinf").toString();
            System.out.println("查询界面的text" + text);
        }
            String[] split = text.split("\\*\\*");
            ArrayList<String> list = new ArrayList<String>();
            for (int i = 0; i <split.length ; i++) {
                list.add(split[i]);
            }
            color=list.get(0).toString();
            color = color.replace("color=", "");
            zaikerenshu=list.get(1).toString();
            zaikerenshu = zaikerenshu.replace("zaikerenshu=", "");
            baigongliyouhao=list.get(2).toString();
            baigongliyouhao=baigongliyouhao.replace("baigongliyouhao=", "");
            pailiang=list.get(3).toString();
            pailiang=pailiang.replace("pailiang=", "");
            baoxian=list.get(4).toString();
            baoxian=baoxian.replace("baoxian=", "");


        System.out.println("list的值未"+list);
        request.setAttribute("color",color);
        request.setAttribute("zaikerenshu",zaikerenshu);
        request.setAttribute("baigongliyouhao",baigongliyouhao);
        request.setAttribute("pailiang",pailiang);
        request.setAttribute("baoxian",baoxian);

        request.setAttribute("carinflist",reducestr);
        request.setAttribute("carlist",showcardetailedinf);
        if(flag==null){
            request.getRequestDispatcher("Cardetailedinf.jsp").forward(request,response);
        }
        else {
            request.getRequestDispatcher("showmailcarinf.jsp").forward(request,response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }


}
