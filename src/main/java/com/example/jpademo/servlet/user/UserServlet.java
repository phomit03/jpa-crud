package com.example.jpademo.servlet.user;

import com.example.jpademo.dao.UserDAO;
import com.example.jpademo.etity.UserEntity;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "userServlet", value = "/userServlet")

public class UserServlet extends HttpServlet {
    UserDAO userDAO = new UserDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");

        if(action == null){
            action = "";
        }

        switch (action) {
            case "createUser":
                req.getRequestDispatcher("user/createUser.jsp").forward(req, resp);
                break;
            case "editUser":
                editUser(req, resp);
                break;
            case "deleteUser":
                deleteUser(req, resp);
                break;
            default:
                userList(req, resp);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");

        if(action == null){
            action = "";
        }

        switch (action) {
            case "createUser":
                createNewUser(req, resp);
                break;
            case "updateUser":
                updateUser(req, resp);
                break;
        }
    }

    private void userList(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<UserEntity> listUser = userDAO.getAllUser();

        req.setAttribute("listUser", listUser);
        req.getRequestDispatcher("user/listUser.jsp").forward(req, resp);
    }

    private void createNewUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String age = req.getParameter("age");
        String address = req.getParameter("address");

        UserEntity userEntity = new UserEntity(name, Integer.parseInt(age), address);
        userDAO.insertUser(userEntity);

        req.setAttribute("message", "Create new user successfully");
        userList(req,resp);
    }
    private void editUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer id = Integer.valueOf(req.getParameter("id"));

        UserEntity userEntity = userDAO.getUserById(id);
        req.setAttribute("user", userEntity);

        req.getRequestDispatcher("user/editUser.jsp").forward(req, resp);
    }

    private void updateUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer id = Integer.valueOf(req.getParameter("id"));
        String name = req.getParameter("name");
        String age = req.getParameter("age");
        String address = req.getParameter("address");

        UserEntity userEntity = new UserEntity(id, name, Integer.parseInt(age), address);
        userDAO.updateUser(userEntity);

        req.setAttribute("message", "Update user successfully");
        userList(req,resp);
    }

    private void deleteUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer id = Integer.valueOf(req.getParameter("id"));
        userDAO.deleteUser(id);

        req.setAttribute("message", "Delete user successfully");
        userList(req,resp);

    }

}
