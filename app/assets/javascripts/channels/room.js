
(function() {
  App.room = App.cable.subscriptions.create({
    channel: "RoomChannel"
  }, {
    connected: function() {},
    disconnected: function() {},
    received: function(data) {
      return $('#messages').append(data.message);
    },
    speak: function(message, team_id) {
      return this.perform('speak', {
        message: message,
        team_id: team_id
      });
    }
  });

  $(document).on('keypress', function(event) {
    var message, team_id;
    team_id = $("#data").attr('data-value');
    message = $("#data").val();
    if (event.keyCode === 13) {
      App.room.speak(message, team_id);
      event.target.value = '';
      return event.preventDefault();
    }
  });

}).call(this);
