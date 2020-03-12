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
	
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/cropper/docs/css/cropper.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/cropper/docs/css/main.css">
	
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
                	<input type="hidden" id="id" value="${id }"/>
                	<input type="hidden" id="isCompany" value="${isCompany }"/>
                    <div class="panel panel-default">
                        <div class="panel-heading">
                        	上传图片
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-9">
                                    <div class="img-container">
							          
							          	<c:if test="${empty image }">
							          		<img id="EditImg" src="" alt="Picture">
	                                	</c:if>
	                                	<c:if test="${not empty image }">
	                                		<img id="EditImg" src="${pageContext.request.contextPath}/upload/${image }" alt="Picture">
	                                	</c:if>
							        </div>
                                </div>
                                
                                <div class="col-lg-3">
	                                <div class="docs-preview clearfix">
							          <div class="img-preview preview-lg"></div>
							          
							        </div>
                                </div>
                                
                        	</div>
                        	<div class="row">
                        		<input style="display: none;" id="inputImage" name="file" type="file" accept="image/*">
        
						        <!--图片裁剪以及智能识别区域-->
						        <div id="showEdit" class="containerImage Hide cliper_wrapper">
						            <div class="footer-btn" style="height: 55px;">
						                <button type="button" class="btn btn-primary"  onclick="JavaScript:$('#inputImage').click();">重选照片</button>
						                <button id="cut" class="btn btn-primary" type="button" >剪切</button>
						                <button id="submit" class="btn btn-primary" type="button" >提交</button>
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
	
	<script src="${pageContext.request.contextPath}/static/cropper/dist/cropper.min.js"></script>
	
	
	<script type="text/javascript">
	$(function (){
        'use strict';//表示强规则  
        var Cropper = window.Cropper;  
        var console = window.console || { log: function () {} };
        var URL = window.URL || window.webkitURL;
        var $image = $('#EditImg');
        //获取图片截取的位置
        var screenWidth = $(window).width();  
        var screenHeight =  $(window).height();  
        var $dataX = $('#dataX');
        var $dataY = $('#dataY');
        var $dataHeight = $('#dataHeight');
        var $dataWidth = $('#dataWidth');
        var $dataRotate = $('#dataRotate');
        var $dataScaleX = $('#dataScaleX');
        var $dataScaleY = $('#dataScaleY');
        var options = {
                containerHeight :  screenWidth,  
                containerWidth : screenHeight, 
                preview: '.img-preview',
                guides :true,//裁剪框虚线 默认true有  
                aspectRatio: 1 / 1, //裁剪框比例1:1
                
                crop: function (e) {
                  $dataX.val(Math.round(e.x));
                  $dataY.val(Math.round(e.y));
                  $dataHeight.val(Math.round(e.height));
                  $dataWidth.val(Math.round(e.width));
                  $dataRotate.val(e.rotate);
                  $dataScaleX.val(e.scaleX);
                  $dataScaleY.val(e.scaleY);
                }
            };

        $('#EditImg').cropper(options);

        // Options
        var originalImageURL = $image.attr('src');
        var uploadedImageURL;
        var $inputImage = $('#inputImage');
        URL = window.URL || window.webkitURL;
        var blobURL;
        if (URL) {
          $inputImage.change(function () {
            var files = this.files,
                file;
            if (files && files.length) {
              file = files[0];
              if (/^image\/\w+$/.test(file.type)) {
                blobURL = URL.createObjectURL(file);
                $image.one('built.cropper', function () {
                  URL.revokeObjectURL(blobURL); // Revoke when load complete
                }).cropper('reset', true).cropper('replace', blobURL);
                //$inputImage.val('');
                $("#showEdit").removeClass('Hide');
              } else {
                //alert('Please choose an image file.');
              }
            }
          });
        } else {
          $inputImage.parent().remove();
        }
        //裁剪图片
        $("#cut").on("click", function (){
           var dataURL = $image.cropper("getCroppedCanvas");  
           var imgurl = dataURL.toDataURL("image/*", 0.5);  
           $image.cropper('destroy').attr('src', imgurl).cropper(options);
        });
        //提交图片
        $("#submit").on("click", function () {
           var accessory = $('#inputImage').val();
           if (typeof accessory == "null"){ 
                alert("is null"); 
                return ;
           } 
           var accessoryName = accessory.substring(accessory.lastIndexOf("\\")+1,accessory.length);//截取原文件名
           var dataURL = $image.cropper("getCroppedCanvas");//拿到剪裁后的数据  
           var data64 = dataURL.toDataURL("image/*",0.5);//转成base64
           if (typeof data == "null"){ 
                alert("is null"); 
                return ;
           }
           
           var id = $("#id").val()
           var isCompany = $("#isCompany").val()
           var jsonObj = {
                   id : id,
                   isCompany : isCompany,
                   imgBase64 : data64.toString()
            	} 
           
           $.ajax({
                url: "custom.do?method=upload",
                dataType:'json',
                contentType: "application/json; charset=utf-8",
                type: "POST",
                data:JSON.stringify(jsonObj), 
                //data:jsonObj,
                //data : "method=upload&&id="+id+"&&isCompany="+isCompany+"&&imgBase64="+data64.toString(),
                timeout : 200000, //超时时间设置，单位毫秒  
                async: true,    
                success: function (resultJson) { 
                	
	            	if(resultJson.msg=="ok"){
	            		alert("上传成功！")
	            		window.location.href="custom.do"
	            		return 
	            	}
                },    
                error: function (returndata) { 
                	alert("上传失败！")
                }  
            }); 
        });
    });

    </script>

</body>

</html>
