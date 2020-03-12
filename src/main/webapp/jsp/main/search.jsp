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
	
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
	
	<style type="text/css">
		.label{
			position: relative;
			left: 15px;
			font-size: 15px;
			color: #000
		}
		
		.divp{
			position: relative;
			top: 5px
		}
		.active{
			background-color: #CCFFFF;
		}
		
	</style>
	
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
							 <a href="main.do?method=life">新闻资讯</a>
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
	
	<div class="row">
		<div class="col-md-8 col-md-offset-2" style="text-align: center">
			<h3>搜索服务</h3>
		</div>
	</div>
	<div class="row" >
		<div class="col-md-6 col-md-offset-2">
			<input type="email" id="searchtxt" class="form-control"  placeholder="名字、城市、类型、学历">
		</div>
		<div class="col-md-2">
			<button id="search" type="button" style="width: 100px" class="btn btn-default">搜索</button>
		</div>
			
	</div>
	<!-- 这里添加内容 -->
	
	
	
</div>
<div class="container" style="position: relative; top: 20px">
	<div class="col-md-12" style="background-color: #FFF;border-radius: 5px;">
		<hr>
		<div class="row ">
			<div class="col-md-12" id="city">
				<label style="font-size: 15px">城市：</label>
				<label class="label" name="{'city':'1'}">不限</label>
				<label class="label" name="{'city':'2'}">北京</label>
				<label class="label" name="{'city':'3'}">上海</label>
				<label class="label" name="{'city':'4'}">广州</label>
				<label class="label" name="{'city':'5'}">深圳</label>
				<label class="label" name="{'city':'6'}">南宁</label>
				<label class="label" name="{'city':'7'}">柳州</label>
				<label class="label" name="{'city':'8'}">桂林</label>
			</div>
		</div>
		<hr>
		<div class="row " >
			<div class="col-md-12" id="server">
				<label style="font-size: 15px">类型：</label>
				<label name="{'server':'1'}" class="label">不限</label>
				<c:forEach  var="jt" items="${jts}" varStatus="status">
					<label name="{'server':'${status.index+2}'}" class="label" >${jt.name}</label>
				</c:forEach>
				
			</div>
		</div>
		<hr>
		<div class="row " >
			<div class="col-md-12" id="edu">
				<label style="font-size: 15px">学历：</label>
				<label name="{'edu':'1'}" class="label">不限</label>				
				<label name="{'edu':'2'}" class="label" >小学</label>
				<label name="{'edu':'3'}" class="label">初中</label>
				<label name="{'edu':'4'}" class="label">高中</label>
				<label name="{'edu':'5'}" class="label">本科</label>
				<label name="{'edu':'6'}" class="label">研究生</label>
			</div>
		</div>
		<hr>
		<div class="row">
			<c:forEach var="sp" items="${sps}">
				<div class="col-md-4 column">
					<div align="center">
						<img  alt="140x140" width="50%" src="${pageContext.request.contextPath}/upload/${sp.image}" />
						<%-- <img  alt="140x140" width="50%" src="${pageContext.request.contextPath}/images/jz4.jpg" /> --%>
						<h4>
							${sp.name }
						</h4>
						<h4>
							${sp.grade }分
						</h4>
						<h4>
							${sp.phone }
						</h4>
						<h4>
							${sp.serviceCity }
						</h4>
						
						<p>
							 <a class="btn" href="main.do?method=searchInfo&&id=${sp.id }&&isCompany=0">查看详细 »</a>
						</p>
						
					</div>
				</div>
			</c:forEach>
			<c:forEach var="sc" items="${scs}">
				<div class="col-md-4 column">
					<div align="center">
						<img  alt="140x140" width="50%" src="${pageContext.request.contextPath}/upload/${sc.image}" />
						<%-- <img  alt="140x140" width="50%" src="${pageContext.request.contextPath}/images/jz4.jpg" /> --%>
						<h4>
							${sc.name }公司
						</h4>
						<h4>
							${sc.grade }分
						</h4>
						<h4>
							${sc.phone }
						</h4>
						<h4>
							${sc.serviceCity }
						</h4>
						<p>
							 <a class="btn" href="main.do?method=searchInfo&&id=${sc.id }&&isCompany=1">查看详细 »</a>
						</p>
					</div>
				</div>
			</c:forEach>
			
	</div>
	<hr>
	<div class="row" style="height: 100px">
	
	</div>
</div>
    <script src="${pageContext.request.contextPath}/static/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/jquery.base64.js"></script>

	<script type="text/javascript">
		 
		
		//-----------处理标签--------------
		var viewMap = ${viewMap}
		var city = 1
		var server = 1
		var edu = 1
		for(key in viewMap){
			if(key == 'city'){
				city = parseInt(viewMap[key])
			}else if(key == 'server'){
				server = parseInt(viewMap[key])
			}else{
				edu = parseInt(viewMap[key])
			}
		}
		
		
		$("#city").children("label:eq("+city+")").addClass("active")
		$("#server").children("label:eq("+server+")").addClass("active")
		$("#edu").children("label:eq("+edu+")").addClass("active")
		
		
		$("label:not(.active)").hover(  
	        function(){  
	           $(this).addClass("active")
	           
	        } ,  
	        function(){  
	           $(this).removeClass("active")  
	        }   
	    );
		
		$("label").click(function(){  
			var name = $(this).attr("name")
			if(name==''){
				return
			}
			
			//base64编码
			$.base64.utf8encode = true
			name = $.base64.btoa(name)
			
			window.location.href="main.do?method=search&&searchInfo="+name
		});
		
		$("#search").click(function(){
			//$(this).attr('placeholder','')
			var str = $("#searchtxt").val()
			
			//base64编码
			$.base64.utf8encode = true
			str = $.base64.btoa(str)
			
			window.location.href="main.do?method=searchDim&&searchInfo="+str
			
		})
		
		
	</script>
</body>

</html>
