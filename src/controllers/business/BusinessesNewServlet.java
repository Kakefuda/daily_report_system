package controllers.business;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Business;

/**
 * Servlet implementation class BusinessesNewServlet
 */
@WebServlet("/businesses/new")
public class BusinessesNewServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public BusinessesNewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("_token",request.getSession().getId());

        Business b = new Business();
        request.setAttribute("business", b);

        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/businesses/new.jsp");
        rd.forward(request, response);
    }

}
