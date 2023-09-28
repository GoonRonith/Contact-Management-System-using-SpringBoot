<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="navbar.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<style>
#rect-img{
 			width: 100%;
            height: 500px;
            position: relative;
            overflow: hidden;
}

#reg-div{
width: 100%; /* Make the container 100% of its parent's width */
  max-width: 400px; /* Set a maximum width for the container, adjust as needed */
  height: auto; /* Allow the height to adjust based on the aspect ratio of the image */
   /* Optional: Add a border to the container */
  text-align: center; /* Center the image horizontally */
   display: flex;
            justify-content: center; /* Center horizontally */
            align-items: center;
             font-family: Arial, sans-serif;
    font-size: 35px;
    font-weight: bold;
    font-style: italic;
    color: #333; /* Dark gray color */
    letter-spacing: 2px;
    word-spacing: 5px;
    text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5); /* Horizontal offset, vertical offset, blur radius, shadow color */
      line-height: 1.5; /* Line height as a multiplier of the font size */
       text-transform: uppercase; /* Convert text to uppercase */
}

#reg-img{
  width: 90%; /* Make the image take up the full width of the container */
  height: auto; /* Allow the height to adjust proportionally */
}

#img{
   position:absolute;
            width: 100%;
            height: 100%;
            z-index: 11;
            transition: opacity 1s ease-in-out;
}

#log-img{
   position:absolute;
            width: 15%;
           
            z-index: 11;
            transition: opacity 1s ease-in-out;
}

.container{
margin: 0;
            padding: 0;
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
}










       

/* Style for the main content */

</style>
</head>
<body>
<div id="rect-img">
<img id="img" src="home2.jpg">
</div>

<div class="container">

<div id="reg-div">
<a href="login"><img id="reg-img" src="login4.jpg"></a>
</div>



<div id="reg-div">
<span>Smart Contact Management System</span>
</div>




   
<div id="reg-div">
<a href="register"><img id="reg-img" src="reg.png"></a>
</div>


</div>




    
    
   
  












<script>




setInterval(()=>{
	  for (let i = 1; i < 3; i++) {
		    setTimeout(function() {
		    	var imageElement=document.getElementById("img")
				imageElement.src = "home"+i+".jpg";
				var divContainer = document.getElementById("rect-img");
				divContainer.appendChild(imageElement);
		    }, i * 3000); // Delay for i seconds (1000 milliseconds = 1 second)
		  }
},

4000)
		
		
	
	
	
	

</script>
</body>
</html>