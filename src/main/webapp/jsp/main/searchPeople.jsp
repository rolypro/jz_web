<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>

<head>
    

    <title>家政网</title>
	
	<jsp:include page="../common/Head.jsp"></jsp:include>
	<!-- Bootstrap Core CSS -->
    <link href="${pageContext.request.contextPath}/static/twts_22/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="${pageContext.request.contextPath}/static/twts_22/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="${pageContext.request.contextPath}/static/twts_22/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/datetimepicker/css/bootstrap-datetimepicker.min.css">
	
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

 <div class="container">
	<div class="row clearfix" >
		<div class="col-md-12 column">
			<nav class="navbar navbar-default" role="navigation" >
				<div class="navbar-header" >
					 <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"> <span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button> <a class="navbar-brand" href="main.do">家政网</a>
				</div>
				
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li>
							 <a href="main.do?method=search">家政服务</a>
						</li>
						<li>
							 <a href="main.do?method=life">生活常识</a>
						</li>
						<li>
							 <a href="main.do?method=recruit">招聘信息</a>
						</li>
						<li>
							 <a href="main.do?method=news">新闻资讯</a>
						</li>
						<li>
							 <a href="main.do?method=message">留言板</a>
						</li>
						
					</ul>
					
					<ul class="nav navbar-nav navbar-right">
						<c:if test="${empty sessionScope.user }">
							<li>
								 <a href="index.do">登陆</a>
							</li>
						</c:if>
						<c:if test="${not empty sessionScope.user }">
							<li>
								 <a href="custom.do">欢迎：${sessionScope.user.name }</a>
							</li>
						</c:if>
						
					</ul>
				
					
				</div>
				
			</nav>
		</div>
		
		
	</div>
	
	
	<!-- 这里添加内容 -->
	<div class = "row">
		<input type="hidden" id="id" value="${sp.id }">
		<input type="hidden" id="isCompany" value="0">
		<div class="col-md-9">
			<div class="row">
				<div class="col-md-6"><h4>姓名：${sp.name }</h4></div>
				<div class="col-md-6"><h4>性别：${sp.sex }</h4></div>
			</div>
			<hr>
			<div class="row">
				<div class="col-md-6"><h4>年龄：${sp.age }</h4></div>
				<div class="col-md-6"><h4>电话：${sp.phone }</h4></div>
			</div>
			<hr>
			<div class="row">
				<div class="col-md-6"><h4>工作能力：${sp.workAblity }</h4></div>
				<div class="col-md-6"><h4>工作经验：${sp.workExperience }个月</h4></div>
			</div>
			<hr>
			<div class="row">
				<div class="col-md-6"><h4>服务城市：${sp.serviceCity }</h4></div>
				<div class="col-md-6"><h4>学历：${sp.education }</h4></div>
			</div>
			<hr>
			<div class="row">
				
				<div class="col-md-2">
					<h4>选择服务：</h4>
				</div>
					<%-- <label class="checkbox-inline">
					  <input type="checkbox" id="inlineCheckbox1" name="serverType" value="${st.gold }"> ${st.serverType}:${st.gold }
					</label> --%>
				<div class="col-md-3">
					<select class="form-control" id="select">
						<option value="">请选择</option>
						<c:forEach var="st" items="${sts}">
						  <option value="${st.gold }">${st.serverType}:${st.gold }元</option>
						</c:forEach>
					</select>
				</div>	
				<div class="col-md-1">
					开始时间
				</div>
				<div class="col-md-2">
					<input class="form-control form_datetime" name="day"/>
					<input class="form-control form_datetime" type="hidden" name="time"/>
				</div>
				<div class="col-md-1">
					结束时间
				</div>
				<div class="col-md-2">
					<input class="form-control form_datetime" name="day"/>
					<input class="form-control form_datetime" type="hidden" name="time"/>
				</div>
										
				
			</div>
			<hr>
			<div class="row">
				<div class="col-md-12"><h4>个人介绍：${sp.introduce }</h4></div>
			</div>
			<hr>
			<div class="row">
				<div class="col-md-12">
					<h4>已预约时间段：</h4>
					<c:forEach var="jo" items="${jos}">
						<h4><fmt:formatDate value="${jo.startTime }" pattern="yyyy-MM-dd HH:mm:ss"/>
						 ------- <fmt:formatDate value="${jo.endTime }" pattern="yyyy-MM-dd HH:mm:ss"/>
						</h4>
					</c:forEach>
					
				</div>
			</div>
			<hr>
			<div class="row">
				<div class="col-md-12">
					<button type="button" class="btn btn-primary" id="order">预约</button>
					<button style="position: relative; left:10px" type="button" class="btn btn-primary" id="review">查看评论</button>
				</div>
			</div>
			<hr>
			<div class="row" id="evaluate" style="display : none">
				<div class="col-md-12">
					<c:forEach var="e" items="${es }">
						<h5>${e.acc.name }:${e.content }</h5>
						<h5>时间:<fmt:formatDate value="${e.createTime }" pattern="yyyy-MM-dd HH:mm:ss"/></h5>
						<hr>
					</c:forEach>
				</div>
			</div>
		</div>
		<div class="col-md-3">
			<c:if test="${empty sc.image }">
           		<img src="${pageContext.request.contextPath}/images/image.jpg" alt="找不到啦" class="img-thumbnail" width="150px" height="150px">
           	</c:if>
           	<c:if test="${not empty sc.image }">
           		<img src="${pageContext.request.contextPath}/upload/${sp.image }" alt="" class="img-thumbnail" width="150px" height="150px">
           	</c:if>
		</div>
	</div>
	
	
	<hr>
	<div class="row" style="height: 100px">
	
	</div>
</div>

<script src="${pageContext.request.contextPath}/static/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/static/datetimepicker/js/bootstrap-datetimepicker.js"></script>

<script type="text/javascript">
	
	Date.prototype.format = function (fmt) {
	    var o = {
	        "M+": this.getMonth() + 1, //月份
	        "d+": this.getDate(), //日
	        "h+": this.getHours(), //小时
	        "m+": this.getMinutes(), //分
	        "s+": this.getSeconds(), //秒
	        "q+": Math.floor((this.getMonth() + 3) / 3), //季度
	        "S": this.getMilliseconds() //毫秒
	    };
	    if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
	    for (var k in o)
	        if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
	    return fmt;
	}
	
	function checkTime(startTime,type){
		if(type == 1){
			now = new Date().format("yyyy-MM-dd 00:00:00")
		}else{
			now = new Date().format("yyyy-MM-dd hh:mm:ss")
		}
		
		
		nowTime = new Date(now).getTime()
		startTime = new Date(startTime).getTime()
		
		if(startTime < nowTime){
			return false
		}
		return true
	}
	
	$("#order").click(function(){
		//提交
		var id = $("#id").val()
		var isCompany = $("#isCompany").val()
		var str = $("#select").children('option:selected').text()
		var arr = str.split(':')
		var serverType = arr[0]
		var gold = $("#select").children('option:selected').val()
		var startTime
		var endTime
		
		if(serverType == '家庭保姆'){
			var input =  $(".form_datetime[name='day']")
			startTime = $(input[0]).val()+" 00:00:00"
			endTime = $(input[1]).val()+" 23:59:59"
			
			flag = checkTime(startTime,1)
			if(!flag){
				alert("开始时间不对")
				return
			}
			
		}else if(serverType == '请选择'){
			alert("未选择服务")
			return
		}else{
			var input =  $(".form_datetime[name='time']")
			startTime = $(input[0]).val()
			endTime = $(input[1]).val()
			
			flag = checkTime(startTime,2)
			if(!flag){
				alert("开始时间不对")
				return
			}
			
		}
		
		var oldTime = (new Date(startTime)).getTime();
		var newTime = (new Date(endTime)).getTime();
		
		if((newTime - oldTime)<0){
			alert("预约时间有误")
			return
		}
		
		$.ajax({ 
            type:"POST", 
            url:"jzOrder.do?method=insert", 
            data:{
            	serverId : id,  //服务商ID
            	isCompany : isCompany,
            	startTime : startTime,
            	endTime : endTime,
            	serverType : serverType,
            	gold : gold
            },
            success:function(resultJson){ 
     
            	var result = jQuery.parseJSON(resultJson)
            	if(result.msg=="ok"){
            		alert("下单成功")
            		window.location.reload()
            	}else{
            		alert("下单失败  时间冲突")
            	}
            },
            error:function(){
            	alert("error exception")
            	alert("未登录")
            	window.localtion.href="inde.do"
            }
		})
		
		
	})


	$("#select").change(function(){
		var str = $(this).children('option:selected').text()
		var arr = str.split(':')
		var serverType = arr[0]
		
		if(serverType == '家庭保姆'){
			
			//$(".form_datetime").attr("name","day")
			$(".form_datetime[name='day']").attr("type","")
			$(".form_datetime[name='time']").attr("type","hidden")
			$(".form_datetime[name='day']").datetimepicker({
				language:  'zh-CN',//选择语言类型
		        weekStart: 1,//设置起始周
		        todayBtn: true ,//打开底部今天按钮,false为关闭
		        autoclose: true,//选中日期后自动关闭选择器
		        todayHighlight: true,//高亮显示当前日期
		        startView: 2,//设置为小时视图 ,1 hour 1 day 2 month 3 year 4 decade(十年)
		        minView: 2,//设置最小视图为小时视图
		        format: 'yyyy-mm-dd',//设置时间展现格式
		        forceParse: true//是否强制解析时间格式和类型
			});
		}else if(serverType == '请选择'){
			
		}else{
			
			//$(".form_datetime").attr("name","time")
			$(".form_datetime[name='time']").attr("type","")
			$(".form_datetime[name='day']").attr("type","hidden")
			$(".form_datetime[name='time']").datetimepicker({
				language:  'zh-CN',//选择语言类型
		        weekStart: 1,//设置起始周
		        todayBtn: true ,//打开底部今天按钮,false为关闭
		        autoclose: true,//选中日期后自动关闭选择器
		        todayHighlight: true,//高亮显示当前日期
		        startView: 2,//设置为小时视图 ,1 hour 1 day 2 month 3 year 4 decade(十年)
		        minView: 1,//设置最小视图为小时视图
		        format: 'yyyy-mm-dd hh:00:00',//设置时间展现格式
		        forceParse: true//是否强制解析时间格式和类型
			});
		}
		
	})
	
	$("#review").click(function(){
		
		$("#evaluate").toggle(function () { 
			   
			},
			function () {
				

			}); 
			
	})

	
</script>
</body>

</html>
