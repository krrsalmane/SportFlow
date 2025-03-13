package sportflow.Member.Servlet;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebFilter("/dashboard.jsp")
public class AuthFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // No initialization needed
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        HttpSession session = httpRequest.getSession(false); // false: don’t create a new session

        // Check if user is logged in
        boolean isLoggedIn = (session != null && session.getAttribute("isLoggedIn") != null
                && (Boolean) session.getAttribute("isLoggedIn"));

        String loginURI = httpRequest.getContextPath() + "/login";

        // If not logged in and trying to access a protected page, redirect to login
        if (!isLoggedIn && !httpRequest.getRequestURI().equals(loginURI)) {
            httpResponse.sendRedirect(loginURI);
        } else {
            // Continue to the requested resource
            chain.doFilter(request, response);
        }
    }

    @Override
    public void destroy() {
        // No cleanup needed
    }
}
