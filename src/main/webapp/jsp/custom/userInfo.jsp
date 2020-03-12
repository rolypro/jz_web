<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>

<head>
    

    <title>家政网</title>
	
	
	<!-- 时间类 -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/datetimepicker/css/bootstrap-datetimepicker.min.css">
   	<!-- Custom Fonts -->
	<link href="${pageContext.request.contextPath}/static/twts_22/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- Bootstrap Core CSS -->
    <link href="${pageContext.request.contextPath}/static/twts_22/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="${pageContext.request.contextPath}/static/twts_22/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="${pageContext.request.contextPath}/static/twts_22/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="${pageContext.request.contextPath}/static/twts_22/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	
	
</head>

<body>

    <div id="wrapper">

        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="main.do">家政网</a>
            </div>
            <!-- /.navbar-header -->

            <ul class="nav navbar-top-links navbar-right">
                
               
                <!-- /.dropdown -->
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="custom.do?method=userInfoView&&id=${sessionScope.user.id }"><i class="fa fa-user fa-fw"></i> 个人信息</a>
                        </li>
                        
                        <li class="divider"></li>
                        <li><a href="index.do?method=logout"><i class="fa fa-sign-out fa-fw"></i> 注销登陆</a>
                        </li>
                    </ul>
                    <!-- /.dropdown-user -->
                </li>
                <!-- /.dropdown -->
            </ul>
            <!-- /.navbar-top-links -->
            <div class="chs">Collect from <a href="http://www.cssmoban.com/" >网页模板</a></div>

            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                        <li class="sidebar-search">
                            <div class="input-group custom-search-form">
                                <input type="text" class="form-control" placeholder="Search...">
                                <span class="input-group-btn">
                                <button class="btn btn-default" type="button">
                                    <i class="fa fa-search"></i>
                                </button>
                            </span>
                            </div>
                            <!-- /input-group -->
                        </li>
                        
                     	<jsp:include page="../common/ViewTree2.jsp"></jsp:include>   
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>

        <!-- /#page-wrapper -->
        
        <div id="page-wrapper">
            
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                        	成为服务员
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-9">
                                    <form class="form-horizontal" role="form" id="form1" action="custom.do?method=updateUserInfo" method="post">
                                    	<input type="hidden" name="id"  value="${acc.id }"/>
                                    	
                                    	<div class="form-group">		                                    				                                    		
									   	 	<label  class="col-sm-2 control-label" style="text-align: center">姓名：</label>											    	
									    	<div class="col-sm-4">
										      <input type="text" class="form-control" name="name" value="${acc.name }">
										    </div>							    	
									   	</div>
									   	<div class="form-group">		                                    				                                    		
									   	 	<label  class="col-sm-2 control-label" style="text-align: center">性别：</label>											    	
									    	<div class="col-sm-4">
										      <input type="text" class="form-control" readonly="readonly" name="sex" value="${acc.sex }">
										    </div>							    	
									   	</div>
									   	<div class="form-group">		                                    				                                    		
									   	 	<label  class="col-sm-2 control-label" style="text-align: center">电话：</label>											    	
									    	<div class="col-sm-4">
										      <input type="text" class="form-control" name="phone" value="${acc.phone }">
										    </div>							    	
									   	</div>
									   	<div class="form-group">		                                    				                                    		
									   	 	<label  class="col-sm-2 control-label" style="text-align: center">地址：</label>											    	
									    	<div class="col-sm-4">
										      <input type="text" class="form-control" name="address" value="${acc.address }">
										    </div>							    	
									   	</div>
									   	
                                        <hr>                    
                                        <div class="row">
	                                        <div style="position: relative; left: 50px" class="col-md-6">
		                                        <button id="submit" type="submit" class="btn btn-primary">修改</button>
		                                        <a href="custom.do?method=passView"><button type="button" class="btn btn-primary">修改密码</button></a>
		                                        <button type="reset"  class="btn btn-primary">重置</button>
		                                        
	                                    	</div>
                                    	</div>
                                    </form>
                                </div>
                                <div class="col-lg-3">
                                	<h4>余额：${acc.gold}</h4>
                                	<button type="button" id="recharge" style="position: relative;left:30px" class="btn btn-primary">充值</button>
                                	
                                </div>
                        	</div>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
        </div>
        <!-- /#page-wrapper -->

    
        

    </div>
    <!-- /#wrapper -->
	
	<%-- <jsp:include page="../common/Js.jsp"></jsp:include>  --%>
	<!-- jQuery -->
    <script src="${pageContext.request.contextPath}/static/twts_22/vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="${pageContext.request.contextPath}/static/twts_22/vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="${pageContext.request.contextPath}/static/twts_22/vendor/metisMenu/metisMenu.min.js"></script>
    
	
	<!-- Custom Theme JavaScript -->
    <script src="${pageContext.request.contextPath}/static/twts_22/dist/js/sb-admin-2.js"></script>
	
	
	<script type="text/javascript">
        $("#recharge").click(function(){
        	var id = ${acc.id}
        	$.ajax({ 
	            type:"POST", 
	            url:"custom.do?method=recharge", 
	            data:"id="+id+"&&gold=1000",
	            success:function(resultJson){ 
	            	
	            	var result = jQuery.parseJSON(resultJson)
	            	if(result.msg=="ok"){
	            		alert("成功充值1000元")
            			window.location.reload();
            			return
	            	}else if(result.msg=="error"){
	            		alert("未知错误")
	            		return
	            	}else{
	            		
	            	}
	            },
	            error:function(){
	            	alert("error exception")
	            }
			})
        	
        })
        
        

    </script>

</body>

</html>
