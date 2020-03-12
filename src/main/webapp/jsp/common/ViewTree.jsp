<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

	
	<li>
	    <a href="tables.html"></i> 客户管理<span class="fa arrow"></span></a>
	    <ul class="nav nav-second-level">
	        <li>
	            <a href="c.do?method=findAll">查看客户</a>
	        </li>
	        
	    </ul>
	</li>
	<li>
	    <a href="tables.html"></i> 管理员管理<span class="fa arrow"></span></a>
	    <ul class="nav nav-second-level">
	        <li>
	            <a href="admin.do?method=findAll">查看管理员</a>
	        </li>
	         <li>
	            <a href="admin.do?method=addPowerView">添加管理员</a>
	        </li>
	        
	    </ul>
	</li>
	<li>
	    <a href="#"></i> 家政服务管理<span class="fa arrow"></span></a>
	    <ul class="nav nav-second-level">
	        <li>
	            <a href="jzType.do">查看服务</a>
	        </li>
	        <li>
	            <a href="jzType.do?method=insertView">添加服务</a>
	        </li>
	    </ul>
	</li>
	<li>
	    <a href="#"></i> 家政管理<span class="fa arrow"></span></a>
	    <ul class="nav nav-second-level">
	        <li>
	            <a href="blank.html">服务人员管理<span class="fa arrow"></span></a>
	            <ul class="nav nav-third-level">
                    <li>
                        <a href="servicePeople.do?state=2">待审核</a>
                    </li>
                    <li>
                        <a href="servicePeople.do?state=0">已审核</a>
                    </li>                    
                </ul>
	        </li>
	        <li>
	            <a href="blank.html">服务公司管理管理<span class="fa arrow"></span></a>
	            <ul class="nav nav-third-level">
                    <li>
                        <a href="serviceCompany.do?state=2">待审核</a>
                    </li>
                    <li>
                        <a href="serviceCompany.do?state=0">已审核</a>
                    </li>                    
                </ul>
	        </li>
	    </ul>
	    <!-- /.nav-second-level -->
	</li>
	<li>
	    <a href="#"> 订单管理<span class="fa arrow"></span></a>
	    <ul class="nav nav-second-level">
	        <li>
	            <a href="jzOrder.do">未完成订单</a>
	        </li>
	        <li>
	            <a href="jzOrder.do?state=6">已完成订单</a>
	        </li>
	        
	    </ul>
	    <!-- /.nav-second-level -->
	</li>
	<li>
	    <a href="#"> 板块管理<span class="fa arrow"></span></a>
	    <ul class="nav nav-second-level">
	        <li>
	            <a href="blank.html">新闻管理<span class="fa arrow"></span></a>
	            <ul class="nav nav-third-level">
                    <li>
                        <a href="news.do?method=insertView">添加新闻</a>
                    </li>
                    <li>
                        <a href="news.do">查看新闻</a>
                    </li>                    
                </ul>
	        </li>
	        <li>
	            <a href="#">招聘管理<span class="fa arrow"></span></a>
	            <ul class="nav nav-third-level">
                    <li>
                        <a href="recruit.do?method=insertView">添加招聘信息</a>
                    </li>
                    <li>
                        <a href="recruit.do">查看招聘信息</a>
                    </li>                    
                </ul>
	        </li>
	        <li>
	            <a href="message.do">留言管理</a>
	        </li>
	        <li>
	            <a href="#">生活常识管理<span class="fa arrow"></span></a>
	            <ul class="nav nav-third-level">
                    <li>
                        <a href="life.do?method=insertView">添加生活常识</a>
                    </li>
                    <li>
                        <a href="life.do">查看生活常识</a>
                    </li>                    
                </ul>
	        </li>
	    </ul>
	    <!-- /.nav-second-level -->
	</li>
	<li>
	    <a href="#"> 数据统计<span class="fa arrow"></span></a>
	    <ul class="nav nav-second-level">
	        <li>
	            <a href="statistics.do?method=findWeekOrderCount">日平台成交额度</a>
	        </li>
	        
	    </ul>
	    <!-- /.nav-second-level -->
	</li>
