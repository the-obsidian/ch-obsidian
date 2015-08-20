proc(_has_mod_mode, @player) {
  @mod_mode = get_value('mod_mode', @player)
  if (@mod_mode) {
    return(true)
  } else {
    return(false)
  }
}

proc(_toggle_mod_mode, @player) {
  if (_has_mod_mode(@player)) {
    store_value('mod_mode', @player, false)
    _on_disable_mod_mode(@player)
    return(false)
  } else {
    store_value('mod_mode', @player, true)
    _on_enable_mod_mode(@player)
    return(true)
  }
}

proc(_on_enable_mod_mode, @player) {
  store_value('mod_mode_enter_location', @player, ploc())
  set_pflight(@player, true)
  _switch_inventory_set_to(@player, '_mod_mode')
  # sudo('/pex user '.@player.' group add CanVanish')
  # sudo('/pex reload')
}

proc(_on_disable_mod_mode, @player) {
  if (pmode(@player) == 'SURVIVAL') {
    set_pflight(@player, false)
  }

  _switch_inventory_set_to(@player, _get_default_inventory_set(@player, pworld(@player)))
  # sudo('/pex user '.@player.' group remove CanVanish')
  # sudo('/pex reload')
  set_ploc(get_value('mod_mode_enter_location', @player))
}

proc(_require_mod_mode) {
  if (player() == '~console') {
    return()
  }

  if (pisop()) {
    return()
  }

  if (_has_mod_mode(player())) {
    return()
  }

  msg(colorize('&cYou are not in mod mode! (/mod)'))
  die()
}
