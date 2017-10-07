<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
 
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Lista de Convidados</title>
<script src="/webjars/angularjs/1.6.4/angular.min.js"></script>
<script src="/webjars/jquery/1.11.1/jquery.min.js"></script>
<link rel="stylesheet" href="webjars/bootstrap/3.3.7/css/bootstrap.css"/>
  <link rel="stylesheet" href="webjars/bootstrap/3.3.7/css/bootstrap-theme.css"/>
</head>
<body>
<script>
var app = angular.module('myApp', []);
app.controller('customersCtrl', function($scope, $http, $window) {
	$scope.convidados = new Array();
	$scope.nome = null;
	$scope.acompanhantes = null;
    $http.get("convidadosLista")
    .then(function (response) {$scope.convidados = response.data;});
   
    $scope.salvarConvidado = function(){
    	//$window.alert($scope.nome);
		/*DEFINI O OBJETO QUE VAI SER ENVIADO VIA AJAX PELO ANGULARJS*/
		var convidado =  new Object();
		convidado.quantidadeAcompanhantes = parseInt($scope.acompanhantes) ;
		convidado.nome  = $scope.nome;
		
		$scope.convidados = new Array();
 
		/*EXECUTA O POST PARA SALVAR O REGISTRO*/
		var response = $http.post("convidados", convidado).then(function (response) {$scope.convidados = response.data;});	 
		$scope.nome = null;
		$scope.acompanhantes = null;
		
		//$http.get("convidadosLista").then(function (response) {$scope.convidados = response.data;});
	 	
 
 
	};
 
    
});
</script>
<h1>AlgaWorks!</h1>


<div ng-app="myApp" ng-controller="customersCtrl" class="panel panel-default" style="margin: 10px">
<form >
<label for="input-nome" >Nome:</label>
	<input type="text" id="input-nome" style="width:220px;" ng-model="nome"/>	
 	<p>{{nome}}</p>
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