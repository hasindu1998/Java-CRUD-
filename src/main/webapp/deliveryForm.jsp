<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delivery Dashboard</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
</head>
<body class="bg-gradient-to-br from-gray-100 to-blue-100 min-h-screen flex flex-col items-center justify-center p-6">

<c:if test="${empty deliveryList}">
  <c:url var="redirectUrl" value="GetAllDeliveriesServlet" />
    <script>
        window.location.href = "${redirectUrl}";
    </script>
</c:if>

    <div class="text-center mb-10">
        <h1 class="text-4xl font-extrabold text-blue-800 mb-2">Delivery Dashboard</h1>
        <p class="text-gray-600">Manage and track all your deliveries from one place</p>
    </div>

    <div class="bg-white p-8 rounded-2xl shadow-xl w-full max-w-lg mb-10">
        <h2 class="text-2xl font-semibold mb-6 text-center text-blue-700">Add Delivery Details</h2>
        <form action="AddDelivery" method="post" class="space-y-4">
            <div>
                <label class="block mb-1 font-medium text-gray-700">Receiver Name</label>
                <input type="text" name="name" required class="w-full px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500">
            </div>
            <div>
                <label class="block mb-1 font-medium text-gray-700">Address</label>
                <input type="text" name="address" required class="w-full px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500">
            </div>
            <div>
                <label class="block mb-1 font-medium text-gray-700">Phone Number</label>
                <input type="text" name="phone" required pattern="[0-9]{10}" title="Enter a valid 10-digit phone number" class="w-full px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500">
            </div>
            <button type="submit" class="w-full bg-blue-600 text-white py-2 rounded-lg hover:bg-blue-700 transition">Submit</button>
        </form>
    </div>

    <div class="w-full max-w-6xl">
        <h2 class="text-2xl font-semibold mb-4 text-center text-blue-700">All Deliveries</h2>
        <div class="overflow-x-auto">
            <table class="w-full table-auto border-collapse border border-gray-300">
                <thead>
                    <tr class="bg-blue-200 text-blue-900">
                        <th class="border border-gray-300 px-4 py-2">ID</th>
                        <th class="border border-gray-300 px-4 py-2">Name</th>
                        <th class="border border-gray-300 px-4 py-2">Address</th>
                        <th class="border border-gray-300 px-4 py-2">Phone</th>
                        <th class="border border-gray-300 px-4 py-2">Edit</th>
                        <th class="border border-gray-300 px-4 py-2">Delete</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="d" items="${deliveryList}">
                        <tr class="bg-white hover:bg-gray-50">
                            <td class="border border-gray-300 px-4 py-2 text-center">${d.id}</td>
                            <td class="border border-gray-300 px-4 py-2 text-center">${d.name}</td>
                            <td class="border border-gray-300 px-4 py-2 text-center">${d.address}</td>
                            <td class="border border-gray-300 px-4 py-2 text-center">${d.phone}</td>
                            <td class="border border-gray-300 px-4 py-2 text-center">
                                <a href="updatedelivery.jsp?id=${d.id}&name=${d.name}&address=${d.address}&phone=${d.phone}" class="bg-blue-500 hover:bg-blue-600 text-white px-4 py-1 rounded-lg transition">
                                    <i class="fas fa-edit"></i> Edit
                                </a>
                            </td>
                            <td class="border border-gray-300 px-4 py-2 text-center">
                                <a href="DeleteDelivery?id=${d.id}" class="bg-red-500 hover:bg-red-600 text-white px-4 py-1 rounded-lg transition">
                                    <i class="fas fa-trash-alt"></i> Delete
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

</body>
</html>
