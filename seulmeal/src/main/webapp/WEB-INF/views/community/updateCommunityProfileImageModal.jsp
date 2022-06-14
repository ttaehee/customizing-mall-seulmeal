<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../layer/header.jsp"></jsp:include>




	<!-- Button trigger modal -->
	<button type="button" class="btn btn-primary" data-toggle="modal"
		data-target="#exampleModal">Launch demo modal</button>

	<!-- Modal -->
	<div class="modal fade" id="testsModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
		
			<div class="modal-content">
			
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				
				<div class="modal-body">...</div>
				
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary">Save changes</button>
				</div>
				
			</div>
			
		</div>
	</div>

	<!-- 버튼 클릭 : 모달창 실행 -->
	<script>
	 	const btnModal = document.getElementById("modal_btn")
	 	btnModal.addEventListener("click", e => {
	 	    modal.style.display = "flex"
	 	})
	 </script>


	<!-- x 버튼 클릭 : 모달창 취소  -->
	<script>
    	const closeBtn = modal.querySelector(".close-area")
    	closeBtn.addEventListener("click", e => {
        	modal.style.display = "none"
    	})
    </script>



</body>
</html>