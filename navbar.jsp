<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
 /* Basic styles for the navbar */
 body {
    margin: 0;
    padding: 0;
}
        .n {
            background-color: #333;
            overflow: hidden;
        }

        .n a {
           float: left;
    font-size: 25px;
    color: white;
    text-align: center;
    padding: 20px 16px;
    text-decoration: none;
        }
        
         .profile-image {
            float: right;
            margin-right: 20px;
            margin-top: 8px;
            border-radius: 50%;
            width: 50px;
            height: 60px;
            object-fit: cover;
        }
        
                .n span {
 			float: right;
            margin-right: 20px;
            margin-top: 8px;
            border-radius: 50%;
            width: 50px;
            height: 60px;
            object-fit: cover;
             font-family: Arial, sans-serif;
    font-size: 16px;
    font-weight: bold;
    font-style: italic;
        }

        .n a:hover {
            background-color: #ddd;
            color: black;
        }
        
        .n span:hover {
            
            color: black;
        }

        /* Style the profile image */
       

        /* Clear floats after the navbar */
        .n:after {
            content: "";
            display: table;
            clear: both;
        }

        /* Media query for responsive design */
        @media screen and (max-width: 600px) {
            .n a {
                float: none;
                display: block;
                text-align: left;
                margin-left: 600px;
            }
            
            

            .n {
                overflow: hidden;
            }
        }
</style>
</head>
<body>
<div class="n">
    <a href="/">Home</a>
    <a href="#about">About</a>
    <a href="#services">Services</a>
    <a href="#contact">Contact</a>
  	<span>Created By Ronith</span>
    <img src="/creater.jpg" alt="Profile Image" class="profile-image">
</div>
</body>
</html>