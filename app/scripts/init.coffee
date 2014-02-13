# Angular initialization only (and global scope handlers)
# use appropriate directories for controllers/directives etc.
'use strict'

noClick = ->
	$('a.null').on "click", (e)->
		e.preventDefault()

tuprecio = ->
	$('#configuracion .square').removeClass "derecha"
	$('#configuracion .tuPrecio').addClass "active"
	$('#configuracion .Contado').removeClass "active"
	console.log "remove"
contado = ->
	$('#configuracion .square').addClass "derecha"
	$('#configuracion .tuPrecio').removeClass "active"
	$('#configuracion .Contado').addClass "active"
	console.log "add"

sidebarIn = ->
	TweenMax.to '.panelConfig', 0.4, 
		x: 368
		ease: "Cubic.easeInOut"
		delay: 0.5
		onComplete: ->
			console.log "in-animation: done"

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
	


app = angular
	.module('vwconfig', [
		'ui.router'
	])
app.config(['$urlRouterProvider', '$stateProvider', ($urlRouterProvider, $stateProvider)->
		#$urlRouterProvider.otherwise '/'
		$stateProvider
			.state 'calculadora', 
				url: '/calculadora'
				controller: 'calcCtrl'
				templateUrl: 'partials/calculadora.html'
				onEnter: ->
					sidebarIn()
			.state 'configuracion', 
				url: '/configuracion'
				controller: 'configCtrl'
				templateUrl: 'partials/configuracion.html'
				onEnter: ->
					sidebarIn()
					noClick()
					#initConfig()
					
					
						
					
									
])
	

$ ->
	$("a.item").on "click", ->
		$('.item').removeClass "active"
		$(this).addClass "active"
		TweenMax.to '.panelConfig', 0.4, 
			x: 368
			ease: "Cubic.easeInOut"
			onComplete: ->
				console.log "animate"
	$(".mainMenu").on "mouseleave", ->
		$('.item').removeClass "active"
		TweenMax.to '.panelConfig', 0.4, 
			x: 0
			ease: "Cubic.easeInOut"
			onComplete: ->
				console.log "animate"

	$('a.null').on "click", (e)->
		e.preventDefault()

	