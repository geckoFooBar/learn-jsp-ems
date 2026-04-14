<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Employee Dashboard</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-slate-100 text-slate-800 font-sans p-8">

    <div class="max-w-5xl mx-auto bg-white p-8 rounded-xl shadow-lg border border-slate-200">
        <h1 class="text-3xl font-bold mb-8 text-slate-900 border-b pb-4">Change it to your Company name</h1>

        <div class="mb-10 bg-slate-50 p-6 rounded-lg border border-slate-200 shadow-sm">
            <h2 class="text-xl font-semibold mb-4 text-slate-700">Add New Employee</h2>
            
            <form action="employees" method="POST" class="flex gap-4 items-end">
                <input type="hidden" name="action" value="add">
                
                <div class="flex-1">
                    <label class="block text-sm font-semibold text-slate-600 mb-1">Full Name</label>
                    <input type="text" name="employeeName" required 
                           class="w-full border border-slate-300 rounded-md px-4 py-2 focus:outline-none focus:ring-2 focus:blue-500">
                </div>
                <div class="flex-1">
                    <label class="block text-sm font-semibold text-slate-600 mb-1">Department</label>
                    <input type="text" name="employeeDept" required 
                           class="w-full border border-slate-300 rounded-md px-4 py-2 focus:outline-none focus:ring-2 focus:blue-500">
                </div>
                <button type="submit" class="bg-blue-600 text-white font-semibold px-6 py-2 rounded-md hover:bg-blue-700 transition">
                    + Add Record
                </button>
            </form>
        </div>

        <h2 class="text-xl font-semibold mb-4 text-slate-700">Current Roster</h2>
        <div class="overflow-x-auto rounded-lg border border-slate-200">
            <table class="w-full text-left border-collapse">
                <thead>
                    <tr class="bg-slate-800 text-white text-sm uppercase tracking-wider">
                        <th class="py-4 px-6 font-medium">ID</th>
                        <th class="py-4 px-6 font-medium">Name</th>
                        <th class="py-4 px-6 font-medium">Department</th>
                        <th class="py-4 px-6 font-medium text-center">Actions</th> </tr>
                </thead>
                <tbody class="divide-y divide-slate-200">
                    <c:forEach var="employee" items="${empData}">
                        <tr class="hover:bg-slate-50 transition duration-150">
                            <td class="py-3 px-6 text-slate-500">${employee.id}</td>
                            <td class="py-3 px-6 font-medium text-slate-900">${employee.name}</td>
                            <td class="py-3 px-6 text-slate-600">${employee.department}</td>
                            
                            <td class="py-3 px-6 text-center">
                                <form action="employees" method="POST" class="inline-block" onsubmit="return confirm('Are you sure you want to delete this employee?');">
                                    <input type="hidden" name="action" value="delete">
                                    <input type="hidden" name="empId" value="${employee.id}">
                                    
                                    <button type="submit" class="text-red-500 hover:text-red-700 font-semibold text-sm px-3 py-1 rounded border border-red-200 hover:bg-red-50 transition">
                                        Delete
                                    </button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

</body>
</html>