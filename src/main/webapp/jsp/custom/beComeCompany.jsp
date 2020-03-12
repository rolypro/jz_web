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
                        	成为服务公司
                        	<c:if test="${sc.state==0 }">(已停用)</c:if>
                        	<c:if test="${sc.state==1 }">(已启用)</c:if>
                        	<c:if test="${sc.state==2 }">(待审核)</c:if>
                        	<c:if test="${sc.state==3 }">(驳回)</c:if>
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-9">
                                    <form class="form-horizontal" role="form" action="serviceCompany.do?method=insert" id="form1" method="post">
                                    	<c:if test="${empty sc.id  }"><input type="hidden" name="id" id="scID" value="0"/></c:if>
                                    	<c:if test="${not empty sc.id  }"><input type="hidden" name="id" id="scID" value="${sc.id }"/></c:if>
                                    	
                                    	<div class="form-group">		                                    				                                    		
									   	 	<label  class="col-sm-2 control-label" style="text-align: center">公司名：</label>											    	
									    	<div class="col-sm-4">
										      <input type="text" class="form-control" value="${sc.name }" name="name">
										    </div>
									    										    	
									   	</div>
									   	
									   	<div class="form-group">	
									   		<input type="hidden" name="serverType"/> 	                                    				                                    		
									   	 	<label  class="col-sm-2 control-label" style="text-align: center">服务类型：</label>											    	
									    	<div class="col-sm-2">
										     	<select id="serverType" class="form-control">
										     		<option>保姆</option>
										     		<option>清洁</option>
										     		<option>临时工</option>
										     	</select>
										    </div>	
										    <label  class="col-sm-2 control-label" style="text-align: center">价格：</label>											    	
									    	<div class="col-sm-2">
										      <input id="price" type="text" class="form-control" >
										    </div>	
										    <button id="add" type="button" class="btn btn-primary">添加</button>						    										    	
									   	</div>	
									   	<hr>
									   	<div class="form-group">
									   		<label  class="col-sm-2 control-label" style="text-align: center">已选服务：</label>	
									   		<div class="col-sm-10" id="serverDiv">
										    	<c:forEach var="st" items="${sts }">
										    		<label name="server"  class="col-sm-2 control-label" style="text-align: center">${st.serverType}:${st.gold}</label>
										    	</c:forEach>					    	
										    </div>			                                    				                                    		
									   	 										    	
									   	</div>							   	
									   <hr>
									 	
									   	<div class="form-group">
									   		<label  class="col-sm-2 control-label" style="text-align: center">电话：</label>											    	
									    	<div class="col-sm-2">
										      <input type="text" class="form-control" value="${sc.phone }" name="phone">
										    </div>
										    <label  class="col-sm-2 control-label" style="text-align: center">工作城市：</label>											    	
									    	<div class="col-sm-2">
										      <input type="text" class="form-control" value="${sc.serviceCity }" name="serviceCity">
										    </div>									    										    	
									   	</div>
									   
									   	<div class="form-group">		                                    				                                    		
									   	 	<label  class="col-sm-2 control-label" style="text-align: center">地址：</label>											    	
									    	<div class="col-sm-8">
										      <input type="text" class="form-control" value="${sc.address }" name="address">
										    </div>									    	
									   	</div>
									   	<div class="form-group">		                                    				                                    		
									   	 	<label  class="col-sm-2 control-label" style="text-align: center">自我介绍：</label>											    	
									    	<div class="col-sm-8">
										      <input type="text" class="form-control" value="${sc.introduce }" name="introduce">
										    </div>									    	
									   	</div>
                                                                              
                                        <div class="row">
	                                        <div class="col-sm-4 ">
		                                        <button id="submit" type="submit" class="btn btn-primary">提交审核</button>
		                                        <button type="reset" style="position: relative;left:30px" class="btn btn-primary">重置</button>
	                                    	</div>
                                    	</div>
                                    </form>
                                </div>
                                
                                <div class="col-lg-3">
                                <!-- image -->
	                                <div class="row">
	                                	<c:if test="${empty sc.image }">
	                                		<img src="${pageContext.request.contextPath}/images/image.jpg" alt="找不到啦" class="img-thumbnail" width="150px" height="150px">
	                                	</c:if>
	                                	<c:if test="${not empty sc.image }">
	                                		<img src="${pageContext.request.contextPath}/upload/${sc.image }" alt="" class="img-thumbnail" width="150px" height="150px">
	                                	</c:if>
	                                </div>
                               	 	<div class="row">
										<button id="image" style="position: relative; top: 10px" type="button" class="btn btn-primary">点击更换</button>                                
									</div>
                                	
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
        $(function () {
            

        	$("#submit").click(function(){
            	var serverType = new Array()
            	var i = 0
            	$("#serverDiv label").each(function(){            	
            		var tmp = new Object()
            		var arr = $(this).text().split(':')
            		tmp.serverType = arr[0]
            		tmp.gold = arr[1]
            		serverType[i++] = tmp
            	})
            	
            	
            	$("input[name='serverType'] ").val(JSON.stringify(serverType))
            	
            	$("#form1").submit()	
            })
        	
        	$("label[name='server']").click(function(){        		
        		
        	});
        	
        	$('#serverDiv').on('click', 'label', function(){        		
        		$(this).remove()
        	})
        	
        	$("#add").click(function(){
        		serverType = $("#serverType").find("option:selected").text()
        		if($("#price").val() == ''){
        			alert("price is null")
        			return 
        		}
        		price = $("#price").val()
        		$("#serverDiv").append("<label name=\"server\"  class=\"col-sm-2 control-label\" style=\"text-align: center\">"+serverType+":"+price+"</label>")
        		
        	});
        	
        	
        	$("#image").click(function(){
        		scID = $("#scID").val()
        		if(scID == 0){
        			alert("你还未提交资料不能上传头像！")
        			return
        		}
        		
        		window.location.href="custom.do?method=uploadImage&&id="+scID+"&&isCompany=1"
        		
        	});
        	
        	
        })

    </script>

</body>

</html>
