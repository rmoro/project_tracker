# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
populatePre = (url, type) ->
	xhr = new XMLHttpRequest()
	xhr.onload = -> document.getElementById(type).textContent = this.responseText;
	xhr.open 'GET', url
	xhr.send
	true