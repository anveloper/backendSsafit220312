<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="java.util.Arrays"%>
<%@ page import="java.util.Map"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="com.ssafy.dto.Count"%>

<%
	Count cnt = new Count();
	cnt.setNum(100);

	pageContext.setAttribute("cnt", cnt);

	Map<String, String> rst = new HashMap<>();

	rst.put("num", "1000");
	pageContext.setAttribute("rst", rst);
	
	String[] arr = {"a", "b", "c", "d"};
	pageContext.setAttribute("arr", arr);
	
	List<String> list = Arrays.asList("A","B","C");
	pageContext.setAttribute("list", list);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		list[0] : ${list[0] }<br>
		list[1] : ${list[1] }<br>
		list[2] : ${list[2] }<br>
	</div>
	<div>
		arr[0] : ${arr[0] }<br>
		arr[1] : ${arr[1] }<br>
		arr[2] : ${arr[2] }<br>
	</div>
	<div>
		<!-- rst.get("num")의 역할  -->
		num : ${pageScope.rst.num } <br>
		num : ${rst.num } <br>
		num : ${rst["num"] }
	</div>
	<div>
		<!-- java bean 라면, 간단 호출로 num을 사용해도 get의 역할을 한다. -->
		num : ${pageScope.cnt.getNum() }<br> 
		num : ${cnt.num }<br>
	</div>
</body>
</html>