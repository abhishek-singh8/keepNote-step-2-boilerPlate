<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
	<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
	
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>KeepNote</title>
</head>
<body>
	<!-- Create a form which will have text boxes for Note ID, title, content and status along with a Send 
		 button. Handle errors like empty fields -->
	<div class="form-group form">
		<form action='add' method="post">
			<label>Note Title:</label>
			<input type="text" id="noteTitle" name="noteTitle" placeholder="note title" class="form-control"/>
			<br/>
			<label>Note Content:</label>
			<input type="text" id="noteContent" name="noteContent" placeholder="note content" class="form-control"/>
			<br/>
			<label>Note Status:</label>
			<select name="noteStatus">
	            <option value="active">active</option>
	            <option value="inactive">inactive</option>
	        </select>
			<br/>
			<button type="submit" class="form-control">Submit</button>
		</form>
	</div>
	<c:if test="${!errorMessage.isEmpty()}">
		<p style= "color:blue;">${errorMessage}</p>
	</c:if>

  <table border="2" width="70%" cellpadding="2">  
<tr><th>NoteId</th><th>Title</th><th>Content</th><th>Status</th><th>Creation Time</th><th>DeleteButton</th><th>UpdateButton</th></tr>  
  <c:forEach var="note" items="${noteList}">  
  <tr>  
  <td>${note.noteId}</td>  
  <td>${note.noteTitle}</td>  
  <td>${note.noteContent}</td>  
  <td>${note.noteStatus}</td>  
  <td>${note.createdAt }</td>
  <td><a href="delete?noteId=${note.noteId}" ><input type="button" value="Delete"></a></td>
  <td><a href="updateNote?noteId=${note.noteId}" ><input type="button" value="Update"></a></td>
  
 
  </tr>  
  </c:forEach>  
  </table> 
</body>
</html>