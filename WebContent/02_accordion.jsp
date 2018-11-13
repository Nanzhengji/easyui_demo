<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>occordion</title>
<link  rel="stylesheet" type="text/css" href="js/easyui/themes/default/easyui.css">
<link  rel="stylesheet" type="text/css" href="js/easyui/themes/icons.css">

<script type="text/javascript" src="js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="js/easyui/jquery.easyui.min.js"></script>

</head>
<body class="easyui-layout">
	<div style="height:100px;font-size:26px" data-options="region:'north'" title="物流管理系统" >BOS物流管理系统</div>
	<div style="width:200px" data-options="region:'west'" title="功能区">
			<div class="easyui-accordion" data-options="fit:true" >
				<div data-options="iconCls:'icon-cut'"  title="基本功能">基本功能</div>
				<div data-options="iconCls:'icon-search'"  title="特殊功能">基本功能</div>
				<div data-options="iconCls:'icon-help'"  title="帮助">基本功能</div>				
			</div>
	</div>
	<div data-options="region:'center'">中</div>
	<div style="width:100px" data-options="region:'east'">右</div>
	<div style="height:50px" data-options="region:'south'">下</div>
	


</body>
</html>