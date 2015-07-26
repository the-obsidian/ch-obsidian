# Customize player joins
bind(player_join, null, null, @event) {
  @player = @event['player']

  modify_event('join_message', _player_prefix(@player).@player.color('f').' joined')

  @display_name = _player_prefix(@player).@player.color('f')
  set_display_name(@display_name)

  @list_name = _player_prefix_short(@player).@player.color('f')
  if (length(@list_name) > 16) {
    set_list_name(substr(@list_name, 0, 16))
  } else {
    set_list_name(@list_name)
  }

  team_add_player(pgroup(@player)[0], @player)
}

# Customize player quits
bind(player_quit, null, null, @event) {
  @player = @event[player]
  modify_event('message', _player_prefix(@player).@player.color('f').' left')
}
