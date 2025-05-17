package delivery;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/UpdateDelivery")
public class UpdateDelivery extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String address = request.getParameter("address");
		String phone = request.getParameter("phone");
		
		int did = Integer.parseInt(id);
		
		boolean isTrue = DBUtil.updatedelivery(did, name, address, phone);
		
		if(isTrue == true)
		{
			 response.sendRedirect("deliveryForm.jsp");
		}
		else 
		{
            response.getWriter().println("Failed to Update delivery details.");
        }
	}

}
