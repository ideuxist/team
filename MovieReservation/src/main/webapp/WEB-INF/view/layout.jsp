
<%@ taglib uri="http://tiles.apache.org/tags-tiles"  prefix="tiles" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
  <head>
    <title>다양한 영화를 한번에! NEGABOX</title>
    <style>
    	@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');
    	
    	body{
    		color: white;
				background:  #444;
				z-index: 0;
    	}

		a{
			text-decoration: none;
		}
		*{
			margin: 0;
			padding: 0;
		}
    </style>
  </head>
  <body>
	<tiles:insertAttribute name="login" />
	<tiles:insertAttribute name="title" />
	<tiles:insertAttribute name="header" />
	<tiles:insertAttribute name="body" />
	<tiles:insertAttribute name="footer" />

  </body>
</html>