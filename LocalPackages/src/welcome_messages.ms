# Customize player joins
bind(player_join, null, null, @event) {
  @player = @event['player']

  # Modify the join message
  modify_event('join_message', _player_prefix(@player).@player.color('f').' joined')

  # Welcome the player
  runas('~console', '/title '.@player.' subtitle {text:"Welcome '.@player.'",color:yellow}')
  runas('~console', '/title '.@player.' title {text:"THE OBSIDIAN",color:white}')

  # Send MOTD
  tmsg(@player, colorize('Welcome to &6The Obsidian&f [&cthe-obsidian.com&f]'))
  tmsg(@player, colorize('    TeamSpeak: &9ts.the-obsidian.com (pw: thetspassword)'))
  tmsg(@player, colorize('    Forum:     &9http://forum.the-obsidian.com'))

  # Announce first-time players
  if (@event['first_login']) {
    broadcast(colorize('&6Please welcome '.@player.' to the server!'))
  }
}

# Customize player quits
bind(player_quit, null, null, @event) {
  @player = @event[player]
  modify_event('message', _player_prefix(@player).@player.color('f').' left')
}
