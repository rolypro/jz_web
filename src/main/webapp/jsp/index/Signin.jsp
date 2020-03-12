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
	
	var canSubmit = false

	$(function(){
		$("#username").blur(function(event){
			username=$("#username").val();
			
			if(username!=''){
				$.ajax({ 
		            type:"POST", 
		            url:"index.do", 
		            data:"method=checkusername&&username="+username,
		            success:function(resultJson){ 
		     
		            	var result = jQuery.parseJSON(resultJson)
		            	if(result.msg=="ok"){
		            		canSubmit = true
		            	}else{
		            		$("#span").text("用户名重复")
		            	}
		            },
		            error:function(){
		            	alert("error exception")
		            }
				})
			}else{
				
			}
		})
	})
	
	$(function(){
		$("#submit").click(function(event){
			username=$("#username").val()
			pass=$("#password").val()
			name = $("#name").val()
			sex = $("#sex").val()
			phone = $("#phone").val()
			addr = $("#addr").val()
			
			
			
			if(canSubmit==true&&username!=''&&pass!=''&&name!=''&&sex!=''&&phone!=''&&addr!=''){
				$('#fromAjax').submit()	
			}else{
				if(canSubmit==false){
					alert("用户名重复！")
					return
				}
				alert("信息不完整！")
				return false
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
		  <div class="container-fluid" style="height:60px;background:#009FCC; color:#FFFFFF">
		    <div class="col-sm-2">
		    	<p style="text-align:center;font-size:45px;font-family: Helvetica, 'Hiragino Sans GB', 'Microsoft Yahei', '微软雅黑', Arial, sans-serif;">家政网</p>
		    </div>
		  </div>
		</nav>
	</div>
	
	<div class="row" >
		<div class="col-md-6 col-md-offset-3" style="position: relative; top:25px;background:#FFFFFF;border-radius: 10px;height:450px">
			<form class="form-horizontal" id="fromAjax" action="index.do?method=signin" method="post" style="position: relative; top:10px">
				<h2 style="text-align: center">用户注册</h2>
				<div class="form-group">
			   	 	<label  class="col-sm-offset-1 col-sm-3 control-label">用户名</label><span style="color:red" id="span"></span>
			    	<div class="col-sm-5">
			      		<input type="text" class="form-control " name="username" id="username">
			    	</div>
			   	</div>
			   	<div class="form-group">
			    	<label  class="col-sm-offset-1 col-sm-3 control-label">密码</label>
			    	<div class="col-sm-5">
			      		<input type="password" class="form-control " name="password" id="password">
			    	</div>
			   	 </div>
			  	<div class="form-group">
			    	<label  class="col-sm-offset-1 col-sm-3 control-label">名称</label>
			    	<div class="col-sm-5">
			      		<input type="text" class="form-control " name="name" id="name">
			    	</div>
			   	 </div>
			   	 <div class="form-group">
			    	<label  class="col-sm-offset-1 col-sm-3 control-label">性别</label>
			    	<div class="col-sm-5">
			      		<select class="form-control " name="sex" id="sex">
					  		<option value="男">男</option>
					  		<option value="女">女</option>
						</select>
			   	 	</div>
			   	 </div>
			   	 
			   	 <div class="form-group">
			   	 	<label  class="col-sm-offset-1 col-sm-3 control-label">手机</label>
			    	<div class="col-sm-5">
			      		<input type="text" class="form-control " name="phone" id="phone">
			    	</div>
			   	 </div>		
			   	 <div class="form-group">
			   	 	<label  class="col-sm-offset-1 col-sm-3 control-label">家庭住址</label>
			    	<div class="col-sm-5">
			      		<input type="text" class="form-control " name="address" id="addr">
			    	</div>
			   	 </div>		   	 
			   	 <div class="form-group">
			    	<div class="col-sm-offset-4 col-sm-3">
			      		<input class="btn " style="background-color: #009FCC;color: #FFFFFF" type="submit" value="提交" id="submit">
			    	</div>
			   	 </div>
			</form>
		</div>
	</div>
	
</div>
	
</body>
</html>