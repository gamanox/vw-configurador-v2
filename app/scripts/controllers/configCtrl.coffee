app
	.controller 'configCtrl', ['$scope','Auto', ($scope, Auto)->
		$scope.auto = Auto
		$scope.change = ()->
			$scope.auto.model = "test"


	]
		

