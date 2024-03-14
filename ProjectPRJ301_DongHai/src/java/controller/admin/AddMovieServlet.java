/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import dal.CategoryDAO;
import dal.MovieDAO;
import dal.userDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.FileOutputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.sql.Date;
import java.util.List;
import model.Category;
import model.Movie;
import model.User;

/**
 *
 * @author nguye
 */
@MultipartConfig
public class AddMovieServlet extends HttpServlet {

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
            out.println("<title>Servlet AddMovieServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddMovieServlet at " + request.getContextPath() + "</h1>");
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
        CategoryDAO c = new CategoryDAO();
        List<Category> list = c.getAll();
        request.setAttribute("listcate", list);
        request.getRequestDispatcher("admin.jsp").forward(request, response);
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
        MovieDAO dal = new MovieDAO();
        String name = request.getParameter("name");
        String date_raw = request.getParameter("RealseYear");
        Part a = request.getPart("banner");
        byte[] hazz = new byte[a.getInputStream().available()];
        a.getInputStream().read(hazz);
        File donghai = new File("D:\\Learn_FPT\\Semeter_4\\PRJ301\\ProjectPRJ301_DongHai\\web\\images\\" + a.getSubmittedFileName());
        if (donghai.exists()) {
//            donghai = new File("D:\\Learn_FPT\\Semeter_4\\PRJ301\\ProjectPRJ301_DongHai\\web\\images\\" + a.getSubmittedFileName() + "ss");
            donghai.delete();
        }
        donghai.createNewFile();
        FileOutputStream sos = new FileOutputStream(donghai);
        sos.write(hazz);
        sos.close();

        String realPath = request.getServletContext().getRealPath("/images");
//        String banner = "images/" + Paths.get(a.getSubmittedFileName()).getFileName().toString();
        String banner = "images/" + donghai.getName();
        if (!Files.exists(Paths.get(realPath))) {
            Files.createDirectories(Paths.get(realPath));
        }

        String price_raw = request.getParameter("Price");
        String describe = request.getParameter("Description");
        String actor = request.getParameter("Actor");
        String director = request.getParameter("Director");
        String cid_raw = request.getParameter("cid");
        String linkmovie = request.getParameter("Src");
        int cid;
        double price;
        Date release;

        if (!Files.exists(Paths.get(realPath))) {
            Files.createDirectories(Paths.get(realPath));
        }
        try {

            price = Double.parseDouble(price_raw);
            cid = Integer.parseInt(cid_raw);
            release = Date.valueOf(date_raw);
            Movie c = dal.getMovieByName(name);
            if (c != null) {
                request.setAttribute("error", "Movie " + name + " exits!!");
                request.getRequestDispatcher("admin.jsp").forward(request, response);
            } else {

                Movie ce = new Movie(name, price, banner, describe, actor, director, linkmovie, release, new Category(cid, null));
                dal.insert(ce);
                response.sendRedirect("movie");
                System.out.println(banner);
//            SendMail.getMovie(name, banner, describe, release, linkmovie);
            }

        } catch (ServletException | IOException | NumberFormatException e) {
        }
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
