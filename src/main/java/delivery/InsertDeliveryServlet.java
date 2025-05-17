package delivery;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/InsertDeliveryServlet")
public class InsertDeliveryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		 	String name = request.getParameter("name");
	        String address = request.getParameter("address");
	        String phone = request.getParameter("phone");

	        // Insert data using DBUtil
	        boolean isSuccess = DBUtil.adddelivery(name, address, phone);

	        if (isSuccess) {
	            response.sendRedirect("deliveryForm.jsp");
	        } else {
	            response.getWriter().println("Failed to add delivery details.");
	        }
	}

}
