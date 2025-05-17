<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="delivery.delivery" %>

<%
    String id = request.getParameter("id");
    String name = request.getParameter("name");
    String address = request.getParameter("address");
    String phone = request.getParameter("phone");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Delivery</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gradient-to-br from-gray-100 to-blue-100 min-h-screen flex items-center justify-center p-6">

    <div class="bg-white p-8 rounded-2xl shadow-xl w-full max-w-md">
        <h2 class="text-3xl font-extrabold mb-8 text-center text-blue-700">Update Delivery Details</h2>
        <form action="updatedelivery" method="post" class="space-y-6">
            <input type="hidden" name="id" value="<%= id %>"/>

            <div>
                <label class="block mb-2 font-semibold text-gray-800">Receiver Name</label>
                <input type="text" name="name" required
                       value="<%= name %>"
                       class="w-full px-5 py-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-4 focus:ring-blue-400 transition" />
            </div>

            <div>
                <label class="block mb-2 font-semibold text-gray-800">Address</label>
                <input type="text" name="address" required
                       value="<%= address %>"
                       class="w-full px-5 py-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-4 focus:ring-blue-400 transition" />
            </div>

            <div>
                <label class="block mb-2 font-semibold text-gray-800">Phone Number</label>
                <input type="text" name="phone" required pattern="[0-9]{10}"
                       value="<%= phone %>"
                       class="w-full px-5 py-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-4 focus:ring-blue-400 transition" />
            </div>

            <button type="submit"
                    class="w-full bg-green-600 hover:bg-green-700 text-white font-semibold py-3 rounded-lg shadow-md transition">
                Update
            </button>
        </form>
    </div>

</body>
</html>
