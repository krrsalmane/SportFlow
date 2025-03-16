package sportflow.Entraineur.Servlet;



import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebFilter("/dashboard2.jsp")
public class AuthFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        HttpSession session = httpRequest.getSession(false);

        boolean isLoggedIn = (session != null && session.getAttribute("isLoggedIn") != null
                && (Boolean) session.getAttribute("isLoggedIn"));

        String loginURI = httpRequest.getContextPath() + "/login";

        if (!isLoggedIn && !httpRequest.getRequestURI().equals(loginURI)) {
            httpResponse.sendRedirect(loginURI);
        } else {

            chain.doFilter(request, response);
        }
    }
    @Override
    public void destroy() {
    }
}

