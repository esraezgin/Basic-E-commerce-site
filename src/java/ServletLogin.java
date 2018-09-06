
import java.beans.Statement;
import java.io.IOException;
import java.io.PrintWriter;
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

/**
 *
 * @author esrae
 */
public class ServletLogin extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ServletLogin</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ServletLogin at " + request.getContextPath() + "</h1>");
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
        processRequest(request, response);
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

        // formda methodumuzu post yaptigimiz icin action oalrak verdigimiz servlette yani bu servlette dopost methodunu kullanicaz

        //forndab gelen kullanici ve adina burada erisiyoruz
        String uname = request.getParameter("uname");
        String psw = request.getParameter("psw");

        //simdi bakalim bunlar db@de varmi varsa giris yapicaz yoksa giris olmayacak
        // once Db baglantimizi yapmamiz lazimki sorgu sql calistirabilelim
        String jdbc_driver = "com.mysql.cj.jdbc.Driver";
        String db_address = "jdbc:mysql://localhost:3306/proje18?useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
        String db_user = "root";
        String db_userpass = "";
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(db_address, db_user, db_userpass);
            int result = 0;

            String sql = "SELECT * FROM user WHERE username = ? AND password = ?";
            PreparedStatement ps=ps = con.prepareStatement(sql);
            ps.setString(1, uname);
            ps.setString(2, psw);
            ResultSet rs = ps.executeQuery();
            if (rs.last()) {
                result = rs.getRow();
            }
            if (result == 0) { // kullanici adi sifre yok yada yanlis

                try (PrintWriter out = response.getWriter()) {
                    /* TODO output your page here. You may use following sample code. */
                    out.println("Yanlis kullanici adi ve sifre");
                }
                con.close();
            } else {
                HttpSession session = request.getSession();
                //bak şimdi alt satırda session oluşuyor eğer giriş başarılıysa
                //biz bu sessionu global bi değişken gibi düşün her yerde bakabiliriz varmı yokmu varsa içinde ne var diye
                //eğer adam login olabildiyse bu var
                //şimdi bunu lazım olan sayfalarda kontrol edicez eğer var bazı aksiyonlar yapıcaz
                //mesela adam giriş yaptıysa o anasayfada Login yazmayacak artık Çıkış yap yazacaz mesela değil mi?
                session.setAttribute("uname", uname);
                //giris yaptiktan sonra gidilecek sayfa
                request.getRequestDispatcher("home.jsp").forward(request, response);
            }

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ServletLogin.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ServletLogin.class.getName()).log(Level.SEVERE, null, ex);
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
