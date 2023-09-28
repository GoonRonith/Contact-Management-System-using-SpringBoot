<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="navbar.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<!--
<form action="loginProcess" method="post">
<input type="text" placeholder="Enter email id" name="email" />
<input type="text" placeholder="Enter name" name="name" />
<input type="password" placeholder="Enter password" name="password" />
<button>Login</button>
</form>
 -->



  <div class="container">
    <h1>Login Form</h1>
    <form action="loginProcess" method="post"  onsubmit="Login(event)">
        
        <div class="mb-3">
            <label for="email" class="form-label">Email</label>
            <input type="text" class="form-control" id="email" placeholder="johndoe@example.com" name="email" >
            <div class="alert alert-danger" id="errorMessageEmail" style="display: none;"></div>
        </div>
        <div class="mb-3">
            <label for="fullName" class="form-label" >Full Name</label>
            <input type="text" class="form-control" id="fullName" placeholder="John Doe" name="name"  >
            <div class="alert alert-danger" id="errorMessage" style="display: none;">
            </div>
        </div>
        <div class="mb-3">
            <label for="password" class="form-label">Password</label>
            <input type="password" class="form-control" id="pwd"  name="password" >
            <div class="alert alert-danger" id="errorMessagePwd" style="display: none;"></div>
        </div>

        <button type="submit" class="btn btn-primary" >Login</button>
    </form>
   
</div>







<% String LoginError=(String) request.getAttribute("LoginError"); 
   if(LoginError != null){
	   %>
	   <div class="error-message" id="errorMessage">
       <h3 class="text-center red"><%= LoginError %></h3>
   		</div>
	   <%
   }
   
   
   %>
   
   

</body>
</html>