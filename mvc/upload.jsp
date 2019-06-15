<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
<!DOCTYPE html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>drag & drop</title>


<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<style>
* {
	margin: 0;
	padding: 0;
}

body {
	background-color: #37474F;
	font-family: Arial, sans-serif;
	padding: 15px;
}

.error {
	color: #B71C1C;
}

#userActions1, #userActions2, #userActions3, #userActions4 {
	padding-top: 5px;
	padding-bottom: 5px;
	display: table-cell;
	/* float: left;

				position: relative; */
	margin: auto;
	height: 237px;
	width: 200px;
	vertical-align: middle;
	text-align: center;
	color: #37474F;
	background-color: #FFFFFF;
	border: solid 2px #333333;
	border-radius: 10px;
}

#userActions1 input, #userActions2 input, #userActions3 input,
	#userActions4 input {
	width: 150px;
	margin: auto;
}

img {
	display: none;
	height :203px;
	width :192px;
}

/* .container { */
/* 	display: grid; */
/* 	grid-template-columns: 1fr 1fr; */
/* } */
.container#upContainer {
	display: grid;
	grid-template-columns: 1fr 1fr 1fr 1fr;
}

button {
	margin: 2px;
}
</style>
</head>
<%
 	String testNum = (String)request.getAttribute("testNum"); 
%>
<body>
<c:set var = "testNum" value="<%=testNum %>"/>
${testNum } <!-- 이건 잘나옴 --><br>
${imgNumArr[0] }<br>
${imgNumArr[1] }<br>
${imgNumArr[2] }<br>  <!-- 배열도 잘나옴 -->
	<!--onmousemove="checkPosition(event)" 	<div id="coordi"></div> -->
	<br>

	<form class="form-group" action="uploadView.do" method="post"
		enctype="multipart/form-data" id="imgform">
<!-- 		hidden -->
		
		<input type="hidden" name="testNum" value="${testNum}" >
		
		<div class="container">
			<div class="form-group ">
				<label for="email">원하시는 질문을 작성해 주세요^^ </label> <input type="text"
					class="form-control" name="question">    
			</div>
		</div>
		<div class="container" id="upContainer">


			<div class="dad" id="userActions1">
				<img id="imgPrime1" alt="uploaded image placeholder" />
				<p id='p1'>Drag &amp; Drop Image</p>
				<input type="file"  id="fileUpload1"
					name="upload1" />
			</div>

			<div class="dad" id="userActions2">
				<img id="imgPrime2" src="" alt="uploaded image placeholder" />
				<p id='p2'>Drag &amp; Drop Image</p>
				<input type="file"  id="fileUpload2"
					name="upload2" />
			</div>

			<div class="dad" id="userActions3">
				<img id="imgPrime3" src="" alt="uploaded image placeholder" />
				<p id='p2'>Drag &amp; Drop Image</p>
				<input type="file" id="fileUpload3"
					name="upload3" />
			</div>

			<div class="dad" id="userActions4">
				<img id="imgPrime4" src="" alt="uploaded image placeholder" />
				<p id='p2'>Drag &amp; Drop Image</p>
				<input type="file" id="fileUpload4"
					name="upload4" />
			</div>
	</form>
	</div>
	<br>
	<br>
	<br>
	<div class="container">
		<div class="row">
			<div class="col"></div>
			<div class="col"></div>
			<div class="col"></div>
			<div class="col"></div>
			<div class="col">
				<button type="submit" class="btn btn-primary" form="imgform">save</button>
				<button type="reset" class="btn btn-primary" form="imgform">reset</button>
			</div>
		</div>
	</div>


	<script type="text/javascript" src="/BoardEx/board/DAD1.js"></script>
</body>

</html>

<!-- <script>
		$(document).ready(function () {
			$('.dad').mouseover(function () {
				var userActions = $(this).id;
				var imagePrime = $(this).find("img")[0].id;
				var pTag = $(this).find("p")[0].id;
				var fileUpload = $(this).find("input")[0].id;
			});
		});
		   document.getElementById('p1').innerHTML = '';
	</script> -->