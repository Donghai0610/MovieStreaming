/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import dal.userDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.FileReader;
import java.sql.Date;
import java.util.List;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import model.User;

/**
 *
 * @author nguye
 */
public class SendMail extends HttpServlet {

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
            out.println("<title>Servlet SendMail</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SendMail at " + request.getContextPath() + "</h1>");
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
        userDAO dal = new userDAO();

        List<User> u = dal.getAll();

        request.setAttribute("list", u);
        request.getRequestDispatcher("sendmail.jsp").forward(request, response);
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
        String usermail = "nguyentuanhongdonghai@gmail.com";
        String password = "donghai06102003";
        Properties prop = new Properties();
        prop.put("mail.smtp.host", "smtp.gmail.com");
        prop.put("mail.smtp.port", "465");
        prop.put("mail.smtp.auth", "true");
        prop.put("mail.smtp.starttls.enable", "true");
        prop.put("mail.smtp.starttls.required", "true");
        prop.put("mail.smtp.ssl.protocols", "TLSv1.2");
        prop.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        Session session = Session.getInstance(prop, new javax.mail.Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(usermail, password);
            }
        });
        userDAO dal = new userDAO();
        List<User> u = dal.getAll();
        String emailSubject = " Has new Movie";
        String content = "hihi";
        for (int i = 0; i < u.size(); i++) {
            String email = u.get(i).getEmail();
            try {
                Message message = new MimeMessage(session);
                message.setFrom(new InternetAddress(usermail));
                message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
                message.setSubject(emailSubject);
                message.setText(content);
                Transport.send(message);
            } catch (MessagingException e) {
            }
        }

        //
    }

    public static void getMovie(String name, String image, String describe, Date date, String linkmovie) {
        String usermail = "nguyentuanhongdonghai@gmail.com";
        String password = "wncl luyh llfu ofep";
        Properties prop = new Properties();
        prop.put("mail.smtp.host", "smtp.gmail.com");
        prop.put("mail.smtp.port", "465");
        prop.put("mail.smtp.auth", "true");
        prop.put("mail.smtp.starttls.enable", "true");
        prop.put("mail.smtp.starttls.required", "true");
        prop.put("mail.smtp.ssl.protocols", "TLSv1.2");
        prop.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        Session session = Session.getInstance(prop, new javax.mail.Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(usermail, password);
            }
        });
        userDAO dal = new userDAO();
        List<User> u = dal.getAll();
        String content = "<!DOCTYPE html>\n"
                + "<html xmlns:v=\"urn:schemas-microsoft-com:vml\" xmlns:o=\"urn:schemas-microsoft-com:office:office\" lang=\"en\">\n"
                + "\n"
                + "    <head>\n"
                + "        <title></title>\n"
                + "        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\n"
                + "        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\"><!--[if mso]><xml><o:OfficeDocumentSettings><o:PixelsPerInch>96</o:PixelsPerInch><o:AllowPNG/></o:OfficeDocumentSettings></xml><![endif]-->\n"
                + "        <style>\n"
                + "            * {\n"
                + "                box-sizing: border-box;\n"
                + "            }\n"
                + "\n"
                + "            body {\n"
                + "                margin: 0;\n"
                + "                padding: 0;\n"
                + "            }\n"
                + "\n"
                + "            a[x-apple-data-detectors] {\n"
                + "                color: inherit !important;\n"
                + "                text-decoration: inherit !important;\n"
                + "            }\n"
                + "\n"
                + "            #MessageViewBody a {\n"
                + "                color: inherit;\n"
                + "                text-decoration: none;\n"
                + "            }\n"
                + "\n"
                + "            p {\n"
                + "                line-height: inherit\n"
                + "            }\n"
                + "\n"
                + "            .desktop_hide,\n"
                + "            .desktop_hide table {\n"
                + "                mso-hide: all;\n"
                + "                display: none;\n"
                + "                max-height: 0px;\n"
                + "                overflow: hidden;\n"
                + "            }\n"
                + "\n"
                + "            .image_block img+div {\n"
                + "                display: none;\n"
                + "            }\n"
                + "\n"
                + "            @media (max-width:660px) {\n"
                + "\n"
                + "                .desktop_hide table.icons-inner,\n"
                + "                .social_block.desktop_hide .social-table {\n"
                + "                    display: inline-block !important;\n"
                + "                }\n"
                + "\n"
                + "                .icons-inner {\n"
                + "                    text-align: center;\n"
                + "                }\n"
                + "\n"
                + "                .icons-inner td {\n"
                + "                    margin: 0 auto;\n"
                + "                }\n"
                + "\n"
                + "                .mobile_hide {\n"
                + "                    display: none;\n"
                + "                }\n"
                + "\n"
                + "                .video_block .sizer {\n"
                + "                    max-width: none !important;\n"
                + "                }\n"
                + "\n"
                + "                .row-content {\n"
                + "                    width: 100% !important;\n"
                + "                }\n"
                + "\n"
                + "                .stack .column {\n"
                + "                    width: 100%;\n"
                + "                    display: block;\n"
                + "                }\n"
                + "\n"
                + "                .mobile_hide {\n"
                + "                    min-height: 0;\n"
                + "                    max-height: 0;\n"
                + "                    max-width: 0;\n"
                + "                    overflow: hidden;\n"
                + "                    font-size: 0px;\n"
                + "                }\n"
                + "\n"
                + "                .desktop_hide,\n"
                + "                .desktop_hide table {\n"
                + "                    display: table !important;\n"
                + "                    max-height: none !important;\n"
                + "                }\n"
                + "            }\n"
                + "        </style>\n"
                + "    </head>\n"
                + "\n"
                + "    <body style=\"background-color: #fff; margin: 0; padding: 0; -webkit-text-size-adjust: none; text-size-adjust: none;\">\n"
                + "        <table class=\"nl-container\" width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"mso-table-lspace: 0pt; mso-table-rspace: 0pt; background-color: #fff;\">\n"
                + "            <tbody>\n"
                + "                <tr>\n"
                + "                    <td>\n"
                + "                        <table class=\"row row-1\" align=\"center\" width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"mso-table-lspace: 0pt; mso-table-rspace: 0pt; background-color: #0A0A0A;\">\n"
                + "                            <tbody>\n"
                + "                                <tr>\n"
                + "                                    <td>\n"
                + "                                        <table class=\"row-content stack\" align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"mso-table-lspace: 0pt; mso-table-rspace: 0pt; color: #000; background-color: #0a0a0a; width: 640px; margin: 0 auto;\" width=\"640\">\n"
                + "                                            <tbody>\n"
                + "                                                <tr>\n"
                + "                                                    <td class=\"column column-1\" width=\"100%\" style=\"mso-table-lspace: 0pt; mso-table-rspace: 0pt; font-weight: 400; text-align: left; border-top: 3px solid #BF3100; padding-bottom: 20px; padding-top: 20px; vertical-align: top; border-right: 0px; border-bottom: 0px; border-left: 0px;\">\n"
                + "                                                        <table class=\"image_block block-1\" width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"mso-table-lspace: 0pt; mso-table-rspace: 0pt;\">\n"
                + "                                                            <tr>\n"
                + "                                                                <td class=\"pad\" style=\"width:100%;\">\n"
                + "                                                                    <div class=\"alignment\" align=\"center\" style=\"line-height:10px\"><img src=\"https://d1oco4z2z1fhwp.cloudfront.net/templates/default/626/Logo.png\" style=\"display: block; height: auto; border: 0; max-width: 184px; width: 100%;\" width=\"184\" alt=\"Image\" title=\"Image\"></div>\n"
                + "                                                                </td>\n"
                + "                                                            </tr>\n"
                + "                                                        </table>\n"
                + "                                                    </td>\n"
                + "                                                </tr>\n"
                + "                                            </tbody>\n"
                + "                                        </table>\n"
                + "                                    </td>\n"
                + "                                </tr>\n"
                + "                            </tbody>\n"
                + "                        </table>\n"
                + "                        <table class=\"row row-2\" align=\"center\" width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"mso-table-lspace: 0pt; mso-table-rspace: 0pt; background-color: #000;\">\n"
                + "                            <tbody>\n"
                + "                                <tr>\n"
                + "                                    <td>\n"
                + "                                        <table class=\"row-content stack\" align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"mso-table-lspace: 0pt; mso-table-rspace: 0pt; color: #000; width: 640px; margin: 0 auto;\" width=\"640\">\n"
                + "                                            <tbody>\n"
                + "                                                <tr>\n"
                + "                                                    <td class=\"column column-1\" width=\"100%\" style=\"mso-table-lspace: 0pt; mso-table-rspace: 0pt; font-weight: 400; text-align: left; padding-bottom: 5px; padding-top: 5px; vertical-align: top; border-top: 0px; border-right: 0px; border-bottom: 0px; border-left: 0px;\">\n"
                + "                                                        <div class=\"spacer_block block-1\" style=\"height:50px;line-height:50px;font-size:1px;\">&#8202;</div>\n"
                + "                                                        <table class=\"image_block block-2\" width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"mso-table-lspace: 0pt; mso-table-rspace: 0pt;\">\n"
                + "                                                            <tr>\n"
                + "                                                                <td class=\"pad\" style=\"padding-left:20px;padding-right:20px;width:100%;\">\n"
                + "                                                                    <div class=\"alignment\" align=\"center\" style=\"line-height:10px\"><img src=\"./" + image + " style=\"display: block; height: auto; border: 0; max-width: 306px; width: 100%;\" width=\"306\" alt=\"I'm an image\" title=\"I'm an image\"></div>\n"
                + "                                                                </td>\n"
                + "                                                            </tr>\n"
                + "                                                        </table>\n"
                + "                                                        <div class=\"spacer_block block-3\" style=\"height:35px;line-height:35px;font-size:1px;\">&#8202;</div>\n"
                + "                                                        <table class=\"paragraph_block block-4\" width=\"100%\" border=\"0\" cellpadding=\"10\" cellspacing=\"0\" role=\"presentation\" style=\"mso-table-lspace: 0pt; mso-table-rspace: 0pt; word-break: break-word;\">\n"
                + "                                                            <tr>\n"
                + "                                                                <td class=\"pad\">\n"
                + "                                                                    <div style=\"color:#555555;font-family:'Helvetica Neue', Helvetica, Arial, sans-serif;font-size:20px;line-height:120%;text-align:center;mso-line-height-alt:24px;\">\n"
                + "                                                                        <p style=\"margin: 0; word-break: break-word;\"><span style=\"color:rgb(153,153,153);\"><strong>New Movie</strong></span></p>\n"
                + "                                                                    </div>\n"
                + "                                                                </td>\n"
                + "                                                            </tr>\n"
                + "                                                        </table>\n"
                + "                                                        <table class=\"paragraph_block block-5\" width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"mso-table-lspace: 0pt; mso-table-rspace: 0pt; word-break: break-word;\">\n"
                + "                                                            <tr>\n"
                + "                                                                <td class=\"pad\" style=\"padding-bottom:5px;\">\n"
                + "                                                                    <div style=\"color:#555555;font-family:'Helvetica Neue', Helvetica, Arial, sans-serif;font-size:46px;line-height:120%;text-align:center;mso-line-height-alt:55.199999999999996px;\">\n"
                + "                                                                        <p style=\"margin: 0; word-break: break-word;\"><span style=\"color:rgb(255,255,255);\"><strong>" + name + "</strong></span></p>\n"
                + "                                                                    </div>\n"
                + "                                                                </td>\n"
                + "                                                            </tr>\n"
                + "                                                        </table>\n"
                + "                                                        <table class=\"button_block block-6\" width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"mso-table-lspace: 0pt; mso-table-rspace: 0pt;\">\n"
                + "                                                            <tr>\n"
                + "                                                                <td class=\"pad\" style=\"padding-bottom:10px;padding-left:10px;padding-right:10px;padding-top:15px;text-align:center;\">\n"
                + "                                                                    <div class=\"alignment\" align=\"center\"><!--[if mso]><v:roundrect xmlns:v=\"urn:schemas-microsoft-com:vml\" xmlns:w=\"urn:schemas-microsoft-com:office:word\" style=\"height:52px;width:102px;v-text-anchor:middle;\" arcsize=\"8%\" stroke=\"false\" fillcolor=\"#BF3100\"><w:anchorlock/><v:textbox inset=\"0px,0px,0px,0px\"><center style=\"color:#ffffff; font-family:Arial, sans-serif; font-size:16px\"><![endif]-->\n"
                + "                                                                        <div style=\"text-decoration:none;display:inline-block;color:#ffffff;background-color:#BF3100;border-radius:4px;width:auto;border-top:0px solid transparent;font-weight:undefined;border-right:0px solid transparent;border-bottom:0px solid transparent;border-left:0px solid transparent;padding-top:10px;padding-bottom:10px;font-family:'Helvetica Neue', Helvetica, Arial, sans-serif;font-size:16px;text-align:center;mso-border-alt:none;word-break:keep-all;\"><span style=\"padding-left:60px;padding-right:60px;font-size:16px;display:inline-block;letter-spacing:normal;\"><span style=\"word-break: break-word; line-height: 32px;\"><strong><a href=\"http://localhost:9999/project/home\" style=\"text-decoration: none;color: white\">Go-Home</a></strong></span></span></div><!--[if mso]></center></v:textbox></v:roundrect><![endif]-->\n"
                + "                                                                    </div>\n"
                + "                                                                </td>\n"
                + "                                                            </tr>\n"
                + "                                                        </table>\n"
                + "                                                        <div class=\"spacer_block block-7\" style=\"height:55px;line-height:55px;font-size:1px;\">&#8202;</div>\n"
                + "                                                    </td>\n"
                + "                                                </tr>\n"
                + "                                            </tbody>\n"
                + "                                        </table>\n"
                + "                                    </td>\n"
                + "                                </tr>\n"
                + "                            </tbody>\n"
                + "                        </table>\n"
                + "                        <table class=\"row row-3\" align=\"center\" width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"mso-table-lspace: 0pt; mso-table-rspace: 0pt; background-color: #0A0A0A;\">\n"
                + "                            <tbody>\n"
                + "                                <tr>\n"
                + "                                    <td>\n"
                + "                                        <table class=\"row-content stack\" align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"mso-table-lspace: 0pt; mso-table-rspace: 0pt; color: #000; width: 640px; margin: 0 auto;\" width=\"640\">\n"
                + "                                            <tbody>\n"
                + "                                                <tr>\n"
                + "                                                    <td class=\"column column-1\" width=\"100%\" style=\"mso-table-lspace: 0pt; mso-table-rspace: 0pt; font-weight: 400; text-align: left; padding-bottom: 5px; padding-top: 5px; vertical-align: top; border-top: 0px; border-right: 0px; border-bottom: 0px; border-left: 0px;\">\n"
                + "                                                        <div class=\"spacer_block block-1\" style=\"height:10px;line-height:10px;font-size:1px;\">&#8202;</div>\n"
                + "                                                    </td>\n"
                + "                                                </tr>\n"
                + "                                            </tbody>\n"
                + "                                        </table>\n"
                + "                                    </td>\n"
                + "                                </tr>\n"
                + "                            </tbody>\n"
                + "                        </table>\n"
                + "                        <table class=\"row row-4\" align=\"center\" width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"mso-table-lspace: 0pt; mso-table-rspace: 0pt; background-color: #000;\">\n"
                + "                            <tbody>\n"
                + "                                <tr>\n"
                + "                                    <td>\n"
                + "                                        <table class=\"row-content stack\" align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"mso-table-lspace: 0pt; mso-table-rspace: 0pt; color: #000; width: 640px; margin: 0 auto;\" width=\"640\">\n"
                + "                                            <tbody>\n"
                + "                                                <tr>\n"
                + "                                                    <td class=\"column column-1\" width=\"100%\" style=\"mso-table-lspace: 0pt; mso-table-rspace: 0pt; font-weight: 400; text-align: left; vertical-align: top; border-top: 0px; border-right: 0px; border-bottom: 0px; border-left: 0px;\">\n"
                + "                                                        <div class=\"spacer_block block-1\" style=\"height:45px;line-height:45px;font-size:1px;\">&#8202;</div>\n"
                + "                                                    </td>\n"
                + "                                                </tr>\n"
                + "                                            </tbody>\n"
                + "                                        </table>\n"
                + "                                    </td>\n"
                + "                                </tr>\n"
                + "                            </tbody>\n"
                + "                        </table>\n"
                + "                        <table class=\"row row-5\" align=\"center\" width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"mso-table-lspace: 0pt; mso-table-rspace: 0pt; background-color: #000;\">\n"
                + "                            <tbody>\n"
                + "                                <tr>\n"
                + "                                    <td>\n"
                + "                                        <table class=\"row-content stack\" align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"mso-table-lspace: 0pt; mso-table-rspace: 0pt; color: #000; width: 640px; margin: 0 auto;\" width=\"640\">\n"
                + "                                            <tbody>\n"
                + "                                                <tr>\n"
                + "                                                    <td class=\"column column-1\" width=\"33.333333333333336%\" style=\"mso-table-lspace: 0pt; mso-table-rspace: 0pt; font-weight: 400; text-align: left; padding-bottom: 5px; padding-left: 20px; padding-right: 20px; padding-top: 5px; vertical-align: top; border-top: 0px; border-right: 0px; border-bottom: 0px; border-left: 0px;\">\n"
                + "                                                        <table class=\"text_block block-1\" width=\"100%\" border=\"0\" cellpadding=\"10\" cellspacing=\"0\" role=\"presentation\" style=\"mso-table-lspace: 0pt; mso-table-rspace: 0pt; word-break: break-word;\">\n"
                + "                                                            <tr>\n"
                + "                                                                <td class=\"pad\">\n"
                + "                                                                    <div style=\"font-family: sans-serif\">\n"
                + "                                                                        <div class style=\"font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 12px; mso-line-height-alt: 18px; color: #555555; line-height: 1.5;\">\n"
                + "                                                                            <p style=\"margin: 0; font-size: 14px; mso-line-height-alt: 27px;\"><span style=\"font-size:16px;color:#999999;\">Duration</span><br> <span style=\"font-size:18px;color:#ffffff;\"><strong>106 mins</strong></span></p>\n"
                + "                                                                        </div>\n"
                + "                                                                    </div>\n"
                + "                                                                </td>\n"
                + "                                                            </tr>\n"
                + "                                                        </table>\n"
                + "                                                        <table class=\"text_block block-2\" width=\"100%\" border=\"0\" cellpadding=\"10\" cellspacing=\"0\" role=\"presentation\" style=\"mso-table-lspace: 0pt; mso-table-rspace: 0pt; word-break: break-word;\">\n"
                + "                                                            <tr>\n"
                + "                                                                <td class=\"pad\">\n"
                + "                                                                    <div style=\"font-family: sans-serif\">\n"
                + "                                                                        <div class style=\"font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 12px; mso-line-height-alt: 18px; color: #555555; line-height: 1.5;\">\n"
                + "                                                                            <p style=\"margin: 0; font-size: 14px; mso-line-height-alt: 27px;\"><span style=\"font-size:16px;color:#999999;\">Year</span><br> <span style=\"font-size:18px;color:#ffffff;\"><strong>" + date + "</strong></span></p>\n"
                + "                                                                        </div>\n"
                + "                                                                    </div>\n"
                + "                                                                </td>\n"
                + "                                                            </tr>\n"
                + "                                                        </table>\n"
                + "                                                        <table class=\"text_block block-3\" width=\"100%\" border=\"0\" cellpadding=\"10\" cellspacing=\"0\" role=\"presentation\" style=\"mso-table-lspace: 0pt; mso-table-rspace: 0pt; word-break: break-word;\">\n"
                + "                                                            <tr>\n"
                + "                                                                <td class=\"pad\">\n"
                + "                                                                    <div style=\"font-family: sans-serif\">\n"
                + "                                                                        <div class style=\"font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 12px; mso-line-height-alt: 18px; color: #555555; line-height: 1.5;\">\n"
                + "                                                                            <p style=\"margin: 0; font-size: 14px; mso-line-height-alt: 27px;\"><span style=\"font-size:16px;color:#999999;\">Genre</span><br> <span style=\"font-size:18px;color:#ffffff;\"><strong>Thriller</strong></span></p>\n"
                + "                                                                        </div>\n"
                + "                                                                    </div>\n"
                + "                                                                </td>\n"
                + "                                                            </tr>\n"
                + "                                                        </table>\n"
                + "                                                    </td>\n"
                + "                                                    <td class=\"column column-2\" width=\"66.66666666666667%\" style=\"mso-table-lspace: 0pt; mso-table-rspace: 0pt; font-weight: 400; text-align: left; padding-bottom: 5px; padding-left: 20px; padding-right: 20px; padding-top: 5px; vertical-align: top; border-top: 0px; border-right: 0px; border-bottom: 0px; border-left: 0px;\">\n"
                + "                                                        <table class=\"paragraph_block block-1\" width=\"100%\" border=\"0\" cellpadding=\"10\" cellspacing=\"0\" role=\"presentation\" style=\"mso-table-lspace: 0pt; mso-table-rspace: 0pt; word-break: break-word;\">\n"
                + "                                                            <tr>\n"
                + "                                                                <td class=\"pad\">\n"
                + "                                                                    <div style=\"color:#555555;font-family:'Helvetica Neue', Helvetica, Arial, sans-serif;font-size:16px;line-height:180%;text-align:left;mso-line-height-alt:28.8px;\">\n"
                + "                                                                        <p style=\"margin: 0; word-break: break-word;\"><span style=\"color:rgb(204,204,204);\">" + describe + "</span></p>\n"
                + "                                                                    </div>\n"
                + "                                                                </td>\n"
                + "                                                            </tr>\n"
                + "                                                        </table>\n"
                + "                                                        <div class=\"spacer_block block-2\" style=\"height:50px;line-height:50px;font-size:1px;\">&#8202;</div>\n"
                + "                                                    </td>\n"
                + "                                                </tr>\n"
                + "                                            </tbody>\n"
                + "                                        </table>\n"
                + "                                    </td>\n"
                + "                                </tr>\n"
                + "                            </tbody>\n"
                + "                        </table>\n"
                + "                        <table class=\"row row-6\" align=\"center\" width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"mso-table-lspace: 0pt; mso-table-rspace: 0pt; background-color: #0A0A0A;\">\n"
                + "                            <tbody>\n"
                + "                                <tr>\n"
                + "                                    <td>\n"
                + "                                        <table class=\"row-content stack\" align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"mso-table-lspace: 0pt; mso-table-rspace: 0pt; color: #000; width: 640px; margin: 0 auto;\" width=\"640\">\n"
                + "                                            <tbody>\n"
                + "                                                <tr>\n"
                + "                                                    <td class=\"column column-1\" width=\"100%\" style=\"mso-table-lspace: 0pt; mso-table-rspace: 0pt; font-weight: 400; text-align: left; padding-bottom: 5px; padding-top: 5px; vertical-align: top; border-top: 0px; border-right: 0px; border-bottom: 0px; border-left: 0px;\">\n"
                + "                                                        <div class=\"spacer_block block-1\" style=\"height:10px;line-height:10px;font-size:1px;\">&#8202;</div>\n"
                + "                                                    </td>\n"
                + "                                                </tr>\n"
                + "                                            </tbody>\n"
                + "                                        </table>\n"
                + "                                    </td>\n"
                + "                                </tr>\n"
                + "                            </tbody>\n"
                + "                        </table>\n"
                + "\n"
                + "\n"
                + "                        <table class=\"row row-9\" align=\"center\" width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"mso-table-lspace: 0pt; mso-table-rspace: 0pt; background-color: #0A0A0A;\">\n"
                + "                            <tbody>\n"
                + "                                <tr>\n"
                + "                                    <td>\n"
                + "                                        <table class=\"row-content stack\" align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"mso-table-lspace: 0pt; mso-table-rspace: 0pt; color: #000; width: 640px; margin: 0 auto;\" width=\"640\">\n"
                + "                                            <tbody>\n"
                + "                                                <tr>\n"
                + "                                                    <td class=\"column column-1\" width=\"100%\" style=\"mso-table-lspace: 0pt; mso-table-rspace: 0pt; font-weight: 400; text-align: left; padding-bottom: 5px; padding-top: 5px; vertical-align: top; border-top: 0px; border-right: 0px; border-bottom: 0px; border-left: 0px;\">\n"
                + "                                                        <div class=\"spacer_block block-1\" style=\"height:10px;line-height:10px;font-size:1px;\">&#8202;</div>\n"
                + "                                                    </td>\n"
                + "                                                </tr>\n"
                + "                                            </tbody>\n"
                + "                                        </table>\n"
                + "                                    </td>\n"
                + "                                </tr>\n"
                + "                            </tbody>\n"
                + "                        </table>\n"
                + "                        <table class=\"row row-10\" align=\"center\" width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"mso-table-lspace: 0pt; mso-table-rspace: 0pt; background-color: #000;\">\n"
                + "                            <tbody>\n"
                + "                                <tr>\n"
                + "                                    <td>\n"
                + "                                        <table class=\"row-content stack\" align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"mso-table-lspace: 0pt; mso-table-rspace: 0pt; color: #000; width: 640px; margin: 0 auto;\" width=\"640\">\n"
                + "                                            <tbody>\n"
                + "                                                <tr>\n"
                + "                                                    <td class=\"column column-1\" width=\"100%\" style=\"mso-table-lspace: 0pt; mso-table-rspace: 0pt; font-weight: 400; text-align: left; vertical-align: top; border-top: 0px; border-right: 0px; border-bottom: 0px; border-left: 0px;\">\n"
                + "                                                        <div class=\"spacer_block block-1\" style=\"height:45px;line-height:45px;font-size:1px;\">&#8202;</div>\n"
                + "                                                        <table class=\"text_block block-2\" width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"mso-table-lspace: 0pt; mso-table-rspace: 0pt; word-break: break-word;\">\n"
                + "                                                            <tr>\n"
                + "                                                                <td class=\"pad\" style=\"padding-bottom:25px;padding-left:10px;padding-right:10px;padding-top:10px;\">\n"
                + "                                                                    <div style=\"font-family: sans-serif\">\n"
                + "                                                                        <div class style=\"font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 12px; mso-line-height-alt: 18px; color: #fff; line-height: 1.5;\">\n"
                + "                                                                            <p style=\"margin: 0; font-size: 12px; text-align: center; mso-line-height-alt: 18px;\"><span style=\"color:#ffffff;font-size:12px;\"><strong><span style=\"font-size:24px;\"><span style=\"font-size:24px;\"><span style=\"font-size:24px;\">Watch the Trailer</span></span></span></strong></span></p>\n"
                + "                                                                        </div>\n"
                + "                                                                    </div>\n"
                + "                                                                </td>\n"
                + "                                                            </tr>\n"
                + "                                                        </table>\n"
                + "                                                        <table class=\"video_block block-3\" width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"mso-table-lspace: 0pt; mso-table-rspace: 0pt;\">\n"
                + "                                                            <tr style=\"box-sizing: content-box;\">\n"
                + "                                                                <td class=\"pad\" style=\"box-sizing: content-box; padding-left: 20px; padding-right: 20px; width: 100%;\" width=\"100%\"><!--[if (mso)|(IE)]><table width=\"600\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\"><tr><td><![endif]-->\n"
                + "                                                                    <div class=\"sizer\" align=\"center\" style=\"box-sizing: content-box; max-width: 600px; min-width: 280px;\"><!--[if !vml]><!--><a class=\"video-preview\" tabindex=\"0\" href=\"" + linkmovie + "\"\" target=\"_blank\" style=\"box-sizing: content-box; background-color: #5b5f66; background-image: radial-gradient(circle at center, #5b5f66, #1d1f21); display: block; text-decoration: none;\">\n"
                + "                                                                            <div style=\"box-sizing: content-box;\">\n"
                + "                                                                                <table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" width=\"100%\" background=\"https://img.youtube.com/vi/zAGVQLHvwOY/maxresdefault.jpg\" role=\"presentation\" style=\"mso-table-lspace: 0pt; mso-table-rspace: 0pt; box-sizing: content-box; background-image: url(https://img.youtube.com/vi/zAGVQLHvwOY/maxresdefault.jpg); background-size: cover; min-height: 158px; min-width: 280px;\">\n"
                + "                                                                                    <tr style=\"box-sizing: content-box;\">\n"
                + "                                                                                        <td width=\"25%\" style=\"box-sizing: content-box;\"><img src=\"https://app-rsrc.getbee.io/public/resources/multiparser/video_block/video_ratio_16-9.gif\" alt=\"ratio\" width=\"100%\" border=\"0\" style=\"display: block; box-sizing: content-box; height: auto; opacity: 0; visibility: hidden;\"></td>\n"
                + "                                                                                        <td width=\"50%\" align=\"center\" valign=\"middle\" style=\"box-sizing: content-box; vertical-align: middle;\"><img src=\"https://app-rsrc.getbee.io/public/resources/components/widgetBar/video-content-icon-sets/light/type-01.png\" width=\"60\" height=\"60\" style=\"display: block; height: auto; box-sizing: content-box;\"></td>\n"
                + "                                                                                        <td width=\"25%\" style=\"box-sizing: content-box;\">&#160;</td>\n"
                + "                                                                                    </tr>\n"
                + "                                                                                </table>\n"
                + "                                                                            </div>\n"
                + "                                                                        </a><!--<![endif]--><!--[if vml]>\n"
                + "<v:group xmlns:v=\"urn:schemas-microsoft-com:vml\" xmlns:w=\"urn:schemas-microsoft-com:office:word\" coordsize=\"600,338\" coordorigin=\"0,0\" href=\"" + linkmovie + " style=\"width:600px;height:338px;\">\n"
                + "<v:rect fill=\"t\" stroked=\"f\" style=\"position:absolute;width:600;height:338;\">\n"
                + "<v:fill src=\"https://img.youtube.com/vi/zAGVQLHvwOY/maxresdefault.jpg\" type=\"frame\"/>\n"
                + "</v:rect>\n"
                + "<v:oval fill=\"t\" strokecolor=\"#FFFFFF\" strokeweight=\"3px\" style=\"position:absolute;left:270;top:139;width:60;height:60\">\n"
                + "<v:fill color=\"#FFFFFF\" opacity=\"100%\" />\n"
                + "</v:oval>\n"
                + "<v:shape coordsize=\"24,32\" path=\"m,l,32,24,16,xe\" fillcolor=\"#000000\" stroked=\"f\" style=\"position:absolute;left:292;top:154;width:21;height:30;\" />\n"
                + "</v:group>\n"
                + "<![endif]--></div><!--[if (mso)|(IE)]></td></tr></table><![endif]-->\n"
                + "                                                                </td>\n"
                + "                                                            </tr>\n"
                + "                                                        </table>\n"
                + "                                                        <div class=\"spacer_block block-4\" style=\"height:65px;line-height:65px;font-size:1px;\">&#8202;</div>\n"
                + "                                                    </td>\n"
                + "                                                </tr>\n"
                + "                                            </tbody>\n"
                + "                                        </table>\n"
                + "                                    </td>\n"
                + "                                </tr>\n"
                + "                            </tbody>\n"
                + "                        </table>\n"
                + "                        <table class=\"row row-11\" align=\"center\" width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"mso-table-lspace: 0pt; mso-table-rspace: 0pt; background-color: #fff;\">\n"
                + "                            <tbody>\n"
                + "                                <tr>\n"
                + "                                    <td>\n"
                + "                                        <table class=\"row-content stack\" align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"mso-table-lspace: 0pt; mso-table-rspace: 0pt; color: #000; width: 640px; margin: 0 auto;\" width=\"640\">\n"
                + "                                            <tbody>\n"
                + "                                                <tr>\n"
                + "                                                    <td class=\"column column-1\" width=\"100%\" style=\"mso-table-lspace: 0pt; mso-table-rspace: 0pt; font-weight: 400; text-align: left; border-bottom: 3px solid #BF3100; padding-bottom: 25px; padding-top: 40px; vertical-align: top; border-top: 0px; border-right: 0px; border-left: 0px;\">\n"
                + "                                                        <table class=\"image_block block-1\" width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"mso-table-lspace: 0pt; mso-table-rspace: 0pt;\">\n"
                + "                                                            <tr>\n"
                + "                                                                <td class=\"pad\" style=\"width:100%;\">\n"
                + "                                                                    <div class=\"alignment\" align=\"center\" style=\"line-height:10px\"><img src=\"https://d1oco4z2z1fhwp.cloudfront.net/templates/default/626/Logo-light.png\" style=\"display: block; height: auto; border: 0; max-width: 184px; width: 100%;\" width=\"184\" alt=\"I'm an image\" title=\"I'm an image\"></div>\n"
                + "                                                                </td>\n"
                + "                                                            </tr>\n"
                + "                                                        </table>\n"
                + "                                                        <table class=\"paragraph_block block-2\" width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"mso-table-lspace: 0pt; mso-table-rspace: 0pt; word-break: break-word;\">\n"
                + "                                                            <tr>\n"
                + "                                                                <td class=\"pad\" style=\"padding-bottom:15px;padding-left:10px;padding-right:10px;padding-top:20px;\">\n"
                + "                                                                    <div style=\"color:#555555;font-family:'Helvetica Neue', Helvetica, Arial, sans-serif;font-size:14px;line-height:120%;text-align:center;mso-line-height-alt:16.8px;\">\n"
                + "                                                                        <p style=\"margin: 0; word-break: break-word;\"><span style=\"color:rgb(128,128,128);\">© Movie Stars Copyright 2020</span></p>\n"
                + "                                                                    </div>\n"
                + "                                                                </td>\n"
                + "                                                            </tr>\n"
                + "                                                        </table>\n"
                + "                                                        <table class=\"social_block block-3\" width=\"100%\" border=\"0\" cellpadding=\"10\" cellspacing=\"0\" role=\"presentation\" style=\"mso-table-lspace: 0pt; mso-table-rspace: 0pt;\">\n"
                + "                                                            <tr>\n"
                + "                                                                <td class=\"pad\">\n"
                + "                                                                    <div class=\"alignment\" align=\"center\">\n"
                + "                                                                        <table class=\"social-table\" width=\"210px\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"mso-table-lspace: 0pt; mso-table-rspace: 0pt; display: inline-block;\">\n"
                + "                                                                            <tr>\n"
                + "                                                                                <td style=\"padding:0 10px 0 0px;\"><a href=\"https://www.facebook.com\" target=\"_blank\"><img src=\"https://app-rsrc.getbee.io/public/resources/social-networks-icon-sets/circle-dark-gray/facebook@2x.png\" width=\"32\" height=\"32\" alt=\"Facebook\" title=\"Facebook\" style=\"display: block; height: auto; border: 0;\"></a></td>\n"
                + "                                                                                <td style=\"padding:0 10px 0 0px;\"><a href=\"https://www.twitter.com\" target=\"_blank\"><img src=\"https://app-rsrc.getbee.io/public/resources/social-networks-icon-sets/circle-dark-gray/twitter@2x.png\" width=\"32\" height=\"32\" alt=\"Twitter\" title=\"Twitter\" style=\"display: block; height: auto; border: 0;\"></a></td>\n"
                + "                                                                                <td style=\"padding:0 10px 0 0px;\"><a href=\"https://www.instagram.com\" target=\"_blank\"><img src=\"https://app-rsrc.getbee.io/public/resources/social-networks-icon-sets/circle-dark-gray/instagram@2x.png\" width=\"32\" height=\"32\" alt=\"Instagram\" title=\"Instagram\" style=\"display: block; height: auto; border: 0;\"></a></td>\n"
                + "                                                                                <td style=\"padding:0 10px 0 0px;\"><a href=\"https://www.linkedin.com\" target=\"_blank\"><img src=\"https://app-rsrc.getbee.io/public/resources/social-networks-icon-sets/circle-dark-gray/linkedin@2x.png\" width=\"32\" height=\"32\" alt=\"LinkedIn\" title=\"LinkedIn\" style=\"display: block; height: auto; border: 0;\"></a></td>\n"
                + "                                                                                <td style=\"padding:0 10px 0 0px;\"><a href=\"https://www.youtube.com\" target=\"_blank\"><img src=\"https://app-rsrc.getbee.io/public/resources/social-networks-icon-sets/circle-dark-gray/youtube@2x.png\" width=\"32\" height=\"32\" alt=\"YouTube\" title=\"YouTube\" style=\"display: block; height: auto; border: 0;\"></a></td>\n"
                + "                                                                            </tr>\n"
                + "                                                                        </table>\n"
                + "                                                                    </div>\n"
                + "                                                                </td>\n"
                + "                                                            </tr>\n"
                + "                                                        </table>\n"
                + "                                                    </td>\n"
                + "                                                </tr>\n"
                + "                                            </tbody>\n"
                + "                                        </table>\n"
                + "                                    </td>\n"
                + "                                </tr>\n"
                + "                            </tbody>\n"
                + "                        </table>\n"
                + "                        <table class=\"row row-12\" align=\"center\" width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"mso-table-lspace: 0pt; mso-table-rspace: 0pt; background-color: #ffffff;\">\n"
                + "                            <tbody>\n"
                + "                                <tr>\n"
                + "                                    <td>\n"
                + "                                        <table class=\"row-content stack\" align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"mso-table-lspace: 0pt; mso-table-rspace: 0pt; background-color: #fff; color: #000; width: 640px; margin: 0 auto;\" width=\"640\">\n"
                + "                                            <tbody>\n"
                + "                                                <tr>\n"
                + "                                                    <td class=\"column column-1\" width=\"100%\" style=\"mso-table-lspace: 0pt; mso-table-rspace: 0pt; font-weight: 400; text-align: left; padding-bottom: 5px; padding-top: 5px; vertical-align: top; border-top: 0px; border-right: 0px; border-bottom: 0px; border-left: 0px;\">\n"
                + "                                                        <table class=\"icons_block block-1\" width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"mso-table-lspace: 0pt; mso-table-rspace: 0pt;\">\n"
                + "                                                            <tr>\n"
                + "                                                                <td class=\"pad\" style=\"vertical-align: middle; color: #1e0e4b; font-family: 'Inter', sans-serif; font-size: 15px; padding-bottom: 5px; padding-top: 5px; text-align: center;\">\n"
                + "                                                                    <table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"mso-table-lspace: 0pt; mso-table-rspace: 0pt;\">\n"
                + "                                                                        <tr>\n"
                + "                                                                            <td class=\"alignment\" style=\"vertical-align: middle; text-align: center;\"><!--[if vml]><table align=\"left\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"display:inline-block;padding-left:0px;padding-right:0px;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\"><![endif]-->\n"
                + "                                                                                <!--[if !vml]><!-->\n"
                + "                                                                                <table class=\"icons-inner\" style=\"mso-table-lspace: 0pt; mso-table-rspace: 0pt; display: inline-block; margin-right: -4px; padding-left: 0px; padding-right: 0px;\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\"><!--<![endif]-->\n"
                + "                                                                                    <tr>\n"
                + "                                                                                        <td style=\"vertical-align: middle; text-align: center; padding-top: 5px; padding-bottom: 5px; padding-left: 5px; padding-right: 6px;\"><a href=\"http://designedwithbeefree.com/\" target=\"_blank\" style=\"text-decoration: none;\"><img class=\"icon\" alt=\"Beefree Logo\" src=\"https://d1oco4z2z1fhwp.cloudfront.net/assets/Beefree-logo.png\" height=\"32\" width=\"34\" align=\"center\" style=\"display: block; height: auto; margin: 0 auto; border: 0;\"></a></td>\n"
                + "                                                                                        <td style=\"font-family: 'Inter', sans-serif; font-size: 15px; color: #1e0e4b; vertical-align: middle; letter-spacing: undefined; text-align: center;\"><a href=\"http://designedwithbeefree.com/\" target=\"_blank\" style=\"color: #1e0e4b; text-decoration: none;\">Designed with Beefree</a></td>\n"
                + "                                                                                    </tr>\n"
                + "                                                                                </table>\n"
                + "                                                                            </td>\n"
                + "                                                                        </tr>\n"
                + "                                                                    </table>\n"
                + "                                                                </td>\n"
                + "                                                            </tr>\n"
                + "                                                        </table>\n"
                + "                                                    </td>\n"
                + "                                                </tr>\n"
                + "                                            </tbody>\n"
                + "                                        </table>\n"
                + "                                    </td>\n"
                + "                                </tr>\n"
                + "                            </tbody>\n"
                + "                        </table>\n"
                + "                    </td>\n"
                + "                </tr>\n"
                + "            </tbody>\n"
                + "        </table><!-- End -->\n"
                + "    </body>\n"
                + "\n"
                + "</html>";
        String emailSubject = "";
        for (int i = 0; i < u.size(); i++) {
            String email = u.get(i).getEmail();
            try {
                Message message = new MimeMessage(session);
                message.setFrom(new InternetAddress(usermail));
                message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
                message.setSubject(emailSubject);
                message.setText(content);
                message.setContent(content, "text/html");
                Transport.send(message);

            } catch (MessagingException e) {
            }
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
