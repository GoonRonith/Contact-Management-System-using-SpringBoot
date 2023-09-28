<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*,com.example.demo.Entities.* "   %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"> -->
  
  <link rel="stylesheet" href="/css/style.css">

</head>
<body>
  <div class="container">
    <div class="sidebar">
      <div class="dash_img">
        <i class="fa fa-dashcube" aria-hidden="true"></i>
        <span>Dashbord</span>
  
      </div>
      <div class="addContact"><a href="/dashbord/addContact"><i class="fa fa-user-plus" aria-hidden="true"></i><span>Add</span></a></div>
      <div class="logout"><a href="/logout"><i class="fa fa-sign-out" aria-hidden="true"></i><span>Logout</span></a></div>
    </div>
    <div class="upper-cont" id="upper-cont">
  <div class="upper">
    <div class="searchbar">
      <i class="fa fa-search" aria-hidden="true"></i>
      <input type="number" id="inp" placeholder="search contact" oninput="getContact()">
    </div>
    <div class="profile-img">
      <img src="data:image/jpeg;base64,${user_image}">
    </div>
  </div>
  <div id="no-cnt"><span id="no-contact"></span></div>
  <div class="contacts" id="cnt">
  
<table width='100%' border="4" class="table table-striped table-bordered table-hover" id="table2">
<tr>
<th>Contact name</th>
<th>Contact Number</th>
<th>photo</th>
<th>Address</th>
<th>Operation</th>
</tr>
<% List<Contact> Contacts=(List<Contact>)request.getAttribute("contacts"); %>

<% 
if(Contacts.size()==0){
	%>
	<script>
	let span=document.getElementById('no-contact');
	var table = document.getElementById("table2");
	table.style.display = "none";
	span.innerText="No Contacts are found"
	</script>
	<% 
}
else{
	%>
	<script>
	let div=document.getElementById('no-cnt');
	div.style.display = "none";
	
	</script>
	<% 
	for(Contact contact:Contacts){
		%>
		<tr>
		<td><%= contact.getName() %></td>
		
		<td><%= contact.getPh_number() %></td>
		<td> <img class="image-class" src="data:image/jpeg;base64,<%=Base64.getEncoder().encodeToString(contact.getImageData()) %> " alt="User Image" /></td>
		
		<td><%= contact.getAddress() %></td>
		<td><a href="/dashbord/delete/<%= contact.getPh_number() %>"><button type="submit" class="red-button">Delete</button></a>
		<a href="/dashbord/update/<%=contact.getPh_number()  %>"><button type="submit" class="green-button">Update</button></a></td>
		</tr>
		<% 
	}
}
		%>


</table >

  </div> 
  
  <div class="div_search" id="div_after" style="display: none">
  <table id="table"  width='100%' border="4">
  <tr>
<th>Contact name</th>
<th>Contact Number</th>
<th>photo</th>
<th>Address</th>
<th>Operation</th>
</tr>
  </table>
  </div>
</div>

</div>

<script>
function getContact(){
  let d=document.getElementById('cnt')
  let nd=document.getElementById('div_after')
  let inp=document.getElementById('inp').value
  if(inp.length==0) {
	  d.style.display='block'
		nd.style.display='none';
  }
  else {
	  d.style.display='none';
	  nd.style.display='block';
	  fetch("/dashbord/"+inp).then(res=>res.json()).then((data)=>{
		  console.log(data)
		  
		  if(data.length==0){
			  console.log("5555")
			  let div=document.getElementById('no-cnt');
				div.style.display = "flex";
				
			  let span=document.getElementById('no-contact');
				let table = document.getElementById("table");
				table.style.display = "none";
				span.innerText="No Contacts are found"
		  }
		  else{
			  console.log("999")
			  
			  let tableElement=document.getElementById('table')
			  tableElement.style.display ="table"
			  
				
	
			  let div=document.getElementById('no-cnt');
				div.style.display = "none";
			  
			  let divElement=document.getElementById('div_after')
			  //let tableElement=document.getElementById('table')
			  
			  var rowCount = tableElement.rows.length;
			  
			  for (var i = rowCount - 1; i > 0; i--) {
				  tableElement.deleteRow(i);
		        }
			  
			  
			
			const headerRow = document.createElement("tr");
			 
			  
			  //add dynamic data to table
			  for (var i = 0; i < data.length; i++) { 
	            var row = tableElement.insertRow(i+1);

	            for (var j = 0; j < 5; j++) { 
	                var cell = row.insertCell(j);
		            if(j==0){
		            	cell.textContent =data[i].name ;
		            }
		            else if(j==1){
		            	cell.textContent = data[i].ph_number;
		            }
		            else if(j==2){
		            	const image = document.createElement("img");
		            
		                image.setAttribute("src", "data:image/jpeg;base64,"+data[i].imageData);
		                image.setAttribute("alt", "User Image");
		                cell.appendChild(image);
		            }
		            
		            else if(j==3){
		            	cell.textContent = data[i].address;
		            }
		            else{
		            	const anchor1 = document.createElement("a");
		            	 anchor1.setAttribute("href", "/dashbord/delete/"+data[i].ph_number);
		            	const button1 = document.createElement("button");
		            	button1.className="red-button";
		            	button1.textContent = "Delete";
		            	
		            	const anchor2 = document.createElement("a");
		            	 anchor2.setAttribute("href", "/dashbord/update/"+data[i].ph_number);
		            	const button2 = document.createElement("button");
		            	button2.className="green-button";
		            	button2.textContent = "Update";
		            	anchor1.appendChild(button1);
		            	anchor2.appendChild(button2);
		            	 cell.appendChild(anchor1);
		            	 cell.appendChild(anchor2);
		            }
	            }
	        }
			  
			  divElement.appendChild(tableElement);
			  let parent=document.getElementById('upper-cont');
			  parent.appendChild(divElement);

		  }
		  
		  		  
		  
	  })
  }
}
</script>

</body>
</html>