<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
</head>
<body>
	<div class="container-fluid">
	    <div class="row flex-nowrap">
		<jsp:include page="sideBar.jsp"/>
		<div class="col py-3" style="margin-left:17%;">
	            <iframe class="frame" style="height:100vh; width:100%;" src="/product/getListProduct"></iframe>
	            <!-- user -->
	            <iframe id="userListFrame" class="frame" style="height:100vh; width:100%; display:none;" src="/user/listUser/1"></iframe>
	            <iframe id="blackUserListFrame" class="frame" style="height:100vh; width:100%; display:none;" src="/user/listUser/1"></iframe>
	            
	            <!-- community -->
	            <iframe id="reportPostFrame" class="frame" style="height:100vh; width:100%; display:none;" src="/community/getListReportPost"></iframe>
	            
	            <!-- operation -->
	            <iframe id="noticeFrame" class="frame" style="height:100vh; width:100%; display:none;" src="/operation/getListOperation/1"></iframe>
	            <iframe id="eventFrame" class="frame" style="height:100vh; width:100%; display:none;" src="/operation/getListOperation/2"></iframe>
	            <iframe id="queryFrame" class="frame" style="height:100vh; width:100%; display:none;" src="/operation/getListOperation/3/0/0"></iframe>
	        </div>
	    </div>
	</div>
	
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js" integrity="sha256-xH4q8N0pEzrZMaRmd7gQVcTZiFei+HfRTBPJ1OGXC0k=" crossorigin="anonymous"></script>
<script type="text/javascript">
	$(()=>{
		//
		$("#notice").on("click",()=>{
			$(".frame").css("display","none");
			$("#noticeFrame").css("display","block");
		})
		$("#event").on("click",()=>{
			$(".frame").css("display","none");
			$("#eventFrame").css("display","block");
		})
		$("#query").on("click",()=>{
			$(".frame").css("display","none");
			$("#queryFrame").css("display","block");
		})
		
		// 유저
		$("#userList").on("click",()=>{
			$(".frame").css("display","none");
			$("#userListFrame").css("display","block");
		})
		$("#blackUserList").on("click",()=>{
			$(".frame").css("display","none");
			$("#blackUserListFrame").css("display","block");
		})
		
		// 커뮤니티
		$("#reportPost").on("click",()=>{
			$(".frame").css("display","none");
			$("#reportPostFrame").css("display","block");
		})
	})	
</script>
</body>
</html>