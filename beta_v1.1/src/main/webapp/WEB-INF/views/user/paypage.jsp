<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="/resources/include/header.jsp" />

<div>
    <h1>예매 결과 확인</h1>
    <% 
    //예매 정보를 받아옴
    request.setCharacterEncoding("utf-8"); //인코딩
    String selectedDate = request.getParameter("selectedDate");
    String selectedTickets = request.getParameter("selectedTickets");
    String selectedEventTitle = request.getParameter("selectedEventTitle");

    // 받아온 정보를 출력
    out.println("<p>선택한 축제: " + selectedEventTitle + "</p>");
    out.println("<p>선택한 날짜: " + selectedDate + "</p>");
    
  //티켓 종류, 수량 분리 표시 - 여러 티켓이 선택되었을 때
    if (selectedTickets != null && selectedTickets.contains("\n")) {
        String[] ticketInfos = selectedTickets.split("\n");
        out.println("<p>선택한 티켓:</p>");
        out.println("<ul>");
        for (String ticketInfo : ticketInfos) {
            String[] ticketDetail = ticketInfo.split("-");
            if (ticketDetail.length >= 2) {
                String ticketType = ticketDetail[0];
                String ticketQuantity = ticketDetail[1];
                out.println("<li>" + ticketType + " - " + ticketQuantity + " 매</li>");
            }
        }
        out.println("</ul>");
    } else {
        out.println("<p>올바르지 않은 티켓 정보입니다.</p>");
    }
    %>
</div>
<jsp:include page="/resources/user/include/footer.jsp" />
