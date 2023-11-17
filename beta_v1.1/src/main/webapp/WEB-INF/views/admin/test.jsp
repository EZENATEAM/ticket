<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="/resources/include/header.jsp" />

	<script>
		function multi()
		{
			let formData = new FormData();
			for( let i=0; i < 3; i++ )
			{
				formData.append('eventList['+i+'].idx', i);
				formData.append('eventList['+i+'].eNote', i);
			}
	    	$.ajax({
	    		type : "post",
	    		data : formData,
	    		contentType : false,
	    		processData : false,
	    		enctype : 'multipart/form-data',
	    		url	 : "${pageContext.request.contextPath}/admin/evnt_post",
	    		dataType: "HTML",
	    		success : function(data){
					console.log("done");
	    		}
	    	});
		}
	</script>
	<button type="button" onclick="multi();">멀티</button>
	</body>
</html>