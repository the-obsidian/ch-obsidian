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
  broadcast('')
  broadcast(colorize('&6Announcements:'))
  broadcast(colorize('  &3New Spawn Open! Details and rules:'))
  broadcast(colorize('    &2http://forum.the-obsidian.com/t/t/43'))
  broadcast(colorize('  &3Staff Spotlight #0: Introduction:'))
  broadcast(colorize('    &2http://forum.the-obsidian.com/t/t/44'))
  broadcast('')
  broadcast(colorize('&6Links:'))
  broadcast(colorize('  &3TeamSpeak: &2ts.the-obsidian.com &f(pw: thetspassword)'))
  broadcast(colorize('  &3Forum:       &2http://forum.the-obsidian.com'))
  broadcast('')
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
