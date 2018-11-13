<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<link  rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js/easyui/themes/default/easyui.css">
<link  rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js/easyui/themes/icons.css">
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/easyui/jquery.easyui.min.js"></script>
<link  rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js/ztree/zTreeStyle.css"> 
<script type="text/javascript" src="${pageContext.request.contextPath }/js/ztree/jquery.ztree.all-3.5.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/easyui/locale/easyui-lang-zh_CN.js"></script>

<script type="text/javascript">
	$(function(){
		//alert方法
		//$.messager.alert("标题","内容","info");
		
		//confirm方法
		/* $.messager.confirm("标题","内容",function(r){
			//点击确定r的值为true，点击取消r的值为false，通过这可以知道用户点击了哪个按钮
			alert(r);
		}); */
		
		//show方法
		$.messager.show({
			title:'标题',
			msg:'内容',
			timeout:3000,
			showType:'slide'
			
		});
		
		
		
	});


</script>
</head>
<body>

</body>
</html>