# Custom chat format
#bind(player_chat, null, null, @event) {
#  @player = @event[player]
#  @message = @event[message]
#
#  @text = array('<')
#  @text[] = _player_name_json(@player)
#  @text[] = '> '.@message
#  _tellraw('@a', @text)
#  cancel()
#}
