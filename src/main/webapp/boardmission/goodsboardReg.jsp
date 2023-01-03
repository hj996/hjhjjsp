<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My JSP Files</title>
</head>
<body>
<h3>상품입력</h3>
<form action="goodsboardRegPro.jsp" method="post">
	<dl>
		<dt>상품명</dt>
		<td>
			<input type="text" name="gname" />
		</td>
	</dl>
	<dl>
		<dt>첨부파일</dt>
		<td>
			<input type="file" name="textfile" />
		</td>
	</dl>
	<div>
		<textarea name="gdescribe" class="gdescribe">상품설명입력란입니다.</textarea>
	</div>
	<input type="submit" value="save" />
	<input type="button" value="cancel" class="cancel"/>
</form>
</body>
</html>