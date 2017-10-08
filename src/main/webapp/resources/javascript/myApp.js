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