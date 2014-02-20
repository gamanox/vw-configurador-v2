# Angular initialization only (and global scope handlers)
# use appropriate directories for controllers/directives etc.
'use strict'
abierto = "false"
noClick = ->
	$('a.null').on "click", (e)->
		e.preventDefault()

tuprecio = (section)->
	$(section+' .square').removeClass "derecha"
	$(section+' .tuPrecio').addClass "active"
	$(section+' .Contado').removeClass "active"
	console.log "remove"
contado = (section)->
	$(section+' .square').addClass "derecha"
	$(section+' .tuPrecio').removeClass "active"
	$(section+' .Contado').addClass "active"
	console.log "add"

sidebarIn = ->
	

	TweenMax.to '#contentMisVW', 0.2, 
		x: -97
		ease: "Cubic.easeInOut"
	TweenMax.to '.panelConfig', 0.4, 
		x: 368
		ease: "Cubic.easeInOut"
		onComplete: ->
			console.log "animate"
			abierto = "true"

initConfig = ->
	console.log "initconfig"
	console.log $('.tuPrecio')
	$ ->
		$('.tuPrecio').on
			click: ->
				$('#configuracion .square').removeClass "derecha"
				console.log "add"
		

		$('.Contado').on
			click: ->
				$('#configuracion .square').addClass "derecha"
				console.log "remove"
car = 
	model: "Volkswagen CC"
	version: "Track & Fun 4Motion"
	price: "814,888"
	description: "Cray freegan Thundercats lomo Tumblr lo-fi.  Neutra chillwave Godard food truck wolf.  Before they sold out Tonx slow-carb viral distillery.  Etsy fap raw denim, chambray squid next level Thundercats yr hashtag Echo Park vinyl selfies.  Skateboard roof party cray letterpress, mlkshk tattooed fixie.  Tattooed forage single-origin coffee, put a bird on it pour-over Truffaut swag Neutra raw denim deep v Pinterest farm-to-table mlkshk.  Before they sold out keffiyeh ethnic semiotics Terry Richardson pickled."
	alimentation: "Inyección Electrónica"
	power: "160"
	performance: "15.3"
	transmision: "DSG"
	color: "Blanco Candy"
	interiors: "Beige tempestad"
	packs: "Paquete 8"
	services: "No ha elegido servicios" 
	warranty: "No ha elegido garantía"

	


app = angular
	.module('vwconfig', [
		'ui.router'
	])
app.config(['$urlRouterProvider', '$stateProvider', ($urlRouterProvider, $stateProvider)->
		$urlRouterProvider.otherwise '/'
		$stateProvider
			.state 'calculadora', 
				url: '/calculadora'
				controller: 'calcCtrl'
				views: 
					'main':
						templateUrl: 'partials/calculadora.html'
				onEnter: ->
					$('.calc-porcentage-drag').slider()
					sidebarIn()

			.state 'configuracion', 
				url: '/configuracion'
				views: 
					'main':
						controller: 'configCtrl'
						templateUrl: 'partials/configuracion.html'
				onEnter: ->
					sidebarIn()
					noClick()
			.state 'misvw', 
				url: '/misvw'
				views: {
					'main':
						controller: 'misvwCtrl'
						templateUrl: 'partials/misvw.html'
				}
				onEnter: ->
					sidebarIn()

					noClick()
					#initConfig()
			.state 'manejo', 
				url: '/manejo'
				views: 
					'main':
						controller: 'manejoCtrl'
						templateUrl: 'partials/manejo.html'
				onEnter: ->
					sidebarIn()
					noClick()
					#initConfig()
			.state 'buscador', 
				url: '/buscador'
				views: 
					'buscador':

						controller: 'buscarCtrl'
						templateUrl: 'partials/buscador.html'
				onEnter: ->
					
					noClick()
					#initConfig()
			.state 'galeria', 
				url: '/galeria'
				views: 
					'buscador':

						controller: 'galeriaCtrl'
						templateUrl: 'partials/galeria.html'
				onEnter: ->
					
					noClick()
					#initConfig()
					
					
						
					
									
])
	

$ ->
	$('.chngPrecio a').on "click", ->
		$('.chngPrecio a').removeClass "active"
		$(this).addClass "active"
	$("a.item").on "click", ->
		$('.item').removeClass "active"
		$(this).addClass "active"
		TweenMax.to '#contentMisVW', 0.2, 
			x: -97
			ease: "Cubic.easeInOut"
		TweenMax.to '.panelConfig', 0.4, 
			x: 368
			ease: "Cubic.easeInOut"
			onComplete: ->
				console.log "animate"
				abierto = "true"
	$(".mainMenu").on "mouseleave", ->
		$('.item').removeClass "active"
		TweenMax.to '.panelConfig', 0.4, 
			x: 0
			ease: "Cubic.easeInOut"
			onComplete: ->
				console.log "animate"
				abierto = "false"

	$('a.null').on "click", (e)->
		e.preventDefault()
	$('.mainMenu .misvw').on "mouseenter", ->
		if abierto is "true"
			TweenMax.to '.panelConfig', 0.2, 
				x: 564
				ease: "Cubic.easeInOut"
			TweenMax.to '#contentMisVW', 0.2, 
				x: 149
				ease: "Cubic.easeInOut"
		else
			TweenMax.to '#contentMisVW', 0.2, 
				x: 149
				ease: "Cubic.easeInOut"
	$("#contentMisVW").on "mouseleave", ->
		if abierto is "true"
			TweenMax.to '.panelConfig', 0.2, 
				x: 368
				ease: "Cubic.easeInOut"
			TweenMax.to '#contentMisVW', 0.2, 
				x: -97
				ease: "Cubic.easeInOut"
		else
			TweenMax.to '#contentMisVW', 0.2, 
				x: -97
				ease: "Cubic.easeInOut"


change = ($scope)->
  $scope.auto.model = "test"

