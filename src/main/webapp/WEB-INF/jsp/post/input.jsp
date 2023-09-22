<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메모 입력</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>
<body>

	<div id="wrap" class="g-dark">
		<c:import url="/WEB-INF/jsp/include/header.jsp" />
		<section class="contents d-flex justify-content-center">
			<div class="post-layout my-5">
				<h2 class="text-center">메모입력</h2>
				
				<div class="d-flex">
					<label class="col-2">제목 : </label>
					<input type="text" class="form-control col-10" id="titleInput">
				</div>
				<textarea class="form-control mt-3" rows="7" id="contentInput"></textarea>
				<input type="file" class="mt-2">
				<div class="d-flex justify-content-between mt-4">
					<a href="/post/list-view" class="btn btn-secondary">목록으로</a>
					<button type="button" class="btn btn-secondary" id="saveBtn">저장</button>
				</div>
			</div>
		</section>
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	</div>



	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>        
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

	<script>
		$(document).ready(function() {
			$("#saveBtn").on("click", function() {
				let title = $("#titleInput").val();
				let content = $("#contentInput").val();
				
				if(title == ""){
					alert("제목을 입력하세요");
					return ;
				}
				
				if(content == ""){
					alert("내용을 입력하세요");
					return ;
				}
				
				$.ajax({
					type:"post"
					, url:"/post/create"
					, data:{"title":title, "content":content}
					, success:function(data){
						
						if(data.result == "success"){
							location.href="/post/list-view";
						}else {
							alert("메모 작성 실패");
						}
					}
					, error:function() {
						alert("메모 작성 에러");
					}
					
				})
				
			});
			
			
			
		});
	
	</script>

</body>
</html>