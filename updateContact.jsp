<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ page import="java.util.*,com.example.demo.Entities.* "   %>
     <%@ include file="navbar.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
.container h1{
text-align: center;
}
</style>
</head>

<body>

<%Contact contact=(Contact)request.getAttribute("contact"); %>

<!--  <form action="" method="post" enctype="multipart/form-data">
<input type="number" value="<%=contact.getPh_number() %>" name="ph_number"  />
<input type="text" value="<%=contact.getName() %>" name="name"/>
<input type="file"   name="image"/>
<h3>upload new image</h3>
<input type="text" value="<%=contact.getAddress() %>" name="address">
<button>update</button>
</form>-->



  <div class="container">
    <h1>Update Contact</h1>
    <form action="" method="post" enctype="multipart/form-data">
        <div class="mb-3">
            <label for="fullName" class="form-label" >Phone number</label>
            <input type="number" class="form-control" value="<%=contact.getPh_number() %>" name="ph_number"  />
            <div class="alert alert-danger" id="errorMessage" style="display: none;">
            </div>
        </div>
        <div class="mb-3">
            <label for="email" class="form-label">Contact Name</label>
         
            <input type="text" class="form-control" value="<%=contact.getName() %>" name="name"/>
            <div class="alert alert-danger" id="errorMessageEmail" style="display: none;"></div>
        </div>
        <div class="mb-3">
            <label for="image" class="form-label">Upload new Image</label>
            <input type="file" class="form-control" id="image" name="image" oninput="checkImage()" >
            <div class="alert alert-danger" id="errorMessageimg" style="display: none;"></div>
        </div>
        <div class="mb-3">
            <label for="Adress" class="form-label">Address</label>
           
            <input type="text" class="form-control" value="<%=contact.getAddress() %>" name="address">
        </div>
        
        <button type="submit" class="btn btn-primary" >Update</button>
    </form>
   
</div>



</body>
</html>