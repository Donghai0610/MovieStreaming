/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.InsertManyToMany;
import dal.MovieDAO;
import dal.WishListDAO;
import dal.userDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Comment;
import model.Movie;
import model.Order;
import model.User;

/**
 *
 * @author nguye
 */
public class Movie_Detail extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Movie_Detail</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Movie_Detail at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        MovieDAO dal = new MovieDAO();
        WishListDAO order = new WishListDAO();
        InsertManyToMany ee = new InsertManyToMany();
        userDAO dao = new userDAO();
        String id_raw = request.getParameter("id");
        int id;
        List<Movie> list_1 = dal.getRandomMovies(4);
        request.setAttribute("random4", list_1);
        int userID = ((User) request.getSession().getAttribute("account")).getId();
        request.setAttribute("paied", order.Ordesr(userID, id_raw));

        try {
            id = Integer.parseInt(id_raw);
            Movie m = dal.getMoviebyId(id);
            request.setAttribute("movie", m);
            List<Comment> c = ee.getCommet(id);
            request.setAttribute("comment", c);
            List<User> list = dao.getAll();
            request.setAttribute("user", list);

        } catch (Exception e) {
        }
        request.getRequestDispatcher("movie-detail.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        WishListDAO dal = new WishListDAO();
        String id_raw = request.getParameter("id");
        int id = Integer.parseInt(id_raw);
        int user_id = ((User) request.getSession().getAttribute("account")).getId();
        dal.insertWishList(user_id, id);
        System.out.println(id_raw == null ? "null" : "");
        System.out.println(user_id == 0 ? "null" : "");
        //inser comment
        try {

            InsertManyToMany dao = new InsertManyToMany();
            String comment = request.getParameter("ms_cmt");
            if (comment != null) {
                Comment c = new Comment();
                c.setUserId(new User(user_id, null));
                c.setVideoId(new Movie(id));
                c.setComment(comment);

                dao.insertComment(c);
            }

        } catch (Exception e) {
        }
        response.sendRedirect("movie_detail?id=" + id);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
