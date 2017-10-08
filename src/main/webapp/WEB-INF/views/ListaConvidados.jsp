<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
 
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Lista de Convidados</title>
<script src="/webjars/angularjs/1.6.4/angular.min.js"></script>
<script src="/webjars/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript" src="../resources/javascript/myApp.js"></script>
<link rel="stylesheet" href="webjars/bootstrap/3.3.7/css/bootstrap.css"/>
  <link rel="stylesheet" href="webjars/bootstrap/3.3.7/css/bootstrap-theme.css"/>
</head>
<body>




<div ng-app="myApp" ng-controller="customersCtrl" class="panel panel-default" style="margin: 10px">
<form >
<label for="input-nome" >Nome:</label>
	<input type="text" id="input-nome" style="width:220px;" ng-model="nome"/>	
 	
	<label for="input-login">Acompanhantes:</label>
	<input type="text" id="input-aom" style="width:120px;" ng-model="acompanhantes"/>
	<input type="button" value="Salvar" ng-click="salvarConvidado()"/>
</form>
<div  class="panel-heading">
<h1 class="panel-title">Lista de convidados</h1>
</div>
<div class="panel-body">
<table  class="table">
<thead>

<tr>
<th>Nome</th>
<th>Acompanhantes</th>
</tr>
</thead>
<tbody>
<tr ng-repeat="x in convidados">
    <td>{{x.nome}}</td>
    <td>{{x.quantidadeAcompanhantes}}</td>
 </tr>

</tbody>
</table>
</div>
</div>

</body>
</html>