<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="/resources/include/header.jsp" />



<style>
#pwRow, #changeId, #changeName, #changeBd, #changeEmail, #changePhone {
    display: none;
}
</style>

<script>
var isEditing = false;

//팝업 내부에 불러오는 페이지
function loadContent(page) {
    if (page === "namec") {
        $("#divId").load("${pageContext.request.contextPath}/resources/user/changer/nameChanger.jsp");
    } else if (page === "bdc") {
        $("#divId").load("${pageContext.request.contextPath}/resources/user/changer/bdChanger.jsp");
    } else if (page === "phonec") {
        $("#divId").load("${pageContext.request.contextPath}/resources/user/changer/phoneChanger.jsp");
    } else if (page === "pwc") {
        $("#divId").load("${pageContext.request.contextPath}/resources/user/changer/pwChanger.jsp");
    }
}


function memberEdit() {
	var pwRow = document.getElementById("pwRow");
    var editButton = document.getElementById("editMemberButton");

    if (!isEditing) {
        // 정보 수정 버튼이 눌렸을 때
        pwRow.style.display = 'table-row'; // 비밀번호 창 보이기
        changeName.style.display = 'table-row'; // 수정 버튼 보이기
        changeBd.style.display = 'table-row'; // 수정 버튼 보이기
        changePhone.style.display = 'table-row'; // 수정 버튼 보이기
        changePw.style.display = 'table-row'; // 수정 버튼 보이기
        editButton.innerHTML = '확인';
        isEditing = true;
    } else {
        // 확인 버튼이 눌렸을 때
        pwRow.style.display = 'none'; // 비밀번호 숨기기
        changeName.style.display = 'none'; // 숨기기
        changeBd.style.display = 'none'; // 숨기기
        changePhone.style.display = 'none'; // 숨기기
        changePw.style.display = 'none'; // 숨기기
        editButton.innerHTML = '정보 수정';
        isEditing = false;
    }
}

//버튼 종류에 따라 불러오는 페이지 설정
$(document).ready(function(){
	$("#changeName").on("click", function() {
        loadContent("namec"); // changeName 버튼을 눌렀을 때 nameChanger.jsp를 로드
    });
    $("#changeBd").on("click", function() {
        loadContent("bdc");
    });
    $("#changePhone").on("click", function() {
        loadContent("phonec");
    });
    $("#changePw").on("click", function() {
        loadContent("pwc");
    });
});

// 팝업 창 외에 선택불가 필름
function popWindowOpen() {
	jQuery("#protectionFilm").css("display", "block");
    jQuery("#popWindow").css("display", "block");
}

function popWindowClose() {
	jQuery("#protectionFilm").css("display", "none");
    jQuery("#popWindow").css("display", "none");
}

// 팝업 창 내부 페이지
$(document).ready(function(){
    $("#divId").load("./changer/idChanger.jsp");
});


</script>


<div id="protectionFilm"></div>

<div id="popWindow">
    <div style="text-align:right;">
        <a href="javascript:;" onClick="popWindowClose();">닫기
        </a>
    </div>
    
	<div id="divId" style="border: none; height:500px; "></div>

</div>


<div class="table-container">
	<table>
		<tr>
			<td>
			<table>
				<tr>
					<td>ID</td>
					<td>hong1234
					</td>
				</tr>
				<tr>
					<td>이름</td>
					<td>홍길동
					<button id="changeName" onClick="popWindowOpen();">수정</button>
					</td>
				</tr>
				<tr>
					<td>생년월일</td>
					<td>2001.01.01
					<button id="changeBd" onClick="popWindowOpen();">수정</button>
					</td>
				</tr>
				<tr>
					<td>이메일</td>
					<td>hong123@naver.com
					</td>
				</tr>
				<tr>
					<td>연락처</td>
					<td>010 - 1234 - 5678
					<button id="changePhone" onClick="popWindowOpen();">수정</button>
					</td>
				</tr>
				<tr id="pwRow">
					<td>비밀번호</td>
					<td><button id="changePw" onClick="popWindowOpen();">수정</button></td>
				</tr>
				<tr>
					<td colspan=2 style="text-align:right; border-bottom:none;"><button id="editMemberButton" onclick="memberEdit()" style="width: 30%; height: 50px;">정보 수정</button></td>
				</tr>
			</table>
			</td>
		</tr>
		<tr>
			<td>
			<table>
				<thead style="text-align:center;">
				<tr>
					<th colspan=4; style="text-align:center; padding-bottom: 20px;">예약내역</th>
				</tr>
				<tr>
					<th>상품명</th>
					<th>이용일/매수</th>
					<th>예매일</th>
					<th>취소가능일</th>
					<th>현재상태</th>
				</tr>
				</thead>
				<tbody>
				<tr>
				<td><a href="${pageContext.request.contextPath}/user/goodspage">2023 문화유산 미디어아트 수원화성</a> </td>
				<td>2023.11.05 <br> 성인 - 3매</td>
				<td>2023.10.26</td>
				<td>2023.11.04</td>
				<td>예매완료</td>
				<td style="border-bottom:none;"><input type="submit" value="예매취소하기" style="width: 100px; height: 40px;"></td>
				</tr>
				<tr>
				<td>2023 인형극 페스티벌 [1일 입장권] - 이천</td>
				<td>2023.11.05 <br> 성인 - 1매</td>
				<td>2023.10.26</td>
				<td>2023.11.04</td>
				<td>예매취소</td>
			</tr>
			<tr>
				<td>렛츠 더단백@한강 예빛섬</td>
				<td>2023.10.05 <br> 성인 - 1매 / 청소년 - 2매</td>
				<td>2023.10.01</td>
				<td>2023.10.04</td>
				<td>예매완료</td>
			</tr>
			<tr>
				<td>렛츠 더단백@한강 예빛섬</td>
				<td>2023.10.05 <br> 성인 - 1매</td>
				<td>2023.10.01</td>
				<td>2023.10.04</td>
				<td>예매취소</td>
			</tr>
			</tbody>
			</table>
			</td>
		</tr>
	</table>
</div>

<jsp:include page="/resources/user/include/footer.jsp" />