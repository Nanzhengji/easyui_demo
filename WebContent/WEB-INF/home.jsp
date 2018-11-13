<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>物流管理系统</title>
<link  rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js/easyui/themes/default/easyui.css">
<link  rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js/easyui/themes/icons.css">
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/easyui/jquery.easyui.min.js"></script>
<link  rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js/ztree/zTreeStyle.css"> 
<script type="text/javascript" src="${pageContext.request.contextPath }/js/ztree/jquery.ztree.all-3.5.js"></script>



</head>
<body class="easyui-layout">
	<div style="height:100px" data-options="region:'north'" title="物流管理系统" ></div>
	<div style="width:200px" data-options="region:'west'" title="菜单导航">
			<div class="easyui-accordion" data-options="fit:true" >
				<div data-options="iconCls:'icon-cut'"  title="基本功能">
					<!-- UL用来盛放获取的JSON数据 -->
					<ul id="ztree1" class="ztree"></ul>
				<!-- 通过AJAX请求来获取JSON数据 -->
					<script type="text/javascript">
						$(function(){
							var setting1={
									data:{
										simpleData:{
											enable:true //表示要使用简单JSON,默认为false
										}
										},
									callback:{
										//为树节点绑定单击事件
										onClick:function(event,treeId,treeNode){
											//动态添加一个选项卡，根节点不添加
											if(treeNode.page !=undefined){
												var e=$("#mytabs").tabs("exists",treeNode.name);
												if(e){
													$("#mytabs").tabs("select",treeNode.name);
												}else{
												$("#mytabs").tabs("add",{
														title:treeNode.name,
														closable:true
												});
											}
											}
										  }
									}
							};
							 
							 
							 //获取json数据的地址
							var url="json/menu.json";
						//发送AJAX请求，获取JSON数据    ，jquery提供了六种AJAX方法：ajax,post,get,load,getJSION,getScript
						$.post(url,{},function(data){$.fn.zTree.init($("#ztree1"),setting1,data )},'json');
					});
				</script>
			
				</div>
				
				<div data-options="iconCls:'icon-search'"  title="系统功能">
					<ul id="ztree2" class="ztree"></ul>
					
				<script type="text/javascript">
					$(function(){
							var setting2={
									data:{
										simpleData:{
											enable:true //表示要使用简单JSON
										}
										},
									callback:{
										//为树节点绑定单击事件
										onClick:function(event,treeId,treeNode){
											//动态添加一个选项卡
											if(treeNode.page !=undefined){
												var e=$("#mytabs").tabs("exists",treeNode.name);
												if(e){
													$("#mytabs").tabs("select",treeNode.name);
												}else{
												$("#mytabs").tabs("add",{
														title:treeNode.name,
														closable:true
												});
											}
											}
										  }
									}
							};
							 //发送AJAX请求，获取JSON数据     
							 //jquery提供了六种AJAX方法：ajax,post,get,load,getJSION,getScript
							var url="json/admin.json";
						$.post(url,{},function(data){$.fn.zTree.init($("#ztree2"),setting2,data )},'json');
					});
					
					</script>
				
				</div>
				<div data-options="iconCls:'icon-help'"  title="辅助功能">
				
				<ul id="ztree3" class="ztree"></ul>
					<script type="text/javascript">
						$(function(){
							var setting3={
									data:{
										simpleData:{
											enable:true //表示要使用简单JSON
										}
									}
							};
							//没有嵌套，方便表示层次关系
							var zNodes3=[
							            {"id":"1","pId":"0","name":"基本辅助"},
							            {"id":"11","pId":"1","name":"增加"},
							            {"id":"12","pId":"1","name":"删除"},
							            {"id":"13","pId":"1","name":"修改"}	,
							            {"id":"2","pId":"0","name":"查找"}	,
							            {"id":"21","pId":"2","name":"查找一个"},
							            {"id":"22","pId":"2","name":"查找一组"}	,
							            {"id":"23","pId":"2","name":"查找全部"}	
							            ];
							           
							$.fn.zTree.init($("#ztree3"),setting3,zNodes3);
						});
					
					</script>
				
				</div>	
				<div data-options="iconCls:'icon-help'"  title="帮助">
				 <a id="but1" class="easyui-linkbutton">添加一个选项卡</a>
					<script type="text/javascript">
					$(function(){
						/* 点击按钮 */
						$("#but1").click(function(){
							/* 如果 系统功能选项卡存在，就选中它，如果不存在就添加它*/
							var e=$("#mytabs").tabs("exists","新加的功能");
							
							 if(e){
								
								$("#mytabs").tabs("select","新加的功能");
								
							}else{ 						
								$("#mytabs").tabs("add",{
												title:'新加的功能',
												closable:true,
												content:'<iframe frameborder="0" height="100%" width="100%" src="https://www.baidu.com"></iframe>'
								});/*iframe标签就像在页面上挖了个洞，里面可以填充其他页面  */
							} 
						});
						
					});
					
					</script>
				</div>			
				</div>
	</div>
	<div data-options="region:'center'">
	<!--中间板块  -->
		<div id="mytabs" class="easyui-tabs" data-options="fit:true" >
				<div data-options="closable:true"  title="基本功能">基本功能</div>
				<div data-options="closable:true"  title="系统功能">系统功能</div>
				<div data-options="closable:true"  title="帮助">帮助</div>				
			</div>



	</div>
	<div style="width:100px" data-options="region:'east'">右</div>
	<div style="height:50px" data-options="region:'south'">下</div>
	


</body>
</html>