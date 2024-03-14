/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.CategoryDAO;
import dal.MovieDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Category;
import model.Movie;

/**
 *
 * @author nguye
 */
public class CheckBoxSearchServlet extends HttpServlet {

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
            out.println("<title>Servlet CheckBoxSearchServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CheckBoxSearchServlet at " + request.getContextPath() + "</h1>");
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
        MovieDAO dao = new MovieDAO();
        CategoryDAO dal = new CategoryDAO();
        List<Category> c = dal.getAll();
        String nameAsc = request.getParameter("nameDown");
        String nameDesc = request.getParameter("nameUp");
        Integer priceAsc = request.getParameter("priceUp") != null ? 1 : null;
        Integer priceDesc = request.getParameter("priceDown") != null ? 1 : null;
        String key = request.getParameter("key");
        if (key == null) {
            key = "";
        }
        String[] id_raw = request.getParameterValues("typeOfFilm");
        int[] id = null;
        if (id_raw != null) {
            id = new int[id_raw.length];
            String checkbox = "";
            for (int i = 0; i < id_raw.length; i++) {
                id[i] = Integer.parseInt(id_raw[i]);
                checkbox += "typeOfFilm=" + id[i];
                if (i < id_raw.length - 1) {
                    checkbox += "&";
                }
            }
            request.setAttribute("checkbox", checkbox);
        }
        List<Movie> movie = dao.checkBox(id, nameAsc, nameDesc, priceDesc, priceAsc, key);

        boolean[] cid = new boolean[c.size()];
        for (int i = 0; i < cid.length; i++) {
            if (isCheck(c.get(i).getId(), id)) {
                cid[i] = true;
            } else {
                cid[i] = false;

            }
        }
        //
        int page, numperpage = 8;
        int size = movie.size();
        int num = (size % numperpage == 0 ? (size / numperpage) : ((size / numperpage)) + 1);
        String xpage = request.getParameter("page");
        if (xpage == null) {
            page = 1;
        } else {
            page = Integer.parseInt(xpage);

        }
        int start, end;
        start = (page - 1) * numperpage;
        end = Math.min(page * numperpage, size);
        List<Movie> list = dao.getListByPage(movie, start, end);//getALL
        request.setAttribute("movie", list);
        request.setAttribute("page", page);
        request.setAttribute("num", num);
        request.setAttribute("data", c);
        request.setAttribute("cid", cid);
        request.getRequestDispatcher("movie.jsp").forward(request, response);
    }

    private boolean isCheck(int d, int[] id) {
        if (id == null) {
            return false;
        } else {
            for (int i = 0; i < id.length; i++) {
                if (id[i] == d) {
                    return true;
                }
            }
        }
        return false;
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
        processRequest(request, response);
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
