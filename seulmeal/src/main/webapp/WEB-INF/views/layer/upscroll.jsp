<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style>
.floating-menu { position: fixed; right: 50px; top: 50%; z-index: 100; margin: -120px 0 0 0;}

.footer { height: 100px; background-color: #707070;}
</style>

</head>
<body>
<div class="floating-menu">
        <img src="/resources/attachments/image/uparrow.jpg" style="width: 48px; height: 48px;"onclick="upscroll()">
        </br>
        <img src="/resources/attachments/image/uparrow.jpg" style="width: 48px; height: 48px; transform:rotate(180deg);"onclick="downscroll()">
</div>
<script>
function upscroll(){
window.scrollTo({ top: 0, left: 0, behavior: 'smooth' });
}

function downscroll(){
	
	var down = document.body.offsetHeight - window.innerHeight;
	window.scrollTo({ top: down, left: 0, behavior: 'smooth' });
	}
</script>
</body>
</html>