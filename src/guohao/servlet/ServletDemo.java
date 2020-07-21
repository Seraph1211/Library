package guohao.servlet;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

public class ServletDemo implements Servlet {

    public ServletDemo(){
        System.out.println("ServletDemo()");
    }

    @Override
    public void init(ServletConfig servletConfig) throws ServletException {
        System.out.println("init()");
    }

    @Override
    public ServletConfig getServletConfig() {
        System.out.println("getServletConfig()");
        return null;
    }

    @Override
    public void service(ServletRequest servletRequest, ServletResponse servletResponse) throws ServletException, IOException {
        System.out.println("service()");

        HttpServletRequest request = (HttpServletRequest) servletRequest;
        String method = request.getMethod();
        System.out.println("method:"+method);

    }

    @Override
    public String getServletInfo() {
        System.out.println("getServletInfo()");
        return null;
    }

    @Override
    public void destroy() {
        System.out.println("destroy()");
    }
}
