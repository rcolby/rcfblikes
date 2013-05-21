# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$(document).ready ->
  displayData = ->
  $.ajax(
    url: '/morris.json'
    method: 'get'
    dataType: 'json'
    success: (data) ->
      $('#chart').html('')
      new Morris.Line (
        element: 'chart'
        data: data
        xkey: ['title']
        ykeys: ['value']
        labels: ['Value']
       )
  )
  setInterval displayData(), 30000

