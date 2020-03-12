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
                <a class="navbar-brand" href="#">家政网</a>
            </div>
            <!-- /.navbar-header -->

            <ul class="nav navbar-top-links navbar-right">
                
               
                <!-- /.dropdown -->
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <!-- <li><a href="#"><i class="fa fa-user fa-fw"></i> 个人信息</a>
                        </li> -->
                        
                        <!-- <li class="divider"></li> -->
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
                        
                     	<jsp:include page="../common/ViewTree.jsp"></jsp:include>   
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
                        	家政服务管理
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                                <thead>
                                    <tr>
                                        <th >ID</th>
                                        <th >服务名</th>
                                        <th >服务描述</th>
                                        <th>创建时间</th>
                                        <th >编辑</th>
                                    </tr>
                                </thead>
                                <tbody>
                                
	                                <c:forEach var="jt" items="${jts }" varStatus="status">
										<tr id="${status.count }">
											<td>${jt.id }</td>
											<td >${jt.name }</td>
											<td >${jt.jzInfo }</td>
											<td ><fmt:formatDate value="${jt.createTime }" pattern="yyyy-MM-dd"/></td>
											<td >
												<input class="btn btn-primary btn-xs" name="mb" id="${jt.id }" type="button" value="编辑">
												<input class="btn btn-primary  btn-xs" name="del" id="${jt.id }" type="button" value="删除">
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
    
    <!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		 <div class="modal-dialog" role="document">
		    <div class="modal-content">
		    	<div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			        <h4 class="modal-title" id="myModalLabel">修改服务信息</h4>
			 	</div>
		      <form class="form-horizontal" action="jzType.do?method=update" method="post" style="position: relative; top:10px">
			  	<input type="hidden" id="id" name="id"  value="">
			  	<div class="form-group">
			    	<label  class="col-sm-2 control-label">服务名</label>
			    	<div class="col-sm-3">
			      		<input type="text" class="form-control " id="name" name="name">
			    	</div>			    	
			   	 </div>
			   	 <div class="form-group">
			   	 	<label  class="col-sm-2 control-label">服务描述</label>
			    	<div class="col-sm-9">
			      		<input type="text" class="form-control " id="jzInfo" name=""jzInfo"">
			   	 	</div>
			   	 </div>
			   	 <div class="form-group">
			   	 	<label  class="col-sm-2 control-label">创建时间</label>
			    	<div class="col-sm-3">
			      		<input type="text" class="form-control " placeholder="Readonly " readonly id="createTime" name=""createTime"" >
			    	</div>			    	
			   	 </div>			   	 
			   	 <div class="modal-footer">
				   	 <div class="form-group">
				    	<div class="col-sm-3 ">
				      		<input class="btn btn-primary"  data-dismiss="modal" style="position:relative;left:30px;"  type="submit" value="提交">
				    	</div>
				   	 </div>
				</div>
			</form>
	    </div>
	  </div>
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
			$("input[name='mb']").click(function(){
				id=this.id;
				
				tr = $(this).parents('tr');
				//tr = $("#"+row);
				$("#id").val(id);
				
				$("#name").val(tr.children().eq(1).text());
				
				$("#jzInfo").val(tr.children().eq(2).text());
				$("#createTime").val(tr.children().eq(3).text());
				$("#myModal").modal('show')
			});
			
			$("input[name='del']").click(function(){
				id = this.id;
				window.location.href="jzType.do?method=delete&&id="+id; 
			});
			
		})
	
	</script>
	

</body>

</html>
