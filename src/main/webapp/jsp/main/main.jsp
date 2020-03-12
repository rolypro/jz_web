<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

<head>
    

    <title>家政网</title>
	
	<jsp:include page="../common/Head.jsp"></jsp:include>
	
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
			<div class="carousel slide" id="carousel-279534">
				<ol class="carousel-indicators">
					<li class="active" data-slide-to="0" data-target="#carousel-279534">
					</li>
					<li data-slide-to="1" data-target="#carousel-279534">
					</li>
					<li data-slide-to="2" data-target="#carousel-279534">
					</li>
				</ol>
				<div class="carousel-inner">
					<div class="item active">
						<img alt="" src="${pageContext.request.contextPath}/images/jz2.jpg" />
						<div class="carousel-caption">
							<h4>
								First Thumbnail label
							</h4>
							<p>
								Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
							</p>
						</div>
					</div>
					<div class="item">
						<img alt="" src="${pageContext.request.contextPath}/images/jz2.jpg" />
						<div class="carousel-caption">
							<h4>
								Second Thumbnail label
							</h4>
							<p>
								Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
							</p>
						</div>
					</div>
					<div class="item">
						<img alt="" src="${pageContext.request.contextPath}/images/jz2.jpg" />
						<div class="carousel-caption">
							<h4>
								Third Thumbnail label
							</h4>
							<p>
								Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
							</p>
						</div>
					</div>
				</div> <a class="left carousel-control" href="#carousel-279534" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a> <a class="right carousel-control" href="#carousel-279534" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
			</div>
		</div>
	</div>
	
	<div class="row clearfix" style="position: relative; top:30px">
		<div class="col-md-4 column">
			<div align="center">
				<img  alt="140x140" width="50%" src="${pageContext.request.contextPath}/images/jz4.jpg" />
				<h2>
					服务一流
				</h2>
				<p>
					我们的服务是超一流的水平。<br>
					没有人能够超越我们
				</p>
				<p>
					 <a class="btn" href="#">查看详细 »</a>
				</p>
			</div>
		</div>
		<div class="col-md-4 column">
			<div align="center">
				<img alt="140x140" width="50%" src="${pageContext.request.contextPath}/images/jz4.jpg" />
				<h2>
					质量第一
				</h2>
				<p>
					我们的质量是全球第一。<br>
					没有人能够超越我们
				</p>
				<p>
					 <a class="btn" href="#">查看详细 »</a>
				</p>
			</div>
		</div>
		<div class="col-md-4 column">
			<div align="center">
				<img alt="140x140" width="50%" src="${pageContext.request.contextPath}/images/jz4.jpg" />
				<h2>
					速度超快
				</h2>
				<p>
					我们的速度世界最快。<br>
					没有人能够超越我们
				</p>
				<p>
					 <a class="btn" href="#">查看详细 »</a>
				</p>
			</div>
		</div>
	</div>
	<hr>
	<div class="row" style="height: 100px">
	
	</div>
</div>
</body>

</html>
