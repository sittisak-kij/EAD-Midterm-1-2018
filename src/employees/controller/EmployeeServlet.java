package employees.controller;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class EmployeeServlet extends HttpServlet {

    public void init() throws ServletException {
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Deletion
        String cmd = request.getParameter("cmd");

        // Insertion
        String empNo = request.getParameter("empNo");
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String gender = request.getParameter("gender");
        String birthDate = request.getParameter("birthDate");
        String hireDate = request.getParameter("hireDate");


        // Set response content type
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        // Insertion
        out.println(empNo+"<br/>");
        out.println(firstName+"<br/>");
        out.println(lastName+"<br/>");
        out.println(gender+"<br/>");
        out.println(birthDate+"<br/>");
        out.println(hireDate+"<br/>");

        Context envContext = null;
        try {
            envContext = new InitialContext();
            out.println(envContext+"<br>");
            Context initContext = envContext;
            DataSource ds = (DataSource)envContext.lookup("java:/comp/env/jdbc/employees");
            Connection con = ds.getConnection();

            if (cmd != null && cmd.equals("d")) {
                // Delete a product
                String sql = "DELETE FROM employees WHERE emp_no = ?";
                PreparedStatement stmt = con.prepareStatement(sql);
                stmt.setInt(1, Integer.parseInt(id));
                stmt.execute();
            } else if (cmd != null && cmd.equals("update")) {
                String sql = "UPDATE employees SET birth_date = ?, first_name = ?, last_name = ?, gender = ?, hire_date = ? WHERE emp_no = ?";
                PreparedStatement stmt = connection.prepareStatement(sql);
                stmt.setString(1, birthDate);
                stmt.setString(2, firstName);
                stmt.setString(3, lastName);
                stmt.setString(4, gender);
                stmt.setString(5, hireDate);
                stmt.setInt(6, Integer.parseInt(empNo));
                stmt.execute();
            } else if (cmd == null) {
                // Insert a new product
                String sql = "insert into employees (emp_no, birth_date, first_name, last_name, gender, hire_date) values (?, ?, ?, ?, ?, ?)";
                PreparedStatement stmt = con.prepareStatement(sql);
                stmt.setInt(1, Integer.parseInt(empNo));
                stmt.setString(2, birthDate);
                stmt.setString(3, firstName);
                stmt.setString(4, lastName);
                stmt.setString(5, gender);
                stmt.setString(6, hireDate);
                stmt.execute();
            }
            response.sendRedirect("index.jsp");

        }  catch (SQLException | NamingException e) {
            e.printStackTrace();
            out.print(e);
        }
    }

    public void destroy() {
        // do nothing.
    }

}
