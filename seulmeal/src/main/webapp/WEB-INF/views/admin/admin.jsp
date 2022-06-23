<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
	.todayList{
		font-size: 18px;
		border-left: 1px solid gray;
		border-right: 1px solid gray;
		padding: 5px;
	}
	
	.todayList+.todayList{
		margin-left: 40px;
	}
</style>
<title>관리자 페이지</title>
<!-- chart.js -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
</head>
<body>
	<div class="container-fluid">
	    <div class="row flex-nowrap">
		<jsp:include page="sideBar.jsp"/>
		<div class="col py-3" style="margin-left:17%;">
				<div style="margin-bottom: 20px; justify-content: center; display: flex;">
					<span class="todayList">블랙리스트 유저 : 0</span>			
					<span class="todayList">주문한 상품 : ${count.PURCHASECOUNT}</span>
					<span class="todayList">재고없는 상품 : ${count.PRODUCTCOUNT}</span>					
					<span class="todayList">진행중인 이벤트 : ${count.EVENTCOUNT}</span>
					<span class="todayList">답변대기중인 문의 : ${count.ANSWERWAITCOUNT}</span>
					<span class="todayList">신고된 게시글 : ${count.REPORTCOUNT}</span>
				</div>
	            <iframe class="frame" style="height:100vh; width:100%; display:none;" src="/product/admin/listProduct"></iframe>
	            <!-- user -->
	            <iframe id="userListFrame" class="frame" style="height:100vh; width:100%; display:none;" src="/user/listUser/1"></iframe>
	            <iframe id="blackUserListFrame" class="frame" style="height:100vh; width:100%; display:none;" src="/user/listUser/1"></iframe>
	            
	            <!-- product -->
	            <iframe id="productListFrame" class="frame" style="height:100vh; width:100%; display:none;" src="/product/admin/listProduct/1"></iframe>
	            <iframe id="partsListFrame" class="frame" style="height:100vh; width:100%; display:none;" src="/product/listParts/1/0"></iframe>
	            <iframe id="foodCategoryListFrame" class="frame" style="height:100vh; width:100%; display:none;" src="/product/listFoodCategory"></iframe>
	            <iframe id="reviewListFrame" class="frame" style="height:100vh; width:100%; display:none;" src="/product/listReview/1"></iframe>
	            
	            <!-- community -->
	            <iframe id="reportPostFrame" class="frame" style="height:100vh; width:100%; display:none;" src="/community/getListReportPost/0"></iframe>
	            
	            <!-- purchase -->
	            <iframe id="saleFrame" class="frame" style="height:100vh; width:100%; display:none;" src="/purchase/getListSale/1"></iframe>
	            
	            <!-- operation -->
	            <iframe id="noticeFrame" class="frame" style="height:100vh; width:100%; display:none;" src="/operation/getListOperation/1"></iframe>
	            <iframe id="eventFrame" class="frame" style="height:100vh; width:100%; display:none;" src="/operation/getListOperation/2"></iframe>
	            <iframe id="queryFrame" class="frame" style="height:100vh; width:100%; display:none;" src="/operation/getListOperation/3/0/0"></iframe>
	            <!--<canvas id="myChart" width="400" height="200"></canvas>-->	            
				<div>
					<h3 class="text-center">유저 가입수</h3>
					<canvas style="width: 100%; height: 300px;" id="user-chart"></canvas>
				</div>
				
				<div style="display:flex; width: 100%;">
					<div style="width: 50%">
						<h3 class="text-center">판매량</h3>
						<canvas id="mixed-chart"></canvas>
					</div>
					<div style="width: 50%">
						<h3 class="text-center">매출액</h3>
						<canvas id="mixed-chart2"></canvas>
					</div>					
				</div>
	            
	            <table class="table table-hover text-center">
				<thead style="background-color: #ff4500; color: #fff;">
					<tr>
						<th>일자</th>
						<th>가입자수</th>
						<th>구매횟수</th>
						<th>판매액</th>
						<th>리뷰횟수</th>
						<th>문의횟수</th>
						<th>게시글횟수</th>
					</tr>
				</thead>
				<tbody>					
					<c:forEach var="u" items="${userDay}" varStatus="statusNum">
					<tr>
						<th>${u.REGDATE}</th>
						<th>${u.UCNT}</th>
						<th>${purchaseDay[statusNum.index].UCNT}</th>
						<th>${purchasePriceDay[statusNum.index].UCNT}</th>
						<th>${reviewDay[statusNum.index].UCNT}</th>
						<th>${queryDay[statusNum.index].UCNT}</th>
						<th>${communityDay[statusNum.index].UCNT}</th>
					</tr>
					</c:forEach>
				</tbody>
			</table>
	            
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
		
		// product		
		$("#productList").on("click",()=>{
			$(".frame").css("display","none");
			$("#productListFrame").css("display","block");
		})
		$("#partsList").on("click",()=>{
			$(".frame").css("display","none");
			$("#partsListFrame").css("display","block");
		})
		$("#foodCategoryList").on("click",()=>{
			$(".frame").css("display","none");
			$("#foodCategoryListFrame").css("display","block");
		})
		$("#reviewList").on("click",()=>{
			$(".frame").css("display","none");
			$("#reviewListFrame").css("display","block");
		})
		
		// purchase
		$("#sale").on("click",()=>{
			$(".frame").css("display","none");
			$("#saleFrame").css("display","block");
		})
		
		// 커뮤니티
		$("#reportPost").on("click",()=>{
			$(".frame").css("display","none");
			$("#reportPostFrame").css("display","block");
		})
	})	
</script>

<script>
/*
const ctx = document.getElementById('myChart').getContext('2d');

const myChart = new Chart(ctx, {
    type: 'line',
    data: {
        labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
        datasets: [{
            label: '# of Votes',
            data: [12, 19, 3, 5, 2, 3],
            backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 159, 64, 0.2)'
            ],
            borderColor: [
                'rgba(255, 99, 132, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)'
            ],
            borderWidth: 1
        }]
    },
    options: {
        scales: {
            y: {
                beginAtZero: true
            }
        }
    }
});
*/
new Chart(document.getElementById("user-chart"), {	
    type: 'bar',
    data: {
      labels: [
			<c:forEach var="userCount" items="${userCount}">
				"${userCount.MONTHLYDATA.split("-")[1]}월",
			</c:forEach>
    	  //"1월", "2월", "3월", "4월", "5월", "6월"
    	  ],
      datasets: [{
          label: "가입수",
          type: "bar",
          backgroundColor: "#F3A285",
          data: [
				<c:forEach var="userCount" items="${userCount}">
					${userCount.COUNT},
				</c:forEach>
        	  //408,547,675,734
        	  ],
        }]
    },
    options: {
    	responsive:false,
      title: {
        display: true,
        text: 'Population growth (millions): Europe & Africa'
      },
      legend: { display: false }
    }
});

new Chart(document.getElementById("mixed-chart"), {	
    type: 'bar',
    data: {
      labels: [
			<c:forEach var="purchaseCount" items="${purchaseCount}">
				"${purchaseCount.MONTHLYDATA.split("-")[1]}월",
			</c:forEach>
    	  //"1월", "2월", "3월", "4월", "5월", "6월"
    	  ],
      datasets: [{
          label: "판매량",
          type: "line",
          backgroundColor:"#F3A285",
          borderColor: "#8e5ea2",
          data: [
				<c:forEach var="purchaseCount" items="${purchaseCount}">
					"${purchaseCount.COUNT}",
				</c:forEach>
        	  //40,547,675,734
        	  ],
          fill: true
        }]
    },
    options: {
      title: {
        display: true,
        text: 'Population growth (millions): Europe & Africa'
      },
      legend: { display: false }
    }
});

new Chart(document.getElementById("mixed-chart2"), {	
    type: 'bar',
    data: {
      labels: [
			<c:forEach var="salePrice" items="${salePrice}">
				"${salePrice.MONTHLYDATA.split("-")[1]}월",
			</c:forEach>
    	  //"1월", "2월", "3월", "4월", "5월", "6월"
    	  ],
      datasets: [{
          label: "판매량",
          type: "line",
          backgroundColor:"#F3A285",
          borderColor: "#3e95cd",
          data: [
				<c:forEach var="salePrice" items="${salePrice}">
					"${salePrice.COUNT}",
				</c:forEach>
        	  //40,547,675,734
        	  ],
          fill: true
        }, {
          label: "매출액",
          type: "line",
          borderColor: "#3e95cd",
          data: [],
          fill: false
        }, {
          label: "가입수",
          type: "bar",
          backgroundColor: "rgba(0,2,0,0.2)",
          data: [
				
        	  //408,547,675,734
        	  ],
        }, {
          label: "123",
          type: "bar",
          backgroundColor: "rgba(0,0,0,0.2)",
          backgroundColorHover: "#3e95cd",
          data: []
        }
      ]
    },
    options: {
      title: {
        display: true,
        text: 'Population growth (millions): Europe & Africa'
      },
      legend: { display: false }
    }
});
</script>
</body>
</html>