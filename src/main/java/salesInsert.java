import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.DriverManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class salesInsert
 */
@WebServlet("/salesInsert")
public class salesInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public salesInsert() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  request.setCharacterEncoding("utf-8");
	      response.setContentType("text/html; charset=utf-8");
	      Connection conn = null;
	      PreparedStatement pstmt = null;

//	         System.out.println(request.getParameter("code")+","+request.getParameter("name")+","+request.getParameter("price"));
	      String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	      String userid = "ora_user";
	      String passcode = "human123";
	      String sql = "insert into cafe_sales values(seq_cafe_sales.nextval,?,?,?,?,sysdate)"; // 주소창에 값을 넣어서 insert하도록 해주는 코드.
	      try {
				Class.forName("oracle.jdbc.driver.OracleDriver");
				conn = DriverManager.getConnection(url, userid, passcode);
				pstmt = conn.prepareStatement(sql);
				System.out.println(request.getParameter("mobile") + "," + request.getParameter("menu_code") + ","
						+ request.getParameter("qty") + "," + request.getParameter("total"));
				String sql1="select code from menu where name='"+request.getParameter("menu_code")+"'";
				Statement stmt=conn.createStatement();
				ResultSet rs=stmt.executeQuery(sql1);
				rs.next();
				int c=rs.getInt("code");
				
//				int c=Integer.parseInt(request.getParameter("menu_code"));
			
				pstmt.setString(1, request.getParameter("mobile"));
//				pstmt.setInt(2, Integer.parseInt(request.getParameter("menu_code")));
				pstmt.setInt(2, c);
				pstmt.setInt(3, Integer.parseInt(request.getParameter("qty")));
				pstmt.setInt(4, Integer.parseInt(request.getParameter("total")));

				pstmt.executeUpdate();
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if (pstmt != null)
						pstmt.close();
					if (conn != null)
						pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}

			}

		}


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
