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
	
	<div class="row">
		<div class="col-md-4 col-md-offset-4" style="text-align: center">
			<h3>生活常识板块</h3>
		</div>
	</div>
	<!-- 这里添加内容 -->
	<div class = "row">
		<c:forEach var="l" items="${ls}">
			<div class="col-md-12 ">
				<div class="panel panel-default">
		            <div class="panel-heading">
		                <h4>标题:<a href="main.do?method=lifeById&&id=${l.id }">${l.title }</a></h4>
						<h5>作者:${l.author }</h5>
						<h5>时间:<fmt:formatDate value="${l.createTime }" pattern="yyyy-MM-dd HH:mm:ss"/></h5>
		            </div>
	        	</div>
        	</div>
		</c:forEach>
		
	</div>
	
	
	<hr>
	<div class="row" style="height: 100px">
	
	</div>
</div>
</body>

</html>
