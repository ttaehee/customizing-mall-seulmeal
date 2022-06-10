<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세</title>

</head>

<body>
	<jsp:include page="../layer/header.jsp"></jsp:include>


	<!-- 댓글 작성 -->
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				댓글 : <input id="comment_content" name="content" />
			</div>
			<div class="col-md-12">
				layer : <input id="layer" name="layer" />
			</div>
		</div>
	
		<div style="display:flex; justify-content: space-between;">
			<div>
				<button id="insertBtn" type="button" class="btn btn-primary">
					등록
				</button>
				<button id="updateBtn" type="button" class="btn btn-primary">
					수정
				</button>
				<button id="deleteBtn" type="button" class="btn btn-primary">
					삭제
				</button>
			</div>
		</div>	
	</div>



	<!-- table : 댓글 -->
			<table width="100%" border="0" cellspacing="0" cellpadding="0"
				style="margin-top: 10px;">

				<tr>
					<td class="ct_list_b" width="100">No</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b" width="150">상품명</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b" width="150">가격</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b">등록일</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b">현재상태</td>
				</tr>
				<tr>
					<td colspan="11" bgcolor="808285" height="1"></td>
				</tr>
				
				<tr>
					<td colspan="11" bgcolor="D6D7D6" height="1"></td>
				</tr>
			</table>



<table border= "1">
    <tr>
        <td></td>
        <td>${DTORes.content}</td>
    </tr>
    <tr>
        <td>작성자</td>
        <td>${DTORes.content}</td>
    </tr>
    <tr>
        <td>내용</td>
        <td>${DTORes.content}</td>
    </tr>
 
</table>


<script>
		// ===================================== 추가 부분 ========================================
		//태그명.클래스명
		$("#insertBtn").on("click",function() {

					var jsonReq = {
							"postNo":380,
							"content":$("#comment_content").val(),
							"layer":$("#layer").val()
					}
					
					alert("jsonReq: " + jsonReq);
					console.log("jsonReq: " + jsonReq);
					
					$.ajax({
						url : "/community/api/insertComment",
						method : "POST",
						//data : JSON.stringify(jsonReq),
						data : jsonReq,
						dataType : "json",
						//contentType : "application/json; charset=utf-8",
						headers : {
									"Accept" : "application/json",
									"Content-Type" : "application/json"
								},
						success : function(DTORes) {

							//(status : sucess or err)
							alert("status: " + status);
							console.log("status: " + status);
						
							//Debug...
							alert("DTORes : " + DTORes);
							console.log("DTORes : " + DTORes);

							var result = DTORes["postNo"]+DTORes["commentNo"]+DTORes["userId"];
							//+DTORes[""]+DTORes[""]
						
							alert("result: " + result);
							console.log("result : " + result);

							
							
							//var displayValue = "<h7>" + 
							//"댓글내용 : " + JSONData.content +
							//"댓글작성시간 : "	+ JSONData.regDate + "</h7>";
							// nickname, profile_image??
							
							//Debug...									
							//alert(displayValue);
							
							//$("h7").remove();
							//$("#" + postNo + "").html(displayValue);
						}
					});

				});

</script>



</body>
</html>