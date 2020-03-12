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

	
	$(function(){
		$("#formAjax").submit(function(event){
			username=$("#username").val();
			pass=$("#password").val()
			//禁止提交表单必须先写
			event.preventDefault()
			if(username!=''&&pass!=''){
				$.ajax({ 
		            type:"POST", 
		            url:"index.do", 
		            data:"method=login&&username="+username+"&&password="+pass,
		            success:function(resultJson){ 
		            	var result = jQuery.parseJSON(resultJson)
		            	if(result.msg=="ok"){
		            		
		            		if(result.is_systemrole == true){
		            			window.location.href="home.do";
		            			return 
		            		}
		            		window.location.href="custom.do";
		            	}else{
		            		$("#span").text("用户名或密码错误")
		            	}
		            },
		            error:function(){
		            	alert("error exception")
		            }
				})
			}else{
				alert("请输入用户名和密码！")
			}
		})
	})
</script>
<title>Insert title here</title>
</head>
<body >
<div class="container-fluid">
	<div class="row">
		<nav class="navbar  navbar-fixed-top" >
		  <div class="container-fluid" style="height:60px;background:	#009FCC; color:#FFFFFF">
		    <div class="col-sm-2">
		    	<p style="text-align:center;font-size:45px;font-family: Helvetica, 'Hiragino Sans GB', 'Microsoft Yahei', '微软雅黑', Arial, sans-serif;">家政网</p>
		    </div>
		    <div class="col-sm-1 col-sm-offset-9">
		    	<a href="index.do?method=signinview"><button style="color:#FFF;position: relative;top: 15px;text-align:center;font-size:25px;font-family: Helvetica, 'Hiragino Sans GB', 'Microsoft Yahei', '微软雅黑', Arial, sans-serif;" type="button" class="btn btn-link">注  册</button></a>
		    </div>
		  </div>
		</nav>
	</div>
	
	<div class="row" >
		<div class="col-md-6 col-md-offset-3" style="position: relative; top:25px;background:#FFFFFF;border-radius: 10px;height:380px">
			<form class="form-horizontal" id="formAjax" >
				
			  <div class="col-md-6 col-md-offset-3">
			  	<h2>登录系统</h2>
			  	<span id="span" style="color:red">&nbsp</span>
			  	<div class="form-group">
			    	<input type="text" id="username" name="username" class="form-control input-lg"  placeholder="Username">
			  	</div>
			  	<div class="form-group">
			    	<input type="password" id="password" name="password" class="form-control input-lg"  placeholder="Password">
			    </div>
			    <input type="hidden" name="method" value="login">
			    <div class="form-group">
			    	</a><button type="text" class="btn btn-link">忘记密码?</button>
			    </div>
			    <div class="row">
			    	<div class="col-sm-4">
			    		<div class="form-group">
			    			<button type="submit"  style="background:#009FCC;width:120%;color: #FFFFFF;"  class="btn ">登录</button>
			    		</div>
			    	</div>
			    	<div class="col-sm-8"></div>
			    	
			    </div>
			     
			  </div>
			  
			 </form>
		</div>
	</div>
	
</div>
	
</body>
</html>