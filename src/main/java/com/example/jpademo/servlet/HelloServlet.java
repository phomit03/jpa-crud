package com.example.jpademo.servlet;

import com.example.jpademo.dao.UserDAO;
import com.example.jpademo.etity.UserEntity;

import java.io.*;
import java.util.List;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "helloServlet", value = "/hello-servlet")
public class HelloServlet extends HttpServlet {
    private String message;
    public void init() {
        message = "Hello World!";
    }

    UserDAO userDAO = new UserDAO();

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");
        //Hello
        /*PrintWriter out = response.getWriter();
        UserEntity userEntity = new UserEntity(1, "T2108E", 20, "Ha Noi");
        userDAO.insertUser(userEntity);
        out.println("create user success");*/

        /*String name = request.getParameter("name");
        List<UserEntity> users = userDAO.findUsersByName(name);
        for (UserEntity user : users) {
            out.println("User Info: " + user);
        }*/
    }

    public void destroy() {
    }
}