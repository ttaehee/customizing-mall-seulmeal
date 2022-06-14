<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로필 정보 수정/삭제 모달창</title>
</head>
<body>

			<!-- 헤더 -->
				<div class="modal-header">
					<h5 class="modal-title" id="staticBackdropLabel">프로필 이미지 바꾸기</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>

			<!-- 바디 -->
				<div class="modal-body">
					<p>					
						<form action="/community/api/updateProfileImage" method="POST" enctype="multipart/form-data">
								<div>
									<input type="file" name="imageFile" />
									<button type="submit" class="btn btn-primary">
										사진 업로드
									</button>
								</div>
						</form>
					</p>
					
					<hr>
					
					<p>
						<a href="#" role="button" id="deleteProfileImageBtn"
							class="btn btn-secondary popover-test" title="Popover title" >현재 사진 삭제</a>
					</p>
				</div>

			<!-- 푸터 -->
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
				</div>
			

</body>
</html>