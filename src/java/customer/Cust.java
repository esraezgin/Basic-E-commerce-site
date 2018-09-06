package customer;

import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Cust extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */

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

    }

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

    public String selectedProductList(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String jdbc_driver = "com.mysql.cj.jdbc.Dyriver";
        String db_address = "jdbc:mysql://localhost:3306/proje18?useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
        String db_user = "root";
        String db_userpass = "";
        String outputHTML = "";

        PrintWriter out = response.getWriter();
  
        HttpSession session = request.getSession();
        try // once Db baglantimizi yapmamiz lazimki sorgu sql calistirabilelim
        {
            if (session.getAttribute("productList") != null) {          
                String sList = session.getAttribute("productList").toString();
                String[] sArray = sList.split(",");
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection(db_address, db_user, db_userpass);
                if (sArray.length > 0) {
                    int totalPrice = 0;

                    for (Object pro : sArray) {
                        if (pro.toString().trim() != "") {
                            String sql = "SELECT * FROM product where name ='" + pro + "'";
                            PreparedStatement ps = con.prepareStatement(sql);
                            ResultSet rs = ps.executeQuery(sql);
              

                            if (rs.next()) {
                                outputHTML += "<p><a href='#' class=''label label-info'>" + rs.getString("name") + "</a> <span class='price'>" + rs.getString("price") +" TL </span>";
                                totalPrice += Integer.parseInt(rs.getString("price"));
                            }
                        }
                    }
                    if (outputHTML.length() > 0) {
                        outputHTML += " <hr><p>Total <span class='price' style='color:black'><b>" + totalPrice + "</b> TL </span></p>";
                    } else {
                        outputHTML += " <hr><p>Total <span class='price' style='color:black'><b>No selected product. Please choose a lot ! :)</b></span></p>";
                    }

                    con.close();
                }
            } else {
            }
        } catch (ClassNotFoundException ex) {
            out.println("hata ClassNotFoundException");
        } catch (SQLException ex) {
            out.println("hata SQLException " + ex.getMessage());
        }

        return outputHTML;
    }

}
