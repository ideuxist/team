
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
  <head>
    <title>main</title>
    <style>
    	body{
    		background-color: black;
    		color: white;
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