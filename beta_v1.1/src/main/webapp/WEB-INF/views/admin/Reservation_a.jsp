<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<jsp:include page="/resources/admin/include/header.jsp" />



<style>
#pwRow {
    display: none;
}
</style>

		
<div class="table-container">
	<table>
		<thead style="text-align:center;">
			<tr>
				<th colspan=6; style="text-align:center; padding-bottom: 20px;">예약내역</th>
			</tr>
			<tr>
				<td colspan=6; style="text-align:center;"><a href="./goodspage.jsp">2023 문화유산 미디어아트 수원화성</a></td>
			</tr>
			<tr>
				<th>예약자</th>
				<th>이용일/매수</th>
				<th>예매일</th>
				<th>취소가능일</th>
				<th>현재상태</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td style="text-align:center;">김철수 </td>
				<td>2023.11.05 &ensp; 성인 - 3매</td>
				<td style="text-align:center;">2023.10.26</td>
				<td style="text-align:center;">2023.11.04</td>
				<td style="text-align:center;">예매완료</td>
				<td><input type="submit" value="예매취소하기" style="width: 100px; height: 40px;"></td>
			</tr>
			<tr>
				<td style="text-align:center;">김철수</td>
				<td >2023.11.05 &ensp; 성인 - 1매</td>
				<td style="text-align:center;">2023.10.26</td>
				<td style="text-align:center;">2023.11.04</td>
				<td style="text-align:center;">예매취소</td>
			</tr>
			<tr>
				<td style="text-align:center;">김철수</td>
				<td>2023.10.05 &ensp; 성인 - 1매 / 청소년 - 2매</td>
				<td style="text-align:center;">2023.10.01</td>
				<td style="text-align:center;">2023.10.04</td>
				<td style="text-align:center;">예매완료</td>
			</tr>
			<tr>
				<td style="text-align:center;">김철수</td>
				<td>2023.10.05 &ensp; 성인 - 1매</td>
				<td style="text-align:center;">2023.10.01</td>
				<td style="text-align:center;">2023.10.04</td>
				<td style="text-align:center;">예매취소</td>
			</tr>
		</tbody>
	</table>
</div>

	


<jsp:include page="/resources/admin/include/footer.jsp" />