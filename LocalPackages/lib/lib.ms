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

proc(_tellraw, @target, @message) {
  sudo('/tellraw '.@target.' '.json_encode(@message))
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
