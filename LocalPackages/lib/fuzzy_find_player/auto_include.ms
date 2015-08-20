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

proc(_fuzzy_find_player_online, @pattern) {
  @player = false
  @players = all_players()
  foreach(@p in @players) {
    if (reg_match(array(@pattern, 'i'), @p)) {
      @player = @p
    }
  }
  return(@player)
}
