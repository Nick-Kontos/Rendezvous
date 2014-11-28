<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
<meta name="layout" content="restrict"/>
<title>Dashboard</title>
</head>
<body>
  <div class="body">
  <h1>Select Profile</h1>
  <g:each in="${profiles}" var="p">
  <g:link controller="app" action="changeActiveProfile" params="[newProfileId:p]" class="profileBox">${p}</g:link>
  </g:each>
  <g:link controller="profile" action="create" class="profileBox"><i class="fa fa-plus fa-lg"></i></g:link>
  </div>
</body>
</html>