package com.example.jpademo.servlet;

import javax.servlet.AsyncContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.Writer;

@WebServlet(value = "/asyncDemo", asyncSupported = true)

public class Async extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        Writer writer = resp.getWriter();
        writer.write("<progress id='progress' max=100></progress>");

        //Bat dong bo
        AsyncContext asyncContext = req.startAsync();   //quan li luong
        asyncContext.start(new Runnable() {
            @Override
            public void run() {
                int i = 0;
                while (i < 100){
                    i++;
                    try {
                        writer.write("<script>document.getElementById('progress').value = '"+i+"'</script>");
                        writer.flush();
                        Thread.sleep(100);
                    } catch (Exception e) {
                        throw new RuntimeException(e);
                    }
                }
                asyncContext.complete();
            }
        });

        //dong bo

        /*int i =0;
        while (i<100){
            i++;
            writer.write("<script>document.getElementById('progress').value = '"+i+"'</script> ");
            writer.flush();
        }
        try {
            Thread.sleep(100);
        }catch (InterruptedException e){
            throw new RuntimeException();
        }*/

        writer.write("</br>");
        writer.write("Success test");

    }
}
