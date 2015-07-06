proc(_player_prefix, @player) {
  return(_group_prefix(pgroup(@player)[0]))
}

proc(_player_prefix_short, @player) {
  return(_group_prefix_short(pgroup(@player)[0]))
}

proc(_fuzzy_find_player, @pattern) {
  @player = false
  @players = get_whitelisted_players()
  foreach(@p in @players) {
    if (reg_match(array(@pattern, 'i'), @p)) {
      @player = @p
    }
  }
  return(@player)
}

proc(_bmessage) {
  # broadcast('')
  # broadcast(colorize('&6Announcements:'))
  # broadcast(colorize('  &3New Spawn Open! Details and rules:'))
  # broadcast(colorize('    &2http://forum.the-obsidian.com/t/t/43'))
  # broadcast(colorize('  &3Staff Spotlight #0: Introduction:'))
  # broadcast(colorize('    &2http://forum.the-obsidian.com/t/t/44'))
  broadcast('')
  broadcast(colorize('&6Links:'))
  broadcast(colorize('  &3TeamSpeak: &2ts.the-obsidian.com &f(pw: thetspassword)'))
  broadcast(colorize('  &3Forum:       &2http://forum.the-obsidian.com'))
  broadcast('')
}

proc(_tellraw, @target, @message) {
  sudo('/tellraw '.@target.' '.json_encode(@message))
}

proc(_portal_type, @position) {
  # Extract location
  @x = @position['x']
  @y = @position['y']
  @z = @position['z']
  @world = @position['world']

  # Shortcuts for block IDs
  @obsidian = '49:0'
  @coal = '173:0'

  # Go down one block
  @y -= 1

  # Return if not obsidian
  if (get_block_at(@x, @y, @z, @world) != @obsidian) {
    return('normal')
  }

  # Initialize search directions
  @xdirection = 0
  @zdirection = 0

  # Determine search directions
  if (get_block_at(@x + 1, @y, @z, @world) == @obsidian) {
    @xdirection = 1
  } else if (get_block_at(@x - 1, @y, @z, @world) == @obsidian) {
    @xdirection = -1
  } else if (get_block_at(@x, @y, @z + 1, @world) == @obsidian) {
    @zdirection = 1
  } else if (get_block_at(@x, @y, @z - 1, @world) == @obsidian) {
    @zdirection = -1
  }

  # Scan for special blocks
  while(true) {
    @x += 1 * @xdirection
    @z += 1 * @zdirection

    if (get_block_at(@x, @y, @z, @world) == @coal) {
      return('district12')
    }

    if (get_block_at(@x, @y, @z, @world) != @obsidian) {
      return('normal')
    }
  }
}

proc(_group_prefix_short, @group) {
  switch(@group) {
    case 'admin':
    case 'operator':
      return(color('3').'[OP] '.color('f'))
    case 'premiumguardian':
      return(color('2').'[G]'.color('6').'✸ ')
    case 'guardian':
      return(color('2').'[G] '.color('f'))
    case 'community':
      return(color('e').'[C] '.color('f'))
    case 'premium':
      return(color('6').'✸ ')
    default:
      return('')
  }
}

proc(_group_prefix, @group) {
  switch(@group) {
    case 'admin':
    case 'operator':
      return(color('3').'[OP] '.color('f'))
    case 'premiumguardian':
      return(color('2').'[Guardian]'.color('6').'✸ ')
    case 'guardian':
      return(color('2').'[Guardian] '.color('f'))
    case 'community':
      return(color('e').'[Community] '.color('f'))
    case 'premium':
      return(color('6').'✸ ')
    default:
      return('')
  }
}

proc(_group_hover_event, @group) {
  switch(@group) {
    case 'admin':
    case 'operator':
      return(array(action: 'show_text', value: array(text: 'Operator - keeps the server running')))
    case 'premiumguardian':
    case 'guardian':
      return(array(action: 'show_text', value: array(text: 'Guardian - welcomes new players, helps around the server, enforces the rules')))
    case 'community':
      return(array(action: 'show_text', value: array(text: 'Community Builder - coordinates events, advertising, and promotions')))
    case 'premium':
      return(array(action: 'show_text', value: array(text: 'Premium - has donated to keep the server running!')))
  }
}

proc(_player_name_json, @player) {
  @group = pgroup(@player)[0]
  @text = array("")

  switch(@group) {
    case 'admin':
    case 'operator':
      @text[] = array(text: '[OP] ', color: 'dark_aqua', hoverEvent: _group_hover_event('operator'))
      @text[] = @player
    case 'premiumguardian':
      @text[] = array(text: '[Guardian] ', color: 'dark_green', hoverEvent: _group_hover_event('guardian'))
      @text[] = array(text: '✸ '. @player, color: 'gold')
    case 'guardian':
      @text[] = array(text: '[Guardian] ', color: 'dark_green', hoverEvent: _group_hover_event('guardian'))
      @text[] = @player
    case 'community':
      @text[] = array(text: '[Community] ', color: 'yellow', hoverEvent: _group_hover_event('community'))
      @text[] = @player
    case 'premium':
      @text[] = array(text: '✸ '. @player, color: 'gold', hoverEvent: _group_hover_event('premium'))
    default:
      @text[] = @player
  }

  return(@text)
}
