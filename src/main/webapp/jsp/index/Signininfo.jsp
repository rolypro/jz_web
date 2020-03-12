<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<jsp:include page="../common/Head.jsp"></jsp:include>

<style type="text/css">
	body { padding-top: 70px; 
		background:#F9F9F9;
	}
</style>

<script type="text/javascript">
	
</script>
<title>Insert title here</title>
</head>
<body >
<div class="container-fluid">
	<div class="row">
		<nav class="navbar  navbar-fixed-top" >
		  <div class="container-fluid" style="height:60px;background:#009FCC; color:#FFFFFF">
		    <div class="col-sm-2">
		    	<p style="text-align:center;font-size:45px;font-family: Helvetica, 'Hiragino Sans GB', 'Microsoft Yahei', '微软雅黑', Arial, sans-serif;">家政网</p>
		    </div>
		  </div>
		</nav>
	</div>
	
	<div class="row" >
		<div class="col-md-6 col-md-offset-3" style="position: relative; top:25px;background:#FFFFFF;border-radius: 10px;height:350px">
			
			</br>
			
			<h2 >注册成功！</h2></br></br>
			<h3 style="text-align: center">您的用户名是：${username }</h3></br></br>
			<a href="index.do"><button type="button" class="btn btn-link">现在就来登录?</button></a>
			 
		</div>
	</div>
	
</div>
	
</body>
</html>