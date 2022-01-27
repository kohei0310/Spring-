<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<header>

    <nav class="navbar fixed-top navbar-expand navbar-blue" style="background-color: #e7e7e7;">
        <div class="collapse navbar-collapse" id="navbar-Nav">
        	<ul class="navbar-nav">
	        	<li class="nav-item">
	        		<a class="navbar-brand" href="search">会員管理システム</a>
	        	</li>
	            <li class="nav-item"><a class="nav-link" href="search">検索</a></li>
	            <li class="nav-item"><a class="nav-link" href="registration">登録</a></li>
	        </ul>
        </div>
    </nav>
    <h1><c:out value="${headline }" /></h1>
</header>