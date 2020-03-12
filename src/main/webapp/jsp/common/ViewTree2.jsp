<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

	<li>
        <a href="#"> 个人中心<span class="fa arrow"></span></a>
        <ul class="nav nav-second-level">
            <li>
                <a href="custom.do?method=beComePeopleView">成为服务员</a>
            </li>
            <li>
                <a href="custom.do?method=beComeCompanyView">成为服务商</a>
            </li>
            
        </ul>
        <!-- /.nav-second-level -->
	</li>
	
	
	<li>
	    <a href="#"> 订单管理<span class="fa arrow"></span></a>
	    <ul class="nav nav-second-level">
	        <li>
	            <a href="jzOrder.do?method=findMyState&&isServer=0">未完成订单</a>
	        </li>
	        <li>
	            <a href="jzOrder.do?method=findMyState&&isServer=1">服务商的订单</a>
	        </li>
	        <li>
	            <a href="jzOrder.do?method=findMyState&&state=6&&isServer=0">已完成订单</a>
	        </li>
	        <li>
	            <a href="jzOrder.do?method=findMyState&&state=6&&isServer=1">服务商已完成订单</a>
	        </li>
	        
	    </ul>
	    <!-- /.nav-second-level -->
	</li>
	
	   
	
