<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>

<head>
    

    <title>家政网</title>
	
	<jsp:include page="../common/Head2.jsp"></jsp:include>
	<!-- DataTables CSS -->
    <link href="${pageContext.request.contextPath}/static/twts_22/vendor/datatables-plugins/dataTables.bootstrap.css" rel="stylesheet">

    <!-- DataTables Responsive CSS -->
    <link href="${pageContext.request.contextPath}/static/twts_22/vendor/datatables-responsive/dataTables.responsive.css" rel="stylesheet">
	
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

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
                        	未审核员工
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body" >
                            <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                                <thead>
                                    <tr>
                                        <th >订单号</th>
                                        <th >下单人</th>
                                        <th >接单人</th>
                                        <th >是否公司</th>
                                        <th>选择服务</th>
                                        <th>开始时间</th>
                                        <th>结束时间</th>
                                        <th>金额</th>
                                       	<th>下单时间</th>
                                       	<th>状态</th>
                                        <th >编辑</th>
                                    </tr>
                                </thead>
                                <tbody>
                                
	                                <c:forEach var="jo" items="${jos }" varStatus="status">
										<tr id="${status.count }">
											<td>${jo.oId }</td>
											<td >${jo.xAccount.name }</td>
											<td >${jo.jAccount.name }</td>
											<c:if test="${jo.isCompany ==0}"><td >否</td></c:if>
											<c:if test="${jo.isCompany ==1}"><td >是</td></c:if>
											<td >${jo.serverType }</td>
											<td ><fmt:formatDate value="${jo.startTime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>	
											<td ><fmt:formatDate value="${jo.endTime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>		
											<td >${jo.gold }</td>													
											<td ><fmt:formatDate value="${jo.createTime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>										
											<td>
												<c:if test="${jo.state==0}">待接单</c:if>
												<c:if test="${jo.state==1}">已接单</c:if>
												<c:if test="${jo.state==2}">已支付</c:if>
												<c:if test="${jo.state==3}">拒绝接单</c:if>
												<c:if test="${jo.state ==4}">待退款</c:if>
												<c:if test="${jo.state==5}">已退款</c:if>
											</td>
											<td >
												<c:if test="${jo.state == 0}"><a href="jzOrder.do?method=updateMyState&&id=${jo.id }&&state=1"><input class="btn btn-primary  btn-xs"  type="button" value="接单"></a>
													<a href="jzOrder.do?method=updateMyState&&id=${jo.id }&&state=3"><input class="btn btn-primary  btn-xs" name="del" id="${jo.id }" type="button" value="拒绝接单"></a>
												</c:if>
												<c:if test="${jo.state == 1}"></c:if>
												<c:if test="${jo.state == 2}"></c:if>
												<c:if test="${jo.state == 3}"></c:if>
												<c:if test="${jo.state == 4}"><a href="jzOrder.do?method=payAndReFund&&id=${jo.id }&&state=5"><input class="btn btn-primary  btn-xs" name="del" id="${jo.id }" type="button" value="接受退款"></a></c:if>
												<c:if test="${jo.state == 5}"></c:if>
											</td>
										</tr>
									</c:forEach> 
                                </tbody>
                            </table>
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
    
    
	<!-- DataTables JavaScript -->
    <script src="${pageContext.request.contextPath}/static/twts_22/vendor/datatables/js/jquery.dataTables.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/twts_22/vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/twts_22/vendor/datatables-responsive/dataTables.responsive.js"></script>
	
	<!-- Custom Theme JavaScript -->
    <script src="${pageContext.request.contextPath}/static/twts_22/dist/js/sb-admin-2.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
	        $('#dataTables-example').DataTable({
	            responsive: true
	        });
	    });
		
		$(function(){
			//show.bs.modal显示前触发
			$("input[name='check']").click(function(){
				id = this.id;
				window.location.href="servicePeople.do?method=findById&&id="+id; 
			});
			
			$("input[name='state']").click(function(){
				state = this.id;
				
				tr = $(this).parents('tr');				
				id = tr.children().eq(0).text();
				
				window.location.href="servicePeople.do?method=updateState&&id="+id+"&&state="+state; 
			
			});
			
			$("input[name='del']").click(function(){
				id = this.id;
				window.location.href="jzOrder.do?method=delete&&id="+id; 
			});
			
		})
	
	</script>
	

</body>

</html>
