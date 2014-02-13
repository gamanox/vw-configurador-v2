angular
	.module 'vwconfig'
	.controller 'configCtrl', ['$scope', ($scope)->
		$scope.model = "Volkswagen CC"
		$scope.version = "Track & Fun 4Motion"
		$scope.price = "814,888"
		
	]