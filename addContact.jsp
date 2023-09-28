<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="navbar.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Contact</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
.container h1{
text-align: center;
}
</style>
</head>
<body>

<!-- 
<form action="addContact" method="post"  enctype="multipart/form-data">
<input type="number" placeholder="Enter Contact Number" name="ph_number"/>
<input type="text" placeholder="Enter Contact Name" name="name"/>
<input type="file" name="image"/>
<input type="text" placeholder="Enter address" name="address">
<button>Add</button>
</form>
 -->




  <div class="container">
    <h1>Add Contact</h1>
    <form action="addContact" method="post"  enctype="multipart/form-data" >
        <div class="mb-3">
            <label for="fullName" class="form-label" >Phone number</label>
            <input type="number" class="form-control" placeholder="Enter Contact Number" name="ph_number"/>
            <div class="alert alert-danger" id="errorMessage" style="display: none;">
            </div>
        </div>
        <div class="mb-3">
            <label for="email" class="form-label">Contact Name</label>
            <input type="text"  class="form-control" placeholder="Enter Contact Name" name="name"/>
            <div class="alert alert-danger" id="errorMessageEmail" style="display: none;"></div>
        </div>
        <div class="mb-3">
            <label for="image" class="form-label">Image</label>
            <input type="file" class="form-control" id="image" name="image" oninput="checkImage()" >
            <div class="alert alert-danger" id="errorMessageimg" style="display: none;"></div>
        </div>
        <div class="mb-3">
            <label for="Adress" class="form-label">Address</label>
            <input type="search" class="form-control" id="password" name="address" >
        </div>
        
        <button type="submit" class="btn btn-primary" >Add</button>
    </form>
   
</div>

</body>
</html>