App.room = App.cable.subscriptions.create {
  channel: "RoomChannel"
},
  connected: ->
    # Called when the subscription is ready for use on the server
  disconnected: ->
    # Called when the subscription has been terminated by the server
  received: (data)->
    $('#messages').append data.message

  speak: (message,team_id)->
    @perform 'speak',message: message ,team_id: team_id

$(document).on 'keypress', (event) ->
  team_id = $("#data").attr('data-value')
  message = $("#data").val()
  if event.keyCode is 13 # return/enter = send
     App.room.speak message , team_id
     event.target.value = ''
     event.preventDefault()
