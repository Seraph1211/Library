package guohao.servlet;

import guohao.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;

public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("doGet");

        request.setCharacterEncoding("utf-8");

        String userName = request.getParameter("user_name");
        String pwd = request.getParameter("pwd");
        System.out.println("user_name="+userName);
        System.out.println("password="+pwd);

        HashMap<String, String> errorMap = new HashMap<>();

        //检查用户名是否合法
        if(userName==null || userName==""){
            errorMap.put("uError", "用户名不能为空！");
        }else if(!userName.matches("^.{2,12}$")){
            errorMap.put("uError", "用户名必须是2-12位");
        }

        //检查密码是否合法
        if(pwd==null || pwd==""){
            errorMap.put("pError", "密码不能为空");
        }else if(!pwd.matches("^\\w{6,18}$")){
            errorMap.put("pError", "密码必须是6-18位");
        }

        if(errorMap.size() > 0){ //如果errorMap中有数据，则说明用户名或密码不合法，返回错误信息给登录页面
            request.setAttribute("errorMap", errorMap);
            request.getRequestDispatcher("login.jsp")
                    .forward(request, response);
        }else {


            if(userName.equals("201850080441") && pwd.equals("111812")){  //管理员登录
                response.sendRedirect("index.jsp");
            } else{

                UserService userService = new UserService();

                String result = "";
                try {
                    result = userService.login(userName, pwd);
                } catch (SQLException e) {
                    e.printStackTrace();
                }

                System.out.println("LoginServlet: result="+result);

                if(result.equals("success")){  //登录成功
                    response.sendRedirect("index.jsp");
                }else {  //登录失败
                    request.setAttribute("msg", result);
                    request.getRequestDispatcher("login.jsp")
                            .forward(request, response);
                }

            }


        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
