package com.tangcheng.shoopingmail.Servlet;
import  com.tangcheng.shoopingmail.Util.picture;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;
import java.io.IOException;

@WebServlet("/startServlet")
public class startServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //创建对象
        picture vc = new picture();
        //获取图片对象
        BufferedImage image = vc.getImage();
        //获得图片的文本内容
        String text = vc.getText();
        // 将系统生成的文本内容保存到session中
        request.getSession().setAttribute("text", text);
        //向浏览器输出图片
        vc.output(image, response.getOutputStream());


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    this.doPost(request,response);
    }
}
