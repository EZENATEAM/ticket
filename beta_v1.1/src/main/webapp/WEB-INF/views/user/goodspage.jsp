<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="/resources/include/header.jsp" />

	<!-- jQuery -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<!-- Datepicker CSS -->
	<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<!-- Datepicker JS -->
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
	<!-- 지도api -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=05494f5c1e5b322c699bbe6308c38827"></script>

<script>

	// 지도
	var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
	var options = { //지도를 생성할 때 필요한 기본 옵션
		center: new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
		level: 3 //지도의 레벨(확대, 축소 정도)
	};
	
	var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴



	//오늘 이전의 날짜는 선택할 수 없음
	$(function () {
	    $("#datepicker").datepicker({
	        minDate: 0
	    });
	});

	//예매테이블 스크롤 이벤트
	window.addEventListener("scroll", function() {
	    var tableContainer = document.querySelector('.table-container');
	    var fixedTable = document.querySelector('.fixed-table');
	    var scrollTop = window.pageYOffset || document.documentElement.scrollTop;
	    
	    // 스크롤 위치에 따라 테이블의 위치 조정
	    if (scrollTop > 100) { // 원하는 스크롤 위치 값으로 조정
	        fixedTable.style.display = "block";
	    } else {
	        fixedTable.style.display = "none";
	    }
	});
	


    // 이용 정보 탭 클릭 시 이벤트 처리
    document.getElementById("useInfo").addEventListener("click", function() {
        // 이용 정보에 해당하는 내용을 보이도록 설정
        document.getElementById("infoContent").style.display = "block"; // 이용 정보 표시
        document.getElementById("selContent").style.display = "none";
        document.getElementById("revContent").style.display = "none";
        document.getElementById("queContent").style.display = "none";
    });

    // 판매 정보 탭 클릭 시 이벤트 처리
    document.getElementById("selInfo").addEventListener("click", function() {
        // 판매 정보에 해당하는 내용을 보이도록 설정
        document.getElementById("infoContent").style.display = "none";
        document.getElementById("selContent").style.display = "block"; // 판매 정보 표시
        document.getElementById("revContent").style.display = "none";
        document.getElementById("queContent").style.display = "none";
    });
    
    document.getElementById("useReview").addEventListener("click", function() {
        document.getElementById("infoContent").style.display = "none";
        document.getElementById("selContent").style.display = "none";
        document.getElementById("revContent").style.display = "block";
        document.getElementById("queContent").style.display = "none";
    });
 
    document.getElementById("questAn").addEventListener("click", function() {
        document.getElementById("infoContent").style.display = "none";
        document.getElementById("selContent").style.display = "none";
        document.getElementById("revContent").style.display = "none";
        document.getElementById("queContent").style.display = "block";
    });
    
 	// 현재 선택된 탭
    var currentTab = "useInfo";
    
    function showTab(tabName) {
    	// 기존에 활성화된 탭의 active 클래스 제거
        var activeTabs = document.querySelectorAll('.active');
        activeTabs.forEach(function(tab) {
            tab.classList.remove('active');
        });

        // 선택한 탭에 active 클래스 추가
        document.getElementById(tabName).classList.add('active');
        
    	// 선택된 탭을 업데이트
        currentTab = tabName;
        
    	// 탭이 클릭되었을 때 호출
        document.getElementById("infoContent").style.display = "none";
        document.getElementById("selContent").style.display = "none";
        document.getElementById("revContent").style.display = "none";
        document.getElementById("queContent").style.display = "none";

        document.getElementById(tabName).style.display = "block";
   		}
    
	 	// 페이지 로딩 후 초기 선택된 탭 활성화
	    document.addEventListener("DOMContentLoaded", function() {
	        showTab(currentTab);
	    });
    
</script>

<script>
		//선택한 날짜를 설정하는 함수
		function setSelectedDate() {
		    // Datepicker에서 선택한 날짜를 yyyy/mm/dd 형식으로 포맷팅
		    var selectedDate = $.datepicker.formatDate('yy/mm/dd', $("#datepicker").datepicker("getDate"));
		 // 선택한 날짜 값을 전달할 hidden input 필드에 설정
		    $("#selectedDate").val(selectedDate);
		 
		    // 현재 페이지에 표시된 이벤트의 제목을 가져와 설정
		    var eventTitle = document.getElementById("eventTitle").innerText;
		    document.getElementById("selectedEventTitle").value = eventTitle;
			// 선택한 티켓 확인
		    var selectedTickets = $("#selectedTickets").val();
		    if (!selectedTickets) {
		        alert("티켓을 선택해 주세요.");
		        event.preventDefault(); // 폼 전송 막기
		    } 
		}
        
		
	// 이전에 선택된 티켓 정보를 보관할 변수 추가
    var previousTicketInfo = "";
	
 	// 선택한 티켓 숨기기 함수
    function hideSelectedTicket(ticketType) {
        var selectedTicket = document.querySelector("span[data-ticket='" + ticketType + "']");
        if (selectedTicket) {
            selectedTicket.style.display = "none"; // 선택한 티켓 숨기기
        }
    }
 
	  // 선택한 티켓 설정하는 함수
    function setSelectedTickets(ticketType) {
	    var ticketQuantity = prompt("티켓 수량을 입력하세요:");
	    var regex = /^[1-5]$/; // 1에서 5까지의 숫자만 허용하는 정규식
	
	    if (regex.test(ticketQuantity)) {
	        // 이전에 선택된 티켓 정보와 새로 선택된 티켓 정보 모두 보관
	        previousTicketInfo += "<br>" + ticketType + " 수량: " + ticketQuantity + " 매";
	        $("#selectedTicketsDisplay").html(previousTicketInfo);

	        // 선택한 티켓 종류와 수량을 hidden input 필드에 설정
	        $("#selectedTickets").val($("#selectedTickets").val() + "\n" + ticketType + "-" + ticketQuantity);
	     // 선택한 티켓을 숨김(hidden) 처리
	        hideSelectedTicket(ticketType);
	    } else {
	        alert("최대 수량은 5매입니다");
	        $("#selectedTicketsDisplay").html(previousTicketInfo); // 이전 티켓 정보로 롤백
	    }
	}
	  
	 // 티켓 선택 초기화하는 함수
    function resetSelectedTickets() {
        previousTicketInfo = ""; // 이전에 선택된 티켓 정보 초기화
        $("#selectedTicketsDisplay").html(""); // 선택된 티켓 정보 화면 초기화
        $("#selectedTickets").val(""); // hidden input 필드 초기화
        
     // 숨겨진 티켓 옵션 보이기
        var hiddenTickets = document.querySelectorAll("span[data-ticket]");
        hiddenTickets.forEach(function(ticket) {
        	ticket.style.display = "inline";
        });
    }

    // Datepicker 초기화
    $(function () {
        $("#datepicker").datepicker();
    });
</script>


		
<div class="table-container">
	<table>
	<tr>
		<td style="text-align:center;"><h2 id="eventTitle">${vo.title}</h2></td>
	</tr>
		<tr>
			<td>
			<table>
				<tr>
					<td rowspan=7><img src="${vo.referenceIdentifier}" alt="포스터 이미지" width="300" height="300"></td>
				</tr>
				<tr>
					<td>장소</td>
					<td>${ vo.spatialCoverage }</td>
				</tr>
				<tr>
					<td>기간</td>
					<td>${ vo.regDate } ~ ${ vo.extent }</td>
				</tr>
				<tr>
					<td>관람시간</td>
					<td>10분</td>
				</tr>
				<tr>
					<td>관람연령</td>
					<td>전체관람가</td>
				</tr>
				<tr>
					<td>주관부 연락처</td>
					<td></td>
				</tr>
				<tr>
					<td>가격</td>
					<td>탑승권 - 일반권_성인(만19세이상) 8,000원</td>
				</tr>
			</table>
			</td>
		</tr>
		<tr>
			<td>
			<table>
				<tr>
					<td id=useInfo onclick="showTab('infoContent')">축제 정보</td>
					<td id=selInfo onclick="showTab('selContent')">행사 정보</td>
					<td id=useReview onclick="showTab('revContent')">이용 후기(0)</td>
					<td id=questAn onclick="showTab('queContent')">Q&A(0)</td>
				</tr>
				<tr>
					<td style="border: none;" colspan=4>
					<div id="infoContent">
					<h1>공연시간 정보</h1>
					<p>예매가능시간: 전일 23시 59분까지</p>
					${ vo.description }
					<h1>상세정보</h1>
					<a href='${ vo.url}&fromDt=20200101'>${ vo.url}</a>
					<h1>장소지도</h1>
					<img src="https://blog.kakaocdn.net/dn/0mySg/btqCUccOGVk/nQ68nZiNKoIEGNJkooELF1/img.jpg" alt="포스터 이미지" width="300" height="300">
					<div id="map" style="width:500px;height:400px;"></div>
					
					</div>
					<div id="selContent" style="display:none;">
						<h1>행사 정보</h1>
						10월 25일~28일 09:30 ~ 21:30 &nbsp;<br>
	                    10월 29일~31일 09:30 ~ 21:30 &nbsp;<br>
	                    11월 01일~03일 09:30 ~ 21:30 &nbsp;<br>
	                    11월 04일~05일 09:30 ~ 21:30 &nbsp;<br>
					</div>
					<div id="revContent" style="display:none;">
					    이용 후기 내용
					</div>
					
					<div id="queContent" style="display:none;">
					    Q&A 내용
					</div>
					</td>
				</tr>
			</table>
			</td>
		</tr>
	</table>
</div>

	<div class="TicketTable">
		<form action="${pageContext.request.contextPath}/user/paypage" method="post" onsubmit="setSelectedDate()">
        <table>
                <tr>
                    <td style="text-align: center;">관람일</td>
                </tr>
                <tr>
                    <td><div id="datepicker"></div></td>
                </tr>
                <tr>
                    <td style="text-align: center;">티켓 선택</td>
                </tr>
                <tr>
                    <td>
                    <div style="max-height: 100px; overflow-y: auto;">
                    <!-- 회차 추가 -->
	                    <span data-ticket="성인" onclick="setSelectedTickets('성인')">성인</span><br>
	           			<span data-ticket="청소년" onclick="setSelectedTickets('청소년')">청소년</span><br>
	           			<span data-ticket="어린이" onclick="setSelectedTickets('어린이')">어린이</span><br>
	           			<span data-ticket="유아" onclick="setSelectedTickets('유아')">유아</span><br>
	           			<span data-ticket="성인(지역 시민)" onclick="setSelectedTickets('성인(지역 시민)')">성인(지역 시민)</span><br>
	           			<span data-ticket="청소년(지역 시민)" onclick="setSelectedTickets('청소년(지역 시민)')">청소년(지역 시민)</span><br>
	           			<span data-ticket="어린이(지역 시민)" onclick="setSelectedTickets('어린이(지역 시민)')">어린이(지역 시민)</span><br>
	           			<span data-ticket="유아(지역 시민)" onclick="setSelectedTickets('유아(지역 시민)')">유아(지역 시민)</span><br>
                    </div>
                    </td>
                </tr>
                <tr>
                    <td>
                    <input type="hidden" name="selectedEventTitle" id="selectedEventTitle" value="">
                    <input type="hidden" name="selectedDate" id="selectedDate" value="">
   					<input type="hidden" name="selectedTickets" id="selectedTickets" value="">
   					<br><div>선택한 티켓: <span id="selectedTicketsDisplay"></span></div>
                    <button type="button" onclick="resetSelectedTickets()">티켓 선택 초기화</button>
                    <input type="submit" value="예매하기" style="width: 100%; height: 50px">
                    </td>
                </tr>
        </table>
        </form>
    </div>


<jsp:include page="/resources/user/include/footer.jsp" />