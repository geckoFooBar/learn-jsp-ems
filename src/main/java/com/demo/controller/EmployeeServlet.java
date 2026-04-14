package com.demo.controller;

import com.demo.model.Employee;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/employees")
public class EmployeeServlet extends HttpServlet {
	
	private static final String dbUrl = "DB_URL";
	private static final String dbUser = "USER";
	private static final String dbPassword = "PASSWORD";

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        List<Employee> employeeList = new ArrayList<>();
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
                 Statement stmt = conn.createStatement();
                 ResultSet rs = stmt.executeQuery("SELECT id, name, department FROM employees")) {
                
                while (rs.next()) {
                    // Create an Employee object and add it to the list
                    employeeList.add(new Employee(rs.getInt("id"), rs.getString("name"), rs.getString("department")));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        System.out.println("DEBUG: I found " + employeeList.size() + " employees in the database!");
        // 3. Attach the data list to the Request object so the JSP can see it
        request.setAttribute("empData", employeeList);

        // 4. Forward the request to the JSP page to display the HTML
        request.getRequestDispatcher("employees.jsp").forward(request, response);
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword)) {
                
            	if("add".equals(action)) {
        			String newName = request.getParameter("employeeName");
                    String newDept = request.getParameter("employeeDept");
                    
                    String sql = "INSERT INTO employees (name, department) VALUES (?, ?)";
                    
                        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                            pstmt.setString(1, newName);
                            pstmt.setString(2, newDept);
                            pstmt.executeUpdate();
                        }
            	} else if ("delete".equals(action)) {
            		
            		int empIdToDelete = Integer.parseInt(request.getParameter("empId"));
            		String sql = "DELETE FROM employees where id = ?";
            		
            		try(PreparedStatement pstmt = conn.prepareStatement(sql)) {
            			pstmt.setInt(1, empIdToDelete);
            			pstmt.executeUpdate();
            		}
            		
            	}
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        response.sendRedirect("employees");
    }
}