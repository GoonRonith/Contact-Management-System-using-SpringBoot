<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ include file="navbar.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registration</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
h1{
text-align: center;
}
</style>

</head>
<body>
<!-- <h1>Register yourself..</h1>
<form  action="register" method="post"  enctype="multipart/form-data">
<input type="text" placeholder="Enter Name" name="name"/>
<input type="email" placeholder="Enter Email" name="email"/>
<input type="file" name="image" >
<input type="text" placeholder="Enter Address" name="address"/>
<input type="password" placeholder="Set Password" name="password"/>
<button>Register</button>
</form> -->


  <div class="container">
    <h1>Registration Form</h1>
    <form action="register" method="post"  enctype="multipart/form-data" onsubmit="register(event)">
        <div class="mb-3">
            <label for="fullName" class="form-label" >Full Name</label>
            <input type="text" class="form-control" id="fullName" placeholder="John Doe" name="name" oninput="chcekName()" >
            <div class="alert alert-danger" id="errorMessage" style="display: none;">
            </div>
        </div>
        <div class="mb-3">
            <label for="email" class="form-label">Email</label>
            <input type="text" class="form-control" id="email" placeholder="johndoe@example.com" name="email" oninput="checkMail()">
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
        <div class="mb-3">
            <label for="password" class="form-label">Password</label>
            <input type="password" class="form-control" id="pwd"  name="password" oninput="checkPwd()">
            <div class="alert alert-danger" id="errorMessagePwd" style="display: none;"></div>
        </div>
        <div class="mb-3">
            <label for="confirmPassword" class="form-label">Confirm Password</label>
            <input type="password" class="form-control" id="confirmPassword" oninput="checkCfPwd()" >
            <div class="alert alert-danger" id="errorMessageCfPwd" style="display: none;"></div>
        </div>
        <button type="submit" class="btn btn-primary" >Register</button>
    </form>
    <div class="alert alert-success text-center" id="reg-done" style="display: none;"></div>
</div>

<script>







function register(event){
  
  /*
    console.log(chcekName()+" chcekName")
    console.log(checkImage()+" checkImage")
    console.log(checkMail()+" checkMail")
    console.log(checkPwd()+" checkPwd")
    console.log(checkCfPwd()+" checkcfffPwd")*/
    
    if(!chcekName() || !checkCfPwd() || !checkImage() || !checkMail() || !checkPwd() ) {
        console.log("stoop")
        event.preventDefault(); 
    }
    else {
         
        console.log("lets go")
   
}
}




function checkCfPwd(){
    let Cpwd=document.getElementById('confirmPassword').value
    let pwd=document.getElementById('pwd').value

    if(Cpwd=="") return false
    else if(Cpwd==pwd){
        document.getElementById("errorMessageCfPwd").style.display = "none"
        return true
    }
    
        document.getElementById("errorMessageCfPwd").style.display = "block"
        document.getElementById("errorMessageCfPwd").textContent = "Not Mached";
        return false
    
}



function checkPwd(){
   let pwd=document.getElementById('pwd').value
    let isPresentCaptial=false
    let isPresentSmall=false
    let isPresentDigit=false
    let isPresentSpecial=false
   
     if(pwd.length>=8 && pwd.length<=12){
       
        for(let i=0;i<pwd.length;i++){
           
            if(pwd[i]>='A' && pwd[i]<='Z') isPresentCaptial=true
            else if(pwd[i]>='a' && pwd[i]<='z') isPresentSmall=true
            else if(pwd[i]>=0 && pwd[i]<=9) isPresentDigit=true
            else isPresentSpecial=true
        }
        if(isPresentCaptial && isPresentSmall && isPresentDigit && isPresentSpecial){
            console.log("okkk")
            document.getElementById("errorMessagePwd").style.display = "none"
            return true
        } 
    }
    document.getElementById("errorMessagePwd").style.display = "block"
    document.getElementById("errorMessagePwd").textContent = "Password should contain 8 to 12 letters with combination of alphanumeric and a special character...";
    console.log("not okkk")
    return false


}


function checkImage(){
    let imgSize=document.getElementById('image')
  
    if(imgSize.files.length === 0) return false
    else if(imgSize.files[0].size>1048576){
        document.getElementById("errorMessageimg").style.display = "block"
        document.getElementById("errorMessageimg").textContent = "Image size should be less than or equal to 1mb";
        return false
    }
    
        console.log(imgSize.files[0].size)
        document.getElementById("errorMessageimg").style.display = "none"
        return true
}




 function chcekName() {
    let name=document.getElementById('fullName').value
    // console.log(name=="")
    var containsOnlyLetters = true;
    // console.log(name.length)
    for (var i = 0; i < name.length; i++) {
                var char = name.charAt(i);
                // Check if the character is not a letter
                if (!isLetter(char)) {
                    containsOnlyLetters = false;
                    break; // Exit the loop early if a non-letter character is found
                }
                else{
                    containsOnlyLetters=true
                }
            }

            if (!containsOnlyLetters) {
         
                document.getElementById("errorMessage").style.display = "block"
                document.getElementById("errorMessage").textContent = "Input should contains only letters...";
                return false
            }

            else if(containsOnlyLetters && name=="") return false
            
                document.getElementById("errorMessage").style.display = "none"
                return true
            
 }

 function isLetter(char) {
    if(char==" ") return true
            else if(char>=0 && char<=9){
                console.log(char+"y")
                return false
            } 
            return true
        }

        function checkMail(){
            let name=document.getElementById('email').value
            var flag = true;
            for (var i = 0; i < name.length; i++) {
                var char = name.charAt(i);
                // Check if the character is not a letter
                if (char!='@') {
                    flag = false;
                     
                }
                else{
                    flag=true
                    break// Exit the loop early if a non-letter character is found
                }
            }

            if(name=="") return false
            else if (!flag) {
         
         document.getElementById("errorMessageEmail").style.display = "block"
         document.getElementById("errorMessageEmail").textContent = "Email shoild contain @";
         return false
     }
    
         document.getElementById("errorMessageEmail").style.display = "none"
         return true
     
        }


        
     // Get a reference to the message element
        let messageElement = document.getElementById('reg-done');

        // Function to remove the message element from the DOM
        function removeMessage() {
          messageElement.style.display = 'none';
        }

        // Set a timeout to call the removeMessage function after 5 seconds (5000 milliseconds)
        setTimeout(removeMessage, 5000);



</script>









<% String alredayRegisteredError=(String) request.getAttribute("alredayRegisteredError"); 
String msg=(String) request.getAttribute("msg");
   if(msg != null){
	   %>
	  
   		<script>
	  //let messageElement = document.getElementById('reg-done');
	  messageElement.style.display="block"
	  messageElement.textContent='<%= msg %>'
		  
	  </script>
   		<%} %>
   		
  <% 
   if(alredayRegisteredError != null){
	   %>
	   <div class="error-message" id="errorMessage">
       <h3 class="text-center red"><%= alredayRegisteredError %></h3>
   		</div>
	   <%
   }
   %>
	  


   
 
   

</body>
</html>