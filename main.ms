# Set up teams for prefixes
try(create_team('member'), @ex, , array(ScoreboardException))
try(create_team('premium'), @ex, , array(ScoreboardException))
try(create_team('guardian'), @ex, , array(ScoreboardException))
try(create_team('premiumguardian'), @ex, , array(ScoreboardException))
try(create_team('community'), @ex, , array(ScoreboardException))
try(create_team('operator'), @ex, , array(ScoreboardException))
try(create_team('admin'), @ex, , array(ScoreboardException))

# Set up team display names
set_team_display('member', array('prefix': _group_prefix('member'), 'suffix': ''))
set_team_display('premium', array('prefix': _group_prefix('premium'), 'suffix': ''))
set_team_display('guardian', array('prefix': _group_prefix('guardian'), 'suffix': ''))
set_team_display('premiumguardian', array('prefix': _group_prefix('premiumguardian'), 'suffix': ''))
set_team_display('community', array('prefix': _group_prefix('community'), 'suffix': ''))
set_team_display('operator', array('prefix': _group_prefix('operator'), 'suffix': ''))
set_team_display('admin', array('prefix': _group_prefix('admin'), 'suffix': ''))

# Set up broadcast messages
set_interval(1500000, closure() {
  _bmessage()
})

# Customize player joins
bind(player_join, null, null, @event) {
  @player = @event[player]

  # Welcome the player
  runas('~console', '/title '.@player.' subtitle {text:"Welcome '.@player.'",color:yellow}')
  runas('~console', '/title '.@player.' title {text:"THE OBSIDIAN",color:white}')

  # Surpress welcome message
  modify_event('join_message', _player_prefix(@player).@player.color('f').' joined')

  # Send MOTD
  tmsg(@player, colorize('Welcome to &6The Obsidian&f [&cthe-obsidian.com&f]'))
  tmsg(@player, colorize('    TeamSpeak: &9ts.the-obsidian.com (pw: thetspassword)'))
  tmsg(@player, colorize('    Forum:     &9http://forum.the-obsidian.com'))

  # Add prefix / suffix
  @name = _player_prefix(@player).@player.color('f')
  set_display_name(@name)

  @list_name = _player_prefix_short(@player).@player.color('f')
  if (length(@list_name) > 16) {
    set_list_name(substr(@list_name, 0, 16))
  } else {
    set_list_name(@list_name)
  }
  team_add_player(pgroup(@player)[0], @player)

  if (equals(get_value(concat('mail', player())), null)) {
    msg(concat(color(gray), 'You have no new mail.'))
  } else {
    msg(concat(color(green), 'You have new mail! Type /mail read to see your messages.'))
  }
}

# Customize player quits
bind(player_quit, null, null, @event) {
  @player = @event[player]
  modify_event('message', _player_prefix(@player).@player.color('f').' left')
}

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

bind(player_portal_travel, null, null, @event) {
  @type = _portal_type(@event[from])
  @from = @event[from]
  @world = @from['world']

  switch(@world) {
    case 'world':
      if (@type == 'district12') {
        @from['world'] = 'district12'
        modify_event('to', @from)
      }
    case 'district12':
      @from['world'] = 'world'
      modify_event('to', @from)
    case 'cleanroom':
      cancel()
  }
}
