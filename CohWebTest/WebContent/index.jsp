<%@page import="java.net.InetAddress"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
	import="com.tangosol.net.CacheFactory, com.tangosol.net.NamedCache" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Coherence Web Test</title>
</head>
<body>
<%
	CacheFactory.ensureCluster();
	NamedCache cache = CacheFactory.getCache("dist-extend");
	
	Integer IValue = (Integer) cache.get("key");
    if (IValue == null)
      IValue = new Integer(1);
    else
      IValue = new Integer(IValue.intValue() + 1);
    cache.put("key", IValue);	
%>
The key/value pair is cached on JCS' Coherence grid.
<p/>
The value of the key is: <%= IValue.toString() %>
<p/>
This is on <b><%= InetAddress.getLocalHost() %></b>
</body>
</html>